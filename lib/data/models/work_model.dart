class WorkModel {
  final String? id;
  final String title;
  final String description;
  final String creation_date;
  final String technique;
  final String artists;
  final String id_museum;
  final String pictures;
}

WorkModel({
  this.id,
  required this.title,
  required this.description,
  required this.creation_date,
  required this.technique,
  required this.artists,
  required this.id_museum,
  required this.pictures,
});

factory WorkModel.fromJson(Map<Stirng, dynamic > josn){
  return WorkModel(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    creation_date: json['creation_date'],
    technique: json['technique'],
    artists: json['artists'],
    id_museum: json['id_museum'],
    pictures: josn['pictures'],
  );

  Map<String, dynamic > toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'creation_date': creation_date,
      'technique': technique,
      'artists': artists,
      'id_museum': id_museum,
      'pictures': pictures,
    };
  }
}
