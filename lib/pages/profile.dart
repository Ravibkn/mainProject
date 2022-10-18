// ignore_for_file: unnecessary_brace_in_string_interps, sized_box_for_whitespace, prefer_const_constructors

import 'package:courierv9/pages/profile_edit.dart';
import 'package:courierv9/pages/routs.dart';
import 'package:courierv9/pages/style_constent.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'colors_constent.dart';
import 'global.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _myBox = Hive.box('AppData');
  String image = '';

  @override
  Widget build(BuildContext context) {
    if (_myBox.get("m_image") == null || _myBox.get("m_image") == '') {
      image = 'NotFound.png';
    } else {
      image = _myBox.get("m_image");
    }
    return Scaffold(
      body: ListView(
        children: [
          CustomPaint(
            // ignore: sort_child_properties_last
            child: Stack(
              children: [
                Container(
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 65,
                      child: CircleAvatar(
                        backgroundColor: mThemeColor,
                        backgroundImage: NetworkImage(
                            "${baseUrl}assets/images/messanger_images/${image}"),
                        radius: 60,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 210, top: 190),
                  child: CircleAvatar(
                    radius: 23,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: mThemeColor,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileEdit()));
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            painter: HeaderCurvedContainer(),
          ),
          const SizedBox(
            height: 20,
          ),
          Card(
            margin: EdgeInsets.only(
              left: 35,
              right: 35,
            ),
            shape: StadiumBorder(
                side: BorderSide(color: Colors.grey.shade300, width: 1)),
            color: Colors.grey.shade100,
            child: ListTile(
              leading: Text("Name :", style: mTextStyle1),
              title: Text(_myBox.get("m_name"), style: mTextStyle1),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            margin: EdgeInsets.only(
              left: 35,
              right: 35,
            ),
            shape: StadiumBorder(
                side: BorderSide(color: Colors.grey.shade300, width: 1)),
            color: Colors.grey.shade100,
            child: ListTile(
              leading: Text("Branch :", style: mTextStyle1),
              title: Text(_myBox.get("m_branch"), style: mTextStyle1),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            margin: EdgeInsets.only(
              left: 35,
              right: 35,
            ),
            shape: StadiumBorder(
                side: BorderSide(color: Colors.grey.shade300, width: 1)),
            color: Colors.grey.shade100,
            child: ListTile(
              leading: Text("City :", style: mTextStyle1),
              title: Text(_myBox.get("m_city"), style: mTextStyle1),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            margin: EdgeInsets.only(
              left: 35,
              right: 35,
            ),
            shape: StadiumBorder(
                side: BorderSide(color: Colors.grey.shade300, width: 1)),
            color: Colors.grey.shade100,
            child: ListTile(
              leading: Text("Mobile No :", style: mTextStyle1),
              title: Text(_myBox.get("m_phone"), style: mTextStyle1),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            margin: EdgeInsets.only(
              left: 35,
              right: 35,
            ),
            shape: StadiumBorder(
                side: BorderSide(color: Colors.grey.shade300, width: 1)),
            color: Colors.grey.shade100,
            child: ListTile(
              leading: Text("Email :", style: mTextStyle1),
              title: Text(_myBox.get("m_email"), style: mTextStyle1),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            margin: EdgeInsets.only(
              left: 35,
              right: 35,
            ),
            shape: StadiumBorder(
                side: BorderSide(color: Colors.grey.shade300, width: 1)),
            color: Colors.grey.shade100,
            child: ListTile(
              leading: Text("Vehicle No :", style: mTextStyle1),
              title: Text(_myBox.get("m_vehicle_number"), style: mTextStyle1),
            ),
          ),
          Container(
            height: 20,
          )
        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = mThemeColor;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
