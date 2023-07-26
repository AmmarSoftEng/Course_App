import 'package:flutter/material.dart';

import 'constants.dart';

class Hometwo extends StatefulWidget {
  const Hometwo({Key? key}) : super(key: key);

  @override
  State<Hometwo> createState() => _HometwoState();
}

class _HometwoState extends State<Hometwo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          color: kSidebarBackgroundColor,
          child: Text(
            'Home page',
            style: kTitle1Style,
          ),
        ),
      ),
    );
  }
}
