import 'dart:convert';

import 'package:andreasan/models/song.dart';
import 'package:collection/collection.dart';

class AppUserData {
  String uid;
  String name;
  List<Song> songList;
  AppUserData({
    required this.uid,
    required this.name,
    required this.songList,
  });

  AppUserData copyWith({
    String? uid,
    String? name,
    List<Song>? songList,
  }) {
    return AppUserData(
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

  factory AppUserData.fromMap(Map<String, dynamic> map) {
    return AppUserData(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      songList: List<Song>.from(map['songList']?.map((x) => Song.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUserData.fromJson(String source) =>
      AppUserData.fromMap(json.decode(source));

  @override
  String toString() =>
      'AppUserData(uid: $uid, name: $name, songList: $songList)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is AppUserData &&
        other.uid == uid &&
        other.name == name &&
        listEquals(other.songList, songList);
  }

  @override
  int get hashCode => uid.hashCode ^ name.hashCode ^ songList.hashCode;
}
