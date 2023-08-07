import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../../../../domain/models/Article.dart';
import '../../../../domain/models/request/breaking_news_request.dart';
import '../../../../utils/constants/nums.dart';
import '../../../../utils/resources/data_state.dart';
import '../base/base_cubit.dart';
import '../../../../domain/repositories/api_repository.dart';

part 'remote_articles_state.dart';

class RemoteArticlesCubit
    extends BaseCubit<RemoteArticlesState, List<Article>> {
  final ApiRepository _apiRepository;
  RemoteArticlesCubit(this._apiRepository) : super(RemoteArticlesLoading(), []);
  int _page = 1;

  Future<void> getBreakingNewsArticle() async {
    if (isBusy) return;

    await run(() async {
      final response = await _apiRepository.getBreakingNews(
        request: BreakingNewsRequest(page: _page),
      );

      if (response is DataSuccess) {
        final articles = response.data!.articles;
        final noMoreData = articles.length < defaultPageSize;
        data.addAll(articles);
        _page++;
        emit(RemoteArticlesSuccess(
          articles: data,
          noMoreData: noMoreData,
        ));
      } else if (response is DataFailure) {
        emit(RemoteArticlesFailed(error: response.exception));
      }
    });
  }
}
