import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news2/src/presentation/views/breaking_news_view.dart';

import '../../domain/models/Article.dart';
import '../../presentation/views/article_details_view.dart';
import '../../presentation/views/saved_articles_view.dart';
import '../../presentation/widgets/homescreen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Route")
class AppRouter extends _$AppRouter {
  @override
  RouteType get routeType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: BreakingNewsViewRoute.page, path: "/", initial: true),
        AutoRoute(page: ArticleDetailsViewRoute.page),
        AutoRoute(page: SavedArticlesViewRoute.page),
      ];
}

final appRouter = AppRouter();
