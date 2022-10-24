import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_state.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/pages/details_page.dart';
import 'package:travel_app/pages/main_page.dart';
import 'package:travel_app/pages/welcome_page.dart';

import '../pages/main_page.dart';

class AppCubitsLogics extends StatefulWidget {
  const AppCubitsLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitsLogics> createState() => _AppCubitsLogicsState();
}

class _AppCubitsLogicsState extends State<AppCubitsLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitState>(builder: (context, state) {
        if (state is WelcomeState) {
          return const WelcomePage();
        }
        if (state is DetailsState) {
          return const DetailsPage();
        }
        if (state is LoadedState) {
          return const MainPage();
        }
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container();
        }
      }),
    );
  }
}
