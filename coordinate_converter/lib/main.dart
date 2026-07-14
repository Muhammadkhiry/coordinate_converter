import 'package:coordinate_converter/views/converter_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CoordinateConverter());
}

class CoordinateConverter extends StatelessWidget {
  const CoordinateConverter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: ConverterView(),
    );
  }
}
