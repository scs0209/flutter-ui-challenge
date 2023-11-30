class WebtoonModel {
  final String title, thumb, id;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}

// Map은 object처럼 Dart가 지원하는 key-value 데이터 구조
// 위의 경우에는 key는 JSON의 key(String)이고 value는 JSON의 body)dynamic)이다.
// json = {id: 751993, title: 보물과 괴물의 도시, thumb: https://image-comic.pstatic.net/webtoon/751993/thumbnail/thumbnail_IMAG21_7089003575688389985.jpg}