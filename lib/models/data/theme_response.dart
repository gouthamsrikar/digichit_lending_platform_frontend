// class ThemeResponse {
//   Map<String, FilledbuttonProps>? filledbutton;
//   Map<String, OutlinedbuttonProps>? outlinedbutton;
//   Map<String, CheckboxProps>? checkbox;
//   Map<String, TextfieldProps>? textfield;
//   Map<String, ScreenProps>? screen;

//   ThemeResponse({
//     this.filledbutton,
//     this.outlinedbutton,
//     this.checkbox,
//     this.textfield,
//     this.screen,
//   });

//   // fromJson constructor
//   factory ThemeResponse.fromJson(Map<String, dynamic> json) {
//     return ThemeResponse(
//         filledbutton: (json['@filledbutton'] as Map<String, dynamic>?)?.map(
//           (key, value) => MapEntry(key, FilledbuttonProps.fromJson(value)),
//         ),
//         outlinedbutton: (json['@outlinedbutton'] as Map<String, dynamic>?)?.map(
//           (key, value) => MapEntry(key, OutlinedbuttonProps.fromJson(value)),
//         ),
//         checkbox: (json['@checkbox'] as Map<String, dynamic>?)?.map(
//           (key, value) => MapEntry(key, CheckboxProps.fromJson(value)),
//         ),
//         textfield: (json['@textfield'] as Map<String, dynamic>?)?.map(
//           (key, value) => MapEntry(key, TextfieldProps.fromJson(value)),
//         ),
//         screen: (json['@screen'] as Map<String, dynamic>?)?.map(
//           (key, value) => MapEntry(key, ScreenProps.fromJson(value)),
//         ));
//   }
// }

// class FilledbuttonProps {
//   String? text;
//   String? textColor;
//   double? textFontSize;
//   String? enabledColor;
//   String? disabledColor;
//   double? borderRadius;
//   double? height;

//   FilledbuttonProps(
//       {this.text,
//       this.textColor,
//       this.textFontSize,
//       this.enabledColor,
//       this.disabledColor,
//       this.borderRadius,
//       this.height});

//   FilledbuttonProps.fromJson(Map<String, dynamic> json) {
//     text = json['@text'];
//     textColor = json['@textColor'];
//     textFontSize = json['@textFontSize'];
//     enabledColor = json['@enabledColor'];
//     disabledColor = json['@disabledColor'];
//     borderRadius = json['@borderRadius'];
//     height = json['@height'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['@text'] = this.text;
//     data['@textColor'] = this.textColor;
//     data['@textFontSize'] = this.textFontSize;
//     data['@enabledColor'] = this.enabledColor;
//     data['@disabledColor'] = this.disabledColor;
//     data['@borderRadius'] = this.borderRadius;
//     data['@height'] = this.height;
//     return data;
//   }
// }

// class OutlinedbuttonProps {
//   String? text;
//   String? textColor;
//   double? textFontSize;
//   String? enabledBorderColor;
//   String? disabledBorderColor;
//   double? borderRadius;
//   double? height;

//   OutlinedbuttonProps(
//       {this.text,
//       this.textColor,
//       this.textFontSize,
//       this.enabledBorderColor,
//       this.disabledBorderColor,
//       this.borderRadius,
//       this.height});

//   OutlinedbuttonProps.fromJson(Map<String, dynamic> json) {
//     text = json['@text'];
//     textColor = json['@textColor'];
//     textFontSize = json['@textFontSize'];
//     enabledBorderColor = json['@enabledBorderColor'];
//     disabledBorderColor = json['@disabledBorderColor'];
//     borderRadius = json['@borderRadius'];
//     height = json['@height'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['@text'] = this.text;
//     data['@textColor'] = this.textColor;
//     data['@textFontSize'] = this.textFontSize;
//     data['@enabledBorderColor'] = this.enabledBorderColor;
//     data['@disabledBorderColor'] = this.disabledBorderColor;
//     data['@borderRadius'] = this.borderRadius;
//     data['@height'] = this.height;
//     return data;
//   }
// }

// class CheckboxProps {
//   String? activeBorderColor;
//   double? activeBorderWidth;
//   String? inactiveBorderColor;
//   double? inactiveBorderWidth;
//   String? checkColor;
//   String? fillColor;
//   double? borderRadius;

//   CheckboxProps(
//       {this.activeBorderColor,
//       this.activeBorderWidth,
//       this.inactiveBorderColor,
//       this.inactiveBorderWidth,
//       this.checkColor,
//       this.fillColor,
//       this.borderRadius});

