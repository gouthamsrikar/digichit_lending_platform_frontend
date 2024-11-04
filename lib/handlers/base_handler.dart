import 'package:flutter/foundation.dart';

import 'js_handler.dart'
    if (dart.library.js) 'js_handler.dart'
    if (dart.library.io) 'mobile_handler.dart';
import 'mobile_handler.dart';

abstract class BaseHandler {
  static BaseHandler getHandler() {
    return kIsWeb ? JsHandler() : MobileHandler();
  }

  void addScript(String url);
  void launchPage(
    String url, {
    name,
  });

  void openSdk(clientId, idempotencyId, token, mobile);
  void addWindowListener(
      String type, Function(dynamic data, Function? onHandled) onCallBack);
}
