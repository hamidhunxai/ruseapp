// @dart=2.9
class UserDetails {
  String displayName;
  String email;
  String photoURL;

  //constructor

  UserDetails({this.displayName, this.email, this.photoURL});

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
