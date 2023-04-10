import 'package:flutter/material.dart';
import 'package:tiktok_clone/shared/constants.dart';
import 'package:tiktok_clone/theme/custom_fonts.dart';
import 'package:tiktok_clone/theme/custom_theme.dart';
import 'package:tiktok_clone/theme/styles.dart';
import 'package:tiktok_clone/views/widgets/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "TikTok Clone",
              style: CustomFonts.kHeadlineSmall.copyWith(color: Pallete.mainColor),
            ),
            const SizedBox(height: 10),
            Text(
              "Welcome Back!",
              style: CustomFonts.kDisplaySmall,
            ),
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                keyboardType: TextInputType.emailAddress,
                labelText: 'Email',
                controller: _emailController,
                icon: Icons.email,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                labelText: 'Password',
                controller: _passwordController,
                icon: Icons.lock,
                isObscured: true,
              ),
            ),
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Styles.buttonRadius),
                color: Pallete.mainColor,
                boxShadow: [BoxShadow(color: Pallete.borderColor, offset: Offset(0, 2), blurRadius: 10)],
              ),
              child: InkWell(
                onTap: () {
                  authController.loginUser(_emailController.text, _passwordController.text);
                },
                child: Text(
                  'Login',
                  style: CustomFonts.kTitleLarge.copyWith(
                    color: Pallete.backgroundColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const RegisterInstead()
          ],
        ),
      ),
    );
  }
}

class RegisterInstead extends StatelessWidget {
  const RegisterInstead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: CustomFonts.kBodyLarge,
        ),
        InkWell(
          onTap: () {
            print('Send user to register page');
          },
          child: Text(
            "Register here",
            style: CustomFonts.kBodyLarge.copyWith(color: Pallete.mainColor),
          ),
        )
      ],
    );
  }
}
