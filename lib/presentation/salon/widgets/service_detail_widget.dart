import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/bloc/salon/our_services_bloc/our_services_bloc.dart';
import 'package:salon_app/core/constants/assets_const.dart';
import 'package:salon_app/core/constants/image_type_const.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/widgets/action_icon_button.dart';
import 'package:salon_app/presentation/widgets/custom_button.dart';
import 'package:salon_app/presentation/widgets/image_widget.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// Widget displaying the details of a service.
class ServiceDetailWidget extends StatefulWidget {
  /// Constructs an instance of [ServiceDetailWidget].
  const ServiceDetailWidget({super.key, this.data});

  /// The data representing the service details.
  final dynamic data;

  @override
  State<ServiceDetailWidget> createState() => _ServiceDetailWidgetState();
}

class _ServiceDetailWidgetState extends State<ServiceDetailWidget> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return SizedBox(
      height: 500,
      child: Scaffold(
        bottomNavigationBar: _buildBottomNavigationBar(),
        body: Padding(
          padding: EdgeInsets.only(bottom: mediaQueryData.viewInsets.bottom),
          child: Stack(
            children: [
              ListView(
                children: [
                  _buildServiceImage(),
                  _buildServiceDetails(),
                ],
              ),
              _buildCloseButton(),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the image of the service.
  Widget _buildServiceImage() {
    return ImageWidget(
      image: widget.data['image'],
      height: 220,
      width: double.infinity,
      fit: BoxFit.cover,
      type: ImageType.asset,
      placeholder: AssetsConst.servicePlaceholderLarge,
    );
  }

  /// Builds the details of the service.
  Widget _buildServiceDetails() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.data['name'] ?? 'N/A'}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: StyleHelper.titleLarge(context)
                ?.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          spacing(height: 15),
          Text(
            '${widget.data['about'] ?? 'N/A'}',
            style: StyleHelper.titleMedium(context)
                ?.copyWith(color: ColorHelper.titleSmallColor(context)),
          ),
        ],
      ),
    );
  }

  /// Builds the close button for dismissing the widget.
  Widget _buildCloseButton() {
    return Positioned(
      top: 10,
      right: 10,
      child: ActionIconButton(
        icon: LucideIcons.x,
        onPressed: () {
          navigateBack(context);
        },
      ),
    );
  }

  /// Builds the bottom navigation bar allowing to add or remove the service.
  Widget _buildBottomNavigationBar() {
    return BlocBuilder<OurServicesBloc, OurServicesState>(
      builder: (context, state) {
        if (state is OurServicesLoaded) {
          bool isSelected = state.selectedSubServices
                  ?.any((e) => e['id'] == widget.data['id']) ??
              false;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    title: isSelected
                        ? trans(context, key: 'remove')
                        : trans(context, key: 'add_to_booking'),
                    elevation: 0,
                    yPadding: 15,
                    fontSize: 15,
                    color: isSelected
                        ? Colors.red
                        : Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                    onTap: () {
                      context
                          .read<OurServicesBloc>()
                          .add(SelectSubServiceEvent(data: widget.data));
                    },
                  ),
                )
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
