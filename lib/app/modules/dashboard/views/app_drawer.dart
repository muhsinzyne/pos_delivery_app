import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:posdelivery/app/ui/components/buttons/create_drawer_body_item_btn.dart';
import 'package:posdelivery/app/ui/components/static/app_version_row.dart';
import 'package:posdelivery/app/ui/theme/app_colors.dart';
import 'package:posdelivery/app/ui/theme/styles.dart';
import 'package:posdelivery/controllers/app_controller.dart';
import 'package:posdelivery/services/app_service.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  AppService appService = Get.find<AppService>();
  AppController appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(
                      'Muhsin Zyne',
                      style: kBaseTextStyle.copyWith(fontFamily: arabic),
                    ),
                    accountEmail: Text(
                      'muhsin.3009@gmail.com',
                      style: kBaseTextStyle.copyWith(fontFamily: english, fontSize: 14),
                    ),
                    currentAccountPicture: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.black,
                      //backgroundImage: MemoryImage(appService.employeeInfo.userInfo?.profileImage ?? dummyBytes),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                    ),
                  ),
                  DrawerBodyItemButton(
                    icon: Icon(FontAwesomeIcons.user),
                    text: 'my_account'.tr,
                    onTap: appController.actionMyAccount,
                  ),
                  DrawerBodyItemButton(icon: Icon(FontAwesomeIcons.user), text: 'app_my_services', onTap: () {}),
                  DrawerBodyItemButton(
                    icon: Icon(Icons.language),
                    text: 'change_language'.tr,
                    onTap: appController.actionChangeLanguage,
                  ),
                  DrawerBodyItemButton(
                    icon: Icon(Icons.logout),
                    text: 'app_logout'.tr,
                    onTap: appController.appBarLogout,
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    AppVersionRow(appController: appController),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
