class InitTransactionResponse {
  String? idempotencyId;
  String? token;

  InitTransactionResponse({this.idempotencyId, this.token});

  InitTransactionResponse.fromJson(Map<String, dynamic> json) {
    idempotencyId = json['idempotency_id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idempotency_id'] = this.idempotencyId;
    data['token'] = this.token;
    return data;
  }
}
