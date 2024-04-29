import 'package:flutter_blog/data/repositories/post_repository.dart';

void main() async {
  await PostRepository().fetchPostList(
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpbWdVcmwiOiIvaW1hZ2VzLzEuanBnIiwic3ViIjoibWV0YWNvZGluZyIsImlkIjoxLCJleHAiOjE3MTQ1MjQwNzYsInVzZXJuYW1lIjoic3NhciJ9.eL5cwvjePnoDHAPa4kAgkyFjGret3K8ndW-lHjGo741SjtwkNj7IIjrUJrpifFb1B2kcMNJ74rA-VoV4CEjBSQ");
}
