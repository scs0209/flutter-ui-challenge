class WebtoonModel {
  final String title, thumb, id;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}

// json = {id: 751993, title: 보물과 괴물의 도시, thumb: https://image-comic.pstatic.net/webtoon/751993/thumbnail/thumbnail_IMAG21_7089003575688389985.jpg}