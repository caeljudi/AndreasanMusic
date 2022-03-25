import 'package:andreasan/models/appuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  DatabaseService(this.uid);

  Future addUser(String name) async {
    await userCollection.doc(uid).set({'name': name});
    return _userFromSnapShot(await userCollection.doc(uid).get());
  }

  AppUser _userFromSnapShot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return AppUser(uid: uid, name: data['name'], songList: []);
  }

  List<AppUser> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) => _userFromSnapShot(doc)).toList();
  }

  Stream<AppUser> get user { 
    return userCollection.doc(uid).snapshots().map(_userFromSnapShot);
  }
}
