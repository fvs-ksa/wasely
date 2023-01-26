import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('عن وصلي'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 18.sp),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo_Wasly.png',
                height: 150.sp,

              ),
              SizedBox(
                height: 15.sp,
              ),
              Padding(
                padding: EdgeInsets.all(18.0.sp),
                child: Text(
                  'تطبـيق سعودي ينسيك الجوع ! \nخلّك مجهز طلبك من المطعم الي تبيه وخلينا نوصله لك بأقل وقت تتوقعه\n\n ملاحظه :\nنوصل لجميع مناطق المملكة العربية السعودية 💪🏻',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
