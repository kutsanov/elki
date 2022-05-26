part of 'houses_bloc.dart';

@immutable
abstract class HousesEvent {}

class InitEvent extends HousesEvent {}

class LoadingEvent extends HousesEvent {}

class FilterEvent extends HousesEvent {
  final String filter;
  FilterEvent(this.filter);
}
