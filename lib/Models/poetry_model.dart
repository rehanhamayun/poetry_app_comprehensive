class ShakeModel {
  String? title;
  String? author;
  List<String>? lines;
  String? linecount;

  ShakeModel({this.title, this.author, this.lines, this.linecount});

  ShakeModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    author = json['author'];
    lines = json['lines'].cast<String>();
    linecount = json['linecount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['author'] = author;
    data['lines'] = lines;
    data['linecount'] = linecount;
    return data;
  }
}
