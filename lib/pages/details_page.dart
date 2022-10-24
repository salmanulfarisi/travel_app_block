import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/core/colors.dart';
import 'package:travel_app/cubit/app_cubit_state.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/widget/app_buttons.dart';
import 'package:travel_app/widget/app_large_text.dart';
import 'package:travel_app/widget/app_text.dart';
import 'package:travel_app/widget/resposive_button.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int gottonStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitState>(builder: (context, state) {
      DetailsState detail = state as DetailsState;
      return Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://picsum.photos/300?places=${detail.places.img}"),
                            fit: BoxFit.cover)),
                  )),
              Positioned(
                top: 20,
                left: 20,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        log("presesd");
                        BlocProvider.of<AppCubits>(context).goHome();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  margin: const EdgeInsets.only(top: 300),
                  width: double.maxFinite,
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                              text: detail.places.name,
                              color: Colors.black.withOpacity(0.8)),
                          AppLargeText(
                            text: "\$${detail.places.price}",
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: AppColors.mainColor,
                          ),
                          AppText(
                            text: detail.places.location,
                            color: AppColors.textColor1,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Wrap(
                              children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < detail.places.stars
                                  ? AppColors.starColor
                                  : AppColors.textColor2,
                            );
                          })),
                          const SizedBox(
                            width: 10,
                          ),
                          AppText(
                            text: "(${detail.places.stars})",
                            color: AppColors.textColor2,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppLargeText(
                        text: "People",
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AppText(
                        text: "Number of People in ypur group",
                        color: AppColors.mainTextColor,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Wrap(
                          children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: AppButtons(
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.black,
                            backgroundColor: selectedIndex == index
                                ? Colors.black
                                : AppColors.buttonBackgroung,
                            borderColor: selectedIndex == index
                                ? Colors.black
                                : AppColors.buttonBackgroung,
                            size: 50,
                            text: (index + 1).toString(),
                          ),
                        );
                      })),
                      const SizedBox(
                        height: 20,
                      ),
                      AppLargeText(
                        text: "Description",
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppText(
                        text: detail.places.description,
                        color: AppColors.mainTextColor,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 10,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButtons(
                        isIcon: true,
                        icon: Icons.favorite_border,
                        color: AppColors.textColor1,
                        backgroundColor: Colors.white,
                        borderColor: AppColors.textColor1,
                        size: 60,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ResponsiveButton(
                        isResponsive: true,
                      )
                    ],
                  ))
            ],
          ),
        ),
      );
    });
  }
}