//   CheckboxProps.fromJson(Map<String, dynamic> json) {
//     activeBorderColor = json['@activeBorderColor'];
//     activeBorderWidth = json['@activeBorderWidth'];
//     inactiveBorderColor = json['@inactiveBorderColor'];
//     inactiveBorderWidth = json['@inactiveBorderWidth'];
//     checkColor = json['@checkColor'];
//     fillColor = json['@fillColor'];
//     borderRadius = json['@borderRadius'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['@activeBorderColor'] = this.activeBorderColor;
//     data['@activeBorderWidth'] = this.activeBorderWidth;
//     data['@inactiveBorderColor'] = this.inactiveBorderColor;
//     data['@inactiveBorderWidth'] = this.inactiveBorderWidth;
//     data['@checkColor'] = this.checkColor;
//     data['@fillColor'] = this.fillColor;
//     data['@borderRadius'] = this.borderRadius;
//     return data;
//   }
// }

// class TextfieldProps {
//   String? hintText;
//   String? hintTextColor;
//   double? hintTextFontSize;
//   String? textColor;
//   String? fillColor;
//   double? textFontSize;
//   String? borderColor;
//   double? borderRadius;
//   double? borderThickness;

//   TextfieldProps(
//       {this.hintText,
//       this.hintTextColor,
//       this.hintTextFontSize,
//       this.textColor,
//       this.fillColor,
//       this.textFontSize,
//       this.borderColor,
//       this.borderRadius,
//       this.borderThickness});

//   TextfieldProps.fromJson(Map<String, dynamic> json) {
//     hintText = json['@hintText'];
//     hintTextColor = json['@hintTextColor'];
//     hintTextFontSize = json['@hintTextFontSize'];
//     textColor = json['@textColor'];
//     fillColor = json['@fillColor'];
//     textFontSize = json['@textFontSize'];
//     borderColor = json['@borderColor'];
//     borderRadius = json['@borderRadius'];
//     borderThickness = json['@borderThickness'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['@hintText'] = this.hintText;
//     data['@hintTextColor'] = this.hintTextColor;
//     data['@hintTextFontSize'] = this.hintTextFontSize;
//     data['@textColor'] = this.textColor;
//     data['@fillColor'] = this.fillColor;
//     data['@textFontSize'] = this.textFontSize;
//     data['@borderColor'] = this.borderColor;
//     data['@borderRadius'] = this.borderRadius;
//     data['@borderThickness'] = this.borderThickness;
//     return data;
//   }
// }

// class ScreenProps {
//   String? backgroundColor;
//   String? titleColor;
//   double? titleFontSize;
//   String? subtitleColor;
//   double? subtitleFontSize;

//   ScreenProps(
//       {this.backgroundColor,
//       this.titleColor,
//       this.titleFontSize,
//       this.subtitleColor,
//       this.subtitleFontSize});

//   ScreenProps.fromJson(Map<String, dynamic> json) {
//     backgroundColor = json['@backgroundColor'];
//     titleColor = json['@titleColor'];
//     titleFontSize = json['@titleFontSize'];
//     subtitleColor = json['@subtitleColor'];
//     subtitleFontSize = json['@subtitleFontSize'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['@backgroundColor'] = this.backgroundColor;
//     data['@titleColor'] = this.titleColor;
//     data['@titleFontSize'] = this.titleFontSize;
//     data['@subtitleColor'] = this.subtitleColor;
//     data['@subtitleFontSize'] = this.subtitleFontSize;
//     return data;
//   }
// }

const sampleThemeResponse = {
  "@filledbutton": {
    "@default": {
      "@text": "#525252",
      "@textColor": "#FFA500",
      "@textFontSize": 12,
      "@enabledColor": "#FFA500",
      "@disabledColor": "#525252",
      "@borderRadius": 20.0,
      "@height": 48.0
    },
    "@tag-1": {
      "@text": "#525252",
      "@textColor": "#525252",
      "@textFontSize": 12,
      "@enabledColor": "#525252",
      "@disabledColor": "#525252",
      "@borderRadius": 4.0,
      "@height": 48.0
    }
  },
  "@outlinedbutton": {
    "@default": {
      "@text": "#525252",
      "@textColor": "#525252",
      "@textFontSize": 12,
      "@enabledBorderColor": "#ffffff",
      "@disabledBorderColor": "#525252",
      "@borderRadius": 4.0,
      "@height": 48.0
    }
  },
  "@checkbox": {
    "@default": {
      "@activeBorderColor": "#52342",
      "@activeBorderWidth": 2.0,
      "@inactiveBorderColor": "#525252",
      "@inactiveBorderWidth": 2.0,
      "@checkColor": "#525252",
      "@fillColor": "#525252",
      "@borderRadius": 4.0
    }
  },
  "@textfield": {
    "@default": {
      "@hintText": "#525252",
      "@hintTextColor": "#525252",
      "@hintTextFontSize": 12,
      "@textColor": "#525252",
      "@fillColor": "#525252",
      "@textFontSize": 12.0,
      "@borderColor": "#525252",
      "@borderRadius": 2.0,
      "@borderThickness": 1.0
    }
  },
  "@screen": {
    "@default": {
      "@backgroundColor": "#ffffff",
      "@titleColor": "#525252",
      "@titleFontSize": 23.0,
      "@subtitleColor": "#525252",
      "@subtitleFontSize": 12.0,
    }
  }
};
