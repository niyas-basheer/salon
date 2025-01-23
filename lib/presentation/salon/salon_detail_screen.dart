import 'package:expandable_richtext/expandable_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart' as anim;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/bloc/salon/our_services_bloc/our_services_bloc.dart';
import 'package:salon_app/core/constants/assets_const.dart';
import 'package:salon_app/core/constants/image_type_const.dart';
import 'package:salon_app/core/themes/colors.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/booking/booking_screen.dart';
import 'package:salon_app/presentation/common/gallery_view.dart';
import 'package:salon_app/presentation/salon/widgets/amenities_widget.dart';
import 'package:salon_app/presentation/salon/widgets/our_services_widget.dart';
import 'package:salon_app/presentation/salon/widgets/our_specialist.dart';
import 'package:salon_app/presentation/salon/widgets/ratings_reviews_widget.dart';
import 'package:salon_app/presentation/salon/widgets/salon_gallery.dart';
import 'package:salon_app/presentation/widgets/action_icon_button.dart';
import 'package:salon_app/presentation/widgets/custom_button.dart';
import 'package:salon_app/presentation/widgets/image_widget.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// A widget for displaying details of a salon, including its images, information and etc,
class SalonDetailScreen extends StatelessWidget {
  /// Constructs a [SalonDetailScreen] widget.
  ///
  /// The [data] parameter is required and should contain the salon data to be displayed.
  const SalonDetailScreen({super.key, this.data});

  /// The data of the salon to be displayed.
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OurServicesBloc(),
      child: SalonDetailScreenImpl(data: data),
    );
  }
}

/// The stateful implementation of the [SalonDetailScreen] widget.
class SalonDetailScreenImpl extends StatefulWidget {
  const SalonDetailScreenImpl({super.key, this.data});

  /// The data of the salon to be displayed.
  final dynamic data;

  @override
  State<SalonDetailScreenImpl> createState() => _SalonDetailScreenImplState();
}

