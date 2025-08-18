import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mega_hub/core/theming/app_text_styles.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/widget/list_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery, // أو ImageSource.camera
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           SizedBox(height: 64),
        GestureDetector(
          onTap: _pickImage,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: _imageFile != null
                ? FileImage(_imageFile!)
                : AssetImage("assets/user.jpg") as ImageProvider,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.edit, size: 20, color: Colors.black),
            ),
          ),
        ),
          const SizedBox(height: 27),
          Text("User Name", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          CustomListTile(onTap: (){},
            title: "Account and Profile",
            titleTextStyle: AppTextStyles.listtiletitlestyle,
            leading: Icon(Icons.person_outline,color: AppColors.appMainColor),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          CustomListTile(onTap: (){},
            title: "Manage payment Method",
            titleTextStyle: AppTextStyles.listtiletitlestyle,
            leading: Icon(Icons.payment_outlined, color: AppColors.appMainColor,),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          CustomListTile(onTap: (){},
            title: "Contact Support",
            titleTextStyle: AppTextStyles.listtiletitlestyle,
            leading: Icon(Icons.contact_support_outlined, color: AppColors.appMainColor,),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          CustomListTile(onTap: (){},
            title: "Write a Review",
            titleTextStyle: AppTextStyles.listtiletitlestyle,
            leading: Icon(Icons.reviews_outlined, color: AppColors.appMainColor,),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          CustomListTile(onTap: (){},
            title: "Privacy Policy",
            titleTextStyle: AppTextStyles.listtiletitlestyle,

            leading: Icon(Icons.mark_unread_chat_alt, color: AppColors.appMainColor,),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          CustomListTile(onTap: (){},
            title: "Invite Friends",
            titleTextStyle: AppTextStyles.listtiletitlestyle,
            leading: Icon(Icons.person_add, color: AppColors.appMainColor,),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          CustomListTile(onTap: (){},
            title: "Logout",
            titleTextStyle: AppTextStyles.listtiletitlestyle,
            leading: Icon(Icons.logout, color: AppColors.appMainColor,),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
        ],
      ),
    );
  }
}
