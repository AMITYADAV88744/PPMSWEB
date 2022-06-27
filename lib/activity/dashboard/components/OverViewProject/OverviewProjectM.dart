import 'package:flutter/cupertino.dart';
import '../../../../constants.dart';
import '../chart.dart';
import '../team_member.dart';

class OverviewProjectM extends StatefulWidget {
  const OverviewProjectM({Key? key}) : super(key: key);

  @override
  _OverviewProjectState createState() => _OverviewProjectState();
}

class _OverviewProjectState extends State<OverviewProjectM> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(defaultPadding),
           child: TeamMember(),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Chart(),
          ),
        ),
      ],
    );
  }
}
