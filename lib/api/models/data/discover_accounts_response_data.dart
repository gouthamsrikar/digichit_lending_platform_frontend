class DiscoverAccountsResponseData {
  List<DiscoveredAccounts>? discoveredAccounts;

  DiscoverAccountsResponseData({this.discoveredAccounts});

  DiscoverAccountsResponseData.fromJson(Map<String, dynamic> json) {
    if (json['discovered_accounts'] != null) {
      discoveredAccounts = <DiscoveredAccounts>[];
      json['discovered_accounts'].forEach((v) {
        discoveredAccounts!.add(new DiscoveredAccounts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.discoveredAccounts != null) {
      data['discovered_accounts'] =
          this.discoveredAccounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DiscoveredAccounts {
  String? accType;
  String? accRefNumber;
  String? maskedAccNumber;
  String? fitype;

  DiscoveredAccounts(
      {this.accType, this.accRefNumber, this.maskedAccNumber, this.fitype});

  DiscoveredAccounts.fromJson(Map<String, dynamic> json) {
    accType = json['accType'];
    accRefNumber = json['accRefNumber'];
    maskedAccNumber = json['maskedAccNumber'];
    fitype = json['fitype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accType'] = this.accType;
    data['accRefNumber'] = this.accRefNumber;
    data['maskedAccNumber'] = this.maskedAccNumber;
    data['fitype'] = this.fitype;
    return data;
  }
}
