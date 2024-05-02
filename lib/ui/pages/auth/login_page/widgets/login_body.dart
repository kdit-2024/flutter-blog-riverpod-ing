import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dtos/user_request.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/ui/pages/auth/login_page/widgets/login_form.dart';
import 'package:flutter_blog/ui/pages/auth/login_page/widgets/login_form_store.dart';
import 'package:flutter_blog/ui/widgets/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/custom_logo.dart';
import 'package:flutter_blog/ui/widgets/custom_text_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginBody extends ConsumerWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const SizedBox(height: xlargeGap),
          const CustomLogo("Blog"),
          const SizedBox(height: largeGap),
          LoginForm(),
          CustomElevatedButton(
            text: "로그인",
            funPageRoute: () {
              LoginFormStore store = ref.read(loginFormProvider);

              if (store.formKey!.currentState!.validate()) {
                LoginReqDTO loginReqDTO = LoginReqDTO(
                    username: store.username!, password: store.password!);

                ref.read(sessionProvider).login(loginReqDTO);
              }
            },
          ),
          CustomTextButton(
            "회원가입 페이지로 이동",
            () {
              Navigator.pushReplacementNamed(context, Move.joinPage);
            },
          ),
        ],
      ),
    );
  }
}
