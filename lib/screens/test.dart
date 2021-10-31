// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:ruse/controllers/login_controller.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//   static String id = "LoginPage";
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('login page'),
//         centerTitle: true,
//         backgroundColor: Colors.redAccent,
//       ),
//       //body of ui
//       body: loginUI(),
//     );
//   }
//
//   // creating a function login UI
//
//   loginUI() {
//     return Consumer<LoginController>(builder: (context, model, child) {
//       //if we are alreadylogin
//       if (model.userDetails != null) {
//         return Center(
//           child: LoggedInUI(model),
//         );
//       } else {
//         return LoginControllers(context);
//       }
//     });
//   }
//
//   LoggedInUI(LoginController model) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//
//       //out ui will 3 childern name, email, photo, logout
//       children: [
//         CircleAvatar(
//             backgroundImage:
//                 Image.network(model.userDetails!.photoURL ?? "").image,
//             radius: 50),
//         Text(model.userDetails!.displayName ?? ""),
//         Text(model.userDetails!.email ?? ""),
//
//         //logout
//         ActionChip(
//           avatar: const Icon(Icons.logout),
//           onPressed: () {
//             Provider.of<LoginController>(context, listen: false).logout();
//           },
//           label: Text("logout"),
//         ),
//       ],
//     );
//   }
//
//   LoginControllers(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           GestureDetector(
//             child: Image.asset(
//               "assets/google.png",
//               width: 240,
//             ),
//             onTap: () {
//               Provider.of<LoginController>(context, listen: false)
//                   .googleLogin();
//             },
//           ),
//           SizedBox(
//             height: 10.0,
//           ),
//           GestureDetector(
//             child: Image.asset(
//               "assets/fb.png",
//               width: 240,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
