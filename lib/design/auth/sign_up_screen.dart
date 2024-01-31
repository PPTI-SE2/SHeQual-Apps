import 'package:flutter/material.dart';
import 'package:shequal/routes/app_routes.dart';
import 'package:shequal/shared/widget/custom_button.dart';
import 'package:shequal/shared/widget/custom_text_form_field.dart';
import '../../shared/theme.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController namaPenggunaController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(
          'Bergabung dengan kita\ndan perluas pengetahuan',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget nameInput() {
        return CustomTextFormField(
          title: 'Nama lengkap',
          hintText: 'Nama lengkap anda',
          controller: nameController,
        );
      }

      Widget emailInput() {
        return CustomTextFormField(
          title: 'Email',
          hintText: 'Alamat email anda',
          controller: emailController,
        );
      }

      Widget passwordInput() {
        return CustomTextFormField(
          title: 'Kata sandi',
          hintText: 'Kata sandi anda',
          obsecureText: true,
          controller: passwordController,
        );
      }

      Widget namaPenggunaInput() {
        return CustomTextFormField(
          title: 'Nama Pengguna',
          hintText: 'Nama Pengguna anda',
          controller: namaPenggunaController,
        );
      }

      Widget button() {
        return CustomButton(
          color: kPrimaryColor,
          textColor: kWhiteColor,
          width: double.infinity,
          text: 'Daftar',
          margin: const EdgeInsets.only(top: 30),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, AppRoutes.main, (route) => false);
          },
        );
      }

      return Container(
        margin: const EdgeInsets.only(
          top: 30,
          bottom: 50,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          children: [
            nameInput(),
            emailInput(),
            passwordInput(),
            namaPenggunaInput(),
            button(),
          ],
        ),
      );
    }

    Widget signInButton() {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 73),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.signIn);
          },
          child: Text(
            'Sudah punya akun? Masuk',
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title(),
                inputSection(),
                signInButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
