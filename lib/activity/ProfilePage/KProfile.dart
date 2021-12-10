
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ProfilePageFormO extends StatefulWidget {

  const ProfilePageFormO({
    Key? key,
  }) : super(key: key);

  _ProfilePageFormOState createState() => _ProfilePageFormOState();
}

class _ProfilePageFormOState extends State<ProfilePageFormO> {
  String path = 'default';
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late DateTime dateOfBirth;
  late String _dob='' ;
  late String _mobileNo='';
  late int a = 0;
  late  String displayName='';
  late  String  _depart='';
  late  String  _branch='';
  late  String  _fatherName='';
  late  String  _motherName='';
  late  String  _bloodGroup='';
  late  String  _address='';
  late String username='';
   late String email='';


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
                    child:FutureBuilder<List<ParseObject>>(
                        future: getUserQuery(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                            case ConnectionState.waiting:
                            default:
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text("Error..."),);
                              }
                              if (!snapshot.hasData) {
                                return Center(
                                  child: Text("No Data..."),);
                              } else {

                                for (int i = 0; i < snapshot.data!.length; i++) {
                                  final snap = snapshot.data![i];
                                   username = snap.get<String>('username')!;
                                   email = snap.get<String>('email')!;
                                   displayName = snap.get<String>('displayName')!;
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
                                                displayName = name;
                                              },
                                              controller: TextEditingController(
                                                  text: displayName),
                                            ),
                                          ),
                                          SizedBox(
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
                                                username = id;
                                              },
                                              controller: TextEditingController(
                                                  text: username),
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
                                                _depart = depart;
                                             //  _showSave();
                                              },
                                              hintText: '',
                                              controller:
                                              TextEditingController(
                                                  text: _depart),
                                            ),
                                          ),
                                          SizedBox(
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
                                            //    _showSave();
                                              },
                                              hintText: '',
                                              controller:
                                              TextEditingController(
                                                  text: _branch),
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
                                                _fatherName = fatherName;
                                            //    _showSave();
                                              },
                                              controller:
                                              TextEditingController(
                                                  text:_fatherName),
                                            ),
                                          ),
                                          SizedBox(
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
                                                _motherName = motherName;
                                               // _showSave();
                                              },
                                              controller:
                                              TextEditingController(
                                                  text: _motherName),
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
                                                      _dob = dob;
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
                                          SizedBox(
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
                                                    text: _bloodGroup),
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
                                                  text: email),
                                            ),
                                          ),
                                          SizedBox(
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
                                              onChanged: (mobile_no) {
                                                mobile_no = _mobileNo;
                                             //   _showSave();

                                              },
                                              controller:
                                              TextEditingController(
                                                  text: _mobileNo),
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
                                          _address = address;
                                        //  _showSave();
                                        },
                                        controller:
                                        TextEditingController(text: _address),
                                      ),

                                      SizedBox(height: 20.0),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 50,
                                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          child: RaisedButton(
                                              textColor: Colors.white,
                                              color: Colors.blue,
                                              child: Text('Save '),
                                              onPressed: () {
                                                _check();
                                              }
                                          )
                                      )
                                    ]
                                  );
                                }
                                return Text('');
                              }//
                          }//
                       }//
                    ),//
                  )
                ],
              ),
            ),
          );
  }
  Future<void>_check()async{

    if(username.isEmpty||email.isEmpty||displayName.isEmpty||_dob.isEmpty||
        _fatherName.isEmpty||_motherName.isEmpty||_branch.isEmpty||_mobileNo.isEmpty||_address.isEmpty){
      _scaffoldKey.currentState!.showSnackBar(
          SnackBar(content:Text('You Need to fill all the details and a profile Photo'))
      );
    }else{

      _save();
      }
    }

  Future<void>_save()async {
    ParseUser? currentUser;
    print(_branch);
    currentUser = await ParseUser.currentUser() as ParseUser?;
    currentUser!..set('displayName', displayName)..set('branch',_branch)..set('depart',_depart);

    await currentUser.save();
  }

}

//// fOR MOBILE

class ProfilePageFormM extends StatefulWidget {

  const ProfilePageFormM({
    Key? key,
  }) : super(key: key);

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


  Future<Null> _selectDate(BuildContext context) async {
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
              child: FutureBuilder<List<ParseObject>>(
                future: getUserQuery(),
                  builder: (context, snapshot){
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                      default:
                        if (snapshot.hasError) {
                          return Center(
                            child: Text("Error..."),
                          );
                        }
                        if (!snapshot.hasData) {
                          return Center(
                            child: Text("No Data..."),
                          );
                        } else {
                          //List _userID = [];
                          for (int i = 0; i <
                              snapshot.data!.length; i++) {
                            final snap = snapshot.data![i];
                            username = snap.get<String>('username')!;
                            displayName = snap.get<String>('displayName')!;
                            email = snap.get<String>('email')!;
                            return Column(
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
                                          _depart= depart;
                                        },
                                        hintText: 'AIT-APEX',
                                        controller:
                                        TextEditingController(text: _depart),
                                      ),
                                    ),
                                    SizedBox(
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
                                          print(branch);
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
                                        borderRadius: BorderRadius.circular(16),
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
                                    SizedBox(
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
                                  hintText:"",
                                  labelText:"Email",
                                  onChanged:(mobile_no){
                                    _mobileNo = mobile_no;
                                  },
                                  controller: TextEditingController(text: _mobileNo),
                                ),
                                ProfileFields(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  hintText: "",
                                  labelText: "Contact No.",
                                  onChanged: (mobile_no){
                                    _mobileNo = mobile_no;
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
                                  onChanged: (mobile_no) {
                                    _mobileNo = mobile_no;
                                  },
                                  controller:
                                  TextEditingController(text: _mobileNo),
                                ),
                              ],
                            );
                          }return Text('');
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
}



/*

 */
Future<List<ParseObject>> getUserQuery()async{
  QueryBuilder<ParseUser> queryUsers =
  QueryBuilder<ParseUser>(ParseUser.forQuery());
  final ParseResponse apiResponse = await queryUsers.query();

  if(apiResponse.success && apiResponse.results != null){
    return apiResponse.results as List<ParseObject>;

  }else{
    return [];
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
      {required this.labelText,
        required this.hintText,
        required this.onChanged,
        required this.controller,
        this.isEditable = true,
        required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      // width: width == null ? MediaQuery.of(context).size.width / 2.5 : width,
      child: TextField(
        enabled: isEditable,
        controller: controller,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(),

          hintText: hintText,
          labelText: labelText,
        ),

      ),
    );
  }
}


