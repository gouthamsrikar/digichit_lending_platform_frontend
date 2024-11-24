import 'i_token_provider.dart';

class ConnectTokenProvider extends ITokenProvider {
  static String phoneno = "";
  static int userId = 0;
  static String idempotencyId = "";

  @override
  Future<Map<String, String?>?> tokenHeadersCallBack(
      {Map<String, String?>? extraHeaders}) async {
    Map<String, String?> headers = {};
    if (extraHeaders != null) {
      headers.addAll(extraHeaders);
    }
    return headers;
  }
}
