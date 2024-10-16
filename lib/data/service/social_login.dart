// library social_login;

// import 'dart:developer';
// import 'dart:io';

// import 'package:flutter/services.dart';

// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';

// import '../model/response/auth/res_social_login.dart';
// import '../../firebase_options.dart';

// class SocialLoginService {
//   GoogleSignIn? googleSignIn;

//   //apple login
//   Future<ResSocialLogin> appleLogin() async {
//     try {
//       final appleCredential = await SignInWithApple.getAppleIDCredential(
//         scopes: [
//           AppleIDAuthorizationScopes.email,
//           AppleIDAuthorizationScopes.fullName,
//         ],
//       );

//       // Apple ID ile başarılı giriş
//       return ResSocialLogin(
//         status: true,
//         message: 'Apple hesabınızla başarıyla giriş yaptınız.',
//         loginType: LoginType.apple,
//         emailAddress: appleCredential.email ?? "",
//         socialId: appleCredential.userIdentifier ?? "Unknown",
//         image: '',
//         name:
//             '${appleCredential.givenName ?? ""} ${appleCredential.familyName ?? ""}'
//                 .trim(),
//       );
//     } on SignInWithAppleAuthorizationException catch (e) {
//       // Apple Sign In'e özgü hatalar
//       String errorMessage;
//       switch (e.code) {
//         case AuthorizationErrorCode.canceled:
//           errorMessage = 'Giriş işlemi iptal edildi.';
//           break;
//         case AuthorizationErrorCode.failed:
//           errorMessage = 'Kimlik doğrulama başarısız oldu.';
//           break;
//         case AuthorizationErrorCode.invalidResponse:
//           errorMessage = 'Geçersiz yanıt alındı.';
//           break;
//         case AuthorizationErrorCode.notHandled:
//           errorMessage = 'İstek işlenemedi.';
//           break;
//         case AuthorizationErrorCode.unknown:
//           errorMessage = 'Bilinmeyen bir hata oluştu.';
//           break;
//         default:
//           errorMessage = 'Apple ile giriş sırasında bir hata oluştu.';
//       }
//       return ResSocialLogin(status: false, message: errorMessage);
//     } on PlatformException catch (e) {
//       // Platform'a özgü hatalar
//       String errorMessage = 'Sistem hatası: ${e.message}';
//       return ResSocialLogin(status: false, message: errorMessage);
//     } catch (e) {
//       // Diğer tüm hatalar
//       return ResSocialLogin(
//         status: false,
//         message:
//             'Beklenmeyen bir hata oluştu. Lütfen daha sonra tekrar deneyin.',
//       );
//     }
//   }

//   //google login
//   Future<ResSocialLogin> googleLogin() async {
//     try {
//       // Mevcut oturumdan çıkış yapın
//       await googleSignIn?.signOut();

//       // GoogleSignIn nesnesi oluşturun
//       googleSignIn = GoogleSignIn(
//         clientId: Platform.isIOS
//             ? DefaultFirebaseOptions.currentPlatform.iosClientId
//             : DefaultFirebaseOptions.currentPlatform.androidClientId,
//         scopes: ['email'],
//       );

//       // Oturum açma işlemini başlatın
//       final GoogleSignInAccount? account = await googleSignIn?.signIn();

//       // Kullanıcı bilgilerini alıp loglayın ve yanıt oluşturun
//       log(account?.email ?? "");
//       return ResSocialLogin(
//           message: 'You have successfully Logged In',
//           status: await googleSignIn?.isSignedIn() ?? false,
//           loginType: LoginType.google,
//           emailAddress: account?.email ?? "",
//           socialId: account?.id ?? "",
//           image: account?.photoUrl ?? "",
//           name: account?.displayName ?? "");
//     } catch (e) {
//       log(e.toString());
//       return ResSocialLogin(
//         status: false,
//         message: '$e',
//       );
//     }
//   }

//   Future<void> signOutGoogle() async {
//     final isLoggedIn = await googleSignIn?.isSignedIn();
//     if ((isLoggedIn) == true) {
//       await googleSignIn?.signOut();
//     }
//   }
// }
