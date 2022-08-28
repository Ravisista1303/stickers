import 'package:flutter/material.dart';
import 'package:stickers/screens/privacy_policy/privacy_policy_header.dart';

class PrivacyPolicyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provides us the height and width of our screen
    Size size = MediaQuery.of(context).size;
    // It enables scrolling
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          PrivacyPolicyHeader(size: size),
        ],
      ),
    );
  }
}
