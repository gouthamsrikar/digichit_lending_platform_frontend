import 'package:onemoney_hack/api/services/models/common_request_models.dart';

abstract class BaseExecuteFlowStepRequestContextModel {
  Map<String, dynamic> toJson();
}

class ExecuteFlowStepRequestModel {
  String? journeyId;
  String? transactionId;
  String? gatewayInstanceId;
  Map<String, dynamic>? inputData;

  ExecuteFlowStepRequestModel(
      {this.journeyId,
      this.transactionId,
      this.gatewayInstanceId,
      this.inputData});

  ExecuteFlowStepRequestModel.fromJson(Map<String, dynamic> json) {
    journeyId = json['journey_id'];
    transactionId = json['transaction_id'];
    gatewayInstanceId = json['gateway_instance_id'];
    inputData = json['input_data'] != null ? inputData : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['journey_id'] = this.journeyId;
    data['transaction_id'] = this.transactionId;
    data['gateway_instance_id'] = this.gatewayInstanceId;
    if (this.inputData != null) {
      data['input_data'] = this.inputData;
    }
    return data;
  }
}
