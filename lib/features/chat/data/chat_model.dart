class ChatModel {
  String? userId;
  String? friendId;

  ChatModel({
    this.userId,
    this.friendId,
  });

    ChatModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    friendId = json['friend_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = userId;
    data['friend_id'] = friendId;

    return data;
  }

}
