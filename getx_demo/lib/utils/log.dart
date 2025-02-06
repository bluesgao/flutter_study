import 'package:logger/logger.dart';

class Log {
  //私有构造函数
  Log._internal() {
    initLogger();
  }

  //保存单例
  static final Log _singleton = Log._internal();

  //工厂构造函数
  factory Log() => _singleton;

  late Logger _logger;

  // log初始化设置
  Future<void> initLogger() async {
    // FileOutput fileOutPut = FileOutput();
    ConsoleOutput consoleOutput = ConsoleOutput();
    // List<LogOutput> multiOutput = [fileOutPut, consoleOutput];
    List<LogOutput> multiOutput = [consoleOutput];

    _logger = Logger(
      filter: DevelopmentFilter(),
      printer: HybridPrinter(
        PrettyPrinter(
          noBoxingByDefault: false,
          methodCount: 2,
          // number of method calls to be displayed
          errorMethodCount: 8,
          // number of method calls if stacktrace is provided
          lineLength: 120,
          // width of the output
          colors: true,
          // Colorful log messages
          printEmojis: false,
          // Print an emoji for each log message
          // printTime: true, // Should each log print contain a timestamp
          dateTimeFormat: DateTimeFormat.dateAndTime,
        ),
        // debug: SimplePrinter(colors: true, printTime: true),
      ),
      output: MultiOutput(
        multiOutput,
      ), // Use the default LogOutput (-> send everything to console)
    );
  }

  // Debug
  void debug(String message) {
    _logger.d(message);
  }

  // info
  void info(String message) {
    _logger.i(message);
  }

  // warning
  void warning(String message) {
    _logger.w(message);
  }

  // error
  void error(String message) {
    _logger.e(message);
  }
}
