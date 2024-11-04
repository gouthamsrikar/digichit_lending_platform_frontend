class FetchCommunitesResponse {
  List<CommuntiesModel>? communties;
  List<CommunityLedger>? communtyLedger;

  FetchCommunitesResponse({this.communties, this.communtyLedger});

  FetchCommunitesResponse.fromJson(Map<String, dynamic> json) {
    if (json['communties'] != null) {
      communties = <CommuntiesModel>[];
      json['communties'].forEach((v) {
        communties!.add(new CommuntiesModel.fromJson(v));
      });
    }
    if (json['communty_ledger'] != null) {
      communtyLedger = <CommunityLedger>[];
      json['communty_ledger'].forEach((v) {
        communtyLedger!.add(new CommunityLedger.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.communties != null) {
      data['communties'] = this.communties!.map((v) => v.toJson()).toList();
    }
    if (this.communtyLedger != null) {
      data['communty_ledger'] =
          this.communtyLedger!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CommunityLedger {
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? iD;
  int? communityId;
  int? userId;
  String? state;

  CommunityLedger(
      {this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.iD,
      this.communityId,
      this.userId,
      this.state});

  CommunityLedger.fromJson(Map<String, dynamic> json) {
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    deletedAt = json['DeletedAt'];
    iD = json['ID'];
    communityId = json['community_id'];
    userId = json['user_id'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CreatedAt'] = this.createdAt;
    data['UpdatedAt'] = this.updatedAt;
    data['DeletedAt'] = this.deletedAt;
    data['ID'] = this.iD;
    data['community_id'] = this.communityId;
    data['user_id'] = this.userId;
    data['state'] = this.state;
    return data;
  }
}

class CommuntiesModel {
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? iD;
  String? communityName;
  double? monthlyDeposit;
  double? totalFund;
  double? interestRate;
  String? adminName;
  String? adminUserId;
  int? repaymentPeriodInMonths;
  String? communityDescription;
  int? userCount;
  int? maxCount;

  CommuntiesModel(
      {this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.iD,
      this.communityName,
      this.monthlyDeposit,
      this.totalFund,
      this.interestRate,
      this.adminName,
      this.adminUserId,
      this.repaymentPeriodInMonths,
      this.communityDescription,
      this.userCount,
      this.maxCount});

  CommuntiesModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    deletedAt = json['DeletedAt'];
    iD = json['ID'];
    communityName = json['community_name'];
    monthlyDeposit = json['monthly_deposit'];
    totalFund = json['total_fund'];
    interestRate = json['interest_rate'];
    adminName = json['admin_name'];
    adminUserId = json['admin_user_id'];
    repaymentPeriodInMonths = json['repayment_period_in_months'];
    communityDescription = json['community_description'];
    userCount = json['user_count'];
    maxCount = json['max_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CreatedAt'] = this.createdAt;
    data['UpdatedAt'] = this.updatedAt;
    data['DeletedAt'] = this.deletedAt;
    data['ID'] = this.iD;
    data['community_name'] = this.communityName;
    data['monthly_deposit'] = this.monthlyDeposit;
    data['total_fund'] = this.totalFund;
    data['interest_rate'] = this.interestRate;
    data['admin_name'] = this.adminName;
    data['admin_user_id'] = this.adminUserId;
    data['repayment_period_in_months'] = this.repaymentPeriodInMonths;
    data['community_description'] = this.communityDescription;
    data['user_count'] = this.userCount;
    data['max_count'] = this.maxCount;
    return data;
  }
}
