import 'package:first_app/navigation/routes.dart';
import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  GridViewScreen({Key? key, this.iconsCount = 10}) : super(key: key);
  int iconsCount;

  List<Map> apps = [
    {"icon": Icons.camera_alt, "name": "Camera", "color": Colors.orange},
    {"icon": Icons.alarm, "name": "Clock", "color": Colors.red},
    {"icon": Icons.map, "name": "Maps", "color": Colors.blue},
    {"icon": Icons.settings, "name": "Settings", "color": Colors.black},
    {"icon": Icons.car_rental, "name": "Car", "color": Colors.green},
    {"icon": Icons.play_arrow, "name": "Music", "color": Colors.purple},
    {"icon": Icons.android, "name": "Drios", "color": Colors.pink},
    {
      "icon": Icons.drive_file_move,
      "name": "Drive",
      "color": Colors.deepOrange
    },
    {"icon": Icons.mail, "name": "Gmail", "color": Colors.red},
    {"icon": Icons.phone, "name": "Phone", "color": Colors.green},
    {"icon": Icons.file_present, "name": "Files", "color": Colors.yellow},
    {"icon": Icons.message, "name": "Message", "color": Colors.pink},
    {"icon": Icons.camera_alt, "name": "Camera", "color": Colors.orange},
    {"icon": Icons.alarm, "name": "Clock", "color": Colors.orange},
    {"icon": Icons.map, "name": "Maps", "color": Colors.orange},
    {"icon": Icons.settings, "name": "Settings", "color": Colors.orange},
    {"icon": Icons.car_rental, "name": "Car", "color": Colors.orange},
    {"icon": Icons.play_arrow, "name": "Music", "color": Colors.orange},
    {"icon": Icons.android, "name": "Drios", "color": Colors.orange},
    {"icon": Icons.drive_file_move, "name": "Drive", "color": Colors.orange},
    {"icon": Icons.mail, "name": "Gmail", "color": Colors.orange},
    {"icon": Icons.phone, "name": "Phone", "color": Colors.orange},
    {"icon": Icons.file_present, "name": "Files", "color": Colors.orange},
    {"icon": Icons.message, "name": "Message", "color": Colors.orange},
    {"icon": Icons.camera_alt, "name": "Camera", "color": Colors.orange},
    {"icon": Icons.alarm, "name": "Clock", "color": Colors.red},
    {"icon": Icons.map, "name": "Maps", "color": Colors.blue},
    {"icon": Icons.settings, "name": "Settings", "color": Colors.black},
    {"icon": Icons.car_rental, "name": "Car", "color": Colors.green},
    {"icon": Icons.play_arrow, "name": "Music", "color": Colors.purple},
    {"icon": Icons.android, "name": "Drios", "color": Colors.pink},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.3,
        ),

        // SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 3,
        //   crossAxisSpacing: 10,
        //   mainAxisSpacing: 10,
        //   childAspectRatio: 1.2,
        //   // in vertical gridview , width= childaspectRation*height

        //   ///  in horizonatal gridview height= chidaspectRatio * width
        // ),

        itemCount: iconsCount,
        itemBuilder: (context, index) {
          final app = apps[index];

          return InkWell(
            onTap: () {
              final res = Navigator.pushNamed(context, Routes.followers);
            },
            child: Container(
              // color: Colors.grey,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(color: app["color"]),
                      child: Icon(
                        app['icon'],
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(app["name"]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
