import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../models/song.dart';

class UploadController extends GetxController {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<List<Song>> getReference(String path) async {
    ListResult listResult = await firebaseStorage.ref().child(path).list();

    return listResult.items
        .map((Reference ref) =>
            Song(fullPath: ref.fullPath, name: getNamefromPath(ref.fullPath)))
        .toList();
  }

  Future<void> upload() async {
    ListResult listResult = await firebaseStorage.ref().child("music").list();

    print(listResult.items.elementAt(0).fullPath);
  }

  String getNamefromPath(String fullPath) {
    String name = fullPath.split('/').elementAt(1).split('.').elementAt(0);

    return name;
  }
}
