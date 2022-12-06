import 'dart:convert';

List<PoemClass> poemFromJson(String str) =>
    List<PoemClass>.from(json.decode(str).map((x) => PoemClass.fromJson(x)));

String poemToJson(List<PoemClass> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PoemClass{
  PoemClass({
    required this.title,
    required this.author,
    required this.lines,
    required this.linecount,
  });

  String title;
  String author;
  List<String> lines;
  String linecount;

  factory PoemClass.fromJson(Map<String, dynamic> json) => PoemClass(
    title: json["title"],
    author: json["author"],
    lines: List<String>.from(json["lines"].map((x) => x)),
    linecount: json["linecount"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "author": author,
    "lines": List<dynamic>.from(lines.map((x) => x)),
    "linecount": linecount,
  };
}