import 'package:elki/pages/houses/bloc/houses_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormFilter extends StatelessWidget {
  const FormFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        FormFilterBtn(type: "", text: "все дома"),
        SizedBox(width: 5),
        FormFilterBtn(type: "o-frame", text: "O-frame"),
        SizedBox(width: 5),
        FormFilterBtn(type: "a-frame", text: "A-frame"),
      ],
    );
  }
}

class FormFilterBtn extends StatelessWidget {
  const FormFilterBtn({Key? key, required this.type, required this.text})
      : super(key: key);
  final String type;
  final String text;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HousesBloc, HousesState>(
      builder: (context, state) {
        HousesBloc block = context.read<HousesBloc>();

        Color colorBg = Colors.black12;
        Color colorText = Colors.black;
        if (state is HousesList) {
          if (state.filter == type) {
            colorBg = const Color.fromARGB(255, 116, 109, 247);
            colorText = Colors.white;
          }
        }
        return GestureDetector(
          onTap: () {
            block.add(FilterEvent(type));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: colorBg,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Text(text, style: TextStyle(color: colorText)),
            ),
          ),
        );
      },
    );
  }
}
