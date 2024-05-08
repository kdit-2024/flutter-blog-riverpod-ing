import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dtos/response_dto.dart';
import 'package:flutter_blog/data/dtos/user_request.dart';
import 'package:flutter_blog/data/models/user.dart';
import 'package:logger/logger.dart';

class UserRepository {
  Future<ResponseDTO> fetchJoin(JoinReqDTO requestDTO) async {
    final response = await dio.post("/join", data: requestDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }

  Future<(ResponseDTO, String)> fetchLogin(LoginReqDTO loginReqDTO) async {
    final response = await dio.post("/login", data: loginReqDTO.toJson());
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.success) {
      responseDTO.response = User.fromJson(responseDTO.response);
      final accessToken = response.headers["Authorization"]!.first;

      return (responseDTO, accessToken);
    } else {
      throw new Exception("${responseDTO.errorMessage}");
    }
  }

  Future<ResponseDTO> fetchAutoLogin(String accessToken) async {
    Response response = await dio.post("/auto/login",
        options: Options(headers: {"Authorization": "$accessToken"}));
    Logger().d(response.data);

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.success) {
      responseDTO.response = User.fromJson(responseDTO.response);
      return responseDTO;
    }

    return responseDTO;
  }
}
