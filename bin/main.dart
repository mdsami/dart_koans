import 'package:io/io.dart';
import 'package:watcher/watcher.dart';
import 'package:path/path.dart' as path;

main(List<String> arguments) async {
  var watcher = DirectoryWatcher(path.relative("lib"));

  print("Watcher is watching!");
  watcher.events.listen((event) async {
    final manager = ProcessManager();

    print(event);

    try {
      await manager.spawn(
        "pub",
        [
          "run",
          "--enable-asserts",
          path.relative("./bin/dart_koans_runner.dart")
        ],
      );
    } catch (e) {
      print(e);
    }
  });
}
