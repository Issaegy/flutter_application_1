import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/constants/hello.dart';
import 'package:flutter_application_1/utils/project_utils.dart';
import 'package:flutter_application_1/widgets/contact_section.dart';
import 'package:flutter_application_1/widgets/drawer_mobile.dart';
import 'package:flutter_application_1/widgets/header_desktop.dart';
import 'package:flutter_application_1/widgets/header_mobile.dart';
import 'package:flutter_application_1/widgets/main_Mobile.dart';
import 'package:flutter_application_1/widgets/main_desktop.dart';
import 'package:flutter_application_1/widgets/projects_sections.dart';
import 'package:flutter_application_1/widgets/skills_desktop.dart';
import 'package:flutter_application_1/widgets/skills_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.grey[700],
          endDrawer: constraints.maxWidth >= DesktopWidth ? null : const DrawerMobile(),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              //Main
              if (constraints.maxWidth >= DesktopWidth)
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
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
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
                    if (constraints.maxWidth >= kMedDesktopWidth)
                      SkillsDesktop()
                    else
                      SkillsMobile(),
                  ],
                ),
              ),

              //Projekte
              const ProjectsSection(),

              //Kontakt
             const ContactSection(),

              Container(
                height: 500,
                width: double.maxFinite,
              ),
            ],
          ),
        );
      },
    );
  }
}


