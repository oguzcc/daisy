import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseClient {
  static final firebaseMessaging = FirebaseMessaging.instance;

  static Future<void> handleBackgroundMessage(RemoteMessage? message) async {
    if (message == null) return;
    debugPrint('--> Handling a background message: ${message.messageId}');
  }

  static Future<void> handleMessage(RemoteMessage? message) async {
    if (message == null) return;
    debugPrint('--> Handling a message: ${message.messageId}');
  }

  static Future<void> initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    await FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onMessage.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  static Future<String> getFcmToken() async {
    final fcmToken = await firebaseMessaging.getToken();
    return fcmToken.toString();
  }

  static Future<void> initFirebaseMessaging() async {
    await firebaseMessaging.requestPermission();
    // final fcmToken = await firebaseMessaging.getToken();

    // debugPrint('--> FCM Token: $fcmToken');
    await initPushNotifications();
  }

  Future<User?> getFirebaseUser() async {
    final user = FirebaseAuth.instance.currentUser;
    return user;
  }

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final credential =
        EmailAuthProvider.credential(email: email, password: password);
    final response =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return response.user;
  }

  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final response = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return response.user;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<User?> signInWithGoogle() async {
    final googleUser = await GoogleSignIn(
            // clientId: Platform.isIOS
            //     ? DefaultFirebaseOptions.currentPlatform.iosClientId
            //     : DefaultFirebaseOptions.currentPlatform.androidClientId,
            )
        .signIn();

    if (googleUser == null) return null;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential.user;
  }

  Future<User?> signInWithApple() async {
    final appleProvider = AppleAuthProvider();
    final response = await FirebaseAuth.instance.signInWithPopup(appleProvider);
    return response.user;
  }

  Future<User?> signInWithFacebook() async {
    final facebookProvider = FacebookAuthProvider();
    final response =
        await FirebaseAuth.instance.signInWithPopup(facebookProvider);
    return response.user;
  }
}