class _SalonDetailScreenImplState extends State<SalonDetailScreenImpl>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();

  late TabController _tabController;

  TextStyle? titleMedium;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    titleMedium =
        StyleHelper.titleMedium(context)?.copyWith(fontWeight: FontWeight.w600);

    return Scaffold(
        appBar: buildAppBar(),
        extendBodyBehindAppBar: true,
        bottomNavigationBar: buildBottomNavigationBar(),
        body: buildBody());
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
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
      actions: [
        Center(
          child: ActionIconButton(
            icon: Icons.favorite,
            iconColor: Colors.red,
            onPressed: () {
              navigateBack(context);
            },
          ),
        ),
        spacing(width: 12)
      ],
    );
  }

  Widget buildBottomNavigationBar() {
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
                          title: trans(context, key: 'book_appointment'),
                          elevation: 0,
                          yPadding: 15,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          onTap: () {
                            navigateToScreen(
                                context,
                                BlocProvider.value(
                                  value: context.read<OurServicesBloc>(),
                                  child: BookingScreen(salonData: widget.data),
                                ));
                          })
                      .animate()
                      .slideY(
                          begin: 0.2,
                          curve: Curves.elasticOut,
                          duration: const Duration(milliseconds: 400)),
                )
              ],
            ));
      },
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildImageStack(),
          buildSalonInfo(),
          buildDescriptionText(),
          spacing(height: 10),
          _buildTabBar(),
          spacing(height: 15),
          _getBodyWidget(),
          spacing(height: 50),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      onTap: (index) {
        setState(() {});
      },
      controller: _tabController,
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      tabs: [
        Tab(text: trans(context, key: 'services')),
        Tab(text: trans(context, key: 'amenities')),
        Tab(text: trans(context, key: 'specialist')),
        Tab(text: trans(context, key: 'gallery')),
        Tab(text: trans(context, key: 'reviews')),
      ],
    );
  }

  Widget _getBodyWidget() {
    switch (_tabController.index) {
      case 0:
        return const OurServicesWidget();
      case 1:
        return const AmenitiesWidget();
      case 2:
        return const OurSpecialist();
      case 3:
        return const SalonGallery();
      case 4:
        return RatingReviewsWidget(salonData: widget.data);
      default:
        return Container();
    }
  }

  Widget buildImageStack() {
    return SizedBox(
      height: 380,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.data['gallery'].length,
            itemBuilder: (context, index) {
              return ImageWidget(
                image: widget.data['gallery'][index],
                type: ImageType.asset,
                fit: BoxFit.cover,
                placeholder: AssetsConst.logoPlaceholder,
                onTap: () {
                  navigateToScreen(
                      context,
                      GalleryView(
                          images: widget.data['gallery'], currentIndex: index));
                },
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: widget.data['gallery'].length,
                    effect: const SlideEffect(
                        spacing: 8.0,
                        radius: 20,
                        dotHeight: 10,
                        dotWidth: 10,
                        paintStyle: PaintingStyle.fill,
                        dotColor: AppColors.grey30,
                        activeDotColor: AppColors.primary),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildSalonInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '${widget.data['title']}',
                  style: StyleHelper.titleLarge(context)
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              const Icon(Icons.star, color: Colors.orange),
              spacing(width: 3),
              Text('${widget.data['rating']}')
            ],
          ),
          spacing(height: 10),
          Row(
            children: [
              const Icon(
                LucideIcons.mapPin,
                color: AppColors.primary,
                size: 18,
              ),
              spacing(width: 5),
              Expanded(
                child: Text('${widget.data['address']}',
                    style: StyleHelper.titleSmall(context)),
              ),
            ],
          ),
          spacing(height: 10),
          Row(
            children: [
              const Icon(
                LucideIcons.clock,
                color: AppColors.primary,
                size: 18,
              ),
              spacing(width: 5),
              Expanded(
                child: Text('${widget.data['timing']} / ${widget.data['days']}',
                    style: StyleHelper.titleSmall(context)),
              ),
            ],
          ),
          spacing(height: 15),
          buildActionButtons(),
          spacing(height: 10),
          const Divider(),
          spacing(height: 10),
        ],
      ),
    );
  }

  Widget buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Column(
            children: [
              ActionIconButton(
                icon: LucideIcons.share2,
                onPressed: () {},
              ),
              spacing(height: 5),
              Text(
                trans(context, key: 'share'),
                style: StyleHelper.labelSmall(context),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              ActionIconButton(
                icon: LucideIcons.map,
                onPressed: () {},
              ),
              spacing(height: 5),
              Text(
                trans(context, key: 'direction'),
                style: StyleHelper.labelSmall(context),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              ActionIconButton(
                icon: LucideIcons.messageCircle,
                onPressed: () {},
              ),
              spacing(height: 5),
              Text(
                trans(context, key: 'message'),
                style: StyleHelper.labelSmall(context),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              ActionIconButton(
                icon: LucideIcons.phone,
                onPressed: () {},
              ),
              spacing(height: 5),
              Text(
                trans(context, key: 'phone'),
                style: StyleHelper.labelSmall(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildDescriptionText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            trans(context, key: 'about'),
            style: titleMedium,
          ),
          spacing(height: 10),
          ExpandableRichText(
            '${widget.data['description']}',
            expandText: trans(context, key: 'show_more'),
            collapseText: trans(context, key: 'show_less'),
            maxLines: 4,
            style: StyleHelper.titleSmall(context),
            onExpandedChanged: (flag) => {},
            showEllipsis: true,
            toggleTextStyle: StyleHelper.titleSmall(context)
                ?.copyWith(color: Theme.of(context).primaryColor),
            textAlign: TextAlign.start,
            animation: true,
            animationDuration: const Duration(milliseconds: 200),
            animationCurve: Curves.fastLinearToSlowEaseIn,
          ),
        ],
      ),
    );
  }
}
