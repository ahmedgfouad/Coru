class MyCourseModel {
  String? courseId;
  String? progress;

  MyCourseModel(this.courseId, this.progress);

  MyCourseModel.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'];
    progress = json['progress'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['course_id'] = courseId;
    data['progress'] = progress;
    return data;
  }
}
