import 'package:flutter/material.dart';
import 'package:ppmsweb/Navigation_UI/components/side_menu.dart';
import 'package:ppmsweb/Navigation_UI/controllers/MenuController.dart';
import 'package:provider/provider.dart';
import '../../responsive.dart';
import 'ProjectBasketView.dart';

class ProjectBasket extends StatefulWidget {
  const ProjectBasket({Key? key}) : super(key: key);
  @override
  _ProjectBasket createState() => _ProjectBasket();
}

class _ProjectBasket extends State<ProjectBasket> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuController(),
        ),
      ],
      child: const ProjectScreen(),
    );
  }
}
  class ProjectScreen extends StatelessWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     key: context.read<MenuController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            const Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child:ProjectBasketView(),
            ),
          ],
        ),
      ),
    );
  }
}