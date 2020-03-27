import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:first_flutter_app/models/artists.dart';

class ApiProvider {
  final url = "https://tastedive.com/api/similar?q=";

  Future<List<Results>> fetchArtistsFromApi(String artist) async {
    var response = await Dio().get(url + artist);
    print("response = $response");
    var results = jsonDecode(response.toString());
    return Artists.fromJson(results).similar.results;
  }
}