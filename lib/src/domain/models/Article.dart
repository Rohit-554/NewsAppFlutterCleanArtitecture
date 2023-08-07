import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

import 'package:intl/intl.dart';
import '../../data/datasources/local/converters/date_time_converter.dart';
import '../../utils/constants/strings.dart';
import 'SourceClass.dart';

@Entity(tableName: articlesTableName)
class Article extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final SourceClass source;
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;
  final String? content;

  const Article({
    this.id,
    required this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  String get formattedPublishedAt {
    return DateFormat('yyyy-MM-dd HH:mm:ss')
        .format(publishedAt); // Use your desired date format
  }

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: SourceClass.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };

  @override
  List<Object?> get props => [
        source,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content
      ];
}
