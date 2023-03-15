// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
//
// void printWrapped(String text) {
//   final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
//   pattern.allMatches(text).forEach((match) => print(match.group(0)));
// }
//
// class AuthService {
//   static Future<User> signInWithApple(
//       {List<Scope> scopes = const [], required BuildContext context}) async {
//     // Email controller
//     var email = TextEditingController();
//     final _firebaseAuth = FirebaseAuth.instance;
//     // 1. perform the sign-in request
//     final result = await TheAppleSignIn.performRequests(
//         [AppleIdRequest(requestedScopes: scopes)]);
//     // 2. check the result
//     switch (result.status) {
//       case AuthorizationStatus.authorized:
//         final appleIdCredential = result.credential!;
//         final oAuthProvider = OAuthProvider('apple.com');
//
//         // print("appleIdCredential.identityToken.. ${appleIdCredential.identityToken}");
//         // print("appleIdCredential.authorizationCode.. ${appleIdCredential.authorizationCode}");
//         print("====================");
//         var identityToken =
//             String.fromCharCodes(appleIdCredential.identityToken!);
//         log("appleIdCredential.identityToken.. ${String.fromCharCodes(appleIdCredential.identityToken!)}");
//
//         final credential = oAuthProvider.credential(
//           idToken: String.fromCharCodes(appleIdCredential.identityToken!),
//           accessToken:
//               String.fromCharCodes(appleIdCredential.authorizationCode!),
//         );
//         final userCredential =
//             await _firebaseAuth.signInWithCredential(credential);
//         var firebaseUser = userCredential.user!;
//
//         var tempToken = await firebaseUser.getIdToken();
//         print("tempToken.. ${tempToken}");
//         print("Scope.fullName ===>> ${Scope.fullName}");
//         if (scopes.contains(Scope.fullName)) {
//           final fullName = appleIdCredential.fullName;
//           print(
//               "appleIdCredential.fullName ===>> ${appleIdCredential.fullName}");
//           // if (fullName != null &&
//           //     fullName.givenName != null &&
//           //     fullName.familyName != null) {
//           //   print("Gi Full Name ===>> ${fullName.givenName}");
//           //   final displayName = '${fullName.givenName} ${fullName.familyName}';
//           //   await firebaseUser.updateDisplayName(displayName);
//           print("firebaseUser.email ===>>> ${firebaseUser.email}");
//           try {
//             print(
//                 "firebaseUser.displayName...... ${firebaseUser.displayName ?? ""}");
//             print("firebaseUser.uid...... ${firebaseUser.uid}");
//             print("firebaseUser.tenantId...... ${firebaseUser.tenantId ?? ""}");
//
//             var b = await firebaseUser.getIdTokenResult();
//             print("firebaseUser.getIdTokenResult...... ${b}");
//
//             var a = await firebaseUser.getIdToken();
//             print("firebaseUser.getIdToken...... ${a.length}");
//             print("firebaseUser.email ===>>> ${firebaseUser.email}");
//
//             if (firebaseUser.email == "" || firebaseUser.email == null) {
//               showDialog(
//                 context: context,
//                 builder: (BuildContext context) => AlertDialog(
//                   title: const Text("Enter Your Email"),
//                   content: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Container(
//                         padding: const EdgeInsets.symmetric(vertical: 20),
//                         // height: 200,
//                         width: Get.width / 1.5,
//                         child: Column(
//                           children: [
//                             TextField(
//                               controller: email,
//                               onTap: () {
//                                 print(email.text);
//                               },
//                               decoration: const InputDecoration(
//                                 hintText: "Enter email",
//                                 border: OutlineInputBorder(),
//                               ),
//                             ),
//                             SizedBox(
//                               width: Get.width,
//                               height: 50,
//                             ),
//                             SizedBox(
//                               width: Get.width,
//                               height: 50,
//                               child: BrandedElevatedButton(
//                                 text: "Add Email",
//                                 onPressed: () {
//                                   if (email.text.isNotEmpty &&
//                                       email.text != "" &&
//                                       email.text.contains("@")) {
//                                     print("====>>>${email.text}");
//                                     Future<dio.Response?> loginResponse =
//                                         ApiClient().login(
//                                             email.text, identityToken,
//                                             source: 'apple');
//                                     EasyLoading.show(
//                                         status: LOADING_AUTHENTICATING);
//
//                                     loginResponse.then((response) async {
//                                       if (response != null) {
//                                         printWrapped(
//                                             "response===== > $response dd");
//                                         Map<String, dynamic> loginResponse =
//                                             jsonDecode(response.toString());
//                                         printWrapped(
//                                             "response===== > > ${loginResponse["status"]} ddd");
//                                         debugPrint(
//                                             "response=====> > ${loginResponse["status"]['successful']}");
//                                         if (loginResponse["token"] != null) {
//                                           await Utils.saveToken(
//                                               loginResponse["token"]);
//                                           await Utils.saveRefreshToken(
//                                               loginResponse["refreshToken"]);
//                                           await Utils.saveCurrentUserDetails(
//                                               jsonEncode(
//                                                   loginResponse["user"]));
//                                           UserModel? user =
//                                               await Utils.getCurrentUser();
//                                           //
//                                           // if (user != null) {
//                                           //   Cache.userFullName = "${user.first_name} ${user.last_name}";
//                                           //   Cache.userEmail = user.email;
//                                           //   Cache.userPhone = user.phone;
//                                           // }
//                                           if (user != null) {
//                                             print("user.paymentSource!.brand");
//                                             Cache.userFullName =
//                                                 "${user.first_name} ${user.last_name}";
//                                             Cache.userEmail = user.email;
//                                             Cache.userPhone = user.phone;
//                                             if (user.paymentSources != null) {
//                                               if (user
//                                                   .paymentSources!.isNotEmpty) {
//                                                 print(jsonEncode(
//                                                     user.paymentSources));
//                                                 await Utils.savePaymentSource(
//                                                     jsonEncode(
//                                                         user.paymentSources!));
//                                                 print(Utils.getPaymentSource());
//                                                 print(
//                                                     "User Payment Sources ===>> ${user.paymentSources!}");
//                                               }
//                                             }
//                                           }
//                                           // EasyLoading.dismiss();
//                                           if (loginResponse["status"]
//                                                   ['successful'] ==
//                                               true) {
//                                             print("TRUE");
//                                             Navigator.pushNamedAndRemoveUntil(
//                                                 context, "/", (route) => false);
//                                             print("TRUE");
//                                           } else if (loginResponse["status"]
//                                                   ['successful'] ==
//                                               false) {
//                                             print("FALSE");
//
//                                             EasyLoading.showError(loginResponse[
//                                                 "messageForUser"]);
//                                           } else {
//                                             EasyLoading.showError(
//                                                 "Login failed, please try again.");
//                                           }
//                                           print("TEST");
//                                         } else {
//                                           EasyLoading.dismiss();
//                                           print("FALSE");
//
//                                           var message = loginResponse["status"]
//                                                   ["messageForUser"] ??
//                                               "Login failed, please try again.";
//                                           EasyLoading.showError(message);
//                                         }
//                                       } else {
//                                         EasyLoading.dismiss();
//                                         print("FALSE");
//
//                                         EasyLoading.showError(
//                                             "Login failed, please try again.");
//                                       }
//                                     });
//                                   } else if (!email.text.contains('@')) {
//                                     EasyLoading.showError(
//                                         "Please Enter Valid Email.");
//                                   } else {
//                                     EasyLoading.showError(
//                                         "Please Enter Your Email.");
//                                   }
//                                 },
//                               ),
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             } else {
//               Future<dio.Response?> loginResponse = ApiClient()
//                   .login(firebaseUser.email!, identityToken, source: 'apple');
//
//               void printWrapped(String text) {
//                 final pattern =
//                     RegExp('.{1,800}'); // 800 is the size of each chunk
//                 pattern
//                     .allMatches(text)
//                     .forEach((match) => print(match.group(0)));
//               }
//
//               EasyLoading.show(status: LOADING_AUTHENTICATING);
//
//               loginResponse.then((response) async {
//                 if (response != null) {
//                   printWrapped("response===== > $response dd");
//                   // EasyLoading.show(status: LOADING_AUTHENTICATING);
//                   Map<String, dynamic> loginResponse =
//                       jsonDecode(response.toString());
//                   printWrapped(
//                       "response===== > > ${loginResponse["status"]} ddd");
//
//                   print(
//                       "response=====> > ${loginResponse["status"]['successful']}");
//                   if (loginResponse["token"] != null) {
//                     await Utils.saveToken(loginResponse["token"]);
//                     await Utils.saveRefreshToken(loginResponse["refreshToken"]);
//                     await Utils.saveCurrentUserDetails(
//                         jsonEncode(loginResponse["user"]));
//                     UserModel? user = await Utils.getCurrentUser();
//                     if (user != null) {
//                       print("user.paymentSource");
//                       print(user.paymentSources);
//                       Cache.userFullName =
//                           "${user.first_name} ${user.last_name}";
//                       Cache.userEmail = user.email;
//                       Cache.userPhone = user.phone;
//                       if (user.paymentSources != null) {
//                         if (user.paymentSources!.isNotEmpty) {
//                           print(jsonEncode(user.paymentSources));
//                           await Utils.savePaymentSource(
//                               jsonEncode(user.paymentSources!));
//                           print(Utils.getPaymentSource());
//                           print(
//                               "user.paymentSources ===>> ${user.paymentSources!}");
//                         }
//                       }
//                     }
//                     EasyLoading.dismiss();
//                     if (loginResponse["status"]['successful'] == true) {
//                       print("TRUE");
//                       Navigator.pushNamedAndRemoveUntil(
//                           context, "/", (route) => false);
//                       print("TRUE");
//                     } else if (loginResponse["status"]['successful'] == false) {
//                       print("FALSE");
//
//                       EasyLoading.showError(loginResponse["messageForUser"]);
//                     } else {
//                       EasyLoading.showError("Login failed, please try again.");
//                     }
//                     print("TEST");
//                   } else {
//                     EasyLoading.dismiss();
//                     print("FALSE");
//
//                     var message = loginResponse["status"]["messageForUser"] ??
//                         "Login failed, please try again.";
//                     EasyLoading.showError(message);
//                   }
//                 } else {
//                   EasyLoading.dismiss();
//                   print("FALSE");
//                   EasyLoading.showError("Login failed, please try again.");
//                 }
//               });
//             }
//           } on FirebaseAuthException catch (e) {
//             if (e.code == 'account-exists-with-different-credential') {
//               // ...
//             } else if (e.code == 'invalid-credential') {
//               // ...
//             }
//           } catch (e) {
//             // ...
//           }
//         }
//
//         print("firebaseUser");
//         return firebaseUser;
//
//       case AuthorizationStatus.error:
//         throw PlatformException(
//           code: 'ERROR_AUTHORIZATION_DENIED',
//           message: result.error.toString(),
//         );
//
//       case AuthorizationStatus.cancelled:
//         throw PlatformException(
//           code: 'ERROR_ABORTED_BY_USER',
//           message: 'Sign in aborted by user',
//         );
//       default:
//         throw UnimplementedError();
//     }
//   }
// }
