class Artists {
  Similar similar;

  Artists({this.similar});

  Artists.fromJson(Map<String, dynamic> json) {
    similar =
        json['Similar'] != null ? Similar.fromJson(json['Similar']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.similar != null) {
      data['Similar'] = this.similar.toJson();
    }
    return data;
  }
}

class Similar {
  List<Info> info;
  List<Results> results;

  Similar({this.info, this.results});

  Similar.fromJson(Map<String, dynamic> json) {
    if (json['Info'] != null) {
      info = List<Info>();
      json['Info'].forEach((v) {
        info.add(Info.fromJson(v));
      });
    }
    if (json['Results'] != null) {
      results = List<Results>();
      json['Results'].forEach((v) {
        results.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.info != null) {
      data['Info'] = this.info.map((v) => v.toJson()).toList();
    }
    if (this.results != null) {
      data['Results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
  String name;
  String type;

  Info({this.name, this.type});

  Info.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Name'] = this.name;
    data['Type'] = this.type;
    return data;
  }
}

class Results {
  String name;
  String type;

  Results({this.name, this.type});

  Results.fromJson(dynamic json) {
    name = json['Name'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Name'] = this.name;
    data['Type'] = this.type;
    return data;
  }
}