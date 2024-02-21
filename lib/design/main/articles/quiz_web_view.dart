import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QuizWebView extends StatefulWidget {
  @override
  _QuizWebViewState createState() => _QuizWebViewState();
}

class _QuizWebViewState extends State<QuizWebView> {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://awve3bsjmmm.typeform.com/to/IoxpVrYv')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://awve3bsjmmm.typeform.com/to/IoxpVrYv'));

    void readJS() async {
      var html = await controller.runJavaScriptReturningResult("window.document.getElementsByTagName('span')[0].textContent;");
      print(html.toString().split("/")[0]);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller,),
      floatingActionButton: FloatingActionButton(
        onPressed: readJS
      ),
    );
  }
}
