import 'dart:io';
import 'package:cis/models/data_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ConnectApi {
  var url = Uri.parse("http://10.0.2.2:8080/person");

  Future<DataModel> getData(String nik) async {
    try {
      var request = http.Request('GET', url);

      request.body = json.encode({"nik": nik});

      var headers = {'Content-Type': 'application/json'};
      request.headers.addAll(headers);

      http.StreamedResponse streamedResponse = await request.send();

      var response = await http.Response.fromStream(streamedResponse);
      final result = jsonDecode(response.body) as Map<String, dynamic>;
      // print(result);
      return DataModel(
          personId: result['personId'].toString(),
          nik: result['nik'].toString(),
          fullName: result['fullName'].toString(),
          gender: result['gender'].toString(),
          address: result['address'].toString(),
          statusPernikahan: result['statusPernikahan'].toString());
    } catch (e) {
      rethrow;
    }
  }
}
