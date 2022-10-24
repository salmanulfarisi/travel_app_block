import 'package:bloc/bloc.dart';
import 'package:travel_app/cubit/app_cubit_state.dart';
import 'package:travel_app/model/data_model.dart';
import 'package:travel_app/services/data_services.dart';

class AppCubits extends Cubit<CubitState> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();

      emit(LoadedState(places));
    } catch (e) {
      print(e);
    }
  }

  detailsPage(DataModel data) {
    emit(DetailsState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
