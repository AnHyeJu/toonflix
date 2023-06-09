class WebtoonDetailModel {
  final String title, about, genre, age;

  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        genre = json['genre'],
        age = json['age'],
        about = json['about'];
}
