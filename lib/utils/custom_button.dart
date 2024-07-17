import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdaptiveButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double? width;
  final double? height;

  const AdaptiveButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 150.w, // Default width if not specified
      height: height ?? 40.h, // Default height if not specified
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 20.sp),
        label: Text(
          text,
          style: TextStyle(fontSize: 16.sp, color: textColor),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    );
  }
}
