import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:ruse/controllers/login_controller.dart';
import 'package:ruse/screens/topScreens/sign_in.dart';
import 'package:ruse/screens/tabs/draft_box.dart';
import 'package:ruse/screens/tabs/home_page.dart';
import 'package:ruse/screens/tabs/profile.dart';
import 'package:ruse/screens/tabs/templates.dart';

import '../components/constants.dart';

final user = FirebaseAuth.instance.currentUser;
final _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;
late User loggedInUser;

class MainScreen extends StatefulWidget {
  static String id = "MainScreen";
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  void onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController.index = selectedIndex;
    });
  }

  void getCurrentUser() async {
    try {
      // ignore: await_only_futures
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  // void getMessages() async {
  //   final messages = await _firestore.collection('users').get();
  //
  //   for (var messages in messages.docs) {
  //     print(messages.data);
  //   }
  // }
  void messagesStream() async {
    await for (var snapshot in _firestore.collection('users').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data);
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/R.gif',
              fit: BoxFit.contain,
              height: 42,
            ),
            Image.asset(
              "assets/images/use.png",
              height: 42,
            ),
            Container(padding: const EdgeInsets.all(8.0))
          ],
        ),
        backgroundColor: kSecondaryColor,
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          HomePage(),
          Templates(),
          DraftBox(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.broken_image_sharp),
            label: "Objects",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.drafts_rounded),
            label: "Draft Box",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: "Mine",
          ),
        ],
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.blueAccent,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
          fontSize: 12.0,
        ),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
    );
  }

  loginUI() {
    return Consumer<LoginController>(builder: (context, model, child) {
      //if we are alreadylogin
      if (model.userDetails != null) {
        return Center(
          child: LoggedInUI(model),
        );
      } else {
        return TextButton(
          onPressed: () {
            Navigator.pushNamed(context, SignIn.id);
          },
          child: Text("logout"),
        );
      }
    });
  }

  // ignore: non_constant_identifier_names
  LoggedInUI(LoginController model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      //out ui will 3 childern name, email, photo, logout
      children: [
        // CircleAvatar(
        //     backgroundImage:
        //         Image.network(model.userDetails.photoURL ?? "").image,
        //     radius: 50),
        Text(model.userDetails!.displayName),
        Text(model.userDetails!.email),

        //logout
      ],
    );
  }
}
