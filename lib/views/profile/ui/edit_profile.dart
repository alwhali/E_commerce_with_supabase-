import 'package:e_commerce_app/core/app_colors.dart';
import 'package:e_commerce_app/views/auth/ui/widgets/custom_ebtn.dart';
import 'package:e_commerce_app/views/auth/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key, required this.title});
  String title;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
