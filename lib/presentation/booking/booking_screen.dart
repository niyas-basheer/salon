import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/bloc/salon/our_services_bloc/our_services_bloc.dart';
import 'package:salon_app/core/themes/app_themes.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/booking/widgets/booking_note_widget.dart';
import 'package:salon_app/presentation/booking/widgets/booking_service_card.dart';
import 'package:salon_app/presentation/booking/widgets/select_more_services.dart';
import 'package:salon_app/presentation/booking/widgets/select_specialist_widget.dart';
import 'package:salon_app/presentation/booking/widgets/booking_time_picker.dart';
import 'package:salon_app/presentation/checkout/checkout_screen.dart';
import 'package:salon_app/presentation/widgets/action_icon_button.dart';
import 'package:salon_app/presentation/widgets/custom_button.dart';
import 'package:salon_app/presentation/widgets/dialog_builder.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';
import 'package:salon_app/presentation/booking/widgets/booking_date_picker.dart';

/// A screen widget for booking services at a salon.
class BookingScreen extends StatefulWidget {
  /// Constructs a new [BookingScreen] instance.
  const BookingScreen({super.key, this.salonData});

  /// Data related to the salon.
  final dynamic salonData;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? bookingDate;
  String? bookingTime;
  TextEditingController noteController = TextEditingController();

  String? specialist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: ListView(
        children: [
          spacing(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  trans(context, key: 'your_services'),
                  style: StyleHelper.titleMedium(context)
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                CustomButton(
                    title: trans(context, key: 'add_more'),
                    color: Colors.transparent,
                    textColor: ColorHelper.primaryToWhite(context),
                    leftIcon: LucideIcons.plus,
                    xPadding: 0,
                    onTap: () {
                      addMoreServices();
                    })
              ],
            ),
          ),
          BlocConsumer<OurServicesBloc, OurServicesState>(
            listener: (context, state) {
              if (state is OurServicesLoaded) {
                if (state.selectedSubServices?.isEmpty ?? false) {
                  navigateBack(context);
                }
              }
            },
            builder: (context, state) {
              if (state is OurServicesLoaded) {
                return _buildServiceList(state);
              } else {
                return const SizedBox();
              }
            },
          ),
          spacing(height: 10),
          BookingDatePicker(
            onChanged: (DateTime value) {
              bookingDate = value;
            },
          ),
          spacing(height: 20),
          BookingTimePicker(
            onChanged: (String value) {
              bookingTime = value;
            },
          ),
          spacing(height: 20),
          SelectSpecialistWidget(onChanged: (String value) {
            specialist = value;
          }),
          spacing(height: 15),
          BookingNoteWidget(controller: noteController),
          spacing(height: 30),
        ],
      ),
    );
  }

  /// Builds the app bar for the booking screen.
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        trans(context, key: 'booking'),
        style: StyleHelper.titleLarge(context)
            ?.copyWith(fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      leading: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: ActionIconButton(
            icon: LucideIcons.arrowLeft,
            onPressed: () {
              navigateBack(context);
            },
          ),
        ),
      ),
    );
  }

  /// Builds the list of selected services.
  Widget _buildServiceList(OurServicesLoaded state) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: state.selectedSubServices?.length ?? 0,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemBuilder: (context, index) {
        final item = state.selectedSubServices![index];
        return BookingServiceCard(data: item);
      },
    );
  }

  /// Builds the bottom navigation bar for the booking screen.
  Widget _buildBottomNavigationBar() {
    return BlocBuilder<OurServicesBloc, OurServicesState>(
      builder: (context, state) {
        if (state is! OurServicesLoaded ||
            (state.selectedSubServices?.isEmpty ?? true)) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  title: trans(context, key: 'checkout'),
                  elevation: 0,
                  yPadding: 15,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  onTap: () {
                    navigateToScreen(
                      context,
                      CheckoutScreen(
                        salonData: widget.salonData,
                        bookingDate: bookingDate ?? DateTime.now(),
                        bookingTime: bookingTime ?? 'N/A',
                        services: state.selectedSubServices ?? [],
                        specialist: specialist,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  /// Displays a modal dialog for adding more services.
  void addMoreServices() {
    showCupertinoModalPopup(
      barrierColor: isDarkTheme(context) ? Colors.white10 : Colors.black26,
      context: context,
      builder: (BuildContext dialogContext) {
        return BlocProvider.value(
          value: context.read<OurServicesBloc>(),
          child: const DialogBuilder(child: SelectMoreServices()),
        );
      },
    );
  }
}
