import 'dart:io';

import 'package:http/http.dart' as http;

class HttpService {
  final String apiKey = 'e1e8d5b85b15bd4fc499fd12dba53da6';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<String> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      String response = result.body;
      return response;
    } else {
      print("Fail");
      return null;
    }
  }
}
