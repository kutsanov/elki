part of 'houses_bloc.dart';

@immutable
abstract class HousesState {}

class HousesInitial extends HousesState {}

class HousesList extends HousesState {
  final List<House> houses;
  final String filter;
  HousesList(this.houses, this.filter);
}
