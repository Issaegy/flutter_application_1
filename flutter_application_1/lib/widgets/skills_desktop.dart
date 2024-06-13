import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/constants/skill_items.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //platforms
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: 450,
                            ),
                            child: Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children: [
                                for(int i = 0; i< platformItems.length; i++)
                                Container(
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[700],
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                     ),
                                    leading: Image.asset(
                                    platformItems[i]["img"],
                                    width: 26,),
                                    title: Text(platformItems[i]["title"]),
                                  ),
                                ),
                              ],
                            
                            ),
                          ),
                          const SizedBox(width: 50),

                          //skills
                          Flexible(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: 500,
                              ),
                              child: Wrap(
                                spacing: 20,
                                runSpacing: 10,
                               children: [
                                for(int i=0; i< skillItems.length; i++)
                                Chip(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  backgroundColor: Colors.grey[700],
                                  labelStyle: TextStyle(
                                  color: CustomColor.whitePrimary),
                                  label: Text(skillItems[i]["title"]),
                                  avatar: Image.asset(skillItems[i]["img"]),
                                  ),
                              
                               ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 50,),

                          //languages
                           Flexible(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: 500,
                              ),
                              child: Wrap(
                                spacing: 20,
                                runSpacing: 10,
                               children: [
                                for(int i=0; i< languageItems.length; i++)
                                Chip(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  backgroundColor: Colors.grey[700],
                                  labelStyle: TextStyle(
                                    color: CustomColor.whitePrimary,
                                  ),
                                  label: Text(languageItems[i]["title"]),
                                  avatar: Image.asset(languageItems[i]["img"]),
                                ),
                               ],
                              ),
                            ),
                          ),


                        ],
                      );
  }
}