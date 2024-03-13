import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shequal/providers/auth_providers.dart';
import 'package:shequal/routes/app_routes.dart';
import 'package:shequal/shared/widget/custom_button.dart';
import 'package:shequal/shared/widget/custom_text_form_field.dart';
import '../../shared/theme.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController(text: '');

  final TextEditingController passwordController =
      TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProviders authProviders = Provider.of<AuthProviders>(context);
    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      if (await authProviders.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.main, (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 1),
            backgroundColor: kRedColor,
            content: Text(
              'Gagal Login',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(
          'Masuk dan berbagi\nilmu dengan yang lain',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget emailInput() {
        return CustomTextFormField(
          title: 'Email',
          hintText: 'Alamat email anda',
          controller: emailController,
        );
      }

      Widget passwordInput() {
        return CustomTextFormField(
          title: 'Password',
          hintText: 'Password anda',
          obscureText: true,
          controller: passwordController,
        );
      }

      Widget button() {
        return CustomButton(
          color: kPrimaryColor,
          textColor: kWhiteColor,
          width: double.infinity,
          text: 'Masuk',
          margin: const EdgeInsets.only(top: 30),
          onPressed: handleSignIn,
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
            emailInput(),
            passwordInput(),
            (isLoading) ? const CircularProgressIndicator() : button(),
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
            Navigator.pushNamed(context, AppRoutes.signUp);
          },
          child: Text(
            'Belum punya akun? Daftar disini',
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
