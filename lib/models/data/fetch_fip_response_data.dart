class FetchFipResponseData {
  List<Fips>? fips;

  FetchFipResponseData({this.fips});

  FetchFipResponseData.fromJson(Map<String, dynamic> json) {
    if (json['fips'] != null) {
      fips = <Fips>[];
      json['fips'].forEach((v) {
        fips!.add(new Fips.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fips != null) {
      data['fips'] = this.fips!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Fips {
  String? fipID;
  String? code;
  String? fipName;
  String? logoUrl;
  String? smallUrl;
  bool? discoverOTP;
  List<Identifiers>? identifiers;
  String? fipStatus;
  int? otpLength;
  List<String>? fis;

  Fips(
      {this.fipID,
      this.code,
      this.fipName,
      this.logoUrl,
      this.smallUrl,
      this.discoverOTP,
      this.identifiers,
      this.fipStatus,
      this.otpLength,
      this.fis});

  Fips.fromJson(Map<String, dynamic> json) {
    fipID = json['fipID'];
    code = json['code'];
    fipName = json['fipName'];
    logoUrl = json['logoUrl'];
    smallUrl = json['smallUrl'];
    discoverOTP = json['discoverOTP'];
    if (json['identifiers'] != null) {
      identifiers = <Identifiers>[];
      json['identifiers'].forEach((v) {
        identifiers!.add(new Identifiers.fromJson(v));
      });
    }
    fipStatus = json['fipStatus'];
    otpLength = json['otpLength'];
    fis = json['fis'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fipID'] = this.fipID;
    data['code'] = this.code;
    data['fipName'] = this.fipName;
    data['logoUrl'] = this.logoUrl;
    data['smallUrl'] = this.smallUrl;
    data['discoverOTP'] = this.discoverOTP;
    if (this.identifiers != null) {
      data['identifiers'] = this.identifiers!.map((v) => v.toJson()).toList();
    }
    data['fipStatus'] = this.fipStatus;
    data['otpLength'] = this.otpLength;
    data['fis'] = this.fis;
    return data;
  }
}

class Identifiers {
  String? identifier;
  String? identifierType;

  Identifiers({this.identifier, this.identifierType});

  Identifiers.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'];
    identifierType = json['identifierType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identifier'] = this.identifier;
    data['identifierType'] = this.identifierType;
    return data;
  }
}
