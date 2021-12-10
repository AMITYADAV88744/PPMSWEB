import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../responsive.dart';
import 'components/OverViewProject/overview_project.dart';
import '../../Navigation_UI/components/header.dart';
import 'components/recent_files.dart';
import 'components/task_info_details.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  _DashboardScreen createState() => _DashboardScreen();
}
final ScrollController _controllerOne = ScrollController();

class _DashboardScreen extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        controller: _controllerOne,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      //TeamMember(),
                      const OverviewProject(),
                      const SizedBox(height: defaultPadding),
                      const RecentFiles(),
                      if (Responsive.isMobile(context))
                        const SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context))
                        const StarageDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  const SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  const Expanded(
                    flex: 2,
                    child: StarageDetails(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

