import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopder/ClassObjects/httpObjectPostWrite.dart';
import 'package:shopder/function/dataManagement/readjson.dart';

var client = http.Client();
String hostname;
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

void initHttpPostWrite() async {
  hostname = await json.decode(await readJson())['http'];
}

Future<PostWriteResponse> HttpPostWrite(
    //<PostWriteResponse>
    PostWriteRequest bufferPostWriteRequest) async {
  var body = await bufferPostWriteRequest.formatJSON();
  // print(body);
  var url = Uri.parse(hostname + "/shop/postWrite");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  // print(uriResponse.request.finalize());
  // print(uriResponse.statusCode);

  var res = jsonDecode(uriResponse.body);
  // print(res);
  PostWriteResponse bufferPostWriteResponse =
      PostWriteResponse(code: res['code']);

  return bufferPostWriteResponse;
}
