
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ProfilePageFormO extends StatefulWidget {

  const ProfilePageFormO({
    Key? key,
  }) : super(key: key);

  @override
  _ProfilePageFormOState createState() => _ProfilePageFormOState();
}


class _ProfilePageFormOState extends State<ProfilePageFormO> {

  late DateTime dateOfBirth;
  late String _dob ;
  late int a = 0;
  late final  String displayName;
  late  String  _depart;
  late  String  _branch;
  late String username;
  late String email;
  ParseUser? currentUser;

  TextEditingController addressController = TextEditingController(); // initialize the controller
  TextEditingController fatherController = TextEditingController();// initialize the controller
  TextEditingController motherController = TextEditingController(); // initialize the controller
//  TextEditingController dobController = TextEditingController(); // initialize the controller
  TextEditingController mobileController = TextEditingController(); // initialize the controller
  TextEditingController bloodController=TextEditingController(); // initialize the controller

  @override
  void initState() {
    super.initState();
  }


  Future<ParseUser?> getUserQuery() async {
    currentUser = await ParseUser.currentUser() as ParseUser?;
    return currentUser;
  }



  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
        initialDatePickerMode: DatePickerMode.day,
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        dateOfBirth = picked;
        _dob = picked.toLocal().toString().substring(0, 10);
      });
    }
  }
  @override
  Widget build(BuildContext context)  {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                // fit: StackFit.loose,
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 8),
                    child:FutureBuilder<ParseUser?>(
                        future: getUserQuery(),
                        builder: (context, snapshot){
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                            case ConnectionState.waiting:
                            default:
                            if (snapshot.hasError) {
                              return const Center(
                                child: Text("Error..."),
                              );
                            }
                            if (!snapshot.hasData) {
                              return const Center(
                                child: Text("No Data..."),
                              );
                            } else{
                              addressController.text=snapshot.data!.get('address');
                              fatherController.text=snapshot.data!.get('father');
                              mobileController.text=snapshot.data!.get('mobile');
                              motherController.text=snapshot.data!.get('mother');
                              bloodController.text=snapshot.data!.get('bloodgroup');
                                return Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: <Widget>[
                                      Row(
                                        // mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: <Widget>[
                                          Expanded(
                                            child: ProfileFields(
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              isEditable: false,
                                              hintText: "",
                                              labelText: "Name",
                                              onChanged: (name) {
                                                name = displayName;
                                              },
                                              controller: TextEditingController(
                                                text: snapshot.data!.get("displayName"),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: ProfileFields(
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              isEditable: false,
                                              hintText: "",
                                              labelText: "UID",
                                              onChanged: (id) {
                                                id = username;
                                              },
                                              controller: TextEditingController(
                                                  text: snapshot.data!.get('username')),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        // mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: <Widget>[
                                          Expanded(
                                            child: ProfileFields(
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              isEditable: false,
                                              labelText: "Department",
                                              onChanged: (depart) {
                                                depart = _depart;
                                                //  _showSave();
                                              },
                                              hintText: '',
                                              controller:
                                              TextEditingController(
                                                  text: snapshot.data!.get('depart')),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: ProfileFields(
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              isEditable: false,
                                              labelText: "Branch",
                                              onChanged: (branch) {
                                                branch = _branch;
                                                //    _showSave();
                                              },
                                              hintText: '',
                                              controller:
                                              TextEditingController(
                                                  text: snapshot.data!.get("branch")
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        // mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: <Widget>[
                                          Expanded(
                                            child: TextField(
                                              controller: fatherController,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              decoration: const InputDecoration(
                                                border:  OutlineInputBorder(),
                                                hintText: "Father",
                                                labelText: "Father ",
                                              ),

                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: TextField(
                                              controller: motherController,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              decoration: const InputDecoration(
                                                border:  OutlineInputBorder(),
                                                hintText: "Mother",
                                                labelText: "Mother",
                                              ),

                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        // mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: <Widget>[
                                          Expanded(
                                            child: InkWell(
                                              onTap: () async {
                                                await _selectDate();
                                              },
                                              borderRadius: BorderRadius
                                                  .circular(16),
                                              child: IgnorePointer(
                                                child: ProfileFields(
                                                    width: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width,
                                                    labelText: "DOB",
                                                    onChanged: (dob) {
                                                      dob = _dob;
                                                      //     _showSave();
                                                    },
                                                    hintText: '25/07/2000',
                                                    controller: TextEditingController(
                                                      text: _dob,
                                                    )
                                                  // initialText: dateOfBirth == null
                                                  //     ? ''
                                                  //     : dateOfBirth
                                                  //         .toLocal()
                                                  //         .toString()
                                                  //         .substring(0, 10),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                              child: TextField(
                                                controller: bloodController,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                decoration: const InputDecoration(
                                                  border:  OutlineInputBorder(),
                                                  hintText: "Blood Group",
                                                  labelText: "Blood Group",
                                                ),

                                              ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        // mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: <Widget>[
                                          Expanded(
                                            child: ProfileFields(
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              isEditable: false,
                                              hintText: "",
                                              labelText: "Email",
                                              onChanged: (email) {
                                                email = email;
                                                //  _showSave();

                                              },
                                              controller:
                                              TextEditingController(
                                                  text: snapshot.data!.emailAddress),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: TextField(
                                              controller: mobileController,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              decoration: const InputDecoration(
                                                border:  OutlineInputBorder(),
                                                hintText: "Contact No",
                                                labelText: "Contact No",
                                              ),

                                            ),
                                          ),
                                        ],
                                      ),
                                      TextField(
                                        controller: addressController,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        decoration: const InputDecoration(
                                          border:  OutlineInputBorder(),
                                          hintText: "Address",
                                          labelText: "Address",
                                        ),
                                      ),
                                      const SizedBox(height: 20.0),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 50,
                                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.blueAccent,
                                                textStyle: const TextStyle(color: Colors.white),
                                              ),
                                              child: const Text('Save '),
                                              onPressed: () {
                                                _save();

                                              }
                                          )
                                      )
                                    ]
                                );
                              }
                          }

                        }
                    ),//
                  )
                ],
              ),
            ),
          );
  }


  Future<void>_save()async {

    //await _update();
    currentUser!..set('address',addressController.text.trim())
      ..set('father',fatherController.text.trim())..set('mother',motherController.text.trim())
      ..set('mobile', mobileController.text.trim())..set('bloodgroup', bloodController.text.trim());
    await currentUser!.save();

  }

}

//// fOR MOBILE

class ProfilePageFormM extends StatefulWidget {

  const ProfilePageFormM({
    Key? key,
  }) : super(key: key);

  @override
  _ProfilePageFormMState createState() => _ProfilePageFormMState();
}

class _ProfilePageFormMState extends State<ProfilePageFormM> {
  late DateTime dateOfBirth;
  late int a = 0;
  late final  String displayName;
  late  String  _depart;
  late  String  _branch;
  late String username;
  late String email;
  ParseUser? currentUser;


  TextEditingController addressController = TextEditingController(); // initialize the controller
  TextEditingController fatherController = TextEditingController();// initialize the controller
  TextEditingController motherController = TextEditingController(); // initialize the controller
 TextEditingController dobController = TextEditingController(); // initialize the controller
  TextEditingController mobileController = TextEditingController(); // initialize the controller
  TextEditingController bloodController=TextEditingController(); // initialize the controller

  Future<ParseUser?> getUserQuery() async {
    currentUser = await ParseUser.currentUser() as ParseUser?;
    return currentUser;
  }



  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
        initialDatePickerMode: DatePickerMode.day,
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        dateOfBirth = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          // fit: StackFit.loose,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 10, horizontal: 8),
              child: FutureBuilder<ParseUser?>(
                future: getUserQuery(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                      default:
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text("Error..."),
                          );
                        }
                        if (!snapshot.hasData) {
                          return const Center(
                            child: Text("No Data..."),
                          );
                        }
                        else {
                          addressController.text=snapshot.data!.get('address');
                          fatherController.text=snapshot.data!.get('father');
                          mobileController.text=snapshot.data!.get('mobile');
                          motherController.text=snapshot.data!.get('mother');
                          bloodController.text=snapshot.data!.get('bloodgroup');
                          dobController.text=snapshot.data!.get('dob');
                          //_dob=snapshot.data!.get('dob');
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ProfileFields(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                                isEditable: false,
                                hintText: "",
                                labelText: "UserName",
                                onChanged: (name) {
                                  displayName = name;
                                  print(displayName);
                                  },
                                controller: TextEditingController(
                                    text: snapshot.data!.get('displayName')),
                              ),
                              ProfileFields(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                isEditable: false,

                                hintText: "",
                                labelText: "UserID",
                                onChanged: (id) {
                                  username = id;
                                  },
                                 controller: TextEditingController(
                                     text: snapshot.data!.get('username')
                                 ),
                               ),
                               Row(
                                 // mainAxisSize: MainAxisSize.min,
                                 mainAxisAlignment: MainAxisAlignment
                                     .spaceBetween,
                                 children: <Widget>[
                                   Expanded(
                                     child: ProfileFields(
                                       width: MediaQuery
                                           .of(context)
                                           .size
                                           .width,
                                       labelText: "Department",
                                       onChanged: (depart) {
                                         // print(depart);
                                         _depart = depart;
                                       },
                                       hintText: 'AIT-APEX',
                                       controller:
                                       TextEditingController(text: snapshot.data!.get('depart')),
                                     ),
                                   ),
                                   const SizedBox(
                                     width: 10,
                                   ),
                                   Expanded(
                                     child: ProfileFields(
                                       width: MediaQuery
                                           .of(context)
                                           .size
                                           .width,
                                       labelText: "Branch",
                                       onChanged: (branch) {
                                         _branch = branch;
                                       },
                                       hintText: 'AI&ML',
                                       controller:
                                       TextEditingController(
                                           text: snapshot.data!.get('branch')
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                                TextField(
                                  controller: fatherController,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: const InputDecoration(
                                    border:  OutlineInputBorder(),
                                    hintText: "",
                                    labelText: "Father ",
                                  ),

                                ),
                                const SizedBox(height: 20.0),

                                TextField(
                                  controller: motherController,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: const InputDecoration(
                                    border:  OutlineInputBorder(),
                                    hintText: "",
                                    labelText: "Mother",
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Row(
                                 // mainAxisSize: MainAxisSize.min,
                                 mainAxisAlignment: MainAxisAlignment
                                     .spaceBetween,
                                 children: <Widget>[
                                   Expanded(
                                     child: InkWell(
                                       onTap: () async {
                                         await _selectDate();
                                       },
                                       borderRadius: BorderRadius.circular(
                                           16),
                                       child: IgnorePointer(
                                         child: TextField(
                                           controller:dobController,
                                           decoration: const InputDecoration(
                                             border:  OutlineInputBorder(),
                                             hintText: "",
                                             labelText: "Date of Birth",
                                           ),

                                         ),
                                       ),

                                     ),
                                   ),
                                   const SizedBox(
                                     width: 20,
                                   ),
                                   Expanded(
                                     child:  TextField(
                                       controller: bloodController,
                                       style: const TextStyle(
                                         fontSize: 18,
                                         fontWeight: FontWeight.w500,
                                       ),
                                       decoration: const InputDecoration(
                                         border:  OutlineInputBorder(),
                                         hintText: "Blood Group",
                                         labelText: "Blood Group",
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                                const SizedBox(height: 20.0),

                                ProfileFields(

                                 width: MediaQuery
                                     .of(context)
                                     .size
                                     .width,
                                 isEditable: false,
                                 hintText: "",
                                 labelText: "Email",
                                 onChanged: (email) {
                                   email = email;
                                 },
                                 controller: TextEditingController(
                                     text: snapshot.data!.get('email')),
                               ),
                                const SizedBox(height: 20.0),

                                TextField(
                                  controller: mobileController,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: const InputDecoration(
                                    border:  OutlineInputBorder(),
                                    hintText: "",
                                    labelText: "Contact No",
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                TextField(
                                  controller: addressController,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: const InputDecoration(
                                    border:  OutlineInputBorder(),
                                    hintText: "Address",
                                    labelText: "Address",
                                  ),

                               ),
                                const SizedBox(height: 20.0),
                                Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.blueAccent,
                                          textStyle: const TextStyle(color: Colors.white),
                                        ),
                                        child: const Text('Save '),
                                        onPressed: () {
                                          _save();

                                        }
                                    )
                                )

                             ],
                           );
                         }
                        }
                    }
              )
            ),
          ],
        ),
      ),
    );
  }

  Future<void>_save()async {

    //await _update();
    currentUser!..set('address',addressController.text.trim())
      ..set('father',fatherController.text.trim())..set('mother',motherController.text.trim())
      ..set('mobile', mobileController.text.trim())..set('bloodgroup', bloodController.text.trim())
      ..set('dob', dobController.text.trim());
    await currentUser!.save();

  }

}




class ProfileFields extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Function onChanged;
  final double width;
  final TextEditingController controller;
  final bool isEditable;

    const ProfileFields(
      {Key? key, required this.labelText,
        required this.hintText,
        required this.onChanged,
        required this.controller,
        this.isEditable = true,
        required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      // width: width == null ? MediaQuery.of(context).size.width / 2.5 : width,
      child: TextField(
        enabled: isEditable,
        controller: controller,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
          labelText: labelText,
        ),

      ),
    );
  }
}


