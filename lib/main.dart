import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'src/config/router/app_router.dart';
import 'src/domain/repositories/api_repository.dart';
import 'src/domain/repositories/database_repository.dart';
import 'src/locator.dart';
import 'src/presentation/widgets/cubits/cubit/local_articles/cubit/local_articles_cubit.dart';
import 'src/presentation/widgets/cubits/cubit/remote_articles_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final __apRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => LocalArticlesCubit(
                    locator<DatabaseRepository>(),
                  )..getSavedArticle()),
          BlocProvider(
            create: (context) => RemoteArticlesCubit(
              locator<ApiRepository>(),
            )..getBreakingNewsArticle(),
          ),
        ],
        child: OKToast(
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            routerConfig: __apRouter.config(),
          ),
        ));
  }
}
