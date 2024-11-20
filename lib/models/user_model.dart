
class UserModel {
  final String? id;
  String? fullname;
  String? adress;
  final String? email;
  String? phoneNumber;
  String? profilePicture;
  Member? member;
  Major? major;

  UserModel({
     this.id,
     this.fullname,
     this.adress,
     this.email,
     this.phoneNumber,
     this.profilePicture,
     this.major,
     this.member,
  });


  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'FullName': fullname,
      'Email': email,
      'Address': adress,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'Major': major?.toMap(),
      'Member': member?.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['Id'] as String?,
      fullname: map['FullName'] as String?,
      adress: map['Address'] as String?,
      email: map['Email'] as String?,
      phoneNumber: map['PhoneNumber'] as String?,
      profilePicture: map['ProfilePicture'] as String?,
      member: map['Member'] != null ? Member.fromMap(map['Member']) : null,
      major: map['Major'] != null ? Major.fromMap(map['Major']) : null,
    );
  }

}

class Member{
  String? memberName;
  String? payStatus;
  String? regDate;

  Member({
    this.memberName,
    this.payStatus,
    this.regDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'MemberName': memberName,
      'PayStatus': payStatus,
      'RegDate': regDate,
    };
  }

  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      memberName: map['MemberName'],
      payStatus: map['PayStatus'],
      regDate: map['RegDate'],
    );
  }
}

class Major{
  String? majorName;
  String? majorLevel;
  String? date;
  String? islamicKnowledgeStatus;

  Major({
    this.majorName,
    this.majorLevel,
    this.date,
    this.islamicKnowledgeStatus
  });

  Map<String, dynamic> toMap() {
    return {
      'MajorName': majorName ?? '',
      'MajorLevel': majorLevel ?? '',
      'Date': date ?? '',
      'IslamicKnowledgeStatus': islamicKnowledgeStatus ?? '',
    };
  }


  factory Major.fromMap(Map<String, dynamic> map) {
    return Major(
      majorName: map['MajorName'],
      majorLevel: map['MajorLevel'],
      date: map['Date'],
      islamicKnowledgeStatus: map['IslamicKnowledgeStatus'],
    );
  }
}
