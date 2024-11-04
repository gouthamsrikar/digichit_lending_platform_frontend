class BaseResponse {
  String? status;
  String? message;
  int? timestamp;
  Map<String, dynamic>? data;
  String? statusCode;

  BaseResponse(
      {this.status, this.message, this.timestamp, this.data, this.statusCode});

  BaseResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return;
    }
    status = json['status'];
    message = json['message'];
    timestamp = json['timestamp'];
    data = json['data'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['timestamp'] = timestamp;
    if (this.data != null) {
      data['data'] = this.data;
    }
    data['status_code'] = statusCode;
    return data;
  }

  bool isSuccess() {
    return status == 'SUCCESS';
  }
}
