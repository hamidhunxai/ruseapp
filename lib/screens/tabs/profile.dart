import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ruse/screens/components/boxAndButtons.dart';

import 'package:ruse/screens/profile/cloud.dart';
import 'package:ruse/screens/profile/draft.dart';
import 'package:ruse/screens/profile/feedback.dart';
import 'package:ruse/screens/profile/help.dart';
import 'package:ruse/screens/profile/instructions.dart';
import 'package:ruse/screens/profile/invite_friends.dart';
import 'package:ruse/screens/profile/order.dart';
import 'package:ruse/screens/profile/settings.dart';
import 'package:ruse/screens/profile/sticker.dart';
import 'package:ruse/screens/profile/tutorials.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: FractionalOffset.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ProfileButton(),
                ),
                Container(
                    margin: EdgeInsets.all(
                      20.0,
                    ),
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProfilePostWidgets(
                          numberPosts: '0',
                          name: 'Posts',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ProfilePostWidgets(
                          numberPosts: '0',
                          name: 'Favorites',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ProfilePostWidgets(
                          numberPosts: '0',
                          name: 'Following',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ProfilePostWidgets(
                          numberPosts: '0',
                          name: 'Follower',
                        ),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(top: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileButtons(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Order()),
                          );
                        },
                        title: 'Order',
                        imageUrl: 'assets/images/order.png',
                        colour: Colors.red,
                      ),
                      ProfileButtons(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Stickers()),
                          );
                        },
                        title: 'Sticker',
                        imageUrl: 'assets/images/sticker.png',
                        colour: Colors.purple,
                      ),
                      ProfileButtons(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Tutorials()),
                          );
                        },
                        title: 'Tutorials',
                        imageUrl: 'assets/images/tutorials.png',
                        colour: Colors.blueAccent,
                      ),
                      ProfileButtons(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Instructions()),
                          );
                        },
                        title: 'Instructions',
                        imageUrl: 'assets/images/instructions.png',
                        colour: Colors.red,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileButtons(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Draft()),
                          );
                        },
                        title: 'Draft',
                        imageUrl: 'assets/images/Drafts.png',
                        colour: Colors.brown,
                      ),
                      ProfileButtons(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Cloud()),
                          );
                        },
                        title: 'Cloud',
                        imageUrl: 'assets/images/cloud.png',
                        colour: Colors.blue,
                      ),
                      ProfileButtons(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FeedBack()),
                          );
                        },
                        title: 'FeedBack',
                        imageUrl: 'assets/images/feed-back.png',
                        colour: Colors.yellow,
                      ),
                      ProfileButtons(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Help()),
                          );
                        },
                        title: 'Help',
                        imageUrl: 'assets/images/helping.png',
                        colour: Colors.blue,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileButtons(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InviteFriends()),
                          );
                        },
                        title: 'Invite Friends',
                        imageUrl: 'assets/images/invite.png',
                        colour: Colors.purple,
                      ),
                      ProfileButtons(
                        onPressed: () {
                          Navigator.pushNamed(context, ProfileSettings.id);
                        },
                        title: 'Setting',
                        imageUrl: 'assets/images/setting.png',
                        colour: Colors.blue,
                      ),
                      ProfileButtons(
                        onPressed: () {
                          setState(() {
                            signOut();
                            Navigator.pop(context);
                          });
                        },
                        title: 'Sign Out',
                        imageUrl: 'assets/images/setting.png',
                        colour: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signOut() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
  }
}
