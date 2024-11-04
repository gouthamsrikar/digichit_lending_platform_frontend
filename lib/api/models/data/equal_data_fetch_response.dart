class EqualDataFetchResponse {
  String? status;
  String? message;
  int? timestamp;
  Data? data;
  String? statusCode;

  EqualDataFetchResponse(
      {this.status, this.message, this.timestamp, this.data, this.statusCode});

  EqualDataFetchResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    timestamp = json['timestamp'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['timestamp'] = this.timestamp;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status_code'] = this.statusCode;
    return data;
  }
}

class Data {
  String? equalDecision;
  int? timestamp;
  String? version;
  String? transactionId;
  ConsumerInformation? consumerInformation;
  String? idempotencyId;
  ResponseMetadata? responseMetadata;
  String? idVerificationReport;
  KeyDetails? keyDetails;

  Data({
    this.equalDecision,
    this.timestamp,
    this.version,
    this.transactionId,
    this.consumerInformation,
    this.idempotencyId,
    this.responseMetadata,
    this.idVerificationReport,
    this.keyDetails,
  });

  Data.fromJson(Map<String, dynamic> json) {
    equalDecision = json['equalDecision'];
    timestamp = json['timestamp'];
    version = json['version'];
    transactionId = json['transaction_id'];
    consumerInformation = json['consumer_information'] != null
        ? new ConsumerInformation.fromJson(json['consumer_information'])
        : null;
    idempotencyId = json['idempotency_id'];
    responseMetadata = json['response_metadata'] != null
        ? new ResponseMetadata.fromJson(json['response_metadata'])
        : null;
    idVerificationReport = json['id_verification_report'];
    keyDetails = json['key_details'] != null
        ? new KeyDetails.fromJson(json['key_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['equalDecision'] = this.equalDecision;
    data['timestamp'] = this.timestamp;
    data['version'] = this.version;
    data['transaction_id'] = this.transactionId;
    if (this.consumerInformation != null) {
      data['consumer_information'] = this.consumerInformation!.toJson();
    }
    data['idempotency_id'] = this.idempotencyId;
    if (this.responseMetadata != null) {
      data['response_metadata'] = this.responseMetadata!.toJson();
    }
    data['id_verification_report'] = this.idVerificationReport;
    if (this.keyDetails != null) {
      data['key_details'] = this.keyDetails!.toJson();
    }

    return data;
  }
}

class ConsumerInformation {
  String? consumerId;
  String? mobile;

  ConsumerInformation({this.consumerId, this.mobile});

  ConsumerInformation.fromJson(Map<String, dynamic> json) {
    consumerId = json['consumer_id'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['consumer_id'] = this.consumerId;
    data['mobile'] = this.mobile;
    return data;
  }
}

class ResponseMetadata {
  String? partnerId;

  ResponseMetadata({this.partnerId});

  ResponseMetadata.fromJson(Map<String, dynamic> json) {
    partnerId = json['partnerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['partnerId'] = this.partnerId;
    return data;
  }
}

class BANKSTATEMENT {
  String? keyName;
  String? keyStatus;
  List<BankStatementKeyData>? keyData;

  BANKSTATEMENT({this.keyName, this.keyStatus, this.keyData});

  BANKSTATEMENT.fromJson(Map<String, dynamic> json) {
    keyName = json['key_name'];
    keyStatus = json['key_status'];
    if (json['key_data'] != null) {
      keyData = <BankStatementKeyData>[];
      json['key_data'].forEach((v) {
        keyData!.add(new BankStatementKeyData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key_name'] = this.keyName;
    data['key_status'] = this.keyStatus;
    if (this.keyData != null) {
      data['key_data'] = this.keyData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BankStatementKeyData {
  String? accountNumber;
  String? accountType;
  String? keyId;
  String? keyFetchType;
  String? keyVerificationStage;
  String? verificationType;
  String? monthWiseSalaries;
  String? transactionList;
  String? issuerName;
  String? keyName;
  String? bankStatementEndDate;
  String? bankStatementStartDate;
  int? closingBalance;
  String? bankName;
  String? name;
  String? keyBuid;
  String? keySource;
  double? openingBalance;
  List<MonthWiseAnalysis>? monthWiseAnalysis;
  String? keyFetchedAt;
  Null? isTampered;
  Null? excelData;

  BankStatementKeyData(
      {this.accountNumber,
      this.accountType,
      this.keyId,
      this.keyFetchType,
      this.keyVerificationStage,
      this.verificationType,
      this.monthWiseSalaries,
      this.transactionList,
      this.issuerName,
      this.keyName,
      this.bankStatementEndDate,
      this.bankStatementStartDate,
      this.closingBalance,
      this.bankName,
      this.name,
      this.keyBuid,
      this.keySource,
      this.openingBalance,
      this.monthWiseAnalysis,
      this.keyFetchedAt,
      this.isTampered,
      this.excelData});

  BankStatementKeyData.fromJson(Map<String, dynamic> json) {
    accountNumber = json['account_number'];
    accountType = json['account_type'];
    keyId = json['key_id'];
    keyFetchType = json['key_fetch_type'];
    keyVerificationStage = json['key_verification_stage'];
    verificationType = json['verification_type'];
    monthWiseSalaries = json['month_wise_salaries'];
    transactionList = json['transaction_list'];
    issuerName = json['issuer_name'];
    keyName = json['key_name'];
    bankStatementEndDate = json['bank_statement_end_date'];
    bankStatementStartDate = json['bank_statement_start_date'];
    closingBalance = json['closing_balance'];
    bankName = json['bank_name'];
    name = json['name'];
    keyBuid = json['key_buid'];
    keySource = json['key_source'];
    openingBalance = json['opening_balance'];
    if (json['month_wise_analysis'] != null) {
      monthWiseAnalysis = <MonthWiseAnalysis>[];
      json['month_wise_analysis'].forEach((v) {
        monthWiseAnalysis!.add(new MonthWiseAnalysis.fromJson(v));
      });
    }
    keyFetchedAt = json['key_fetched_at'];
    isTampered = json['is_tampered'];
    excelData = json['excel_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_number'] = this.accountNumber;
    data['account_type'] = this.accountType;
    data['key_id'] = this.keyId;
    data['key_fetch_type'] = this.keyFetchType;
    data['key_verification_stage'] = this.keyVerificationStage;
    data['verification_type'] = this.verificationType;
    data['month_wise_salaries'] = this.monthWiseSalaries;
    data['transaction_list'] = this.transactionList;
    data['issuer_name'] = this.issuerName;
    data['key_name'] = this.keyName;
    data['bank_statement_end_date'] = this.bankStatementEndDate;
    data['bank_statement_start_date'] = this.bankStatementStartDate;
    data['closing_balance'] = this.closingBalance;
    data['bank_name'] = this.bankName;
    data['name'] = this.name;
    data['key_buid'] = this.keyBuid;
    data['key_source'] = this.keySource;
    data['opening_balance'] = this.openingBalance;
    if (this.monthWiseAnalysis != null) {
      data['month_wise_analysis'] =
          this.monthWiseAnalysis!.map((v) => v.toJson()).toList();
    }
    data['key_fetched_at'] = this.keyFetchedAt;
    data['is_tampered'] = this.isTampered;
    data['excel_data'] = this.excelData;
    return data;
  }
}

class MonthWiseAnalysis {
  String? monthName;
  int? noOfDebitTransactions;
  int? noOfCreditTransactions;
  double? totalCreditAmount;
  String? year;
  double? totalDebitAmount;
  int? averageEodBalance;

  MonthWiseAnalysis(
      {this.monthName,
      this.noOfDebitTransactions,
      this.noOfCreditTransactions,
      this.totalCreditAmount,
      this.year,
      this.totalDebitAmount,
      this.averageEodBalance});

  MonthWiseAnalysis.fromJson(Map<String, dynamic> json) {
    monthName = json['month_name'];
    noOfDebitTransactions = json['no_of_debit_transactions'];
    noOfCreditTransactions = json['no_of_credit_transactions'];
    totalCreditAmount = json['total_credit_amount'];
    year = json['year'];
    totalDebitAmount = json['total_debit_amount'];
    averageEodBalance = json['average_eod_balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month_name'] = this.monthName;
    data['no_of_debit_transactions'] = this.noOfDebitTransactions;
    data['no_of_credit_transactions'] = this.noOfCreditTransactions;
    data['total_credit_amount'] = this.totalCreditAmount;
    data['year'] = this.year;
    data['total_debit_amount'] = this.totalDebitAmount;
    data['average_eod_balance'] = this.averageEodBalance;
    return data;
  }
}

class PanKeyData {
  String? keyName;
  Null? equalArtefact;
  String? gender;
  String? keyId;
  String? dob;
  String? name;
  String? keyBuid;
  String? keyVerificationStage;
  String? keySource;
  String? keyFetchedAt;

  PanKeyData(
      {this.keyName,
      this.equalArtefact,
      this.gender,
      this.keyId,
      this.dob,
      this.name,
      this.keyBuid,
      this.keyVerificationStage,
      this.keySource,
      this.keyFetchedAt});

  PanKeyData.fromJson(Map<String, dynamic> json) {
    keyName = json['key_name'];
    equalArtefact = json['equal_artefact'];
    gender = json['gender'];
    keyId = json['key_id'];
    dob = json['dob'];
    name = json['name'];
    keyBuid = json['key_buid'];
    keyVerificationStage = json['key_verification_stage'];
    keySource = json['key_source'];
    keyFetchedAt = json['key_fetched_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key_name'] = this.keyName;
    data['equal_artefact'] = this.equalArtefact;
    data['gender'] = this.gender;
    data['key_id'] = this.keyId;
    data['dob'] = this.dob;
    data['name'] = this.name;
    data['key_buid'] = this.keyBuid;
    data['key_verification_stage'] = this.keyVerificationStage;
    data['key_source'] = this.keySource;
    data['key_fetched_at'] = this.keyFetchedAt;
    return data;
  }
}

class KeyDetails {
  BANKSTATEMENT? bANKSTATEMENT;
  PAN? pAN;

  KeyDetails({this.bANKSTATEMENT, this.pAN});

  KeyDetails.fromJson(Map<String, dynamic> json) {
    bANKSTATEMENT = json['BANK_STATEMENT'] != null
        ? new BANKSTATEMENT.fromJson(json['BANK_STATEMENT'])
        : null;
    pAN = json['PAN'] != null ? new PAN.fromJson(json['PAN']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bANKSTATEMENT != null) {
      data['BANK_STATEMENT'] = this.bANKSTATEMENT!.toJson();
    }
    if (this.pAN != null) {
      data['PAN'] = this.pAN!.toJson();
    }
    return data;
  }
}

class PAN {
  String? keyName;
  String? keyStatus;
  List<PanKeyData>? keyData;

  PAN({this.keyName, this.keyStatus, this.keyData});

  PAN.fromJson(Map<String, dynamic> json) {
    keyName = json['key_name'];
    keyStatus = json['key_status'];
    if (json['key_data'] != null) {
      keyData = <PanKeyData>[];
      json['key_data'].forEach((v) {
        keyData!.add(new PanKeyData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key_name'] = this.keyName;
    data['key_status'] = this.keyStatus;
    if (this.keyData != null) {
      data['key_data'] = this.keyData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
