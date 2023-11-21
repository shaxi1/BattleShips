import 'package:battleships/structs/friend.dart';

class User {
  final String id;
  final String nickname;
  final String points;
  final String isAvailable;
  final List<Friend> friends;

  User({required this.id, 
  required this.nickname, 
  required this.points, 
  required this.isAvailable, 
  required this.friends});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nickname': nickname,
      'points': points,
      'isAvailable': isAvailable,
      'friends': friends,
    };
  }
}