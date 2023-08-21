import 'package:project_work/index.dart';

/// performs similar fuction as compute
/// but keeps the isolate to cutoff time needed to spawn new one
abstract class WorkerIsolate {
  static late ReceivePort receivePort;
  static late SendPort sendPort;
  static Isolate? _isolate;
  static late StreamQueue _queue;

  ///the function to be run on worker isolate
  static void _create(SendPort sender) {
    ReceivePort receiver = ReceivePort();
    sender.send(receiver);

    receiver.listen((message) async {
      if (message is Function()) {
        var a = message.call();
        sender.send(a);
      } else {
        throw Exception(
          """
          inavalid input on the worker isolate:
          the function of type ${message.runtimeType} cannot be assigned to Function of type dynamic Function()
          """,
        );
      }
    });
  }

  ///spawn a new instance of the worker isolate
  ///and ensures that only one isolate is running
  static Future<void> start() async {
    if (_isolate != null) {
      log("isolate has already started");
      return;
    }
    receivePort = ReceivePort();
    _isolate = await Isolate.spawn(_create, receivePort.sendPort);
    _queue = StreamQueue(receivePort);
    sendPort = await _queue.next;
  }

  ///recieve a function of any type,
  ///runs th function and return value of same type as the function
  static work(Function() function) async {
    if (_isolate == null) throw Exception("No running isolate");
    sendPort.send(function);
    return _queue.next;
  }

  static close() {
    _isolate?.kill();
    _isolate = null;
  }
}
