class LanguageProvider {
  LanguageProvider._internal();
  static final LanguageProvider _singleton = LanguageProvider._internal();

  factory LanguageProvider() {
    return _singleton;
  }

  static LanguageProvider getInstance() {
    return _singleton;
  }

  Map<String, String?>? language;

  void loadLanguage({Map<String, String>? customlanguage}) {
    language = customlanguage;
  }

  String? getTextById(String id) {
    return language?[id];
  }
}

const Map<String, String> languageSampleEn = {
  "OTP_VERIFY_BUTTON_TEXT_TAG": "Verify",
  "CONSENT_APPROVE_BUTTON_TEXT_TAG": "Approve",
  "CONSENT_REJECT_BUTTON_TEXT_TAG": "Reject",
  "LINK_MORE_ACCOUNT_BUTTON_TEXT_TAG": "Link More Accounts",
  "SELECT_BANK_LINKED_TO": "Select Bank Linked to",
  "SELECT_BANK_SUBTITLE": "This is required to discover your accounts",
  "SELECT_DISCOVERED_ACCOUNT": "Select the discovered account to link",
  "LINK_ACCOUNTS": "Link Accounts",
  "SKIP": "Skip",
  "BY_PROCEEDING_AA":
      "By proceeding, you agree to share your financial statement",
  "CONSENT_TO_SHARE": "Consent to Share",
  "CONSENT_TO_SUBTITLE": "Choose Account where you receive salary:",
  "ALL_BANKS": "ALL BANKS",
  "PURPOSE": "Purpose",
  "FOR_THE_DURATION": "For the Duration",
  "DATA_FETCHED": "Data fetched"
};

const Map<String, String> languageSampleHi = {
  "OTP_VERIFY_BUTTON_TEXT_TAG": "सत्यापित करें",
  "CONSENT_APPROVE_BUTTON_TEXT_TAG": "स्वीकार करें",
  "CONSENT_REJECT_BUTTON_TEXT_TAG": "अस्वीकार करें",
  "LINK_MORE_ACCOUNT_BUTTON_TEXT_TAG": "अधिक खातों को लिंक करें",
  "SELECT_BANK_LINKED_TO": "लिंक किए गए बैंक का चयन करें",
  "SELECT_BANK_SUBTITLE": "यह आपके खातों की खोज के लिए आवश्यक है",
  "SELECT_DISCOVERED_ACCOUNT": "लिंक करने के लिए खोजे गए खाते का चयन करें",
  "LINK_ACCOUNTS": "खाते लिंक करें",
  "SKIP": "छोड़ें",
  "BY_PROCEEDING_AA":
      "आगे बढ़ने पर, आप अपनी वित्तीय जानकारी साझा करने के लिए सहमत होते हैं",
  "CONSENT_TO_SHARE": "साझा करने की सहमति",
  "CONSENT_TO_SUBTITLE": "वह खाता चुनें जिसमें आपको वेतन प्राप्त होता है:",
  "ALL_BANKS": "सभी बैंक",
  "PURPOSE": "उद्देश्य",
  "FOR_THE_DURATION": "अवधि के लिए",
  "DATA_FETCHED": "डेटा प्राप्त हुआ",
};

const Map<String, String> languageSampleTa = {
  "OTP_VERIFY_BUTTON_TEXT_TAG": "சரிபார்க்கவும்",
  "CONSENT_APPROVE_BUTTON_TEXT_TAG": "ஏற்கவும்",
  "CONSENT_REJECT_BUTTON_TEXT_TAG": "நிராகரிக்கவும்",
  "LINK_MORE_ACCOUNT_BUTTON_TEXT_TAG": "மேலும் கணக்குகளை இணைக்கவும்",
  "SELECT_BANK_LINKED_TO": "இணைக்கப்பட்ட வங்கியைத் தேர்ந்தெடுக்கவும்",
  "SELECT_BANK_SUBTITLE": "உங்கள் கணக்குகளை கண்டறிய இது அவசியம்",
  "SELECT_DISCOVERED_ACCOUNT":
      "இணைக்க கண்டறியப்பட்ட கணக்கைத் தேர்ந்தெடுக்கவும்",
  "LINK_ACCOUNTS": "கணக்குகளை இணைக்கவும்",
  "SKIP": "தவிர்க்கவும்",
  "BY_PROCEEDING_AA":
      "தொடர்ந்தால், நீங்கள் உங்கள் நிதி அறிக்கையைப் பகிர ஒப்புக்கொள்கிறீர்கள்",
  "CONSENT_TO_SHARE": "பகிர்வதற்கு ஒப்புதல்",
  "CONSENT_TO_SUBTITLE": "நீங்கள் சம்பளம் பெறும் கணக்கைத் தேர்ந்தெடுக்கவும்:",
  "ALL_BANKS": "அனைத்து வங்கிகள்",
  "PURPOSE": "நோக்கம்",
  "FOR_THE_DURATION": "காலவரையறைக்குள்",
  "DATA_FETCHED": "தரவைப் பெற்றது",
};

const Map<String, String> languageSampleTe = {
  "OTP_VERIFY_BUTTON_TEXT_TAG": "ధృవీకరించండి",
  "CONSENT_APPROVE_BUTTON_TEXT_TAG": "ఆమోదించు",
  "CONSENT_REJECT_BUTTON_TEXT_TAG": "తిరస్కరించు",
  "LINK_MORE_ACCOUNT_BUTTON_TEXT_TAG": "మరిన్ని ఖాతాలను లింక్ చేయండి",
  "SELECT_BANK_LINKED_TO": "లింక్ చేయబడిన బ్యాంకును ఎంచుకోండి",
  "SELECT_BANK_SUBTITLE": "మీ ఖాతాలను కనుగొనడానికి ఇది అవసరం",
  "SELECT_DISCOVERED_ACCOUNT": "లింక్ చేయడానికి కనుగొన్న ఖాతాను ఎంచుకోండి",
  "LINK_ACCOUNTS": "ఖాతాలను లింక్ చేయండి",
  "SKIP": "దాటవేయి",
  "BY_PROCEEDING_AA":
      "కొనసాగితే, మీరు మీ ఆర్థిక నివేదికను పంచుకోవడానికి అంగీకరిస్తారు",
  "CONSENT_TO_SHARE": "పంచుకోవడానికి అంగీకారం",
  "CONSENT_TO_SUBTITLE": "మీరు వేతనం పొందే ఖాతాను ఎంచుకోండి:",
  "ALL_BANKS": "అన్ని బ్యాంకులు",
  "PURPOSE": "ఉద్దేశ్యం",
  "FOR_THE_DURATION": "వ్యవధి కోసం",
  "DATA_FETCHED": "డేటా తీసుకొచ్చారు",
};
