import 'package:flutter_blog/data/repositories/post_repository.dart';

void main() async {
  await fetchPost_test();
}

Future<void> fetchPost_test() async {
  await PostRepository().fetchPost(50,
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpbWdVcmwiOiIvaW1hZ2VzLzEuanBnIiwic3ViIjoibWV0YWNvZGluZyIsImlkIjoxLCJleHAiOjE3MTQ2OTU4MjYsInVzZXJuYW1lIjoic3NhciJ9.HW89ytooDsjNCs1aofKvIrZOYCnJmhW0PkQUAXai0SwcztF3DB62d8DreLBf2RV9z807t-6PoqGA9EaMHYi1Ww");
}

Future<void> fetchPostList_test() async {
  await PostRepository().fetchPostList(
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpbWdVcmwiOiIvaW1hZ2VzLzEuanBnIiwic3ViIjoibWV0YWNvZGluZyIsImlkIjoxLCJleHAiOjE3MTQ2OTU4MjYsInVzZXJuYW1lIjoic3NhciJ9.HW89ytooDsjNCs1aofKvIrZOYCnJmhW0PkQUAXai0SwcztF3DB62d8DreLBf2RV9z807t-6PoqGA9EaMHYi1Ww");
}
