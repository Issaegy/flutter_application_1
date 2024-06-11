import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/project_utils.dart';

import 'dart:js' as js;
import '../constants/colors.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    super.key,
    required this.project,
  });
  final ProjectUtils project; //ProjectUtils ist mein Ordner der Klassenname und projects ist dernname des ganzen hier

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias, //die ränder wurden einfach nur runder
      height: 280,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //porjectImage
          Image.asset(
          project.image, //project.image, dass ist der "project" Name, welches ich da oben gegeben habe und das .image, bedeutet, dass er es von den Bilder=> images nimmt 
          height: 190, 
          width: 250,
          fit: BoxFit.cover,
          ),
          //title
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 1),
            child: Text(
              project.title, 
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: CustomColor.whitePrimary,
            ),
            ),
          ),
          //subtitle
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 5, 5),
            child: Text(
              project.subtitle, 
            style: const TextStyle(
              fontSize: 10,
              color: CustomColor.whiteSecondary,
            ),
            ),
          ),
          const Spacer(),
          //footer
          Container(
            color: CustomColor.bgLight1,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            child: Row(
              children: [
                Text(
                  "Verfügbar auf:",
              style: TextStyle( 
              color: Colors.grey[700],
              fontSize: 10,
              ),
                ),
                const Spacer(),
                if(project.aandroidLink != null)
                //Das InkWell ist dieses Handschuh, wenn die Maus da drau zeigt
                InkWell(
                  onTap: () {
                    js.context.callMethod("open",[project.aandroidLink]);
                  },
                  child: Image.asset(
                    "assets/images/android.png", 
                  width: 15,),
                ),
                if(project.iosLink != null) // Hier sage ich nichts anders als, wenn der kein Link gegeben ist "null", so wird der button auch nicht angezeigt
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: InkWell(
                    onTap: () {
                      js.context.callMethod("open",[project.iosLink]);
                    },
                    child: Image.asset(
                      "assets/images/apple.png",
                    width: 15,),
                  ),
                ),
                if(project.webLink != null)
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: InkWell(
                    onTap: () {
                      js.context.callMethod("open",[project.webLink]);
                    },
                    child: Image.asset(
                      "assets/images/web.png",
                    width: 15),
                  ),
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}