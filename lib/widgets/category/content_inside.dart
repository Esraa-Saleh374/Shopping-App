import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  final String title;
  final int quantity;
  final Widget widget;
  final String subtotal;
  final Widget contaner;
  final String offer;
  final String imageUrl;

  const Content(
    this.title,
    this.quantity,
    this.subtotal,
    this.contaner,
    this.widget,
    this.offer,
    this.imageUrl,
  );

  Widget showproducDetail(String value) {
    return Text(
      " $value دينار",
      textDirection: TextDirection.rtl,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white60,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 0,
            offset: Offset(1.5, 1.5), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget,
                      Flexible(
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      contaner,
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            showproducDetail(
                              subtotal.toString(),
                            ),
                            Text(
                              offer.toString(),
                              style: TextStyle(color: Colors.green[700]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              width: 100,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
