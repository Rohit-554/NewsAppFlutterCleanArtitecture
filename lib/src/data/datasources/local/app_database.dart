import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../domain/models/Article.dart';
import 'converters/date_time_converter.dart';
import 'converters/source_type_converter.dart';
import 'dao/articles_dao.dart';

part 'app_database.g.dart';

@TypeConverters([SourceClassConverter, DateTimeConverter])
@Database(version: 1, entities: [Article])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDao;
}
