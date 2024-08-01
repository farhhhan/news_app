import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/domain/newsModel.dart';

class NewsRepo {
  Future<List<NewsModel>> fetchNews({required int limit, required int offset}) async {
    try {
      final url = Uri.parse('https://news.kumudam.com/api/posts/?limit=$limit&offset=$offset&order=id&orderType=desc');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => NewsModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to fetch data');
    }
  }
}
