class login {
  String? objectId;
  String? username;
  String? email;
  String? createdAt;
  String? updatedAt;
  ACL? aCL;
  String? sessionToken;

  login(
      {this.objectId,
      this.username,
      this.email,
      this.createdAt,
      this.updatedAt,
      this.aCL,
      this.sessionToken});

  login.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    username = json['username'];
    email = json['email'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    aCL = json['ACL'] != null ? ACL.fromJson(json['ACL']) : null;
    sessionToken = json['sessionToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['username'] = username;
    data['email'] = email;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (aCL != null) {
      data['ACL'] = aCL!.toJson();
    }
    data['sessionToken'] = sessionToken;
    return data;
  }
}

class ACL {
  A? a;
  DhoHcafmlz? dhoHcafmlz;

  ACL({this.a, this.dhoHcafmlz});

  ACL.fromJson(Map<String, dynamic> json) {
    a = json['a'] != null ? A.fromJson(json['a']) : null;
    dhoHcafmlz = json['dhoHcafmlz'] != null
        ? DhoHcafmlz.fromJson(json['dhoHcafmlz'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (a != null) {
      data['a'] = a!.toJson();
    }
    if (dhoHcafmlz != null) {
      data['dhoHcafmlz'] = dhoHcafmlz!.toJson();
    }
    return data;
  }
}

class A {
  bool? read;

  A({this.read});

  A.fromJson(Map<String, dynamic> json) {
    read = json['read'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['read'] = read;
    return data;
  }
}

class DhoHcafmlz {
  bool? read;
  bool? write;

  DhoHcafmlz({this.read, this.write});

  DhoHcafmlz.fromJson(Map<String, dynamic> json) {
    read = json['read'];
    write = json['write'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['read'] = read;
    data['write'] = write;
    return data;
  }
}
