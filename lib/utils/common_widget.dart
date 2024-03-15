import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hire_app/utils/extensions.dart';

import 'app_theme.dart';
import 'custom_text.dart';

class CommonWidget {
  static AppBar appBar(
      {required String title, bool isCenter = false, List<Widget>? trailing}) {
    return AppBar(
        elevation: 0.8,
        title: CustomText.title(
            text: title, color: AppTheme.lightPrimaryColor, size: 16),
        backgroundColor: Colors.white,
        centerTitle: isCenter,
        actions: trailing);
  }

  static goTo(BuildContext context, Widget screen) {
    Navigator.push(context, _createRoute(screen));
  }

  static replaceTo(BuildContext context, Widget screen) {
    Navigator.pushReplacement(context, _createRoute(screen));
  }

  static Route _createRoute(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static showToast(String text, {int maxLine = 2, int seconds = 2}) {
    // Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static BoxDecoration containerDecoration(
      {String? imgUrl, Color? color, double radius = 10}) {
    return BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(radius.r),
        image: (imgUrl != null)
            ? DecorationImage(fit: BoxFit.cover, image: NetworkImage(imgUrl))
            : null,
        boxShadow: [
          BoxShadow(
              color: AppTheme.lightPrimaryColor.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2))
        ]);
  }

  static ElevatedButton roundedButton(
      {required BuildContext context,
      required String title,
      EdgeInsets? padding,
      double borderRadius = 10,
      Color? backgroundColor = AppTheme.lightPrimaryColor,
      double textsize = 16,
      required VoidCallback onTap}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            // minimumSize: Size(120.w, 40.h),
            padding: padding ??
                EdgeInsets.symmetric(vertical: 12.h, horizontal: 42.w),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius.r))),
        onPressed: onTap,
        child:
            CustomText.title(text: title, color: Colors.white, size: textsize));
  }

  static Container reportRefundBanner({bool isMargin = true}) {
    return Container(
      width: double.infinity,
      margin: isMargin
          ? EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w)
          : EdgeInsets.zero,
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
      decoration: BoxDecoration(
          color: AppTheme.darkSecondaryColor,
          borderRadius: BorderRadius.circular(isMargin ? 4.r : 0)),
      child: CustomText.title(
          text: 'Get Reports in 24 hours or 100% Refund.',
          textAlign: TextAlign.center,
          color: Colors.white),
    );
  }

  static BoxDecoration containerBorder(
      {Color? borderColor,
      Color? bgColor,
      double width = 1.0,
      double radius = 10}) {
    return BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(radius.r),
        border: Border.all(
            width: width,
            color: borderColor ?? AppTheme.lightPrimaryColor.withOpacity(0.1)));
  }

  static CachedNetworkImage networkImage(
      {required String? imgUrl, BoxFit? fit, bool showErrorImg = true}) {
    return CachedNetworkImage(
      imageUrl: imgUrl ?? '',
      fit: fit,
      placeholder: (context, url) => Container(
        color: Colors.grey.shade100,
      ),
      errorWidget: (context, url, error) => SizedBox(
        child: Image.asset(
          "asset/images/no-pictures.png",
          color: Colors.grey,
        ).paddingSymmetric(horizontal: 30, vertical: 30),
      ).visible(showErrorImg),
    );
  }

  static Widget showLoader() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  static Row titleViewAll(String title, VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: AppTheme.lightPrimaryColor),
        ),
        // TextButton(
        //     onPressed: onTap,
        //     child: Text('View All', style: TextStyle(fontSize: 14.sp)))
      ],
    );
  }

  static Future<T> apiCallWithLoading<T>(Future<T> fun) {
    return Get.showOverlay(
      asyncFunction: () {
        return fun;
      },
      opacityColor: Colors.grey,
      loadingWidget: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            height: 70.h,
            width: 200.h,
            alignment: Alignment.center,
            decoration: CommonWidget.containerDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25.h,
                  width: 25.h,
                  child: const CircularProgressIndicator(),
                ).paddingOnly(right: 15.h),
                CustomText.title(text: 'Please wait..', size: 16)
              ],
            ),
          ),
        ),
      ),
    );
  }

  // static Future<T> apiCallWithLoading<T>(Future<T> fun) {
  //   return Get.showOverlay(
  //     asyncFunction: () {
  //       return fun;
  //     },
  //     opacityColor: Colors.grey,
  //     loadingWidget: Scaffold(
  //       backgroundColor: Colors.transparent,
  //       body: Center(
  //         child: Container(
  //           height: 70.h,
  //           width: 200.h,
  //           alignment: Alignment.center,
  //           decoration: CommonWidget.containerDecoration(color: Colors.white),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               SizedBox(
  //                 height: 25.h,
  //                 width: 25.h,
  //                 child: const CircularProgressIndicator(),
  //               ).paddingOnly(right: 15.h),
  //               CustomText.title(text: 'Please wait..', size: 16)
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 3, dashSpace = 4, startX = 0;
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// ignore: must_be_immutable
class CustomMultiTF extends StatefulWidget {
  CustomMultiTF(
      {super.key,
      this.hint = "",
      this.lable,
      this.helperTxt,
      this.keyboardType,
      this.validator,
      this.formatter,
      this.onTap,
      this.isReadyOnly = false,
      this.maxLine,
      this.controller});
  final String? lable;
  final String? hint;
  final String? helperTxt;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool isReadyOnly;
  final Function(String)? validator;
  final List<TextInputFormatter>? formatter;
  final int? maxLine;
  void Function()? onTap;
  @override
  State<CustomMultiTF> createState() => _CustomMultiTFState();
}

