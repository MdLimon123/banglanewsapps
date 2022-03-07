// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}

class Article {
  Article({
    required this.title,
    required this.category,
    required this.excerpt,
    required this.content,
    required this.tag,
    required this.imageUrl,
    required this.videoUrl,
    required this.newsUrl,
    required this.author,
    required this.authorUrl,
    required this.source,
    required this.sourceUrl,
    required this.publishedAt,
  });

  String title;
  Category? category;
  String excerpt;
  String content;
  String tag;
  String imageUrl;
  String videoUrl;
  String newsUrl;
  String author;
  AuthorUrl? authorUrl;
  String source;
  String sourceUrl;
  DateTime publishedAt;

  factory Article.fromJson(Map<String, dynamic>json) => Article(
    title: json["title"],
    category: categoryValues.map![json["category"]],
    excerpt: json["excerpt"],
    content: json["content"],
    tag: json["tag"],
    imageUrl: json["imageUrl"],
    videoUrl: json["videoUrl"],
    newsUrl: json["newsUrl"],
    author: json["author"],
    authorUrl: authorUrlValues.map![json["authorUrl"]],
    source: json["source"],
    sourceUrl: json["sourceUrl"],
    publishedAt: DateTime.parse(json["publishedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "category": categoryValues.reverse[category],
    "excerpt": excerpt,
    "content": content,
    "tag": tag,
    "imageUrl": imageUrl,
    "videoUrl": videoUrl,
    "newsUrl": newsUrl,
    "author": author,
    "authorUrl": authorUrlValues.reverse[authorUrl],
    "source": source,
    "sourceUrl": sourceUrl,
    "publishedAt": publishedAt.toIso8601String(),
  };
}

enum AuthorUrl { NULL }

final authorUrlValues = EnumValues({
  "null": AuthorUrl.NULL
});

enum Category { EMPTY, CATEGORY, PURPLE, FLUFFY, TENTACLED, STICKY }

final categoryValues = EnumValues({
  "বাংলাদেশ": Category.CATEGORY,
  "আন্তর্জাতিক": Category.EMPTY,
  "খেলা": Category.FLUFFY,
  "অর্থনীতি": Category.PURPLE,
  "স্বাস্থ্য": Category.STICKY,
  "বিজ্ঞান ও প্রযুক্তি": Category.TENTACLED
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues( this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
