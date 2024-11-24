class FetchProfileResponse {
  ProfileData? profileData;
  List<BankStatement>? bankStatement;

  FetchProfileResponse({this.profileData});

  FetchProfileResponse.fromJson(Map<String, dynamic> json) {
    profileData =
        json['user'] != null ? new ProfileData.fromJson(json['user']) : null;

    if (json['bank_statement'] != null) {
      bankStatement = <BankStatement>[];
      json['bank_statement'].forEach((v) {
        bankStatement!.add(new BankStatement.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profileData != null) {
      data['user'] = this.profileData!.toJson();
    }

    if (this.bankStatement != null) {
      data['bank_statement'] =
          this.bankStatement!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProfileData {
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? iD;
  String? name;
  String? joinDate;
  String? panNo;
  String? bankAccountNo;
  String? communityLevel;
  double? digitScore;
  double? monthlyIncome;
  double? avgBalance;
  double? emiToIncomeRatio;
  double? creditToDebitRatio;
  String? phoneNumber;
  bool? bankStatementFetch;

  ProfileData(
      {this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.iD,
      this.name,
      this.joinDate,
      this.panNo,
      this.bankAccountNo,
      this.communityLevel,
      this.digitScore,
      this.monthlyIncome,
      this.avgBalance,
      this.emiToIncomeRatio,
      this.creditToDebitRatio,
      this.phoneNumber,
      this.bankStatementFetch});

  ProfileData.fromJson(Map<String, dynamic> json) {
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    deletedAt = json['DeletedAt'];
    iD = json['ID'];
    name = json['name'];
    joinDate = json['join_date'];
    panNo = json['pan_no'];
    bankAccountNo = json['bank_account_no'];
    communityLevel = json['community_level'];
    digitScore = json['digit_score'];
    monthlyIncome = json['monthly_income'];
    avgBalance = json['avg_balance'];
    emiToIncomeRatio = json['emi_to_income_ratio'];
    creditToDebitRatio = json['credit_to_debit_ratio'];
    phoneNumber = json['phone_number'];
    bankStatementFetch = json['bank_statement_fetch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CreatedAt'] = this.createdAt;
    data['UpdatedAt'] = this.updatedAt;
    data['DeletedAt'] = this.deletedAt;
    data['ID'] = this.iD;
    data['name'] = this.name;
    data['join_date'] = this.joinDate;
    data['pan_no'] = this.panNo;
    data['bank_account_no'] = this.bankAccountNo;
    data['community_level'] = this.communityLevel;
    data['digit_score'] = this.digitScore;
    data['monthly_income'] = this.monthlyIncome;
    data['avg_balance'] = this.avgBalance;
    data['emi_to_income_ratio'] = this.emiToIncomeRatio;
    data['credit_to_debit_ratio'] = this.creditToDebitRatio;
    data['phone_number'] = this.phoneNumber;
    data['bank_statement_fetch'] = this.bankStatementFetch;
    return data;
  }
}

class BankStatement {
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? iD;
  int? userId;
  String? monthName;
  int? noOfDebitTransactions;
  int? noOfCreditTransactions;
  double? totalCreditAmount;
  String? year;
  double? totalDebitAmount;
  int? averageEodBalance;

  BankStatement(
      {this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.iD,
      this.userId,
      this.monthName,
      this.noOfDebitTransactions,
      this.noOfCreditTransactions,
      this.totalCreditAmount,
      this.year,
      this.totalDebitAmount,
      this.averageEodBalance});

  BankStatement.fromJson(Map<String, dynamic> json) {
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    deletedAt = json['DeletedAt'];
    iD = json['ID'];
    userId = json['user_id'];
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
    data['CreatedAt'] = this.createdAt;
    data['UpdatedAt'] = this.updatedAt;
    data['DeletedAt'] = this.deletedAt;
    data['ID'] = this.iD;
    data['user_id'] = this.userId;
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
