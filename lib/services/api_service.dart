import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode.dart';
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

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final result = await http.get(url);
    if (result.statusCode == 200) {
      final webtoon = jsonDecode(result.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse("$baseUrl/$id/episodes");
    final result = await http.get(url);
    if (result.statusCode == 200) {
      final episodes = jsonDecode(result.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }

      return episodesInstances;
    }
    throw Error();
  }
}

// Future는 미래에 받을 값의 타입을 알려줌