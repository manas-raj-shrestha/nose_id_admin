import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:route_mapper/data.dart';

class ScreenshotMapper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScreenshotMapperState();
  }
}

class _ScreenshotMapperState extends State<ScreenshotMapper> {
  int selectedRouteIndex = 0;
  Map<String, List<String>> routeData = data;
  List<String> keys = data.keys.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
              flex: 2,
              child: Container(
                  color: Color(0xff1E3056), child: _buildRoutesListView())),
          Flexible(
            flex: 8,
            child: Center(
                child: Image.asset(
                    "assets/${routeData[keys[selectedRouteIndex]]!.first}")),
          ),
        ],
      ),
    );
  }

  _buildRoutesListView() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.keys.length,
        itemBuilder: (context, index) {
          var keys = data.keys;
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedRouteIndex = index;
                  });
                },
                child: Text(
                  keys.toList()[index],
                  style: TextStyle(color: Colors.white),
                )),
          );
        },
      ),
    );
  }

  _buildHeader() {
    return Container(
        padding: EdgeInsets.all(16),
        child: Text(
          'Routes',
          style: TextStyle(color: Colors.white),
        ));
  }
}
