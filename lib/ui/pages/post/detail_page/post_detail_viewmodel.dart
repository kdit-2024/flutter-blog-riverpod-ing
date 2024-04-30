import 'package:flutter_blog/data/dtos/response_dto.dart';
import 'package:flutter_blog/data/models/post.dart';
import 'package:flutter_blog/data/repositories/post_repository.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailModel {
  Post post;

  PostDetailModel(this.post);
}

class PostDetailViewModel extends StateNotifier<PostDetailModel?> {
  Ref ref;
  PostDetailViewModel(super.state, this.ref);

  Future<void> notifyInit(int postId) async {
    // 통신하기
    SessionStore sessionStore = ref.read(sessionProvider);
    ResponseDTO responseDTO =
        await PostRepository().fetchPost(sessionStore.accessToken!, postId);

    // 상태값 갱신 (새로 new해서 넣어줘야 한다)
    state = PostDetailModel(responseDTO.response);
  }
}

// 화면이 stack 에서 제거될때, 창고도 함께 제거되게 하기 (autoDispose)
final postDetailProvider = StateNotifierProvider.autoDispose
    .family<PostDetailViewModel, PostDetailModel?, int>((ref, postId) {
  return PostDetailViewModel(null, ref)..notifyInit(postId);
});
