class SDKInitResult {
  String? status;
  String? message;
  String? errorCode;
  String? statusCode;
  bool? isRetryable;
  String? token;

  SDKInitResult(
      {this.status,
        this.message,
        this.errorCode,
        this.statusCode,
        this.isRetryable,
        this.token});

  SDKInitResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errorCode = json['error_code'];
    statusCode = json['status_code'];
    isRetryable = json['is_retryable'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['error_code'] = this.errorCode;
    data['status_code'] = this.statusCode;
    data['is_retryable'] = this.isRetryable;
    data['token'] = this.token;
    return data;
  }
}
