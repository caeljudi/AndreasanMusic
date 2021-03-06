import 'dart:convert';

import 'package:andreasan/models/song.dart';
import 'package:collection/collection.dart';

class AppUser {
  String uid;
  String name;
  List<Song> songList;

  AppUser({
    required this.uid,
    required this.name,
    required this.songList,
  });

  AppUser copyWith({
    String? uid,
    String? name,
    List<Song>? songList,
  }) {
    return AppUser(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      songList: songList ?? this.songList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'songList': songList.map((x) => x.toMap()).toList(),
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      songList: List<Song>.from(map['songList']?.map((x) => Song.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));

  @override
  String toString() => 'AppUser(uid: $uid, name: $name, songList: $songList)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return other is AppUser &&
        other.uid == uid &&
        other.name == name &&
        listEquals(other.songList, songList);
  }

  @override
  int get hashCode => uid.hashCode ^ name.hashCode ^ songList.hashCode;
}
