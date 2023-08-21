import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_work/app/core/utils/dimensions.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Dimensions.padding),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height(40),
            ),
            CircleAvatar(
              backgroundImage: const AssetImage('assets/placeholder.jpg'),
              radius: Dimensions.width(70),
            ),
            SizedBox(
              height: Dimensions.height(8),
            ),
            const ListTile(
              title: Text('User Name'),
            ),
            const ListTile(
              title: Text('Email'),
            ),
            const ListTile(
              title: Text('Address'),
            ),
            const Divider(),
            SizedBox(
              height: Dimensions.height(100),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Log out',
                style: Get.textTheme.labelMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
