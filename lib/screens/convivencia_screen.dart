import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Convivencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Convivencia'),
        ),
        body: ListView(
          children: [
            GestureDetector(
              onTap:  () => Navigator.pushNamed(context, "expulsados"),
              child: Card(
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.boxes),
                  title: Text('Expulsados'),
                ),
              ),
            ),
            GestureDetector(
              onTap:  () => Navigator.pushNamed(context, "mayores"),
              child: Card(
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.braille),
                  title: Text('Mayores'),
                ),
              ),
            )
          ],
        ));
  }
}