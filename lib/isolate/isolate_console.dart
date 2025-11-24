import 'dart:isolate';
import 'dart:math';

/// Worker isolate
void worker(SendPort mainPort) async {
  final random = Random();
  int generated = 0;

  // Port để worker nhận lệnh STOP
  final workerReceivePort = ReceivePort();
  mainPort.send(workerReceivePort.sendPort);

  workerReceivePort.listen((msg) {
    if (msg == "STOP") {
      print("Worker received STOP, exiting...");
      Isolate.exit();
    }
  });

  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    generated = random.nextInt(10) + 1;
    print("Worker → random = $generated");
    mainPort.send(generated);
  }
}

/// MAIN
void main() async {
  final receive = ReceivePort();
  await Isolate.spawn(worker, receive.sendPort);

  SendPort? workerSender;
  int total = 0;

  // Listen messages from worker
  await for (final msg in receive) {
    // nhận sendPort lần đầu
    if (msg is SendPort) {
      workerSender = msg;
      print("Worker connected.");
      continue;
    }

    // msg là random số
    if (msg is int) {
      total += msg;
      print("Main sum = $total");

      if (total > 100) {
        print("\n=== Sending STOP ===");
        workerSender?.send("STOP");
        break;
      }
    }
  }

  print("\nWorker exited – main finished");
}
