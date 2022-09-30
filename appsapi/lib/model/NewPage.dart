import 'dart:ui';

import 'package:appsapi/Helper/helper.dart';
import 'package:appsapi/model/Dataapi.dart';
import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  List<Productdata>? productdata;
  bool isloaed = false;

  getData() async {
    productdata = await datehelper().getProductdata();
    setState(() {
      isloaed = true;
    });
  }

  @override
  void initState() {
    getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.amber,
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      height: 100,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.blue,
              ),
              child: Center(
                  child: Text(
                'Product Data',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              )),
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: productdata?.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (_, index) {
                    return Visibility(
                      child: Card(
                        child: Column(
                          children: [
                            Text(productdata![index].body)
                          ],
                        ),
                      ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
