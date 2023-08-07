import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../domain/models/Article.dart';
import '../../../../../../domain/repositories/database_repository.dart';

part 'local_articles_state.dart';

class LocalArticlesCubit extends Cubit<LocalArticlesState> {
  final DatabaseRepository _databaseRespository;
  LocalArticlesCubit(this._databaseRespository)
      : super(const LocalArticlesLoading());

  Future<void> getSavedArticle() async {
    emit(await _getAllSavedArticles());
  }

  Future<void> saveArticle({required Article article}) async {
    await _databaseRespository.saveArticle(article);
    emit(await _getAllSavedArticles());
  }

  Future<LocalArticlesState> _getAllSavedArticles() async {
    final articles = await _databaseRespository.getSavedArticle();
    return LocalArticlesSuccess(articles: articles);
  }

  Future<void> removeArticle({required Article article}) async {
    await _databaseRespository.removeArticle(article);
    emit(await _getAllSavedArticles());
  }
}
