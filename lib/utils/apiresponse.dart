



import 'dart:convert';
import 'package:http/http.dart' as http;
class ApiResponse{
  apiCall(String text)async{
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://api.aivinya.education/api/public/aivachat'));
    request.body = json.encode({
      "text": text
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseOutput = await response.stream.bytesToString();
      print(responseOutput);
      return responseOutput;
    }
    else {
    print(response.reasonPhrase);
    }
  }
}