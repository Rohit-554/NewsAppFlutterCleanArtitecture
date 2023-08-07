import 'package:floor/floor.dart';
import 'dart:convert';

import '../../../../domain/models/SourceClass.dart';

class SourceClassConverter extends TypeConverter<SourceClass, String> {
  @override
  SourceClass decode(String databaseValue) {
    final Map<String, dynamic> json = jsonDecode(databaseValue);
    return SourceClass(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  String encode(SourceClass value) {
    final Map<String, dynamic> json = {
      'id': value.id,
      'name': value.name,
    };
    return jsonEncode(json);
  }
}
