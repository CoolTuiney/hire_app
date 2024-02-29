import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import 'common_widget.dart';

extension ExtendedWidget on Widget {
  // padding({required EdgeInsetsGeometry padding}) {
  //   return Padding(
  //     padding: padding,
  //     child: this,
  //   );
  // }

  visible(bool isVisible) {
    return (isVisible) ? this : const SizedBox.shrink();
  }

  rotate(int degree) {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(degree / 360),
      child: this,
    );
  }

  ClipRRect clipR(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius.r),
      child: this,
    );
  }

  Shimmer shimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade50,
      child: this,
    );
  }

  // Widget paddingAll(double padding) =>
  //     Padding(padding: EdgeInsets.all(padding), child: this);

  // Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
  //     Padding(
  //         padding:
  //             EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
  //         child: this);

  // Widget paddingOnly({
  //   double left = 0.0,
  //   double top = 0.0,
  //   double right = 0.0,
  //   double bottom = 0.0,
  // }) =>
  //     Padding(
  //         padding: EdgeInsets.only(
  //             top: top, left: left, right: right, bottom: bottom),
  //         child: this);

  // Widget get paddingZero => Padding(padding: EdgeInsets.zero, child: this);
}

extension ExtendedDivider on Divider {
  dashLine({double height = 0}) {
    return CustomPaint(
      painter: DashedLinePainter(),
      child: Container(),
    ).paddingSymmetric(vertical: height);
  }
}

extension ExtendedString on String? {
  //return default value is the string is null
  nullDef({String def = '--'}) {
    return this ?? def;
  }
}
