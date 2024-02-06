import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/constants.dart';

class ApiService{

  Future<dynamic> postRequest({required apiUrl, required data}) async {
    var request = http.MultipartRequest('POST', Uri.parse('$BASEURL/$apiUrl'));
    request.fields.addAll(data);

    http.StreamedResponse res = await request.send();

    print(res.statusCode);
    // var body =
    // print(body);
    var decode = jsonDecode(await res.stream.bytesToString());

    if (res.statusCode == 200) {
      return decode;
    } else {
      print(res.reasonPhrase);
    }
  }

}

