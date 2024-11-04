abstract class BaseErrorEntity {
  String? message;
  Status? status;
  StatusCode? statusCode;

  BaseErrorEntity({this.status, this.message, this.statusCode});
}

abstract class StatusCode {}

enum Status { success, failure }
