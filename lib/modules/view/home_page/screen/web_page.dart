import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gov_services_app/modules/view/home_page/model/gov_service_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late InAppWebViewController inAppWebViewController;
  late PullToRefreshController pullToRefreshController;

  @override
  void initState() {
    super.initState();

    pullToRefreshController = PullToRefreshController(
      settings: PullToRefreshSettings(color: Colors.blue),
      onRefresh: () {
        inAppWebViewController.reload();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    GovServiceModel govSerData =
        ModalRoute.of(context)!.settings.arguments as GovServiceModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(govSerData.name),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () async {
                if (await inAppWebViewController.canGoBack()) {
                  await inAppWebViewController.goBack();
                }
              },
              child: const Icon(Icons.arrow_back),
            ),
            FloatingActionButton(
              onPressed: () async {
                if (await inAppWebViewController.canGoForward()) {
                  await inAppWebViewController.goForward();
                }
              },
              child: const Icon(Icons.arrow_forward),
            ),
            FloatingActionButton(
              onPressed: () async {
                await inAppWebViewController.reload();
              },
              child: const Icon(Icons.refresh),
            ),
            FloatingActionButton(
              onPressed: () async {
                await inAppWebViewController.loadUrl(
                  urlRequest: URLRequest(
                    url: WebUri(govSerData.link),
                  ),
                );
              },
              child: const Icon(Icons.home),
            ),
          ],
        ),
      ),
      body: InAppWebView(
        pullToRefreshController: pullToRefreshController,
        initialUrlRequest: URLRequest(
          url: WebUri(govSerData.link),
        ),
        onWebViewCreated: (InAppWebViewController controller) {
          setState(() {
            inAppWebViewController = controller;
          });
        },
        onLoadStop: (controller, uri) async {
          await pullToRefreshController.endRefreshing();
        },
      ),
    );
  }
}
