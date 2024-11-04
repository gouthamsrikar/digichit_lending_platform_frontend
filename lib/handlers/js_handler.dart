import 'package:flutter/foundation.dart';
import 'package:js/js.dart';

import 'base_handler.dart';
import 'dart:html' as html;

BaseHandler getPlatformHandler() => JsHandler();

@kIsWeb
class JsHandler extends BaseHandler {
  html.WindowBase? childWidowHandler;
  @override
  void openSdk(clientId, idempotencyId, token, mobile) {
    IdGatewayJSInterface(clientId, idempotencyId, token, mobile);
  }

  @override
  void addWindowListener(
      String type, Function(dynamic p1, Function? onHandled) onCallBack) {
    html.window.removeEventListener(type, (event) => null);
    html.window.addEventListener(type, (event) {
      html.MessageEvent message = event as html.MessageEvent;
      debugPrint('EventBack ------> ${message.data}');
      try {
        onCallBack(message.data, () {
          debugPrint('on Handled Call Back ------<>');
          // isResponseHandled = true;
          // debugPrint('on Handled after $isResponseHandled');
        });
      } catch (e) {
        debugPrint('Exception ------<>${e.toString()}');
      }
    });
  }

  @override
  void addScript(String url) {
    html.ScriptElement script = html.ScriptElement();
    script.src = url;
    html.document.body!.append(script);
  }

  @override
  void launchPage(String url, {name}) {
    childWidowHandler = html.window.open(url, name ?? '_openUrl');
  }
}

@JS()
class IdGatewayJSInterface {
  external IdGatewayJSInterface(clientId, idempotencyId, token, mobile);
}
