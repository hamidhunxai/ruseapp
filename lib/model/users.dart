import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String displayName;
  String avatarUrl;
  UserModel(this.uid, this.displayName, this.avatarUrl);
  final userCollection = FirebaseFirestore.instance.collection("user");

  Future updateUserInfo(String userName, String email, String phone) async {
    return await userCollection.doc(uid).set({
      'userName': userName,
      'email': email,
      'phone': phone,
    });
  }

  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }

  Future getCurrentUserData() async {
    try {
      DocumentSnapshot ds = await userCollection.doc(uid).get();
      String userName = ds.get('userName');
      String email = ds.get('email');
      String phone = ds.get('phone');
      return [userName, email, phone];
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //
  // Future<void> userSetup(String displayName) async {
  //   CollectionReference users =
  //       FirebaseFirestore.instance.collection('Profile');
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   String uid = auth.currentUser!.uid.toString();
  //   users.add({
  //     'displayName': displayName,
  //     'uid': uid,
  //   });
  // }
}
