class RequestContext {
  String? requestId;

  RequestContext({this.requestId});

  RequestContext.fromJson(final Map<String, dynamic> json) {
    requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['request_id'] = requestId;
    return data;
  }
}
