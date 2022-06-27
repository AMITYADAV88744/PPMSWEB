import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:ppmsweb/Navigation_UI/controllers/MenuController.dart';
import 'package:ppmsweb/activity/ProjectBasket/ProjectBasket.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../responsive.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: context.read<MenuController>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Text(
            "Dashboard",
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        const Expanded(child: SearchField()),
        const ProfileCard()
      ],
    );
  }
}
class HeaderPP extends StatelessWidget {
  const HeaderPP({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: context.read<MenuController>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Text(
            "ProfilePage",
            style: Theme.of(context).textTheme.headline6,
          ),
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    ParseUser? currentUser;

    Future<ParseUser?> getUserQuery() async {
      currentUser = await ParseUser.currentUser() as ParseUser?;
      return currentUser;
    }

    return FutureBuilder<ParseUser?>(
      future: getUserQuery(),
      builder: (context, snapshot) {
        switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
          default :
            return Container(
              margin: const EdgeInsets.only(left: defaultPadding),
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding,
                vertical: defaultPadding / 2,
              ),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.white10),
              ),
              child: Row(
                children: [

                  if (!Responsive.isMobile(context))
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                      child: Text(snapshot.data!.get("displayName")),
                    ),
                  const Icon(Icons.keyboard_arrow_down),
                ],
              ),
            );
        }
      },
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(defaultPadding * 0.75),
            margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}


// Header for Select Team
class HeaderT extends StatelessWidget {
  const HeaderT({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed:() {
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const ProjectBasket()));
            },
          ),
          const SizedBox(width: defaultPadding,),
          Text(
            "Select Team",
            style: Theme.of(context).textTheme.headline6,
          ),
        ]
    );
  }
}

class HeaderDP extends StatelessWidget {
  const HeaderDP({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: context.read<MenuController>().controlMenu,
            ),
          if (!Responsive.isMobile(context))
            Text(
              "Document Details",
              style: Theme.of(context).textTheme.headline6,
            ),
          if (!Responsive.isMobile(context))
            Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
          const Expanded(child: SearchField()),
          const ProfileCard()

        ]
    );
  }
}

