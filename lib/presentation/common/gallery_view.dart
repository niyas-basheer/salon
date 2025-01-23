import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';

/// GalleryView displays a fullscreen gallery of images with zooming functionality.
class GalleryView extends StatefulWidget {
  /// List of image URLs.
  final List<String> images;

  /// Optional: Index of the image to display initially.
  final int? currentIndex;

  /// Constructor for the GalleryView.
  const GalleryView({
    super.key,
    required this.images,
    this.currentIndex,
  });

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: widget.currentIndex ?? 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: AssetImage(widget.images[index]),
          );
        },
        itemCount: widget.images.length,
        loadingBuilder: (context, event) => Center(
          child: SizedBox(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded /
                  (event.expectedTotalBytes ?? 0),
            ),
          ),
        ),
        pageController: pageController,
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
