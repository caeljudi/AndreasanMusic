import 'package:andreasan/models/app_user_data.dart';
import 'package:andreasan/models/appuser.dart';
import 'package:andreasan/models/song.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  late AppUser user;

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  Song? currentSong;

  late Stream<DocumentSnapshot<Object?>> documentSnapshot;

  void initUser(User u) {
    user = AppUser(uid: u.uid, name: "", songList: []);
  }

  Stream<DocumentSnapshot<Object?>> getUserDocuments() {
    return documentSnapshot = userCollection.doc(user.uid).snapshots();
  }
}
