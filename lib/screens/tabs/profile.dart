import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ruse/components/boxAndButtons.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      onPressed: () {},
                      title: 'Order',
                      imageUrl: 'assets/images/order.png',
                      colour: Colors.red,
                    ),
                    ProfileButtons(
                      onPressed: () {},
                      title: 'Sticker',
                      imageUrl: 'assets/images/sticker.png',
                      colour: Colors.purple,
                    ),
                    ProfileButtons(
                      onPressed: () {},
                      title: 'Tutorials',
                      imageUrl: 'assets/images/tutorials.png',
                      colour: Colors.blueAccent,
                    ),
                    ProfileButtons(
                      onPressed: () {},
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
                      onPressed: () {},
                      title: 'Drafts',
                      imageUrl: 'assets/images/Drafts.png',
                      colour: Colors.brown,
                    ),
                    ProfileButtons(
                      onPressed: () {},
                      title: 'Cloud',
                      imageUrl: 'assets/images/cloud.png',
                      colour: Colors.blue,
                    ),
                    ProfileButtons(
                      onPressed: () {},
                      title: 'FeedBack',
                      imageUrl: 'assets/images/feed-back.png',
                      colour: Colors.yellow,
                    ),
                    ProfileButtons(
                      onPressed: () {},
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
                      onPressed: () {},
                      title: 'Invite Friends',
                      imageUrl: 'assets/images/invite.png',
                      colour: Colors.purple,
                    ),
                    ProfileButtons(
                      onPressed: () {},
                      title: 'Setting',
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
    );
  }
}
