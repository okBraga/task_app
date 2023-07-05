import 'package:flutter/material.dart';

class CheckList extends StatefulWidget {
  const CheckList({super.key});

  @override
  State<CheckList> createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    return Colors.deepPurple;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          activeColor: Colors.deepPurple,
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        const Text(
          'SubTask description Lorem Ipsum',
          style: TextStyle(color: Colors.black),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 55),
          child: Icon(
            Icons.more_vert,
            color: Colors.deepPurple,
          ),
        )
      ],
    );
  }
}
