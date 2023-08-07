import 'package:floor/floor.dart';

import '../../domain/models/Article.dart';
import '../../domain/repositories/database_repository.dart';
import '../datasources/local/app_database.dart';

class DatabaseRespositoryImpl implements DatabaseRepository {
  final AppDatabase _appDatabase;
  DatabaseRespositoryImpl(this._appDatabase);

  @override
  Future<List<Article>> getSavedArticle() async {
    return await _appDatabase.articleDao.getAllArticles();
  }

  @override
  Future<void> removeArticle(Article article) {
    return _appDatabase.articleDao.deleteArticle(article);
  }

  @override
  Future<void> saveArticle(Article article) async {
    return _appDatabase.articleDao.insertArticle(article);
  }
}
