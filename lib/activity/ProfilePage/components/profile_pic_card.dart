import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProfilePicCard extends StatelessWidget{
  const ProfilePicCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
          height: 200,
          child:Stack(
            children: <Widget>[
              const SizedBox(height: defaultPadding),
              CircleAvatar(
                radius: 70,
                child: ClipOval(
                  child: Image.asset('assets/images/avtar_team.png',
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(bottom: 0,right:1 ,child: Container(
                height: 40, width: 40,
                child: const Icon(Icons.add_a_photo, color: Colors.white,),
                decoration: const BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
              ))
            ],
          ),
    );
  }
}
