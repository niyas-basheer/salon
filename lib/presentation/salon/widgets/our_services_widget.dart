import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/bloc/salon/our_services_bloc/our_services_bloc.dart';
import 'package:salon_app/core/constants/assets_const.dart';
import 'package:salon_app/core/constants/image_type_const.dart';
import 'package:salon_app/core/themes/app_themes.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/salon/widgets/service_detail_widget.dart';
import 'package:salon_app/presentation/widgets/custom_button.dart';
import 'package:salon_app/presentation/widgets/dialog_builder.dart';
import 'package:salon_app/presentation/widgets/image_widget.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// Widget displaying the services offered by the salon.
class OurServicesWidget extends StatefulWidget {
  /// Constructs an instance of [OurServicesWidget].
  const OurServicesWidget({super.key});


  @override
  State<OurServicesWidget> createState() => OurServicesWidgetState();
}

class OurServicesWidgetState extends State<OurServicesWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OurServicesBloc, OurServicesState>(
      listener: (context, state) {
        if (state is OurServicesLoaded) {
          selectInitially(state);
        }
      },
      builder: (context, state) {
        if (state is OurServicesLoaded) {
          return listWidget(data: state.data, state: state);
        } else {
          return const SizedBox();
        }
      },
    );
  }

  /// Builds the list of services.
  Widget listWidget(
      {required List<dynamic> data, required OurServicesLoaded state}) {
    return Column(
      children: [
        buildServiceList(data: data, state: state),
        buildSubServiceList(state: state),
      ],
    );
  }

  /// Builds the list of primary services.
  Widget buildServiceList(
      {required List<dynamic> data, required OurServicesLoaded state}) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemBuilder: (context, index) {
          bool selected = state.selected?['id'] == data[index]['id'];
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CustomButton(
                title: '${data[index]['title']}',
                lined: true,
                color: selected
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
                elevation: 0,
                textColor: selected
                    ? Colors.white
                    : ColorHelper.primaryToWhite(context),
                onTap: () {
                  context
                      .read<OurServicesBloc>()
                      .add(ToggleServiceEvent(data: data[index]));
                },
              ),
            ),
          );
        },
      ),
    );
  }

  /// Builds the list of sub-services.
  Widget buildSubServiceList({required OurServicesLoaded state}) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: state.subServices?.length ?? 0,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemBuilder: (context, index) =>
          buildSubServiceItem(state.subServices?[index], state),
    );
  }

  /// Builds the widget for each sub-service.
  Widget buildSubServiceItem(dynamic data, OurServicesLoaded state) {
    bool isSelected =
        state.selectedSubServices?.map((e) => e['id']).contains(data['id']) ??
            false;

    return GestureDetector(
      onTap: () {
        viewService(data);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(15),
          border: getBoxBorder(context),
        ),
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ImageWidget(
                image: data['image'],
                height: 90,
                width: 95,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(12),
                type: ImageType.asset,
                placeholder: AssetsConst.servicePlaceholder,
              ),
              spacing(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${data['name'] ?? 'N/A'}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: StyleHelper.titleMedium(context)
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    spacing(height: 5),
                    Row(
                      children: [
                        Text(
                          '\$${data['price'] ?? 'N/A'}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: StyleHelper.titleMedium(context)?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: ColorHelper.primaryToWhite(context),
                          ),
                        ),
                        spacing(width: 5),
                        Text(
                          '• ${data['timing'] ?? 'N/A'}',
                          style: StyleHelper.titleMedium(context)
                              ?.copyWith(color: Theme.of(context).dividerColor),
                        ),
                        spacing(width: 10),
                      ],
                    ),
                    spacing(height: 5),
                    Text(
                      '${data['about'] ?? 'N/A'}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: StyleHelper.titleSmall(context),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  context
                      .read<OurServicesBloc>()
                      .add(SelectSubServiceEvent(data: data));
                },
                icon: Icon(
                  isSelected ? LucideIcons.minusCircle : LucideIcons.plusCircle,
                  size: 32,
                  color: isSelected
                      ? Colors.red
                      : ColorHelper.primaryToWhite(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Selects the initial service when the widget is loaded.
  void selectInitially(OurServicesLoaded state) {
    if (state.selected == null && state.data.isNotEmpty) {
      context
          .read<OurServicesBloc>()
          .add(ToggleServiceEvent(data: state.data.first));
    }
  }

  /// Opens a modal dialog to view the service details.
  void viewService(data) {
    showCupertinoModalPopup(
      barrierColor: isDarkTheme(context) ? Colors.white10 : Colors.black26,
      context: context,
      builder: (BuildContext dialogContext) {
        return BlocProvider.value(
          value: context.read<OurServicesBloc>(),
          child: DialogBuilder(child: ServiceDetailWidget(data: data)),
        );
      },
    );
  }
}
