import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:apple_sign_in/apple_sign_in.dart';
import 'dart:developer';

class SignApple {
  Future<AuthorizationCredentialAppleID> signIn() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      webAuthenticationOptions: WebAuthenticationOptions(
        clientId: 'com.aboutyou.dart_packages.sign_in_with_apple.example',
        redirectUri: Uri.parse(
          'https://flutter-sign-in-with-apple-example.glitch.me/callbacks/sign_in_with_apple',
        ),
      ),
      nonce: 'example-nonce',
      state: 'example-state',
    );
    return credential;
  }
}

class SignAppleOld {
  signIn() async {
    if (await AppleSignIn.isAvailable()) {
      print('apple1');
      final AuthorizationResult result = await AppleSignIn.performRequests([
        AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
      ]);
      print('apple2');
      switch (result.status) {
        case AuthorizationStatus.authorized:
          inspect(result.credential);
          break;
        case AuthorizationStatus.cancelled:
          print("Sign in failed: ${result.error.localizedDescription}");
          break;
        case AuthorizationStatus.error:
          print('User cancelled');
          break;
      }
    }
  }
}
