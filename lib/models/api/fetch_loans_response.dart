class FetchLoansResponse {
  List<LoansModels>? loans;

  FetchLoansResponse({this.loans});

  FetchLoansResponse.fromJson(Map<String, dynamic> json) {
    if (json['loans'] != null) {
      loans = <LoansModels>[];
      json['loans'].forEach((v) {
        loans!.add(new LoansModels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.loans != null) {
      data['loans'] = this.loans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LoansModels {
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? iD;
  int? loanAmount;
  int? communityId;
  int? loanAmountRepaid;
  int? userId;
  String? ledgerState;

  LoansModels(
      {this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.iD,
      this.loanAmount,
      this.communityId,
      this.loanAmountRepaid,
      this.userId,
      this.ledgerState});

  LoansModels.fromJson(Map<String, dynamic> json) {
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    deletedAt = json['DeletedAt'];
    iD = json['ID'];
    loanAmount = json['loan_amount'];
    communityId = json['community_id'];
    loanAmountRepaid = json['loan_amount_repaid'];
    userId = json['user_id'];
    ledgerState = json['ledger_state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CreatedAt'] = this.createdAt;
    data['UpdatedAt'] = this.updatedAt;
    data['DeletedAt'] = this.deletedAt;
    data['ID'] = this.iD;
    data['loan_amount'] = this.loanAmount;
    data['community_id'] = this.communityId;
    data['loan_amount_repaid'] = this.loanAmountRepaid;
    data['user_id'] = this.userId;
    data['ledger_state'] = this.ledgerState;
    return data;
  }
}
