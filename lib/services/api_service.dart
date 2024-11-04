import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:onemoney_hack/api/models/data/equal_data_fetch_response.dart';
import '../models/sdk_init_req.dart';
import '../url_config_manager.dart';

class ApiService {
  final dio = Dio();
  final url = UrlConfigManager.getInstance().hostUrl;
  final urlManager = UrlConfigManager.getInstance();
  Future<Response<dynamic>> sdkInit(SdkInitReq req) async {
    String basicAuth = base64Encode(
        utf8.encode('${urlManager.clientId}:${urlManager.clientSecret}'));
    final result = dio.post(
      '${url}business/ie/transaction/init',
      options: Options(headers: {'Authorization': 'Basic ${basicAuth}'}),
      data: jsonEncode(
        req.toJson(),
      ),
    );
    return result;
  }

  Future<EqualDataFetchResponse> fetchData(String idempotencyid) async {
    String basicAuth = base64Encode(
        utf8.encode('${urlManager.clientId}:${urlManager.clientSecret}'));
    final result = await dio.post(
      '${url}business/transaction/data/fetch',
      options: Options(headers: {'Authorization': 'Basic ${basicAuth}'}),
      data: jsonEncode({
        "idempotency_id": idempotencyid,
      }),
    );
    return EqualDataFetchResponse.fromJson(result.data);
  }
}
