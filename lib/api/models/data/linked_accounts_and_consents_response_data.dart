class LinkedAccountsAndConsentResponseData {
  List<ConsentData>? consentData;
  List<LinkedBankAccounts>? linkedBankAccounts;

  LinkedAccountsAndConsentResponseData(
      {this.consentData, this.linkedBankAccounts});

  LinkedAccountsAndConsentResponseData.fromJson(Map<String, dynamic> json) {
    if (json['consents'] != null) {
      consentData = <ConsentData>[];
      json['consents'].forEach((v) {
        consentData!.add(new ConsentData.fromJson(v));
      });
    }
    if (json['linked_bank_accounts'] != null) {
      linkedBankAccounts = <LinkedBankAccounts>[];
      json['linked_bank_accounts'].forEach((v) {
        linkedBankAccounts!.add(new LinkedBankAccounts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.consentData != null) {
      data['consents'] = this.consentData!.map((v) => v.toJson()).toList();
    }
    if (this.linkedBankAccounts != null) {
      data['linked_bank_accounts'] =
          this.linkedBankAccounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ConsentData {
  Null? ver;
  Null? timestamp;
  Null? errorCode;
  Null? errorMessage;
  bool? status;
  List<Consents>? consents;
  List<Accounts>? accounts;
  Info? info;
  String? statusCode;

  ConsentData(
      {this.ver,
      this.timestamp,
      this.errorCode,
      this.errorMessage,
      this.status,
      this.consents,
      this.accounts,
      this.info,
      this.statusCode});

  ConsentData.fromJson(Map<String, dynamic> json) {
    ver = json['ver'];
    timestamp = json['timestamp'];
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    status = json['status'];
    if (json['consents'] != null) {
      consents = <Consents>[];
      json['consents'].forEach((v) {
        consents!.add(new Consents.fromJson(v));
      });
    }
    if (json['accounts'] != null) {
      accounts = <Accounts>[];
      json['accounts'].forEach((v) {
        accounts!.add(new Accounts.fromJson(v));
      });
    }
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ver'] = this.ver;
    data['timestamp'] = this.timestamp;
    data['errorCode'] = this.errorCode;
    data['errorMessage'] = this.errorMessage;
    data['status'] = this.status;
    if (this.consents != null) {
      data['consents'] = this.consents!.map((v) => v.toJson()).toList();
    }
    if (this.accounts != null) {
      data['accounts'] = this.accounts!.map((v) => v.toJson()).toList();
    }
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    data['statusCode'] = this.statusCode;
    return data;
  }
}

class Consents {
  String? consentId;
  String? consentArtefactId;
  String? startTime;
  String? expireTime;
  String? accountId;
  int? id;
  String? ver;
  String? txnId;
  String? consentStart;
  String? consentExpiry;
  String? consentMode;
  String? fetchType;
  String? consentTypes;
  String? fiTypes;
  String? dataconsumerId;
  String? customerVua;
  int? purposeCode;
  String? purposeRefuri;
  String? purposeText;
  String? purposeCategoryType;
  String? fiDatarangeFrom;
  String? fiDatarangeTo;
  String? dataLifeUnit;
  int? dataLifeValue;
  String? frequencyUnit;
  int? frequencyValue;
  String? consentHandle;
  String? status;
  String? refUserId;
  Null? requestType;
  String? totalData;
  String? createdAt;
  String? updatedAt;
  Null? dataFilter;
  String? timeStamp;
  String? statusUpdateByType;
  String? statusUpdateById;
  String? responseVer;
  String? responseTimeStamp;
  String? responseCustomerAddress;
  String? responseTxnid;
  String? dataconsumerType;
  String? fiuName;
  String? fiuID;

  Consents(
      {this.consentId,
      this.consentArtefactId,
      this.startTime,
      this.expireTime,
      this.accountId,
      this.id,
      this.ver,
      this.txnId,
      this.consentStart,
      this.consentExpiry,
      this.consentMode,
      this.fetchType,
      this.consentTypes,
      this.fiTypes,
      this.dataconsumerId,
      this.customerVua,
      this.purposeCode,
      this.purposeRefuri,
      this.purposeText,
      this.purposeCategoryType,
      this.fiDatarangeFrom,
      this.fiDatarangeTo,
      this.dataLifeUnit,
      this.dataLifeValue,
      this.frequencyUnit,
      this.frequencyValue,
      this.consentHandle,
      this.status,
      this.refUserId,
      this.requestType,
      this.totalData,
      this.createdAt,
      this.updatedAt,
      this.dataFilter,
      this.timeStamp,
      this.statusUpdateByType,
      this.statusUpdateById,
      this.responseVer,
      this.responseTimeStamp,
      this.responseCustomerAddress,
      this.responseTxnid,
      this.dataconsumerType,
      this.fiuName,
      this.fiuID});

  Consents.fromJson(Map<String, dynamic> json) {
    consentId = json['consentId'];
    consentArtefactId = json['consentArtefactId'];
    startTime = json['startTime'];
    expireTime = json['expireTime'];
    accountId = json['accountId'];
    id = json['id'];
    ver = json['ver'];
    txnId = json['txnId'];
    consentStart = json['consentStart'];
    consentExpiry = json['consentExpiry'];
    consentMode = json['consentMode'];
    fetchType = json['fetchType'];
    consentTypes = json['consentTypes'];
    fiTypes = json['fiTypes'];
    dataconsumerId = json['dataconsumerId'];
    customerVua = json['customerVua'];
    purposeCode = json['purposeCode'];
    purposeRefuri = json['purposeRefuri'];
    purposeText = json['purposeText'];
    purposeCategoryType = json['purposeCategoryType'];
    fiDatarangeFrom = json['fiDatarangeFrom'];
    fiDatarangeTo = json['fiDatarangeTo'];
    dataLifeUnit = json['dataLifeUnit'];
    dataLifeValue = json['dataLifeValue'];
    frequencyUnit = json['frequencyUnit'];
    frequencyValue = json['frequencyValue'];
    consentHandle = json['consentHandle'];
    status = json['status'];
    refUserId = json['refUserId'];
    requestType = json['requestType'];
    totalData = json['totalData'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    dataFilter = json['dataFilter'];
    timeStamp = json['timeStamp'];
    statusUpdateByType = json['statusUpdateByType'];
    statusUpdateById = json['statusUpdateById'];
    responseVer = json['responseVer'];
    responseTimeStamp = json['responseTimeStamp'];
    responseCustomerAddress = json['responseCustomerAddress'];
    responseTxnid = json['responseTxnid'];
    dataconsumerType = json['dataconsumerType'];
    fiuName = json['fiuName'];
    fiuID = json['fiuID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['consentId'] = this.consentId;
    data['consentArtefactId'] = this.consentArtefactId;
    data['startTime'] = this.startTime;
    data['expireTime'] = this.expireTime;
    data['accountId'] = this.accountId;
    data['id'] = this.id;
    data['ver'] = this.ver;
    data['txnId'] = this.txnId;
    data['consentStart'] = this.consentStart;
    data['consentExpiry'] = this.consentExpiry;
    data['consentMode'] = this.consentMode;
    data['fetchType'] = this.fetchType;
    data['consentTypes'] = this.consentTypes;
    data['fiTypes'] = this.fiTypes;
    data['dataconsumerId'] = this.dataconsumerId;
    data['customerVua'] = this.customerVua;
    data['purposeCode'] = this.purposeCode;
    data['purposeRefuri'] = this.purposeRefuri;
    data['purposeText'] = this.purposeText;
    data['purposeCategoryType'] = this.purposeCategoryType;
    data['fiDatarangeFrom'] = this.fiDatarangeFrom;
    data['fiDatarangeTo'] = this.fiDatarangeTo;
    data['dataLifeUnit'] = this.dataLifeUnit;
    data['dataLifeValue'] = this.dataLifeValue;
    data['frequencyUnit'] = this.frequencyUnit;
    data['frequencyValue'] = this.frequencyValue;
    data['consentHandle'] = this.consentHandle;
    data['status'] = this.status;
    data['refUserId'] = this.refUserId;
    data['requestType'] = this.requestType;
    data['totalData'] = this.totalData;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['dataFilter'] = this.dataFilter;
    data['timeStamp'] = this.timeStamp;
    data['statusUpdateByType'] = this.statusUpdateByType;
    data['statusUpdateById'] = this.statusUpdateById;
    data['responseVer'] = this.responseVer;
    data['responseTimeStamp'] = this.responseTimeStamp;
    data['responseCustomerAddress'] = this.responseCustomerAddress;
    data['responseTxnid'] = this.responseTxnid;
    data['dataconsumerType'] = this.dataconsumerType;
    data['fiuName'] = this.fiuName;
    data['fiuID'] = this.fiuID;
    return data;
  }
}

class Accounts {
  int? userAccountID;
  String? maskedAccNumber;
  String? linkRefNumber;
  String? accountRefNumber;
  String? fiType;
  String? accountType;
  String? fipID;
  String? status;

  Accounts(
      {this.userAccountID,
      this.maskedAccNumber,
      this.linkRefNumber,
      this.accountRefNumber,
      this.fiType,
      this.accountType,
      this.fipID,
      this.status});

  Accounts.fromJson(Map<String, dynamic> json) {
    userAccountID = json['userAccountID'];
    maskedAccNumber = json['maskedAccNumber'];
    linkRefNumber = json['linkRefNumber'];
    accountRefNumber = json['accountRefNumber'];
    fiType = json['fiType'];
    accountType = json['accountType'];
    fipID = json['fipID'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userAccountID'] = this.userAccountID;
    data['maskedAccNumber'] = this.maskedAccNumber;
    data['linkRefNumber'] = this.linkRefNumber;
    data['accountRefNumber'] = this.accountRefNumber;
    data['fiType'] = this.fiType;
    data['accountType'] = this.accountType;
    data['fipID'] = this.fipID;
    data['status'] = this.status;
    return data;
  }
}

class Info {
  String? ver;
  String? txnid;
  String? timestamp;
  ConsentDetail? consentDetail;

  Info({this.ver, this.txnid, this.timestamp, this.consentDetail});

  Info.fromJson(Map<String, dynamic> json) {
    ver = json['ver'];
    txnid = json['txnid'];
    timestamp = json['timestamp'];
    consentDetail = json['consentDetail'] != null
        ? new ConsentDetail.fromJson(json['consentDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ver'] = this.ver;
    data['txnid'] = this.txnid;
    data['timestamp'] = this.timestamp;
    if (this.consentDetail != null) {
      data['consentDetail'] = this.consentDetail!.toJson();
    }
    return data;
  }
}

class ConsentDetail {
  List<String>? fiTypes;
  String? fetchType;
  String? consentMode;
  String? consentStart;
  List<String>? consentTypes;
  String? consentExpiry;
  Frequency? frequency;
  Customer? customer;
  Purpose? purpose;
  Frequency? dataLife;
  FidataRange? fidataRange;
  DataConsumer? dataConsumer;

  ConsentDetail(
      {this.fiTypes,
      this.fetchType,
      this.consentMode,
      this.consentStart,
      this.consentTypes,
      this.consentExpiry,
      this.frequency,
      this.customer,
      this.purpose,
      this.dataLife,
      this.fidataRange,
      this.dataConsumer});

  ConsentDetail.fromJson(Map<String, dynamic> json) {
    fiTypes = json['fiTypes'].cast<String>();
    fetchType = json['fetchType'];
    consentMode = json['consentMode'];
    consentStart = json['consentStart'];
    consentTypes = json['consentTypes'].cast<String>();
    consentExpiry = json['consentExpiry'];
    frequency = json['frequency'] != null
        ? new Frequency.fromJson(json['frequency'])
        : null;
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    purpose =
        json['purpose'] != null ? new Purpose.fromJson(json['purpose']) : null;
    dataLife = json['dataLife'] != null
        ? new Frequency.fromJson(json['dataLife'])
        : null;
    fidataRange = json['fidataRange'] != null
        ? new FidataRange.fromJson(json['fidataRange'])
        : null;
    dataConsumer = json['dataConsumer'] != null
        ? new DataConsumer.fromJson(json['dataConsumer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fiTypes'] = this.fiTypes;
    data['fetchType'] = this.fetchType;
    data['consentMode'] = this.consentMode;
    data['consentStart'] = this.consentStart;
    data['consentTypes'] = this.consentTypes;
    data['consentExpiry'] = this.consentExpiry;
    if (this.frequency != null) {
      data['frequency'] = this.frequency!.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.purpose != null) {
      data['purpose'] = this.purpose!.toJson();
    }
    if (this.dataLife != null) {
      data['dataLife'] = this.dataLife!.toJson();
    }
    if (this.fidataRange != null) {
      data['fidataRange'] = this.fidataRange!.toJson();
    }
    if (this.dataConsumer != null) {
      data['dataConsumer'] = this.dataConsumer!.toJson();
    }
    return data;
  }
}

class Frequency {
  String? unit;
  int? value;

  Frequency({this.unit, this.value});

  Frequency.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit'] = this.unit;
    data['value'] = this.value;
    return data;
  }
}

class Customer {
  String? id;
  List<Identifiers>? identifiers;

  Customer({this.id, this.identifiers});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['identifiers'] != null) {
      identifiers = <Identifiers>[];
      json['identifiers'].forEach((v) {
        identifiers!.add(new Identifiers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.identifiers != null) {
      data['identifiers'] = this.identifiers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Identifiers {
  String? type;
  String? value;

  Identifiers({this.type, this.value});

  Identifiers.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['value'] = this.value;
    return data;
  }
}

class Purpose {
  String? code;
  String? text;
  String? refUri;
  Category? category;

  Purpose({this.code, this.text, this.refUri, this.category});

  Purpose.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    text = json['text'];
    refUri = json['refUri'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['text'] = this.text;
    data['refUri'] = this.refUri;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  String? type;

  Category({this.type});

  Category.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    return data;
  }
}

class FidataRange {
  String? to;
  String? from;

  FidataRange({this.to, this.from});

  FidataRange.fromJson(Map<String, dynamic> json) {
    to = json['to'];
    from = json['from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['to'] = this.to;
    data['from'] = this.from;
    return data;
  }
}

class DataConsumer {
  String? id;
  String? type;

  DataConsumer({this.id, this.type});

  DataConsumer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    return data;
  }
}

class LinkedBankAccounts {
  int? userAccountID;
  String? userID;
  String? fipID;
  String? fiType;
  String? accountType;
  String? accountRefNumber;
  String? linkRefNumber;
  String? maskedAccountNumber;
  String? updatedAt;
  String? nickName;
  String? status;
  List<Null>? consentArtefacts;
  String? fipname;

  LinkedBankAccounts(
      {this.userAccountID,
      this.userID,
      this.fipID,
      this.fiType,
      this.accountType,
      this.accountRefNumber,
      this.linkRefNumber,
      this.maskedAccountNumber,
      this.updatedAt,
      this.nickName,
      this.status,
      this.consentArtefacts,
      this.fipname});

  LinkedBankAccounts.fromJson(Map<String, dynamic> json) {
    userAccountID = json['userAccountID'];
    userID = json['userID'];
    fipID = json['fipID'];
    fiType = json['fiType'];
    accountType = json['accountType'];
    accountRefNumber = json['accountRefNumber'];
    linkRefNumber = json['linkRefNumber'];
    maskedAccountNumber = json['maskedAccountNumber'];
    updatedAt = json['updatedAt'];
    nickName = json['nickName'];
    status = json['status'];

    fipname = json['fipname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userAccountID'] = this.userAccountID;
    data['userID'] = this.userID;
    data['fipID'] = this.fipID;
    data['fiType'] = this.fiType;
    data['accountType'] = this.accountType;
    data['accountRefNumber'] = this.accountRefNumber;
    data['linkRefNumber'] = this.linkRefNumber;
    data['maskedAccountNumber'] = this.maskedAccountNumber;
    data['updatedAt'] = this.updatedAt;
    data['nickName'] = this.nickName;
    data['status'] = this.status;

    data['fipname'] = this.fipname;
    return data;
  }
}
