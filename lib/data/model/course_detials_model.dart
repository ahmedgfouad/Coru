// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:elearning_app/data/model/lessons_model.dart';

class CourseDetailsModel {
  String? id;
  String? name;
  String? image;
  String? category;
  String? instructor;
  String? price;
  String? rating;
  String? hours;
  String? about;
  int? studentNumber;
  List<Lessons>? lessons;
  CourseDetailsModel({
    this.id,
    this.name,
    this.image,
    this.category,
    this.instructor,
    this.price,
    this.rating,
    this.hours,
    this.about,
    this.studentNumber,
    this.lessons,
  });

  CourseDetailsModel.fromJson(Map<String, dynamic> json) {
    name = json['course_name'] ?? 'empty';
    image = json['image'] ?? 'empty';
    category = json['category'] ?? 'empty';
    instructor = json['instructor'] ?? 'empty';
    price = json['price'] ?? 'empty';
    rating = json['rating'] ?? 'empty';
    hours = json['hours'] ?? 'empty';
    studentNumber = json['student_number'] ?? 0;
    about = json['about'] ?? 'empty';

    if (json['lessons'] != null) {
      lessons = <Lessons>[];
      json['lessons'].forEach((v) {
        lessons!.add(Lessons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['course_name'] = name ?? 'empty';
    data['image'] = image ?? 'empty';
    data['category'] = category ?? 'empty';
    data['instructor'] = instructor ?? 'empty';
    data['price'] = price ?? 'empty';
    data['rating'] = rating ?? 'empty';
    data['hours'] = hours ?? 'empty';
    data['about'] = about ?? 'empty';
    data['student_number'] = studentNumber ?? 0;
    if (lessons != null) {
      data['lessons'] = lessons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
