import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dtos/paging_dto.dart';
import 'package:flutter_blog/data/dtos/response_dto.dart';
import 'package:flutter_blog/data/models/post.dart';
import 'package:flutter_blog/ui/pages/post/list_page/post_list_viewmodel.dart';

class PostRepository {
  Future<ResponseDTO> fetchPost(String accessToken, int postId) async {
    // 통신
    Response response = await dio.get("/api/post/$postId",
        options: Options(headers: {"Authorization": "$accessToken"}));

    // 응답 받은 데이터 파싱
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.success) {
      responseDTO.response = Post.fromJson(responseDTO.response);
    }

    return responseDTO;
  }

  Future<ResponseDTO> fetchPostList(String accessToken, {int page = 0}) async {
    final response = await dio.get(
      "/api/post",
      queryParameters: {"page": page},
      options: Options(headers: {"Authorization": "${accessToken}"}),
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.success) {
      List<dynamic> temp = responseDTO.response["posts"];
      List<Post> posts = temp.map((e) => Post.fromJson(e)).toList();
      PageDTO pageDTO = PageDTO.fromJson(responseDTO.response);

      PostListModel postListModel = PostListModel(page: pageDTO, posts: posts);
      responseDTO.response = postListModel;
    }

    return responseDTO;
  }
}
