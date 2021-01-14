import 'package:flutter/material.dart';

class CooksImage extends StatelessWidget {
  final Map cook;

  CooksImage({this.cook});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: InkWell(
          child: Container(
        height: 400.0,
        width: 300.0,
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                '${cook['image']}',
                height: 300.0,
                width: 300.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Container(
                child: new Text('${cook['name']}',
                    style: new TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'Lato Black',
                        color: new Color(0xff00556A),
                        fontWeight: FontWeight.bold)))
          ],
        ),
      )),
    );
  }
}
