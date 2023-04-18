// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:motion_toast/motion_toast.dart';
// import 'package:sports_app/models/user_model.dart';

// class AuthServices {
//   static var errorMessage;
//   static void signUp(
//       BuildContext context, String email, String password, phoneNumber) async {
//     final auth = FirebaseAuth.instance;

//     try {
//       await auth
//           .createUserWithEmailAndPassword(
//             email: email,
//             password: password,
//           )
//           .then((value) => {PostDetailToFirestore(phoneNumber, email)})
//           .catchError((e) {
//         MotionToast.error(description: e).show(context);
//       });
//     } on FirebaseAuthException catch (e) {
//       switch (e.code) {
//         case "invalid-email":
//           errorMessage = "Your email address is invalid";
//           break;
//         case "wrong-password":
//           errorMessage = "Your password is wrong.";
//           break;
//         case "user-not-found":
//           errorMessage = "User with this email doesn't exist.";
//           break;
//         case "user-disabled":
//           errorMessage = "User with this email has been disabled.";
//           break;
//         case "too-many-requests":
//           errorMessage = "Too many requests";
//           break;
//         case "operation-not-allowed":
//           errorMessage = "Signing in with Email and Password is not enabled.";
//           break;
//         default:
//           errorMessage = "An undefined Error happened.";
//       }
//       MotionToast.error(description: errorMessage);
//     }
//   }

//   static PostDetailToFirestore(phoneNumber, email) async {
//     final auth = FirebaseAuth.instance;
//     final firebaseFirestore = FirebaseFirestore.instance;
//     UserModel userModel = UserModel();
//     User? user = auth.currentUser;
//     userModel.uid = user!.uid;
//     userModel.phoneNumber = user.phoneNumber;
//     userModel.email = user.email;
//     await firebaseFirestore.collection('users').doc(user.uid).set({
//       'uid': user.uid,
//       'phoneNumber': user.phoneNumber,
//       'email': user.email,
//     });
//   }
// }
