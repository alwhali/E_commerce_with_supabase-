import 'package:e_commerce_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Card(
          color: AppColors.kWhiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColors.kPrimaryColor,
                  child: Icon(Icons.person, color: Colors.white, size: 56),
                ),
                const SizedBox(height: 16),
                //user name
                Text(
                  'Ahmed Ali',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kBlackColor,
                  ),
                ),
                SizedBox(height: 16),
                //user email
                Text(
                  'alwhali11@gmail.com',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.kGrayColor,
                  ),
                ),
                SizedBox(height: 32),
                // edit profile
                OptionsCardInProfile(icon: Icons.person, title: "Edit Profile"),
                SizedBox(height: 20),
                // orders
                OptionsCardInProfile(
                  icon: Icons.shopping_cart,
                  title: "Orders",
                ),
                SizedBox(height: 20),
                //
                OptionsCardInProfile(icon: Icons.logout, title: "Logout"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OptionsCardInProfile extends StatelessWidget {
  OptionsCardInProfile({super.key, required this.icon, required this.title});
  IconData icon;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.kPrimaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: Colors.white, size: 24),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.white, size: 24),
        ],
      ),
    );
  }
}
