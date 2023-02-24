import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewScreen extends StatefulWidget {
  final String url;


  WebViewScreen(this.url);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  bool isLoading=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          WebView(initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (url){
            Future.delayed(Duration(milliseconds: 900),(){
              setState(() {
                isLoading=false;
              });
            });
            },
          ),
          if(isLoading==true)Center(child: CircularProgressIndicator()),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (

          ){}),
    );
  }
}
