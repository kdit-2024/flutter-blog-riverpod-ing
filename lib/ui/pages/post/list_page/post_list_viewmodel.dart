import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dtos/paging_dto.dart';
import 'package:flutter_blog/data/dtos/response_dto.dart';
import 'package:flutter_blog/data/models/post.dart';
import 'package:flutter_blog/data/repositories/post_repository.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 창고 데이터
class PostListModel {
  PageDTO page;
  List<Post> posts;

  PostListModel({required this.page, required this.posts});
}

// 창고
class PostListViewModel extends StateNotifier<PostListModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  PostListViewModel(super.state, this.ref);

  Future<void> notifyInit(int page) async {
    SessionStore sessionStore = ref.read(sessionProvider);
    String jwt = sessionStore.accessToken!;

    ResponseDTO responseDTO = await PostRepository().fetchPostList(jwt);

    if (responseDTO.success) {
      state = responseDTO.response;
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("게시물 보기 실패 : ${responseDTO.errorMessage}")));
    }
  }
}

// 창고 관리자
final postListProvider =
    StateNotifierProvider<PostListViewModel, PostListModel?>((ref) {
  return PostListViewModel(null, ref)..notifyInit(0);
});
