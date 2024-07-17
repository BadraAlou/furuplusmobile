import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdaptiveButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  const AdaptiveButton({
    Key? key,
    required this.text,
    this.icon,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          minimumSize: Size(double.infinity, 50.h), // Hauteur adaptative
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h), // Marges adaptatives
        ),
        icon: icon != null ? Icon(icon, size: 24.sp) : SizedBox.shrink(), // Taille de l'icône adaptative
        label: Text(
          text,
          style: TextStyle(
            fontSize: 18.sp, // Taille de texte adaptative
            color: textColor,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
