import 'package:elearning_app/data/model/users_info/my_cource_model.dart';

class UserInfoModel {
  String? firstName;
  String? lasttName;
  String? email;
  String? password;
  String? cofirmPassword;
  String? imageProfileUrl;
  String? userId;
  List<String>? bookMark;
  List<MyCourseModel>? myCources;

  UserInfoModel({
    this.firstName,
    this.lasttName,
    this.email,
    this.password,
    this.cofirmPassword,
    this.imageProfileUrl,
    this.userId,
    this.bookMark,
    this.myCources,
  });

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lasttName = json['last_name'];
    email = json['email'];
    password = json['password'];
    cofirmPassword = json['confirm_password'];
    imageProfileUrl = json['image_profile_rul'];
    userId = json['user_id'];

    if (json['book_mark'] != null) {
      //["","","","",""]
      bookMark = <String>[];
      json['book_mark'].forEach((v) {
        bookMark!.add(v);
      });
    }

    if (json['my_course'] != null) {
      myCources = <MyCourseModel>[];
      json['my_course'].forEach((v) {
        myCources!.add(MyCourseModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["first_name"] = firstName;
    data["last_name"] = lasttName;
    data["email"] = email;
    data["password"] = password;
    data["confirm_password"] = cofirmPassword;
    data["image_profile_rul"] = imageProfileUrl;
    data["user_id"] = userId;

     if (bookMark != null) {
      data['book_mark'] = bookMark!.map((v) => v).toList();
    }

    if (myCources != null) {
      data['lessons'] = myCources!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
