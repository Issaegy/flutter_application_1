import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/constants/hello.dart';
import 'package:flutter_application_1/utils/project_utils.dart';
import 'package:flutter_application_1/widgets/drawer_mobile.dart';
import 'package:flutter_application_1/widgets/gradient_text.dart';
import 'package:flutter_application_1/widgets/header_desktop.dart';
import 'package:flutter_application_1/widgets/header_mobile.dart';
import 'package:flutter_application_1/widgets/main_Mobile.dart';
import 'package:flutter_application_1/widgets/main_desktop.dart';
import 'package:flutter_application_1/widgets/projects_sections.dart';
import 'package:flutter_application_1/widgets/skills_desktop.dart';
import 'package:flutter_application_1/widgets/skills_mobile.dart';

import '../widgets/project_card.dart';

class HomePage extends StatefulWidget {
  const HomePage ({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get fontSize => null;
final scaffoldKey = GlobalKey <ScaffoldState>();

  get alignment => null;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.width;

        return LayoutBuilder(
          builder: (context,constraints) {
            return Scaffold(
              key: scaffoldKey,
              backgroundColor: Colors.grey[700],
              endDrawer: constraints.maxWidth >= DesktopWidth?null : const DrawerMobile(),
              body: ListView(
                scrollDirection: Axis.vertical,  
                children:<Widget>[
                  //Main
                if(constraints.maxWidth >= DesktopWidth)
                 const HeaderDesktop()
                 else
                 HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                 ),
                 
                 if (constraints.maxWidth >= DesktopWidth)
                     const MainDesktop()
                     else
                     const MainMobile(),
            
                 //Fähigkeiten
                 Container(
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB( 25, 20, 25, 60),
                  color: Colors.black,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //title
                      const Text(
                        "Was ich alles kann",
                        style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.normal,
                         color: CustomColor.whitePrimary,       
                         ),
                      ),
                      const SizedBox(height: 50),

                      //platform,skills, and languages
                      if(constraints.maxWidth>=kMedDesktopWidth)
                      const SkillsDesktop()
                      else
                      const SkillsMobile(),
                    ],
                    ), 
                 ),     
                     //Projekte
                     const ProjectsSection(),
                     //Kontakt
                    Container(
                    padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
                    color: Colors.black,
                    child: Column(
                      children: [
                        Text("So erreichen Sie mich",
                        style:  TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 24,
                          color: CustomColor.whitePrimary,
                        ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: TextField(
                                cursorColor: Colors.black,
                                style: TextStyle(
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(16),
                                  filled: true,
                                  fillColor: Colors.grey[700],
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10), 
                                    borderSide: BorderSide.none
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10), 
                                    borderSide: BorderSide.none
                                    ),
                                    border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10), 
                                    borderSide: BorderSide.none
                                    ),
                                    hintText: "Your Name",
                                    hintStyle: TextStyle(
                                      color: CustomColor.whitePrimary,
                                    ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        //
                      ]
                    ),
                    ),

                  Container(
                    height: 500,
                    width: double.maxFinite,
                    ),
                ],
              ),
            );
          }
        );
      }
  }

