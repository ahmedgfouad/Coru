// ignore_for_file: public_member_api_docs, sort_constructors_first
class Lessons {
  String? title;
  String? description;
  String? link;
  Lessons({
    this.title,
    this.description,
    this.link,
  });
 
  Lessons.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? 'empty';
    description = json['description'] ?? 'empty';
    link = json['link'] ?? 'empty';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title ?? 'empty';
    data['description'] = description ?? 'empty';
    data['link'] = link ?? 'empty';
    return data;
  }
   
}
