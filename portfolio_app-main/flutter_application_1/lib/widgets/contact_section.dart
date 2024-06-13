import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/constants/hello.dart';
import 'package:url_launcher/url_launcher.dart'; // Importiere das url_launcher Paket

import 'package:flutter_application_1/constants/links.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    
    return Container(
        width: screenWidth,
        height: 500,
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
        color: Colors.black,
        child: Column(
          children: [
            Text(
              "So erreichen Sie mich",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 24,
                color: CustomColor.whitePrimary,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 700),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if(constraints.maxWidth >= DesktopWidth){
                      return buildNameEmailFieldDesktop();
                    }
                    else
                      return buildNameEmailFieldMobile();
                  },
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 700,
                  maxHeight: 1000,
                ),
                child: TextField(
                  maxLines: 20,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    filled: true,
                    fillColor: Colors.grey[700],
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Ihre Message",
                    hintStyle: TextStyle(
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Flexible(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 700),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white24,
                    ),
                    child: Text(
                      "Senden",
                      style: TextStyle(
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Flexible(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 700,),
                child: const Divider(),
              ),
            ),
            const SizedBox(height: 15),
            // SNS Icon Button Links
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    launch(Linkskl.linkedin); 
                  },
                  child: Image.asset("assets/images/linkedin.png", width: 28),
                ),
                InkWell(
                  onTap: () {
                    launch(Linkskl.github);
                  },
                  child: Image.asset("assets/images/github2.png", width: 28),
                ),
              ],
            ),
          ],
        ),
      );
  }

  Row buildNameEmailFieldDesktop() {
    return Row(
      children: [
        Flexible(
          child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(16),
              filled: true,
              fillColor: Colors.grey[700],
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: "Ihr Name",
              hintStyle: TextStyle(
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Flexible(
          child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(16),
              filled: true,
              fillColor: Colors.grey[700],
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: "Ihre E-Mail",
              hintStyle: TextStyle(
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column buildNameEmailFieldMobile() {
    return Column(
      children: [
        Flexible(
          child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(16),
              filled: true,
              fillColor: Colors.grey[700],
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: "Ihr Name",
              hintStyle: TextStyle(
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15,),
        Flexible(
          child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(16),
              filled: true,
              fillColor: Colors.grey[700],
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: "Ihre E-Mail",
              hintStyle: TextStyle(
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
