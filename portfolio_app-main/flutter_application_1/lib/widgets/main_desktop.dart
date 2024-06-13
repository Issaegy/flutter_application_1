import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return Container(
                   color: CustomColor.black,    
                   child: Container(
                    margin: const EdgeInsets.symmetric
                    (horizontal: 20,),
                    height: screenSize.height/1.2,
                    constraints: const BoxConstraints(minHeight: 350,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                          Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              " Hi,\n Ich bin der Issa Samir Ibrahim \n Student an der THM", 
                            style: TextStyle(
                              fontSize: 40,
                              height: 1.2,
                              fontWeight: FontWeight.normal,
                              color: CustomColor.whitePrimary,
                              ),
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              height: 50,
                              width: 500,
                              child: ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white24,
                                ), 
                                child: const Text(
                                  "Download: Mein Lebenslauf",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                                ),
                              ),
                              ),
                           ]
                          ),
                        CircleAvatar (
                        radius: screenWidth / 10,
                        backgroundColor: Colors.transparent, 
                        child: ClipOval(
                          child: SizedBox(
                          child: Image.asset(
                            "assets/bild.png",
                            width: screenWidth / 3,
                            height: screenHeight / 2,
                            fit:BoxFit.cover),
                        ),
                      ),
                     ), 
                   ],
                 ),
                ),
              );
  }
  }