class Names {
  List<String> words;

  Names({this.words});

  Names.fromJson(Map<String, dynamic> json) {
    words = json['words'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['words'] = this.words;
    return data;
  }
}
