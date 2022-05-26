import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:elki/models/house.dart';
import 'package:elki/services/service_house.dart';

part 'houses_event.dart';
part 'houses_state.dart';

class HousesBloc extends Bloc<HousesEvent, HousesState> {
  final ServiceHouse _serviceHouse = ServiceHouse();

  List<House> _listHouse = [];

  HousesBloc() : super(HousesInitial()) {
    on<HousesEvent>((event, emit) async {
      if (event is LoadingEvent) {
        await onLoadingEvent(event, emit);
      }

      if (event is FilterEvent) {
        await onFilterEvent(event, emit);
      }
    });
  }
  Future<void> onLoadingEvent(
      LoadingEvent event, Emitter<HousesState> emit) async {
    List<House> listHouse = await _serviceHouse.list();
    emit(HousesList(listHouse, ""));
    _listHouse = listHouse;
  }

  Future<void> onFilterEvent(
      FilterEvent event, Emitter<HousesState> emit) async {
    _listHouse = await _serviceHouse.list();
    List<House> listHouse = _listHouse;
    String filter = event.filter;

    if (filter != "") {
      listHouse = [];
      for (House house in _listHouse) {
        if (house.type == filter) {
          listHouse.add(house);
        }
      }
    }

    emit(HousesList(listHouse, filter));
  }
}
