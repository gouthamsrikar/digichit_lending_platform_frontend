class SpeechCheckModel {
  bool? irrelevance;
  bool? profanity;

  SpeechCheckModel({this.irrelevance, this.profanity});

  SpeechCheckModel.fromJson(Map<String, dynamic> json) {
    irrelevance = json['irrelevance'];
    profanity = json['profanity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['irrelevance'] = this.irrelevance;
    data['profanity'] = this.profanity;
    return data;
  }
}

class NextQuestionModel {
  String? question;
  String? hint;
  String? profanityMessage;
  String? irrelavanceMessage;

  NextQuestionModel(
      {this.question,
      this.hint,
      this.profanityMessage,
      this.irrelavanceMessage});

  NextQuestionModel.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    hint = json['hint'];
    profanityMessage = json['profanity_message'];
    irrelavanceMessage = json['irrelavance_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['hint'] = this.hint;
    data['profanity_message'] = this.profanityMessage;
    data['irrelavance_message'] = this.irrelavanceMessage;
    return data;
  }
}