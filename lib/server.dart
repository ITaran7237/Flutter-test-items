import 'dart:convert';
import 'dart:io';

Future main() async {
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 4040);
  print('Listening on localhost:${server.port}');

  await for (HttpRequest request in server) {
    switch (request.method) {
      case "GET":
        request.response.write(request.uri.path.substring(1));
        print('TRN.main.GET >>> amount = ${request.uri.path.substring(1)}');
        break;
      case "POST":
        String content = await utf8.decoder.bind(request).join();
        var data = jsonDecode(content);
        List<String> words = data != null ? List.from(data) : null;
        print('TRN.main.POST >>> words = $words');
        break;
    }
    await request.response.close();
  }
}
