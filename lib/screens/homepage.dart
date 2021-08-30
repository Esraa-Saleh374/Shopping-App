import 'package:flutter/material.dart';
import 'package:shopping/widgets/category/appbar.dart';
import 'package:dotted_line/dotted_line.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget detailCart(IconData icon, String text) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: Icon(
                    icon,
                    size: 30,
                  )),
            ),
            SizedBox(
              height: 4,
            ),
            Center(child: Text(text)),
          ],
        ),
      ),
    );
  }

  Widget dashLine() {
    return Expanded(
        flex: 2,
        child: DottedLine(
          direction: Axis.horizontal,
          dashColor: Colors.purple,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShowappBar(
        hight: 150,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 75.0, right: 8, left: 8),
              child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 118,
                  child: Text("WIP: Main Page")
                  //  Row(
                  //   children: [
                  //     detailCart(Icons.payment, 'تفاصيل الدفع '),
                  //     dashLine(),
                  //     detailCart(Icons.location_on, "تفاصيل الشحن "),
                  //     dashLine(),
                  //     detailCart(Icons.details_outlined, "تفاصيل الطلب "),
                  //   ],
                  // ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
