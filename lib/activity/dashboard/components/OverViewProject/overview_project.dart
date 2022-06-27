import 'package:flutter/cupertino.dart';

import 'OverviewProjectM.dart';
import 'OverviewProjectO.dart';


class OverviewProject extends StatefulWidget {
  const OverviewProject({Key? key}) : super(key: key);

  @override
  _OverviewProjectState createState() => _OverviewProjectState();
}

class _OverviewProjectState extends State<OverviewProject> {
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return const OverviewProjectM();//for mobile
            } else {
              return const OverviewProjectO();//for tab
            }
          },
        );
  }
}



















