library flutter_youtube_vimeo;

import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

// ignore: prefer_collection_literals
final Set<JavascriptChannel> jsChannels = [
  JavascriptChannel(
      name: 'YouVimPlayer',
      onMessageReceived: (JavascriptMessage message) {
        print(message.message);
      }),
].toSet();

// ignore: must_be_immutable
class YouVimPlayer extends StatelessWidget {
  String provider, videoID;
  YouVimPlayer(this.provider, this.videoID);
  // final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    String url = provider == 'vimeo'
        ? 'https://player.vimeo.com/video/$videoID'
        : 'https://www.youtube.com/embed/$videoID?autoplay=1&mute=1&controls=0&loop=1';
    return EasyWebView(
      onLoaded: () {
        print('Loaded video $videoID from provider $provider');
      },
      src: url,
      isHtml: false, // Use Html syntax
      isMarkdown: false, // Use markdown syntax
      convertToWidgets: false, // Try to convert to flutter widgets
      // width: 100,
      // height: 100,
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'YouVimPlayer',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: WebviewScaffold(
    //     //url: 'https://fluttervimeo.web.app/$provider,$videoID',
    //     url: provider == 'vimeo'
    //         ? 'https://player.vimeo.com/video/$videoID'
    //         : 'https://www.youtube.com/embed/$videoID?autoplay=1&mute=1&controls=0&loop=1',
    //     // : 'https://fluttervimeo.web.app/$provider,$videoID',
    //     javascriptChannels: jsChannels,
    //     mediaPlaybackRequiresUserGesture: false,
    //     withZoom: true,
    //     withLocalStorage: true,
    //     hidden: true,
    //     initialChild: Container(
    //       color: Colors.black54,
    //       child: const Center(child: CircularProgressIndicator()),
    //     ),
    //   ),
    // );
  }
}
