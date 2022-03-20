import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserDetails {
  late String displayName;
  late String email;
  late String photoURL;

  //constructor

  UserDetails(
      {required this.displayName, required this.email, required this.photoURL});

  //we meed create map

  UserDetails.fromJson(Map<String, dynamic> json) {
    displayName = json["displayName"];
    photoURL = json["photoUrl"];
    email = json["email"];
  }
  Map<String, dynamic> toJson() {
    //object - data
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['displayName'] = this.displayName;
    data['photoUrl'] = this.photoURL;
    data['email'] = this.email;

    return data;
  }
}

DatabaseReference userRef = FirebaseDatabase.instance.ref().child('users');

displayMessage(String message) {
  Fluttertoast.showToast(msg: message);
}
