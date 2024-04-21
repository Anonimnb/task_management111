import 'dart:convert';

class Student {
  String firstName;
  String lastName;
  String bornDate;
  int course;
  String faculty;
  String imageUrl;

  Student(
      {required this.firstName,
        required this.lastName,
        required this.bornDate,
        required this.course,
        required this.faculty,
        required this.imageUrl, }
      );

  Student.fromJson(Map<String, dynamic> json)
      : firstName = json["firstName"],
        lastName = json["lastName"],
        bornDate = json["bornDate"],
        course = int.parse(json['course']),
        faculty = json["faculty"],
        imageUrl = json["imageUrl"];

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "bornDate": bornDate,
    "course": course.toString(),
    "faculty": faculty,
    "imageUrl": imageUrl,
  };
}
