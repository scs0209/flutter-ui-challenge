import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

// 데이터에 state가 없기 때문에 static으로 선언
class AppService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = 'today';

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final result = await http.get(url);
    if (result.statusCode == 200) {
      final List<dynamic> webtoons =
          jsonDecode(result.body); // body를 json으로 변경해줌
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}

// Future는 미래에 받을 값의 타입을 알려줌