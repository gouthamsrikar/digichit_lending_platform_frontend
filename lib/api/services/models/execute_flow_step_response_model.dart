class ExecuteFlowStepResponseDataModel {
  String? status;
  String? message;
  String? statusCode;
  String? transactionId;
  String? journeyTransactionId;
  String? journeyId;
  Map<String, dynamic>? data;

  ExecuteFlowStepResponseDataModel(
      {this.status,
      this.message,
      this.statusCode,
      this.transactionId,
      this.journeyTransactionId,
      this.journeyId,
      this.data});

  ExecuteFlowStepResponseDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusCode = json['status_code'];
    transactionId = json['transaction_id'];
    journeyTransactionId = json['journey_transaction_id'];
    journeyId = json['journey_id'];
    data = json['data'] != null ? data : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    data['transaction_id'] = this.transactionId;
    data['journey_transaction_id'] = this.journeyTransactionId;
    data['journey_id'] = this.journeyId;
    if (this.data != null) {
      data['data'] = this.data;
    }
    return data;
  }
}
