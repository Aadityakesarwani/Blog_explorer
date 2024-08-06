import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/blog.dart';

class ApiService {
  static const String apiUrl = "https://intent-kit-16.hasura.app/api/rest/blogs";
  static const String adminSecret = '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

  Future<List<Blog>> fetchBlogs() async {
    final response = await http.get(Uri.parse(apiUrl), headers: {
      'x-hasura-admin-secret': adminSecret,
    });

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['blogs'];
      return data.map((json) => Blog.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load blogs');
    }
  }
}

