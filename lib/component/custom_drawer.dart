import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/cubit/profile_cubit/cubit.dart';
import 'package:wasely/model/login_model.dart';
import 'package:wasely/screens/drawer_screen/about_us.dart';
import 'package:wasely/screens/drawer_screen/contact_us.dart';
import 'package:wasely/screens/drawer_screen/notification_screen.dart';
import 'package:wasely/screens/drawer_screen/order_screen.dart';
import 'package:wasely/screens/drawer_screen/privacy_polices.dart';
import 'package:wasely/screens/drawer_screen/profile_screen.dart';
import '../cubit/profile_cubit/state.dart';
import 'component.dart';
import 'constant_fonts.dart';

class CustomDrawer extends StatelessWidget {
  // LoginModel? loginModel;
 // const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var profileCubit=ProfileCubit.get(context);
    Size size=MediaQuery.of(context).size;
    return BlocConsumer<ProfileCubit,ProfileState>(
      listener: (context,state){},
      builder: (context,state) {
        return Column(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text(profileCubit.isInitialize?profileCubit.profileModel.account!.fname!:"",
                  style: TextStyle(fontSize: size.height>1000?9.sp: 8.sp),),
                accountEmail: Text( profileCubit.isInitialize?profileCubit.profileModel.account!.phone!:"",
                  style: TextStyle(fontSize: size.height>1000?9.sp: 8.sp),)),
            containerOfDrawer(
                context: context,
                fct: () {
                  navigateTo(context: context, child: ProfileScreen());
                  print('object');
                },
                text: 'حسابي',iconData:Icons.person),
            SizedBox(height:size.height>1000?0.2.h: 10.sp,),
            containerOfDrawer(
                context: context,
                fct: () {
                  navigateTo(context: context, child: NotificationScreen());
                  print('object');
                },
                text: 'الاشعارات',
                iconData: FontAwesomeIcons.bell
            ),
            SizedBox(height:size.height>1000?0.2.h: 10.sp,),
            containerOfDrawer(
                context: context,
                fct: () {
                  navigateTo(context: context, child: OrderScreen());
                },
                iconData: FontAwesomeIcons.paperPlane,
                text: 'طلباتي'),
            SizedBox(height:size.height>1000?0.2.h: 10.sp,),
            containerOfDrawer(
                context: context,
                iconData: FontAwesomeIcons.phoneFlip,
                fct: () {
                  navigateTo(context: context, child: ContactUs());
                  print('object');
                },
                text: 'اتصل بنا'),
            SizedBox(height:size.height>1000?0.2.h: 10.sp,),
            containerOfDrawer(
                context: context,
                iconData: Icons.info_outlined,
                fct: () {
                 navigateTo(context: context, child: AboutUs());
                },
                text: 'عن وصلي'),
            SizedBox(height:size.height>1000?0.2.h: 10.sp,),
            containerOfDrawer(
                context: context,
                iconData: FontAwesomeIcons.pollH,
                fct: () {
                  navigateTo(context: context, child: PrivacyPolicesScreen());
                },
                text: 'سياسه الخصوصيه'),
            SizedBox(height:size.height>1000?0.2.h: 10.sp,),
            containerOfDrawer(
              context: context,
                fct: () {
                  Share.share('https://pub.dev/packages/share_plus/example',);
                },
                iconData: FontAwesomeIcons.share,
                text: 'شارك وصلي'),
          ],
        );
      }
    );
  }
}
