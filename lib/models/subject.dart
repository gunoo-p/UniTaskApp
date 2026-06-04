// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Subject {
  final String id;
  final String name;
  final String color;
  final DateTime? createAt;
  final DateTime? updateAt;
  Subject({
    required this.id,
    required this.name,
    required this.color,
    this.createAt,
    this.updateAt,
  });

  Subject copyWith({
    String? id,
    String? name,
    String? color,
    DateTime? createAt,
    DateTime? updateAt,
  }) {
    return Subject(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      createAt: createAt ?? this.createAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'color': color,
      'createAt': createAt?.millisecondsSinceEpoch,
      'updateAt': updateAt?.millisecondsSinceEpoch,
    };
  }

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      id: map['id'] as String,
      name: map['name'] as String,
      color: map['color'] as String,
      createAt: map['createAt'] != null ? DateTime.parse(map['create_at'] as String) : null,
      updateAt: map['updateAt'] != null ? DateTime.parse(map['update_at'] as String) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Subject.fromJson(String source) => Subject.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Subject(id: $id, name: $name, color: $color, createAt: $createAt, updateAt: $updateAt)';
  }

  @override
  bool operator ==(covariant Subject other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.color == color &&
      other.createAt == createAt &&
      other.updateAt == updateAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      color.hashCode ^
      createAt.hashCode ^
      updateAt.hashCode;
  }
}
