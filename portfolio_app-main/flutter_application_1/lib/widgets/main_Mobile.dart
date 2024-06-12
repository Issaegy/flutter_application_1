// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height; // Corrected to use screenHeight instead of screenWidth

    return Container(
      color: CustomColor.black,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      height: screenHeight,
      constraints: const BoxConstraints(minHeight: 560),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar image
          ClipOval(
            child: Image.asset(
              "assets/bild.png",
              width: 140, // Adjust the size as needed
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 30),
          // Intro text
          const Text(
            "Hi,\nIch bin der Issa Samir Ibrahim\nStudent an der THM",
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              fontWeight: FontWeight.normal,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white24,
              ),
              child: const Text(
                "Download: Mein Lebenslauf",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}