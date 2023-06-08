import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_Model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse("$baseUrl/$today");
    //http.get이 반환하는 Future 타입
    //-> 미래에 받을 결과값을 알려주는 타입(미래에 <>안의 타입이 반환될것임)
    // future<Response> 는 미래에 <Response>라는 값이 반환된다는걸 알려줌
    //이기 때문에 리턴값이 이런 타입일때 async함수 안에서 await을 씀
    //async함수 안에서만 await쓸 수 있음
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
