import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

//read file with future
Future<String> readFileFuture() async {
  String text;
  try {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/file.txt');
    text = await file.readAsString();
    _writeFile(text);
  } catch (e) {
    print("Couldn't read file");
  }
  return text;
}

//write file with future
void _writeFile(String text) async {
  final Directory directory = await getApplicationDocumentsDirectory();
  final File file = File('${directory.path}/file2.txt');
  await file.writeAsString(text).then((_) {
    print('Done');
  });
}

//read file with stream
void readFileStream() async {
  final Directory directory = await getApplicationDocumentsDirectory();
  Stream<List<int>> stream = File('${directory.path}/file2.txt').openRead();
  StringBuffer buffer = StringBuffer();
  stream.transform(utf8.decoder).transform(LineSplitter()).listen((data) {
    buffer.write(data);
  },
      onDone: () => _writeFileStream(buffer.toString()),
      onError: (e) => print(e));
}

//write file with stream
_writeFileStream(String text) async {
  final Directory directory = await getApplicationDocumentsDirectory();
  File('${directory.path}/file.txt').openWrite(mode: FileMode.write)
    ..write(text)
    ..close().then((_) {
      print('Done stream');
    });
}
