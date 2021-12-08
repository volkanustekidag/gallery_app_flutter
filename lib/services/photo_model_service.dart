import 'dart:convert';

import 'package:flutter_application_1/models/photo_model.dart';
import 'package:http/http.dart' as http;

class PhotoModelService {
  Future<List<PhotoModel>> fetchPicturesAPI() async {
    String url = 'https://picsum.photos/v2/list';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List<dynamic>;
      final listResult = json.map((e) => PhotoModel.fromJson(e)).toList();

      return listResult;
    } else {
      throw Exception('Error');
    }
  }
}
