import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie.dart';
import 'dart:async';

class MovieService {
  final String baseUrl = 'https://www.omdbapi.com/';
  final String apiKey = '6f68d766'; 

  Future<Movie> getMovie(String title) async {
    final url = Uri.parse('$baseUrl?apikey=$apiKey&t=$title');
    final response = await http.get(url);

    await Future.delayed(Duration(seconds: 3));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      if (data['Response'] == 'True') {
        return Movie.fromJson(data);
      } else {
        throw Exception(data['Error']);
      }
    } else {
      throw Exception('Failed to load movie');
    }
  }
}