import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WebViewApp(),
    );
  }
}

class WebViewApp extends StatefulWidget {
  @override
  _WebViewAppState createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController();
    _initializeWebView();
  }

  void _initializeWebView() {
    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("https://www.nossoprojeto.x10.mx/")); // Seu site
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // Evita que o WebView fique atrás da barra de status
        child: WebViewWidget(controller: _controller),
      ),
    );
  }
}
