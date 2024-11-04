class SdkInitReq {
  String? gatewayInstanceId;
  List<String>? keys;
  String? idempotencyId;
  String? clientId;
  String? clientSecret;
  TransactionInput? transactionInput;

  SdkInitReq(
      {this.gatewayInstanceId,
      this.keys,
      this.idempotencyId,
      this.clientId,
      this.clientSecret,
      this.transactionInput});

  SdkInitReq.fromJson(Map<String, dynamic> json) {
    gatewayInstanceId = json['gateway_instance_id'];
    if (json['keys'] != null) {
      keys = <String>[];
      json['keys'].forEach((v) {
        keys!.add(v);
      });
    }
    idempotencyId = json['idempotency_id'];
    clientId = json['client_id'];
    clientSecret = json['client_secret'];
    transactionInput = json['transaction_input'] != null
        ? TransactionInput.fromJson(json['transaction_input'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gateway_instance_id'] = gatewayInstanceId;
    if (keys != null) {
      data['keys'] = keys;
    }
    data['idempotency_id'] = idempotencyId;
    data['client_id'] = clientId;
    data['client_secret'] = clientSecret;
    if (transactionInput != null) {
      data['transaction_input'] = transactionInput!.toJson();
    }
    return data;
  }
}

class TransactionInput {
  String? mobile;

  TransactionInput({
    this.mobile,
  });

  TransactionInput.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['mobile'] = mobile;

    return data;
  }

  TransactionInput copyWith({
    String? mobile,
  }) {
    return TransactionInput(
      mobile: mobile ?? this.mobile,
    );
  }
}
