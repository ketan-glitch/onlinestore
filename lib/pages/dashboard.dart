import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:http/http.dart';
// import 'package:onlinestore/json/products.json' as data;

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // static const String url ='https://run.mocky.io/v3/43929819-0a6f-498e-8f6e-f8841bc64b7a';
  // Map<String, List> _products;
  // bool _loading;
  @override
  void initState() {
    super.initState();
    // _loading = true;
    // Services.getdata().then((value) {
    //   _products = value;
    // Map<String, dynamic> temp =
    //     _products['Aloevera Soap'] as Map<String, dynamic>;
    //   print(_products);
    //   _loading = false;
    // });
    List<dynamic> response;
    response = loadAsset() as List;
    print(response);
  }

  Future<String> loadAsset() async {
    return jsonDecode(await rootBundle.loadString('assets/config.json'));
  }
  // void reqRecord() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Products'),
        ),
        body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("_products[index][0]['Description']"),
              subtitle: Text('SubData'),
            );
          },
        ));
  }
}
