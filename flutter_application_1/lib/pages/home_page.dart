import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/constants/hello.dart';
import 'package:flutter_application_1/widgets/contact_section.dart';
import 'package:flutter_application_1/widgets/drawer_mobile.dart';
import 'package:flutter_application_1/widgets/header_desktop.dart';
import 'package:flutter_application_1/widgets/header_mobile.dart';
import 'package:flutter_application_1/widgets/main_mobile.dart';
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
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

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
          endDrawer: constraints.maxWidth >= DesktopWidth
              ? null
              : DrawerMobile(onNavItemTap: (int navIndex){
                scaffoldKey.currentState?.closeDrawer();
                scrollToSection(navIndex);
                }
                ),
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(key: navbarKeys.first),
                // Header je nach Bildschirmgröße anzeigen
                if (constraints.maxWidth >= DesktopWidth)
                  HeaderDesktop(
                    onNavMenuTap: (int navIndex) {scrollToSection(navIndex);
                    })
                else
                  HeaderMobile(
                    onLogoTap: () {},
                    onMenuTap: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),

                // Hauptinhalt der Seite je nach Bildschirmgröße anzeigen
                if (constraints.maxWidth >= DesktopWidth)
                  const MainDesktop()
                else
                  const MainMobile(),

                // Fähigkeiten je nach Bildschirmgröße anzeigen
                Container(
                  key: navbarKeys[1],
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                  color: Colors.black,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Titel für Fähigkeiten
                      const Text(
                        "Was ich alles kann",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                      const SizedBox(height: 50),

                      // Plattformen, Fähigkeiten und Sprachen je nach Bildschirmgröße anzeigen
                      if (constraints.maxWidth >= kMedDesktopWidth)
                        SkillsDesktop()
                      else
                        SkillsMobile(),
                    ],
                  ),
                ),

                // Projektabschnitt
                ProjectsSection(
                  key: navbarKeys[2],
                ),

                // Kontaktabschnitt
                ContactSection(
                  key: navbarKeys[3],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void scrollToSection(int navIndex) {
    if(navIndex == 4){

      return;
    }
    final key = navbarKeys [navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}