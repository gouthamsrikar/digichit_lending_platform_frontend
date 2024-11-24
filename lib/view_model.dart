import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onemoney_hack/api/services/chitfund_service.dart';
import 'package:onemoney_hack/di/connect_token_provider.dart';
import 'url_config_manager.dart';
import 'handlers/base_handler.dart';
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

  static String idempotencyId = "";

  Future<void> sdkInit({required String mobile}) async {
    final uuid = const Uuid().v4();
    idempotencyId = uuid;
    setState(ApiStates.loading);

    try {
      final result = await ChitFundService().initTransaction(mobile);
      ConnectTokenProvider.idempotencyId = result.idempotencyId!;

      BaseHandler.getHandler().openSdk(
          urlManager.clientId, result.idempotencyId, result.token, mobile);

      setState(ApiStates.loading);
    } catch (e) {
      setState(ApiStates.error);
    }
  }
}
