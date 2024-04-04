import 'dart:convert';
import 'dart:js_interop';
import 'package:http/http.dart' as http;
import 'package:web/web.dart';

void main() {
  makeRequest();
}

Future<void> makeRequest() async {
  const path = 'examples.json';
  // final httpRequest = HttpRequest();
  final client = http.Client();
  final response = await client.get(Uri.parse(path));
  requestComplete(response);
}

void requestComplete(http.Response response) {
  Element? examples = document.querySelector('#examples');
  switch (response.statusCode) {
    case 200:
      for (var obj in json.decode(response.body)) {
        HTMLAnchorElement link = HTMLAnchorElement()
          ..href = '${obj['folder']}/index.html';
        link.text = obj['title'];
        link.className = 'list-group-item list-group-item-action';
        examples?.children.add(link);
      }
      removeSpinner();
      return;
    default:
      final error = HTMLDivElement()
        ..text = 'Request failed, status=${response.statusCode}'
        ..className = 'alert alert-danger';

      examples?.children.add(error);
      removeSpinner();
  }
}

void removeSpinner() {
  Element? spinner = document.querySelector('#spinner');
  spinner?.remove();
}
