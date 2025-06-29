import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class ApiService {
  Future<List<Character>> fetchCharacters(String adventurerName) async {
    final url = Uri.parse(
        'https://dundam.xyz/search?server=adven&name=$adventurerName');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final list = data['characters'] as List;
      return list.map((e) => Character.fromJson(e)).toList();
    } else {
      throw Exception('캐릭터 정보를 불러올 수 없습니다.');
    }
  }
}
