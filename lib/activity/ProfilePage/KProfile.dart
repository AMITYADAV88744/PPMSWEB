import 'package:flutter/foundation.dart';
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
  String path = 'default';
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late DateTime dateOfBirth;
  late String _dob ;
  late String _mobileNo;
  late int a = 0;
  late String displayName;
  late String  _depart;
  late String  _branch;
  late String  _fatherName;
  late String  _motherName;
  late String  _bloodGroup;
  late String  _address;
  late String username;
  late String email;
  ParseUser? currentUser;


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
                                            hintText: "",
                                            labelText: "Name",
                                            onChanged: (name) {
                                              name = displayName;
                                            },
                                            controller: TextEditingController(
                                                text: snapshot.data!.get("displayName")
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
                                            hintText: "",
                                            labelText: "UID",
                                            onChanged: (id) {
                                              id = username;
                                            },
                                            controller: TextEditingController(
                                                text: snapshot.data!.username),
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
                                            labelText: "Department",
                                            onChanged: (depart) {
                                              depart = _depart;
                                              //  _showSave();
                                            },
                                            hintText: '',
                                            controller:
                                            TextEditingController(
                                                text: snapshot.data!.get("depart")),
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
                                          child: ProfileFields(
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width,
                                            hintText: "",
                                            labelText: "Father Name",
                                            onChanged: (fatherName) {
                                              fatherName = _fatherName;
                                              //    _showSave();
                                            },
                                            controller:
                                            TextEditingController(
                                                text:snapshot.data!.get("father")),
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
                                            hintText: "",
                                            labelText: "Mother Name",
                                            onChanged: (motherName) {
                                              motherName = _motherName;
                                              // _showSave();
                                            },
                                            controller:
                                            TextEditingController(
                                                text: snapshot.data!.get("m_name")),
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
                                                    text: snapshot.data!.get("dob"),
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
                                            child: ProfileFields(
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              hintText: "B+",
                                              labelText: "Blood Group",
                                              onChanged: (bg) {
                                                bg = _bloodGroup;
                                                //    _showSave();
                                              },
                                              controller: TextEditingController(
                                                  text: snapshot.data!.get("blood_group")),
                                            )
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
                                          child: ProfileFields(
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width,
                                            hintText: "",
                                            labelText: "Contact No.",
                                            onChanged: (mobileNo) {
                                              mobileNo = _mobileNo;
                                              //   _showSave();

                                            },
                                            controller:
                                            TextEditingController(
                                                text: snapshot.data!.get("mobile")),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ProfileFields(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      hintText: "",
                                      labelText: "Address",
                                      onChanged: (address) {
                                        address = _address;
                                        //  _showSave();
                                      },
                                      controller:
                                      TextEditingController(text: snapshot.data!.get("address")),
                                    ),

                                    const SizedBox(height: 20.0),
                                    Container(
                                        alignment: Alignment.center,
                                        height: 50,
                                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child: RaisedButton(
                                            textColor: Colors.white,
                                            color: Colors.blue,
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
                    ),//
                  )
                ],
              ),
            ),
          );
  }
 /* Future<void>_check()async{

    if(username.isEmpty||email.isEmpty||displayName.isEmpty||_dob.isEmpty||
        _fatherName.isEmpty||_motherName.isEmpty||_branch.isEmpty||_mobileNo.isEmpty||_address.isEmpty){
      _scaffoldKey.currentState!.showSnackBar(
          const SnackBar(content:Text('You Need to fill all the details and a profile Photo'))
      );
    }else{
      _save();
      }
    }
*/
  Future<void>_save()async {
    ParseUser? currentUser;
    if (kDebugMode) {
      print("Save:");

    }
    if (kDebugMode) {
      print(displayName);
    }

  }

}
/*
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
  late String _dob ;
  late String _mobileNo;
  late int a = 0;
  late  String displayName;
  late  String  _depart;
  late  String  _branch;
  late  String  _fatherName;
  late  String  _motherName;
  late  String  _bloodGroup;
  late  String  _address;
  late String username;
  late String email;
  ParseUser? currentUser;

  Future<ParseUser?> getUserQuery() async {
    currentUser = await ParseUser.currentUser() as ParseUser?;
    return currentUser;
  }



  Future<void> _selectDate(BuildContext context) async {
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
                          return
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ProfileFields(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  hintText: "",
                                  labelText: "UserName",
                                  onChanged: (name) {
                                    // print(name);
                                    displayName = name;
                                  },
                                  controller: TextEditingController(
                                      text: username),
                                ),
                                ProfileFields(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  hintText: "",
                                  labelText: "UserID",
                                  onChanged: (id) {
                                    // print(id);
                                    username = id;
                                  },
                                  controller:
                                  TextEditingController(text: username),
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
                                        TextEditingController(text: _depart),
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
                                          if (kDebugMode) {
                                            print(branch);
                                          }
                                          _branch = branch;
                                        },
                                        hintText: 'AI&ML',
                                        controller:
                                        TextEditingController(text: _branch),
                                      ),
                                    ),
                                  ],
                                ),
                                ProfileFields(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  hintText: "",
                                  labelText: "Father Name",
                                  onChanged: (fatherName) {
                                    _fatherName = fatherName;
                                  },
                                  controller:
                                  TextEditingController(text: _fatherName),
                                ),
                                ProfileFields(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  hintText: "",
                                  labelText: "Mother Name",
                                  onChanged: (motherName) {
                                    _motherName = motherName;
                                  },
                                  controller:
                                  TextEditingController(text: _motherName),
                                ),
                                Row(
                                  // mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child: InkWell(
                                        onTap: () async {
                                          await _selectDate(context);
                                        },
                                        borderRadius: BorderRadius.circular(
                                            16),
                                        child: IgnorePointer(
                                          child: ProfileFields(
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              labelText: "DOB",
                                              onChanged: (dob) {
                                                _dob = dob;
                                              },
                                              hintText: '25/07/2000',
                                              controller: TextEditingController(
                                                text: _dob,
                                              )
                                            // initialText: dateOfBirth == null
                                            //   ? ''
                                            //  : dateOfBirth
                                            //    .toLocal()
                                            //   .toString()
                                            // .substring(0, 10),
                                          ),
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
                                        hintText: "B+",
                                        labelText: "Blood Group",
                                        onChanged: (bg) {
                                          _bloodGroup = bg;
                                        },
                                        controller: TextEditingController(
                                            text: _bloodGroup),
                                      ),
                                    ),
                                  ],
                                ),
                                ProfileFields(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  hintText: "",
                                  labelText: "Email",
                                  onChanged: (mobileNo) {
                                    _mobileNo = mobileNo;
                                  },
                                  controller: TextEditingController(
                                      text: _mobileNo),
                                ),
                                ProfileFields(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  hintText: "",
                                  labelText: "Contact No.",
                                  onChanged: (mobileNo) {
                                    _mobileNo = mobileNo;
                                  },
                                  controller:
                                  TextEditingController(text: _mobileNo),
                                ),
                                ProfileFields(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  hintText: "",
                                  labelText: "Address",
                                  onChanged: (mobileNo) {
                                    _mobileNo = mobileNo;
                                  },
                                  controller:
                                  TextEditingController(text: _mobileNo),
                                ),
                              ],
                            );

                        }
                        return const Text('');
                    }
                  }
              )
            ),
          ],
        ),
      ),
    );
  }
}
*/
class ProfileFields extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Function onChanged;
  final double width;
  final TextEditingController controller;
  final bool isEditable;

   ProfileFields(
      {required this.labelText,
        required this.hintText,
        required this.onChanged,
        required this.controller,
        this.isEditable = true,
        required this.width});

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


