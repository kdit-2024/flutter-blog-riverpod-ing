import 'package:flutter_blog/data/dtos/post_request.dart';
import 'package:flutter_blog/data/repositories/post_repository.dart';

void main() async {
  await updatePost_test();
}

Future<void> updatePost_test() async {
  PostUpdateReqDTO reqDTO =
      PostUpdateReqDTO(title: "title 24", content: "content 24");

  int postId = 1;

  await PostRepository().updatePost(postId, reqDTO,
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpbWdVcmwiOiIvaW1hZ2VzLzEucG5nIiwic3ViIjoibWV0YWNvZGluZyIsImlkIjoxLCJleHAiOjE3MTQ4Njg4MTgsInVzZXJuYW1lIjoic3NhciJ9.hPr8lNAzkKnotePJ7vxx26984j2E5Vg_ey5BzRw3oxV8YBBKRkGJD-gLE5DtQp-2FPcmLuZ9tBhU5KdBkqbdPg");
}

Future<void> savePost_test() async {
  PostSaveReqDTO reqDTO =
      PostSaveReqDTO(title: "title 24", content: "content 24");

  await PostRepository().savePost(reqDTO,
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpbWdVcmwiOiIvaW1hZ2VzLzEuanBnIiwic3ViIjoibWV0YWNvZGluZyIsImlkIjoxLCJleHAiOjE3MTQ2OTU4MjYsInVzZXJuYW1lIjoic3NhciJ9.HW89ytooDsjNCs1aofKvIrZOYCnJmhW0PkQUAXai0SwcztF3DB62d8DreLBf2RV9z807t-6PoqGA9EaMHYi1Ww");
}

Future<void> fetchPost_test() async {
  await PostRepository().fetchPost(50,
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpbWdVcmwiOiIvaW1hZ2VzLzEuanBnIiwic3ViIjoibWV0YWNvZGluZyIsImlkIjoxLCJleHAiOjE3MTQ2OTU4MjYsInVzZXJuYW1lIjoic3NhciJ9.HW89ytooDsjNCs1aofKvIrZOYCnJmhW0PkQUAXai0SwcztF3DB62d8DreLBf2RV9z807t-6PoqGA9EaMHYi1Ww");
}

Future<void> fetchPostList_test() async {
  await PostRepository().fetchPostList(
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpbWdVcmwiOiIvaW1hZ2VzLzEuanBnIiwic3ViIjoibWV0YWNvZGluZyIsImlkIjoxLCJleHAiOjE3MTQ2OTU4MjYsInVzZXJuYW1lIjoic3NhciJ9.HW89ytooDsjNCs1aofKvIrZOYCnJmhW0PkQUAXai0SwcztF3DB62d8DreLBf2RV9z807t-6PoqGA9EaMHYi1Ww");
}
