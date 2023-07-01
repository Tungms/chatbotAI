import 'dart:convert';
import 'dart:io';

import 'package:case2/services/apiconst.dart';
import 'package:http/http.dart' as http;

// class ApiServices {
//   static Future<void> getModels() async { //static dùng để chạy hàm trong hàm
//     try {
//       var response = await http.get(
//         Uri.parse("$BASE_URL/models"),
//         headers: {'Authorization': 'Bearer $API_KEY'},
//       );
//
//       Map jsonResponse = jsonDecode(response.body);
//
//       if (jsonResponse["error"] != null) {
//         print(jsonResponse["error"]["message"]);
//         throw HttpException(jsonResponse["error"]["message"]);
//       }
//       print('jsonResponse $jsonResponse');
//     } catch (error) {
//       print('error apiservices');
//     }
//   }
// }

Future<String> generateResponse(String msg) async {
  final response = await http.post(
    Uri.parse("$BASE_URL/chat/completions"),
    headers: {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $API_KEY"
    },
    body: json.encode({
      "model": "gpt-3.5-turbo",
      "messages": [{"role": "user", "content": msg}],
      "temperature": 0.7
    }),
  );

  Map<String, dynamic> newResponse = jsonDecode(response.body);
  return newResponse["choices"][0]["message"]["content"];
}