// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:salon_app/presentation/home/__my_widget_state.dart';

class filter extends StatefulWidget {
  final String text;
  filter({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<filter> createState() => MyWidgetState();
}