class _CustomMultiTFState extends State<CustomMultiTF> {
  late bool isObsure;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.formatter,
      readOnly: widget.isReadyOnly,
      maxLines: widget.maxLine,
      onTap: widget.onTap,
      validator: (value) {
        if (widget.validator != null) {
          return widget.validator!(value ?? "");
        }
        return null;
      },
      decoration: InputDecoration(
        // isDense: true,
        helperText: widget.helperTxt,
        labelText: widget.lable,
        hintText: widget.hint,

        labelStyle: const TextStyle(color: AppTheme.primaryTextColor),
        helperStyle: const TextStyle(color: AppTheme.secondaryTextColor),
        hintStyle: const TextStyle(color: AppTheme.secondaryTextColor),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}

class CustomTF extends StatefulWidget {
  CustomTF(
      {super.key,
      this.hint = "",
      this.lable,
      this.helperTxt,
      this.keyboardType,
      this.showObscure = false,
      this.validator,
      this.formatter,
      this.onTap,
      this.isReadyOnly = false,
      this.maxLine,
      this.controller});
  final String? lable;
  final String? hint;
  final String? helperTxt;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool showObscure;
  final bool isReadyOnly;
  final Function(String)? validator;
  final List<TextInputFormatter>? formatter;
  final int? maxLine;
  void Function()? onTap;
  @override
  State<CustomTF> createState() => _CustomTFState();
}

class _CustomTFState extends State<CustomTF> {
  late bool isObsure;

  @override
  void initState() {
    super.initState();
    isObsure = widget.showObscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: isObsure,
      inputFormatters: widget.formatter,
      readOnly: widget.isReadyOnly,
      // maxLines: widget.maxLine,
      onTap: widget.onTap,
      validator: (value) {
        if (widget.validator != null) {
          return widget.validator!(value ?? "");
        }
        return null;
      },
      decoration: InputDecoration(
        // isDense: true,
        helperText: widget.helperTxt,
        labelText: widget.lable,
        hintText: widget.hint,
        suffixIcon: (widget.showObscure)
            ? GestureDetector(
                onTap: () => setState(() => isObsure = !isObsure),
                child: Icon(
                  (isObsure) ? Icons.visibility : Icons.visibility_off,
                  size: 24,
                  color: AppTheme.primaryTextColor,
                ))
            : null,
        labelStyle: const TextStyle(color: AppTheme.primaryTextColor),
        helperStyle: const TextStyle(color: AppTheme.secondaryTextColor),
        hintStyle: const TextStyle(color: AppTheme.secondaryTextColor),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}

class CustomSearchTF extends StatefulWidget {
  CustomSearchTF(
      {super.key,
      this.hint = "",
      this.lable,
      this.helperTxt,
      this.keyboardType,
      this.showObscure = false,
      this.validator,
      this.formatter,
      this.onTap,
      this.isReadyOnly = false,
      this.maxLine,
      this.controller});
  final String? lable;
  final String? hint;
  final String? helperTxt;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool showObscure;
  final bool isReadyOnly;
  final Function(String)? validator;
  final List<TextInputFormatter>? formatter;
  final int? maxLine;
  void Function()? onTap;
  @override
  State<CustomSearchTF> createState() => _CustomSearchTFState();
}

class _CustomSearchTFState extends State<CustomSearchTF> {
  late bool isObsure;

  @override
  void initState() {
    super.initState();
    isObsure = widget.showObscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: isObsure,
      inputFormatters: widget.formatter,
      readOnly: widget.isReadyOnly,
      // maxLines: widget.maxLine,
      onTap: widget.onTap,
      validator: (value) {
        if (widget.validator != null) {
          return widget.validator!(value ?? "");
        }
        return null;
      },
      decoration: InputDecoration(
        isDense: true,
        helperText: widget.helperTxt,
        labelText: widget.lable,
        
        hintText: widget.hint,
        prefixIcon: GestureDetector(
                onTap: () => setState(() => isObsure = !isObsure),
                child: const Icon(
                   Icons.search,
                  size: 24,
                  color: AppTheme.secondaryTextColor,
                ))
            ,
        labelStyle: const TextStyle(color: AppTheme.primaryTextColor),
        helperStyle: const TextStyle(color: AppTheme.secondaryTextColor),
        hintStyle: const TextStyle(color: AppTheme.secondaryTextColor),
        border:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
                borderSide:  const BorderSide(color: AppTheme.secondaryTextColor),
            ),

            enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
                borderSide:  const BorderSide(color: AppTheme.secondaryTextColor,),
            ),
      ),
      
    );
  }
}
