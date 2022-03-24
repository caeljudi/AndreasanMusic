import 'dart:convert';

class Song {
  String fullPath;
  String name;
  Song({
    required this.fullPath,
    required this.name,
  });

  Song copyWith({
    String? fullPath,
    String? name,
  }) {
    return Song(
      fullPath: fullPath ?? this.fullPath,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullPath': fullPath,
      'name': name,
    };
  }

  factory Song.fromMap(Map<String, dynamic> map) {
    return Song(
      fullPath: map['fullPath'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Song.fromJson(String source) => Song.fromMap(json.decode(source));

  @override
  String toString() => 'Song(fullPath: $fullPath, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Song && other.fullPath == fullPath && other.name == name;
  }

  @override
  int get hashCode => fullPath.hashCode ^ name.hashCode;
}
