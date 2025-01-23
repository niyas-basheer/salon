import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/presentation/widgets/action_icon_button.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// A screen that displays a web page using a WebView.
class WebViewScreen extends StatefulWidget {
  /// Constructs a WebViewScreen with the given [pageTitle] and [url].
  const WebViewScreen({super.key, required this.pageTitle, required this.url});

  /// The title of the web page.
  final String pageTitle;

  /// The URL of the web page.
  final String url;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController controller;
  bool isLoading = true;

  @override
  void initState() {
    // Initialize the WebViewController and load the URL.
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          // Display a loading indicator while the web page is loading.
          if (isLoading)
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  /// Builds the app bar for the WebViewScreen.
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        trans(context, key: widget.pageTitle),
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
              // Navigate back when the arrow button is pressed.
              navigateBack(context);
            },
          ),
        ),
      ),
    );
  }
}
