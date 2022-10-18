// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace

import 'package:courierv9/pages/colors_constent.dart';
import 'package:courierv9/pages/routs.dart';
import 'package:courierv9/pages/style_constent.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'login_signup_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('AppData');
  //

  @override
  Widget build(BuildContext context) {
    if (_myBox.get("m_email") == null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginSignUpPage()));
    }
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(
      //     child: Padding(
      //       padding: const EdgeInsets.only(right: 50.0),
      //       child: Text(
      //         "Driver App",
      //         style: mTextStyleHeader,
      //       ),
      //     ),
      //   ),
      //   backgroundColor: mThemeColor,
      // ),
      // drawer: MySidebar(),
      body: Container(
        color: Colors.white,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Padding(padding: EdgeInsets.only(top: 80)),
            // InkWell(
            //   onTap: () {
            //     print("Profile");
            //   },
            //   child: Container(
            //     alignment: Alignment.centerLeft,
            //     margin: const EdgeInsets.only(left: 16, right: 16),
            //     width: MediaQuery.of(context).size.width,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         Container(
            //           width: MediaQuery.of(context).size.width,
            //           height: 200,
            //           decoration: BoxDecoration(
            //               boxShadow: [
            //                 BoxShadow(
            //                     blurRadius: 15,
            //                     spreadRadius: 1,
            //                     color: Colors.grey)
            //               ],
            //               color: mThemeColor,
            //               borderRadius: BorderRadius.circular(15)),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            // Padding(
            //   padding: const EdgeInsets.only(left: 16, top: 10, bottom: 12),
            //   child: Center(
            //     child: Text(
            //       "Pick & Drop History",
            //       style: mTitleStyle,
            //     ),
            //   ),
            // ),

            // Container(
            //   color: Colors.white,
            //   height: 80,
            //   margin: const EdgeInsets.only(left: 16, right: 16),
            //   child: Column(
            //     children: [
            //       Row(
            //         children: [
            //           Expanded(
            //             child: InkWell(
            //               onTap: () {
            //                 Navigator.pushNamed(
            //                     context, MyRouts.pickandDropRout);
            //               },
            //               child: Container(
            //                 margin: const EdgeInsets.only(right: 8),
            //                 padding: const EdgeInsets.only(left: 16),
            //                 height: 64,
            //                 decoration: BoxDecoration(
            //                   boxShadow: [
            //                     BoxShadow(
            //                         blurRadius: 5,
            //                         spreadRadius: .2,
            //                         color: Colors.grey)
            //                   ],
            //                   color: mThemeColor,
            //                   borderRadius: BorderRadius.circular(12),
            //                   border: Border.all(color: mBorderColor, width: 1),
            //                 ),
            //                 child: Row(
            //                   children: [
            //                     Image.asset("images/distance.png",
            //                         scale: 15, color: mIconeColor),
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 10),
            //                       child: Column(
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.start,
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         children: [
            //                           Text(
            //                             "Pick & Drop",
            //                             style: mServiceTitleStyle,
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ),
            //           Expanded(
            //             child: InkWell(
            //               onTap: () {
            //                 Navigator.pushNamed(
            //                     context, MyRouts.pickandDropHistoryRout);
            //               },
            //               child: Container(
            //                 margin: const EdgeInsets.only(right: 8),
            //                 padding: const EdgeInsets.only(left: 16),
            //                 height: 64,
            //                 decoration: BoxDecoration(
            //                   boxShadow: [
            //                     BoxShadow(
            //                         blurRadius: 5,
            //                         spreadRadius: .2,
            //                         color: Colors.grey)
            //                   ],
            //                   color: mThemeColor,
            //                   borderRadius: BorderRadius.circular(12),
            //                   border: Border.all(color: mBorderColor, width: 1),
            //                 ),
            //                 child: Row(
            //                   children: [
            //                     Image.asset(
            //                       "images/verification-of-delivery-list-clipboard-symbol.png",
            //                       scale: 20,
            //                       color: mIconeColor,
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 10),
            //                       child: Column(
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         children: [
            //                           Text(
            //                             "Pick N History",
            //                             style: mServiceTitleStyle,
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //       const SizedBox(
            //         height: 16,
            //       ),
            //       //
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 12),
              child: Center(
                child: Text(
                  "Pick Up List & History",
                  style: mTitleStyle,
                ),
              ),
            ),

            Container(
              height: 80,
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, MyRouts.pickupListRout);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.only(left: 16),
                            height: 64,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 5,
                                    spreadRadius: .2,
                                    color: Colors.grey)
                              ],
                              color: mThemeColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: mBorderColor, width: 1),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  "images/pickup-car.png",
                                  scale: 15,
                                  color: mIconeColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Pick Up List",
                                        style: mServiceTitleStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, MyRouts.pickupHistoryRout);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.only(left: 16),
                            height: 64,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 5,
                                    spreadRadius: .2,
                                    color: Colors.grey)
                              ],
                              color: mThemeColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: mBorderColor, width: 1),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  "images/verification-of-delivery-list-clipboard-symbol.png",
                                  scale: 20,
                                  color: mIconeColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Pickup History",
                                        style: mServiceTitleStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  //
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 12),
              child: Center(
                child: Text(
                  "Drs List & History",
                  style: mTitleStyle,
                ),
              ),
            ),

            Container(
              height: 80,
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, MyRouts.drsListRout);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.only(left: 16),
                            height: 64,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 5,
                                    spreadRadius: .2,
                                    color: Colors.grey)
                              ],
                              color: mThemeColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: mBorderColor, width: 1),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  "images/drslist2.png",
                                  scale: 9,
                                  color: mIconeColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Drs List",
                                        style: mServiceTitleStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, MyRouts.drsHistory);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.only(left: 16),
                            height: 64,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 5,
                                    spreadRadius: .2,
                                    color: Colors.grey)
                              ],
                              color: mThemeColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: mBorderColor, width: 1),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  "images/verification-of-delivery-list-clipboard-symbol.png",
                                  scale: 20,
                                  color: mIconeColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Drs History",
                                        style: mServiceTitleStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  //
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 12),
              child: Center(
                child: Text(
                  "Scan Web & Profile",
                  style: mTitleStyle,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 150,
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, MyRouts.scanawbRout);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.only(left: 16),
                            height: 110,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 5,
                                    spreadRadius: .2,
                                    color: Colors.grey)
                              ],
                              color: mThemeColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: mBorderColor, width: 1),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Image.asset(
                                    "images/mobscan.png",
                                    // color: Colors.black,
                                    scale: 8,
                                    color: mIconeColor,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Text("Scan Awb",
                                            style: mServiceTitleStyle),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, MyRouts.profileRout);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.only(left: 16),
                            height: 110,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 5,
                                    spreadRadius: .2,
                                    color: Colors.grey)
                              ],
                              color: mThemeColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: mBorderColor, width: 1),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 15, top: 15.0),
                                  child: Image.asset(
                                    "images/user.png",
                                    scale: 11,
                                    color: mIconeColor,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 25, top: 15.0),
                                    child: Text("Profile",
                                        style: mServiceTitleStyle),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  //
                ],
              ),
            ),

            // Container(
            //   height: 140,
            //   child: ListView.builder(
            //     itemCount: populars.length,
            //     scrollDirection: Axis.horizontal,
            //     padding: const EdgeInsets.only(left: 12, right: 16),
            //     itemBuilder: (context, index) {
            //       return Card(
            //         elevation: 5,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12),
            //         ),
            //         child: Container(
            //           height: 140,
            //           width: 160,
            //           decoration: BoxDecoration(
            //             color: mThemeColor,
            //             borderRadius: BorderRadius.circular(12),
            //             border: Border.all(color: mBorderColor, width: 1),
            //           ),
            //           child: Padding(
            //             padding: const EdgeInsets.only(top: 8, bottom: 12),
            //             child: Column(
            //               children: [
            //                 Image.asset(
            //                   populars[index].image,
            //                   height: 74,
            //                   scale: 10,
            //                 ),
            //                 Text(
            //                   populars[index].name,
            //                   style: const TextStyle(color: Colors.black),
            //                 ),
            //                 Text(
            //                   populars[index].country,
            //                   style: mPopularDestinationSubtitleStyle,
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
