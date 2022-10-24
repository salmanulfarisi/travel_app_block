import 'package:equatable/equatable.dart';
import 'package:travel_app/model/data_model.dart';

abstract class CubitState extends Equatable {}

class InitialState extends CubitState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WelcomeState extends CubitState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends CubitState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends CubitState {
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  // TODO: implement props
  List<Object> get props => [places];
}

class DetailsState extends CubitState {
  DetailsState(this.places);
  final DataModel places;
  @override
  // TODO: implement props
  List<Object> get props => [places];
}
