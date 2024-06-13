import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';

import '../utils/project_utils.dart';
import 'project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
                    color: CustomColor.black,
                    width: screenWidth,
                    padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                    child: Column(
                      children: [
                        //hobby projects title
                       const Text(
                        "Uni-Projekt",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.normal,
                          color: CustomColor.whitePrimary,
                        ),
                       ),
                       SizedBox(height: 50),
                        //hobbyprojects cards
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: 900), // so wären die Cards in einer Reihe, also drei Stück, wenn ich mehrere hätte
                          child: Wrap(
                            spacing: 25,
                            runSpacing: 25,
                            children: [
                              for(int i = 0; i<hobbyProjectUtils.length; i++)
                              ProjectCardWidget(
                                project: hobbyProjectUtils[i]),
                            ],
                          ),
                        ), //hobbyProjectUtils, da der Name,  meiner Projekte in der ProjectUtils Klasse, "HobbyProjectUtils" 
                      ], //rechtsklick und dann auf "Zur Typdefinition wechseln" drücken
                    ),
                    );
}
}