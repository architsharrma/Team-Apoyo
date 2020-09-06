import 'dart:math';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Random random = new Random();

FirebaseFirestore firestore = FirebaseFirestore.instance;
GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
  ],
);

GoogleSignInAccount currentUser;

Future<void> handleSignIn() async {
  try {
    await googleSignIn.signIn();
  } catch (error) {
    print(error);
  }
}

void signInSilent() async {
  await googleSignIn.isSignedIn().then((isSignedIn) async {
    if (isSignedIn) {
      await googleSignIn.signInSilently();
    }
  });
}

TextStyle txt = GoogleFonts.notoSerif(textStyle: TextStyle(fontSize: 19));
TextStyle mtxt = GoogleFonts.notoSerif(
    textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.w600));

TextStyle ttl = GoogleFonts.notoSerif(
    textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold));
Color iconColor = Colors.red;
