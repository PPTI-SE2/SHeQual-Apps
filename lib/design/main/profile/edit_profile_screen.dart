import 'package:flutter/material.dart';
import 'package:shequal/shared/theme.dart';
import 'package:shequal/shared/widget/custom_button.dart';
import 'package:shequal/shared/widget/custom_text_form_field.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController namaPenggunaController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget banner() {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.width / 1.5,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        decoration: BoxDecoration(
          color: kGreyColor,
          image: const DecorationImage(
            image: AssetImage("assets/profile/banner.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Transform.translate(
              offset: Offset(0, MediaQuery.of(context).size.width / 3.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 126,
                      height: 126,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage("assets/home/profile.png"),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                        color: kGreyColor,
                      ),
                      child: Center(
                        child: Icon(Icons.edit_square, color: kBlackColor.withOpacity(0.5), size: 54),
                      ),
                    ),
                  ),
                  Text(
                    "dinonara_",
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    "nono thing's",
                    style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: light,
                        color: kBlackColor.withOpacity(0.5)),
                  ),
                  Text(
                    "Bergabung sejak 20 Oct 2023",
                    style: redTextStyle.copyWith(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget inputSection() {
      Widget namaPenggunaInput() {
        return CustomTextFormField(
          title: 'Nama Pengguna',
          hintText: 'dinonara_',
          controller: namaPenggunaController,
        );
      }

      Widget emailInput() {
        return CustomTextFormField(
          title: 'Email',
          hintText: 'ashdiey@gmail.com',
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

      Widget button() {
        return CustomButton(
          color: kPrimaryColor,
          textColor: kWhiteColor,
          width: double.infinity,
          text: 'Simpan',
          margin: const EdgeInsets.only(top: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        );
      }

      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 55),
        child: Column(
          children: [
            namaPenggunaInput(),
            emailInput(),
            passwordInput(),
            button(),  
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              banner(),
              const SizedBox(
                height: 60,
              ),
              inputSection(),
            ],
          ),
        ),
      ),
    );
  }
}
