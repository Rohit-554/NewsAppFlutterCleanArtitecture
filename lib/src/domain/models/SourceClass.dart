import 'package:equatable/equatable.dart';

class SourceClass extends Equatable {
  final String? id;
  final String name;

  const SourceClass({
    this.id,
    required this.name,
  });

  factory SourceClass.fromJson(Map<String, dynamic> json) => SourceClass(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  List<Object?> get props => [id, name];
}
