import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class SignGoogle {
  String _contactText;
  GoogleSignInAccount _currentUser;

  GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
    'email',
    // 'https://www.googleapis.com/auth/contacts.readonly',
  ]);

  Future<GoogleSignInAccount> login() async {
    try {
      _currentUser = await googleSignIn.signIn();
      return _currentUser;
    } catch (err) {
      print(err);
      return null;
    }
  }

  logout() {
    googleSignIn.signOut();
  }

  Future<void> handleGetContact() async {
    final http.Response response = await http.get(
      'https://people.googleapis.com/v1/people/me/connections'
      '?requestMask.includeField=person.names',
      headers: await _currentUser.authHeaders,
    );
    if (response.statusCode != 200) {
      _contactText = "People API gave a ${response.statusCode} "
          "response. Check logs for details.";

      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String namedContact = _pickFirstNamedContact(data);
    if (namedContact != null) {
      _contactText = "I see you know $namedContact!";
    } else {
      _contactText = "No contacts to display.";
    }
  }

  String _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic> connections = data['connections'];
    final Map<String, dynamic> contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic> name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }
}
