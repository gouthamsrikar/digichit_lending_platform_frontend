import 'i_token_provider.dart';

class ConnectTokenProvider extends ITokenProvider {
  static String sessionId =
      "";
  static List<String> consentHandles = [""];
  static String phoneno = "";
  static List<String> fipIds = [""];
  static String redirecturl = "";

  static int userId = 1;

  @override
  Future<Map<String, String?>?> tokenHeadersCallBack(
      {Map<String, String?>? extraHeaders}) async {
    Map<String, String?> headers = {};
    if (extraHeaders != null) {
      headers.addAll(extraHeaders);
    }
    headers['Authorization'] =
        "";
    return headers;
  }
}
