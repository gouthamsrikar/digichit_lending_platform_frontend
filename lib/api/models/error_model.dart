import 'package:onemoney_hack/api/models/base_error_entity.dart';

class RepositoryErrorModel extends BaseErrorEntity {
  RepositoryErrorModel({
    super.message,
    super.status,
    super.statusCode,
  });
}
