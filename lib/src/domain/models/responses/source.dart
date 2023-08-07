import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../Article.dart';

Source sourceFromJson(String str) => Source.fromJson(json.decode(str));

String sourceToJson(Source data) => json.encode(data.toJson());

class Source extends Equatable {
  final String status;
  final int totalResults;
  final List<Article> articles;

  const Source({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [status, totalResults, articles];
}
