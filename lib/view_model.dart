import 'dart:async';

import 'package:flutter/material.dart';
import 'url_config_manager.dart';
import 'handlers/base_handler.dart';
import 'models/sdk_init_req.dart';
import 'models/sdk_init_res.dart';
import 'services/api_service.dart';
import 'package:uuid/uuid.dart';

enum ApiStates { initial, loading, success, error }

enum PdfReportStatus { initial, viewReport, waiting, failed }

class ViewModel extends ChangeNotifier {
  ApiStates apiStates = ApiStates.initial;
  PdfReportStatus pdfReportStatus = PdfReportStatus.initial;
  dynamic transactionId;
  void setState(ApiStates state) {
    apiStates = state;
    notifyListeners();
  }

  void setPdfState(PdfReportStatus state) {
    pdfReportStatus = state;
    notifyListeners();
  }

  final urlManager = UrlConfigManager.getInstance();

  TransactionInput transactionInput = TransactionInput();

  static String idempotencyId = "";

  Future<void> sdkInit({required String mobile}) async {
    final uuid = const Uuid().v4();
    idempotencyId = uuid;
    transactionInput.mobile = mobile;
    setState(ApiStates.loading);
    final req = SdkInitReq(
      clientId: urlManager.clientId,
      clientSecret: urlManager.clientSecret,
      gatewayInstanceId: urlManager.instanceId,
      idempotencyId: uuid,
      keys: [],
      transactionInput: transactionInput,
    );
    try {
      final result = await ApiService().sdkInit(req);
      if (result.statusCode == 200 || result.statusCode == 201) {
        final res = SDKInitResult.fromJson(result.data);
        BaseHandler.getHandler().openSdk(
            urlManager.clientId, uuid, res.token, transactionInput.mobile);

        setState(ApiStates.loading);
      } else {
        setState(ApiStates.error);
      }
    } catch (e) {
      setState(ApiStates.error);
    }
  }
}
