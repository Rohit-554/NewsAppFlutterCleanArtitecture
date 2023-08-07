import '../models/Article.dart';

abstract class DatabaseRepository {
  Future<List<Article>> getSavedArticle();
  Future<void> saveArticle(Article article);
  Future<void> removeArticle(Article article);
}
