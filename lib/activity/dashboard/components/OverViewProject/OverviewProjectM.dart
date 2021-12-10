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
    final Size _size = MediaQuery
        .of(context)
        .size;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
           child: TeamMember(),
          ),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Chart(),
          ),
        ),
      ],
    );
  }
}
