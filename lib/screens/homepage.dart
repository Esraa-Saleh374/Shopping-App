import 'package:flutter/material.dart';
import 'package:shopping/widgets/category/appbar.dart';
import 'package:shopping/widgets/drawer_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 120, 66, 150),
      ),
      body: ShowappBar(
        hight: 150,
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Row(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber,

                      // image: DecorationImage(
                      //     image: NetworkImage(
                      //   'https://imcut.jollychic.com//uploads/jollyimg/imageLibrary/201903/8SV/03/IL201903032021362101.jpg',
                      // )
                      // ),
                    ),
                    child: Image.network(
                      'https://imcut.jollychic.com//uploads/jollyimg/imageLibrary/201903/8SV/03/IL201903032021362101.jpg',
                    )),
              )
            ],
          ),
        ),
      ),
      endDrawer: DrawerScreen(),
    );
  }
}
