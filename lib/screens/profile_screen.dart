import 'package:eccomerce_it_sharks_2/shared/components/Text.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: BuildText(
          text: 'profile screen',
        ),
      )
    );
  }
}
