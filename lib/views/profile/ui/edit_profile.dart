import 'package:e_commerce_app/core/app_colors.dart';
import 'package:e_commerce_app/core/component/custom_app_bar.dart';
import 'package:e_commerce_app/core/functions/navigate/class_my_navigate.dart';
import 'package:e_commerce_app/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:e_commerce_app/views/auth/ui/login_view.dart';
import 'package:e_commerce_app/views/auth/ui/widgets/custom_ebtn.dart';
import 'package:e_commerce_app/views/auth/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cubit = context.read<AuthCubit>();
    if (!cubit.isAuthenticated) {
      return MyNavigate.navigatePushReplacement(context, LoginScreen())
          as Widget;
    }
    return Scaffold(
      appBar: CustomAppBar(title: "Edit Profile"),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 12, vertical: 24),
        child: Column(
          children: [
            CustomTextField(
              keyboardType: TextInputType.name,
              lableText: "Enter Name",
            ),
            SizedBox(height: 20),
            Center(
              child: CustomEBtn(
                text: Text(
                  "Update",
                  style: TextStyle(color: AppColors.kWhiteColor, fontSize: 18),
                ),
                onTap: () {},
                width: size.width - 24,
                height: 54,
                borderRadius: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
