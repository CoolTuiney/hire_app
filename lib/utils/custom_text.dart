import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_theme.dart';

class CustomText {
  CustomText._();

  static Widget subTitle(
      {required String text,
      double size = 11,
      Color? color,
      bool? isBold,
      int? maxLine,
      TextAlign? textAlign,
      EdgeInsetsGeometry? padding}) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Text(text,
          overflow: TextOverflow.ellipsis,
          textAlign: textAlign,
          maxLines: maxLine,
          style: textStyle(size: size, bold: isBold, color: color)),
    );
  }

  static Widget title(
      {required String text,
      double size = 13,
      Color? color,
      bool? isBold,
      int? maxLine,
      TextOverflow? overflow,
      TextAlign? textAlign,
      TextDecoration? decoration,
      EdgeInsetsGeometry? padding}) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Text(text,
          overflow: overflow ?? TextOverflow.ellipsis,
          textAlign: textAlign,
          maxLines: maxLine,
          style: textStyle(
              size: size, bold: isBold, color: color, decoration: decoration)),
    );
  }

  static TextStyle textStyle(
          {required double size,
          bool? bold = false,
          Color? color,
          TextDecoration? decoration}) =>
      TextStyle(
          fontSize: size.sp,
          decoration: decoration,
          decorationColor: color ?? AppTheme.primaryTextColor,
          fontWeight: (bold != null && bold) ? FontWeight.w500 : null,
          color: color ?? AppTheme.primaryTextColor);
}
