import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  final String title;
  final int quantity;
  final Widget removeButton;
  final String subtotal;
  final Widget quantityControlWidget;
  final String offer;
  final String imageUrl;

  const Content(
    this.title,
    this.quantity,
    this.subtotal,
    this.quantityControlWidget,
    this.removeButton,
    this.offer,
    this.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10),
      height: 135,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 1, spreadRadius: 1,
            offset: Offset(0, 0.5), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment(-0.9, -0.7),
                    child: removeButton,
                  ),
                ),
                Expanded(flex: 1, child: quantityControlWidget),
                Expanded(flex: 1, child: SizedBox()),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // removeButton,
                // SizedBox(height: 0.5),
                Text(title,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                        )),
                Text(
                  "$subtotal دينار",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                // SizedBox(height: 0.5),
                Text(
                  offer.toString(),
                  style: TextStyle(color: Colors.green[700]),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              width: 100,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
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
