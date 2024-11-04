class LoginResponseData {
  String? redirectUrl;
  String? phoneNo;
  List<String>? fipIds;
  List<String>? consentHandles;
  String? otpReference;

  LoginResponseData(
      {this.redirectUrl,
      this.phoneNo,
      this.fipIds,
      this.consentHandles,
      this.otpReference});

  LoginResponseData.fromJson(Map<String, dynamic> json) {
    redirectUrl = json['redirect_url'];
    phoneNo = json['phone_no'];
    fipIds = json['fip_ids'].cast<String>();
    consentHandles = json['consent_handles'].cast<String>();
    otpReference = json['otp_reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['redirect_url'] = this.redirectUrl;
    data['phone_no'] = this.phoneNo;
    data['fip_ids'] = this.fipIds;
    data['consent_handles'] = this.consentHandles;
    data['otp_reference'] = this.otpReference;
    return data;
  }
}
