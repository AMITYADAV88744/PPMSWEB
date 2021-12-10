import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppmsweb/Navigation_UI/components/header.dart';
import 'package:ppmsweb/Navigation_UI/controllers/MenuController.dart';
import 'package:provider/src/provider.dart';
import '../../constants.dart';
import 'KProfile.dart';
import 'components/profile_pic_card.dart';

class PersonalDeatilCard extends StatefulWidget {
  const PersonalDeatilCard({Key? key}) : super(key: key);

  @override
  _PersonalDeatilCardState createState() => _PersonalDeatilCardState();
}
final ScrollController _controllerOne = ScrollController();

class _PersonalDeatilCardState extends State<PersonalDeatilCard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        controller: _controllerOne,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      HeaderPP(),
                      ProfilePicCard(),
                      const SizedBox(height: defaultPadding),
                      ProfilePageForm(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



class ProfilePageForm extends StatefulWidget {
  const ProfilePageForm({Key? key}) : super(key: key);

  @override
  _ProfilePageFormState createState() => _ProfilePageFormState();
}

class _ProfilePageFormState extends State<ProfilePageForm> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery
        .of(context)
        .size;
    return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return const ProfilePageFormO();//for mobile
          } else {
            return const ProfilePageFormM();//for tab
          }
        },

    );


  }
}






