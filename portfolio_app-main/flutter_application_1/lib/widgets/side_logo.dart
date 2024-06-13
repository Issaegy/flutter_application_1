import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/gradient_text.dart';
import 'package:flutter_application_1/constants/colors.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GradientText(
        "Issa Samir Ibrahim",
        gradient: LinearGradient(colors: [
          CustomColor.whitePrimary,
          Colors.black45,
        ]),
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
