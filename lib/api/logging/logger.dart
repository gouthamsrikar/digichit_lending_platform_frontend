import 'package:logger/logger.dart';

class ELogger {
  static final ELogger _instance = ELogger._internal();
  static final Logger _logger = Logger();

  ELogger._internal();

  static ELogger get() {
    return _instance;
  }

  void info(final dynamic message) {
    _logger.i(message);
  }

  void debug(final dynamic message) {
    _logger.d(message);
  }

  void error(final dynamic message) {
    _logger.e(message);
  }
}
