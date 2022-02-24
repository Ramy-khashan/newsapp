class NewsApi {
  NewsApi({
    required this.source,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });
  late final Source source;
  late final String title;
  late final String description;
  late final String url;
  late final String urlToImage;
  late final String publishedAt;

  NewsApi.fromJson(Map<String, dynamic> json) {
    source = Source.fromJson(json['source']);
    title = json['title'];
    description = json['description'] == null ? "" : json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'] == null ? "" : json['urlToImage'];
    publishedAt = json['publishedAt'];
  }
}

class Source {
  Source({
    this.id,
    required this.name,
  });
  late final void id;
  late final String name;

  Source.fromJson(Map<String, dynamic> json) {
    id = null;
    name = json['name'];
  }
}
