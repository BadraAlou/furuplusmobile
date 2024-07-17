import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furuplus/utils/custom_button.dart';
import 'package:get/get.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690), minTextAdapt: true, splitScreenMode: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('INFOS', style: TextStyle(fontSize: 18.sp)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: 20.h),
              // Icon(Icons.info, size: 64.sp),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "Pour plus d'informations contactez le 98 93 36 25",
                  style: TextStyle(fontSize: 18.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20.h),
              AdaptiveButton(
                text: 'Retour',
                icon: Icons.arrow_back_ios,
                onPressed: () {
                  Get.back();
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
