import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/colors.dart';
import 'package:travel_app/widget/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key, this.width = 120, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceEvenly
              : MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? AppText(
                    text: "Book Trip Now",
                    color: Colors.white,
                  )
                : Container(),
            const Icon(CupertinoIcons.arrow_right, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
