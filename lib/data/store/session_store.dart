// 창고 데이터
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/data/dtos/response_dto.dart';
import 'package:flutter_blog/data/dtos/user_request.dart';
import 'package:flutter_blog/data/models/user.dart';
import 'package:flutter_blog/data/repositories/user_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionUser {
  User? user;
  String? accessToken;
  bool isLogin = false;
  int? selectedPostId;

  SessionUser();
}

// 창고
class SessionStore extends SessionUser {
  final mContext = navigatorKey.currentContext;

  SessionStore();

  Future<void> logout() async {
    super.user = null;
    super.accessToken = null;
    super.isLogin = false;

    await secureStorage.delete(key: "accessToken");
    Navigator.popAndPushNamed(mContext!, Move.loginPage);
  }

  void loginCheck(String path) {
    if (isLogin) {
      Navigator.pushNamed(mContext!, path);
    } else {
      Navigator.pushNamed(mContext!, Move.loginPage);
    }
  }

  Future<void> join(JoinReqDTO joinReqDTO) async {
    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);

    // 비지니스 로직
    if (responseDTO.success) {
      Navigator.pushNamed(mContext!, Move.loginPage);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("로그인 실패 : ${responseDTO.errorMessage}")),
      );
    }
  }

  Future<void> login(LoginReqDTO loginReqDTO) async {
    var (responseDTO, accessToken) =
        await UserRepository().fetchLogin(loginReqDTO);

    if (responseDTO.success) {
      await secureStorage.write(key: "accessToken", value: accessToken);

      this.user = responseDTO.response;
      this.accessToken = accessToken;
      this.isLogin = true;

      Navigator.pushNamedAndRemoveUntil(
          mContext!, Move.postListPage, (route) => false);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("로그인 실패 : ${responseDTO.errorMessage}")));
    }
  }

  Future<void> autoLogin() async {
    // secureStorage는 앱삭제시에 사라짐
    String? accessToken = await secureStorage.read(key: "accessToken");

    if (accessToken == null) {
      Navigator.of(mContext!).pushNamed(Move.loginPage);
    } else {
      ResponseDTO responseDTO =
          await UserRepository().fetchAutoLogin(accessToken);

      if (responseDTO.success) {
        super.user = responseDTO.response;
        super.accessToken = accessToken;
        super.isLogin = true;
        Navigator.popAndPushNamed(mContext!, Move.postListPage);
      } else {
        ScaffoldMessenger.of(mContext!).showSnackBar(
            SnackBar(content: Text("자동 로그인 실패 : ${responseDTO.errorMessage}")));
        Navigator.popAndPushNamed(mContext!, Move.loginPage);
      }
    }
  }
}

// 창고 관리자
final sessionProvider = StateProvider<SessionStore>((ref) {
  return SessionStore();
});
