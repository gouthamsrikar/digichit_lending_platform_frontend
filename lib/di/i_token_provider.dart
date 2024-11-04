abstract class ITokenProvider {
  Future<Map<String, String?>?> tokenHeadersCallBack({
    Map<String, String?>? extraHeaders,
  });
}
