import 'package:flutter/material.dart';
import 'package:http_sample_project/screens/select_country_screen/selectCountrBloc.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class SelectLanguageWidget extends StatefulWidget {
  final SelectCountryBloc bloc;
  const SelectLanguageWidget({required this.bloc, super.key});

  @override
  State<SelectLanguageWidget> createState() => _SelectLanguageWidgetState();
}

class _SelectLanguageWidgetState extends State<SelectLanguageWidget> {
  final Map<int, Widget> _children = const {
    0: Text('English'),
    1: Text('العربيه'),
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 100,
      child: MaterialSegmentedControl(
        children: _children,
        selectionIndex: widget.bloc.currentSelection,
        borderColor: Colors.grey,
        selectedColor: Colors.redAccent,
        unselectedColor: Colors.white,
        borderRadius: 6.0,
        verticalOffset: 8.0,
        onSegmentChosen: (int index) {
          setState(() {
            widget.bloc.currentSelection = index;

            if (index == 0) {
              widget.bloc.refreshAppWithLanguageCode(context, "en");
            } else {
              widget.bloc.refreshAppWithLanguageCode(context, "ar");
            }
          });
        },
      ),
    );
  }
}
