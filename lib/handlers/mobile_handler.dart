import 'base_handler.dart';

BaseHandler getPlatformHandler() => MobileHandler();

class MobileHandler extends BaseHandler {
  @override
  void openSdk(clientId, idempotencyId, token, mobile) {}

  @override
  void addWindowListener(
      String type, Function(dynamic data, Function? onHandled) onCallBack) {
    // TODO: implement addWindowListener
  }

  @override
  void addScript(String url) {
    // TODO: implement addScript
  }

  @override
  void launchPage(String url, {name}) {
    // TODO: implement launchPage
  }
}
