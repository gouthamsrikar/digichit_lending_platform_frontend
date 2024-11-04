import 'package:onemoney_hack/api/models/data/theme_response.dart';

class ThemeProvider {
  ThemeProvider._internal();
  static final ThemeProvider _singleton = ThemeProvider._internal();

  factory ThemeProvider() {
    return _singleton;
  }

  static ThemeProvider getInstance() {
    return _singleton;
  }

  ThemeResponse? theme;

  void loadTheme({Map<String, dynamic>? customtheme}) {
    try {
      theme = ThemeResponse.fromJson(customtheme ?? sampleThemeResponse);
    } catch (e) {}
  }

  FilledbuttonProps? getFilledButtonPropsById(String? id) {
    return theme?.filledbutton?[id] ?? theme?.filledbutton?["@default"];
  }

  OutlinedbuttonProps? getOutlinedbuttonPropsById(String? id) {
    return theme?.outlinedbutton?[id] ?? theme?.outlinedbutton?["@default"];
  }

  TextfieldProps? getTextfieldPropsById(String? id) {
    return theme?.textfield?[id] ?? theme?.textfield?["@default"];
  }

  CheckboxProps? getCheckboxPropsById(String? id) {
    return theme?.checkbox?[id] ?? theme?.checkbox?["@default"];
  }

  ScreenProps? getScreenPropsById(String? id) {
    return theme?.screen?[id] ?? theme?.screen?["@default"];
  }
}
