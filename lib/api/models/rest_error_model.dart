import 'package:onemoney_hack/api/models/base_error_entity.dart';

class RestErrorModel extends BaseErrorEntity {
  final RestErrorCode errorCode;

  RestErrorModel({
    super.message,
    super.statusCode,
    required this.errorCode,
  });
}

class RestException implements Exception {
  final RestErrorModel error;

  RestException({required this.error});
}

enum RestErrorCode {
  badResponse,
  timeout,
  unknown,
  unauthorized,
  forbidden,
  notFound,
  internalServerError
}
