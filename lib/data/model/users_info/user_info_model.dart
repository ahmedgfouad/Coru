import 'package:elearning_app/data/model/users_info/my_course_model.dart';

class UserInfoModel {
  String? firstName;
  String? lasttName;
  String? email;
  String? password;
  String? confirmPassword;
  String? imageProfileUrl;
  String? userId;
  List<String>? bookMark;
  List<MyCourseModel>? myCourses;

  UserInfoModel({
    this.firstName,
    this.lasttName,
    this.email,
    this.password,
    this.confirmPassword,
    this.imageProfileUrl,
    this.userId,
    this.bookMark,
    this.myCourses,
  });

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lasttName = json['last_name'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirm_password'];
    imageProfileUrl = json['image_profile_rul'];
    userId = json['user_id'];

    if (json['book_mark'] != null) {
      bookMark = <String>[];
      json['book_mark'].forEach((v) {
        bookMark!.add(v);
      });
    }

    if (json['my_course'] != null) {
      myCourses = <MyCourseModel>[];
      json['my_course'].forEach((v) {
        myCourses!.add(MyCourseModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["first_name"] = firstName;
    data["last_name"] = lasttName;
    data["email"] = email;
    data["password"] = password;
    data["confirm_password"] = confirmPassword;
    data["image_profile_rul"] = imageProfileUrl;
    data["user_id"] = userId;

    if (bookMark != null) {
      data['book_mark'] = bookMark!.map((v) => v).toList();
    }

    if (myCourses != null) {
      data['my_course'] = myCourses!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
