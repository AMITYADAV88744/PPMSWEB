

class User {
  String? className;
  String? objectId;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? userID;
  String? email;
  String? depart;
  String? branch;
  String? profilepic;

  User({
    this.className,
    this.objectId,
    this.createdAt,
    this.updatedAt,
    this.userID,
    this.email,
    this.depart,
    this.branch,
    this.name,
    this.profilepic,
  });


  Map<String, dynamic> toMap() {
    return {
      'className': className,
      'objectId': objectId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      "email": email,
      "displyName": name,
      "username": userID,
      //  "depart":depart,
      //"brach":branch,
      //"profilepic":profilepic,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        className: map['className'],
        objectId: map['objectId'],
        createdAt: map['createdAt'],
        updatedAt: map['updatedAt'],
        name: map['displayName'],
        userID: map['username'],
        email: map['email']
    );
  }

}




