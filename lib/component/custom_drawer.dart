import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/const_color.dart';
import 'package:wasely/screens/drawer_screen/about_us.dart';
import 'package:wasely/screens/drawer_screen/contact_us.dart';
import 'package:wasely/screens/drawer_screen/notification_screen.dart';
import 'package:wasely/screens/drawer_screen/order_screen.dart';
import 'package:wasely/screens/drawer_screen/privacy_polices.dart';
import 'package:wasely/screens/drawer_screen/profile_screen.dart';

import 'component.dart';
import 'constant_fonts.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('مرحبا جلال',style: whiteBodyStyle,),
              accountEmail: Text('+966506977241')),
          containerOfDrawer(
              fct: () {
                navigateTo(context: context, child: ProfileScreen());
               // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                print('object');
              },
              text: 'حسابي',iconData: FontAwesomeIcons.person),
          SizedBox(height: 10.sp,),
          containerOfDrawer(
              fct: () {
                navigateTo(context: context, child: NotificationScreen());
                print('object');
              },
              text: 'الاشعارات',
              iconData: FontAwesomeIcons.bell
          ),
          SizedBox(height: 10.sp,),
          containerOfDrawer(
              fct: () {
                navigateTo(context: context, child: OrderScreen());
              },
              iconData: FontAwesomeIcons.paperPlane,
              text: 'طلباتي'),
          SizedBox(height: 10.sp,),
          containerOfDrawer(
              iconData: FontAwesomeIcons.phoneFlip,
              fct: () {
                navigateTo(context: context, child: ContactUs());
                print('object');
              },
              text: 'اتصل بنا'),
          SizedBox(height: 10.sp,),
          containerOfDrawer(
              iconData: FontAwesomeIcons.info,
              fct: () {
               navigateTo(context: context, child: AboutUs());
              },
              text: 'عن وصلي'),
          SizedBox(height: 10.sp,),
          containerOfDrawer(
              iconData: FontAwesomeIcons.pollH,
              fct: () {
                navigateTo(context: context, child: PrivacyPolicesScreen());
              },
              text: 'سياسه الخصوصيه'),
          SizedBox(height: 10.sp,),
          containerOfDrawer(
              fct: () {
                Share.share('https://pub.dev/packages/share_plus/example',);
              },
              iconData: FontAwesomeIcons.share,
              text: 'شارك وصلي'),
        ],
      ),
    );
  }
}
