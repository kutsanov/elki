import 'package:elki/models/house.dart';
import 'package:elki/pages/houses/bloc/houses_bloc.dart';
import 'package:elki/pages/houses/houses_card.dart';
import 'package:elki/pages/houses/houses_form_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:getwidget/getwidget.dart';

class PageHouses extends StatelessWidget {
  const PageHouses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HousesBloc(),
      child: BlocBuilder<HousesBloc, HousesState>(
        builder: (context, state) {
          HousesBloc block = context.read<HousesBloc>();
          List<House>? listHouse;
          if (state is HousesList) {
            listHouse = state.houses;
          }
          if (state is HousesInitial) {
            block.add(LoadingEvent());
          }

          if (listHouse != null) {
            List<Widget> lst = [];
            lst.add(const Padding(
              padding: EdgeInsets.all(8.0),
              child: FormFilter(),
            ));
            lst.add(const SizedBox(height: 5));
            for (House house in listHouse) {
              lst.add(HouseCard(house: house));
              lst.add(const SizedBox(height: 20));
            }
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 8,
                ),
                child: ListView(
                  children: lst,
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: Text("Загрузка даннных"),
              ),
            );
          }
        },
      ),
    );
  }
}
