import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/ui/pages/auth/login_page/login_page.dart';

class SplashTestPage extends StatefulWidget {
  const SplashTestPage({super.key});

  @override
  State<SplashTestPage> createState() => _SplashTestPageState();
}

class _SplashTestPageState extends State<SplashTestPage> {
  @override
  void initState() {
    super.initState();

    myInit();

    // dio.get("/init/download").then((value) => Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => LoginPage())));

    // Future.delayed(Duration(seconds: 5), () {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => LoginPage()));
    // });
  }

  void myInit() async {
    // 1. 외부 API 연결하기 (소켓 - 알림)
    await dio.get("/init/download");

    // if 로컬에 존재하는지 체크
    // 2. 20MB 무거운 데이터 (다운로드)

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/splash.gif',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
