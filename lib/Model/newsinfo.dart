// To parse this JSON data, do
//
//     final newsModelClass = newsModelClassFromJson(jsonString);

import 'dart:convert';

NewsModelClass newsModelClassFromJson(String str) => NewsModelClass.fromJson(json.decode(str));

String newsModelClassToJson(NewsModelClass data) => json.encode(data.toJson());

class NewsModelClass {
    NewsModelClass({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    String status;
    int totalResults;
    List<Article> articles;

    factory NewsModelClass.fromJson(Map<String, dynamic> json) => NewsModelClass(
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
        required this.source,
        required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content,
    });

    Source source;
    String author;
    String title;
    String description;
    String url;
    String urlToImage;
    DateTime publishedAt;
    String content;

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? "author",
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author == null ?  null : author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
    };
}

class Source {
    Source({
        required this.id,
        required this.name,
    });

    String id;
    String name;

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] ?? "null",
        name: json["name"] ?? "null",
    );

    Map<String, dynamic> toJson() => {
        "id": id ?? "null",
        "name": name,
    };
}
