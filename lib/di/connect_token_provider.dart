import 'i_token_provider.dart';

class ConnectTokenProvider extends ITokenProvider {
  static String phoneno = "7893016461";
  static int userId = 1;
  static String idempotencyId = "3faa3f2c-bbc2-401c-8824-bb738b7e7a46";

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
