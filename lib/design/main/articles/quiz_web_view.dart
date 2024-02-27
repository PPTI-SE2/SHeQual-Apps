import 'package:flutter/material.dart';
import 'package:shequal/shared/theme.dart';
import 'package:shequal/shared/widget/custom_button.dart';
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
    Widget header() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: kWhiteColor,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios, color: kBlackColor, size: 30,),
            ),
          ],
        ),
      );
    }

    Widget button() {
      return Container(
        height: 70,
        margin: const EdgeInsets.only(top: 20),
        width: double.infinity,
        child: Center(
          child: CustomButton(onPressed: readJS, color: kPrimaryColor, text: "Konfirmasi", textColor: kWhiteColor, width: double.infinity),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            header(),
            Expanded(child: WebViewWidget(controller: controller,),),
            button(),
          ],
        ),
      ),
    );
  }
}
