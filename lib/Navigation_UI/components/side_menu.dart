import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:ppmsweb/activity/Authentication/LoginPage.dart';
import 'package:ppmsweb/activity/Document/DocumentPage.dart';
import 'package:ppmsweb/activity/ProfilePage/ProfilePage.dart';
import 'package:ppmsweb/activity/dashboard/DashConnection.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/login_logo.png"),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashConnection()));

            },
          ),
          DrawerListTile(
            title: "Task",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Documents",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DocumentPage()));

            },
          ),
          DrawerListTile(
            title: "Notification",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Profile",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePageScreen()));
            },
          ),
          DrawerListTile(
            title: "Log Out",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () async {
              final user = await ParseUser.currentUser() as ParseUser;
              var response = await user.logout();
              if (response.success) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
              }
            },
          ),
        ],
      ),
    );
  }

}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
