// ignore_for_file: prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps, prefer_const_constructors, prefer_is_empty

import 'dart:convert';
import 'package:courierv9/pages/routs.dart';
import 'package:courierv9/pages/style_constent.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../colors_constent.dart';
import '../components/custom_button.dart';
import '../global.dart';
import 'package:http/http.dart' as http;

class PickupAwbHistory extends StatefulWidget {
  final Map<String, dynamic>? args;
  const PickupAwbHistory(this.args, {Key? key}) : super(key: key);

  @override
  State<PickupAwbHistory> createState() => _PickupAwbHistoryState();
}

class _PickupAwbHistoryState extends State<PickupAwbHistory> {
  List dataList = [];
  var isLoading = true;
  var arguments;
  @override
  void initState() {
    super.initState();
    arguments = widget.args;
    getAppData(arguments);
  }

  Future<void> getAppData(arguments) async {
    try {
      var res = await http.post(
          Uri.parse('${baseUrl}rest_api_native/RestController.php'),
          body: {
            "view": "getAwbNumberForPickup",
            "drs_unique_id": arguments['pickup_id'],
            "page": "1",
            "listType": "History"
          });
      setState(() {
        isLoading = false;
      });
      if (res.statusCode == 200) {
        var items = jsonDecode(res.body)['output'];
        if (items[0]['error'] == 'No Record found!') {
          dataList = [];
        } else {
          setState(() {
            dataList = items;
          });
        }
      } else {
        dataList = [];
      }
    } catch (err) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("${err}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    double mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mThemeColor,
          title: Padding(
            padding: const EdgeInsets.only(right: 45.0),
            child: Center(
              child: Text("Pickup Awb List", style: mTextStyleHeader),
            ),
          ),
        ),
        body: isLoading == false
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                      height: mHeight * .12,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          // ignore: prefer_const_literals_to_create_immutables
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5,
                                spreadRadius: .2,
                                color: Colors.grey)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                            ),
                            child: Text(
                              "View Direction Of All\nBellow Pickup Shipments\nin Google Map ",
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                          CustomButton(text: "Get Direction", onTap: () {})
                        ],
                      ),
                    ),
                  ),
                  getList()
                ],
              )
            : Center(
                child: Lottie.asset("images/delivery-loader.json",
                    width: 150, height: 150),
              ));
  }

  Widget getList() {
    if (dataList.length > 0) {
      return Expanded(
        child: ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              return getCard(context, dataList[index]);
            }),
      );
    } else {
      return Center(child: const Text('No items'));
    }
  }

  Widget getCard(context, item) {
    double mHeight = MediaQuery.of(context).size.height;
    return Column(children: [
      SizedBox(
        height: 15,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, MyRouts.pickupdetallHistoryrout,
                arguments: {
                  "shipment_id": item['shipment_id'],
                  "unique_id": arguments['pickup_id']
                });
          },
          child: Container(
              height: mHeight * .11,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5, spreadRadius: .2, color: Colors.grey)
                  ]),
              child: Row(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("AWB No:"),
                ),
                Expanded(
                  child: Divider(
                    indent: 5.0,
                    endIndent: 15,
                    thickness: 1,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, right: 10),
                      child: Text("${item['shipment_id']}",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text("${item['drs_date']}"),
                    )
                  ],
                )
              ])),
        ),
      )
    ]);
  }
}
