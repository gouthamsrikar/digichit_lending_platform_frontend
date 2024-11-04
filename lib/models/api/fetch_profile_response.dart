class FetchProfileResponse {
  ProfileData? profileData;

  FetchProfileResponse({this.profileData});

  FetchProfileResponse.fromJson(Map<String, dynamic> json) {
    profileData = json['profile_data'] != null
        ? new ProfileData.fromJson(json['profile_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profileData != null) {
      data['profile_data'] = this.profileData!.toJson();
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
      this.phoneNumber});

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
    return data;
  }
}
