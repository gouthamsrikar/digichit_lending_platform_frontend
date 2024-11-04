import 'dart:convert';

import 'package:flutter/services.dart';

class UrlConfigManager {
  static final UrlConfigManager _singleton = UrlConfigManager._internal();

  String? baseUrl;
  String? hostUrl;
  String? scriptUrl;
  String? clientId;
  String? clientSecret;
  String? instanceId;
  String? token;
  String? accessCode;
  factory UrlConfigManager() {
    return _singleton;
  }

  static UrlConfigManager getInstance() {
    return UrlConfigManager();
  }

  UrlConfigManager._internal();

  void initUrls(Function() onUrlsUpdated) {
    rootBundle.loadString('env/url_config.json').then((value) {
      Map<String, dynamic> jsonMap = json.decode(value);
      baseUrl = jsonMap['baseUrl'];
      hostUrl = jsonMap['hostUrl'];
      scriptUrl = jsonMap['script_url'];
      clientId = jsonMap['clientId'];
      clientSecret = jsonMap['client_secret'];
      instanceId = jsonMap['instance_id'];
      token = jsonMap['token'];
      accessCode = jsonMap['access_code'];
      onUrlsUpdated();
    });
  }

  Future<void> asyncLoadConfig() async {
    Map<String, dynamic> jsonMap =
        json.decode(await rootBundle.loadString('env/url_config.json'));
    baseUrl = jsonMap['baseUrl'];
    hostUrl = jsonMap['hostUrl'];
    scriptUrl = jsonMap['script_url'];
    clientId = jsonMap['clientId'];
    clientSecret = jsonMap['client_secret'];
    instanceId = jsonMap['instance_id'];
    token = jsonMap['token'];
    accessCode = jsonMap['access_code'];
  }
}
