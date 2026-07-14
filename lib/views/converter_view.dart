import 'package:coordinate_converter/models/coordinate_result.dart';
import 'package:coordinate_converter/utils/coordinate_sys_enum.dart';
import 'package:coordinate_converter/utils/coordinate_converter.dart';
import 'package:coordinate_converter/widgets/coordinate_input_field.dart';
import 'package:coordinate_converter/widgets/result_box.dart';
import 'package:flutter/material.dart';

class ConverterView extends StatefulWidget {
  const ConverterView({super.key});

  @override
  State<ConverterView> createState() => _ConverterViewState();
}

class _ConverterViewState extends State<ConverterView> {
  CoordinateResult? conversionResult;

  double? firstValue;
  double? secondValue;
  double? thirdValue;

  CoordinateSystem? selectedCoordinateSystem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: const Text(
          "Coordinate Converter",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildDropdown(),

              const SizedBox(height: 20),

              ..._buildInputFields(),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: selectedCoordinateSystem == null
                      ? null
                      : _convertCoordinates,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),

                  child: const Text("Convert", style: TextStyle(fontSize: 18)),
                ),
              ),

              const SizedBox(height: 20),

              if (conversionResult != null) ...[
                ResultBox(
                  title: "Cartesian",
                  value: conversionResult!.cartesian,
                ),

                ResultBox(
                  title: "Spherical",
                  value: conversionResult!.spherical,
                ),

                ResultBox(
                  title: "Cylindrical",
                  value: conversionResult!.cylindrical,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  ///////////////////////////////////////////////////////////

  Widget _buildDropdown() {
    return DropdownButton<CoordinateSystem>(
      value: selectedCoordinateSystem,
      isExpanded: true,
      hint: const Text("Select Coordinate System"),

      items: CoordinateSystem.values.map((system) {
        return DropdownMenuItem(
          value: system,
          child: Text(_systemName(system)),
        );
      }).toList(),

      onChanged: (value) {
        setState(() {
          selectedCoordinateSystem = value;

          conversionResult = null;

          firstValue = null;
          secondValue = null;
          thirdValue = null;
        });
      },
    );
  }

  String _systemName(CoordinateSystem system) {
    switch (system) {
      case CoordinateSystem.cartesian:
        return "Cartesian";

      case CoordinateSystem.spherical:
        return "Spherical";

      case CoordinateSystem.cylindrical:
        return "Cylindrical";
    }
  }

  ///////////////////////////////////////////////////////////

  List<Widget> _buildInputFields() {
    switch (selectedCoordinateSystem) {
      case CoordinateSystem.cartesian:
        return [
          CoordinateInputField(
            label: "X",
            onChanged: (value) => firstValue = double.tryParse(value),
          ),

          CoordinateInputField(
            label: "Y",
            onChanged: (value) => secondValue = double.tryParse(value),
          ),

          CoordinateInputField(
            label: "Z",
            onChanged: (value) => thirdValue = double.tryParse(value),
          ),
        ];

      case CoordinateSystem.spherical:
        return [
          CoordinateInputField(
            label: "r",
            onChanged: (value) => firstValue = double.tryParse(value),
          ),

          CoordinateInputField(
            label: "θ (Theta)",
            onChanged: (value) => secondValue = double.tryParse(value),
          ),

          CoordinateInputField(
            label: "φ (Phi)",
            onChanged: (value) => thirdValue = double.tryParse(value),
          ),
        ];

      case CoordinateSystem.cylindrical:
        return [
          CoordinateInputField(
            label: "ρ (Rho)",
            onChanged: (value) => firstValue = double.tryParse(value),
          ),

          CoordinateInputField(
            label: "φ (Phi)",
            onChanged: (value) => secondValue = double.tryParse(value),
          ),

          CoordinateInputField(
            label: "Z",
            onChanged: (value) => thirdValue = double.tryParse(value),
          ),
        ];

      case null:
        return const [
          Center(
            child: Text(
              "Please select a coordinate system.",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ];
    }
  }

  ///////////////////////////////////////////////////////////

  void _convertCoordinates() {
    if (firstValue == null || secondValue == null || thirdValue == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please fill all fields.")));

      return;
    }

    setState(() {
      switch (selectedCoordinateSystem) {
        case CoordinateSystem.cartesian:
          conversionResult = CoordinateConverter.convertFromCartesian(
            x: firstValue!,
            y: secondValue!,
            z: thirdValue!,
          );
          break;

        case CoordinateSystem.spherical:
          conversionResult = CoordinateConverter.convertFromSpherical(
            r: firstValue!,
            thetaDeg: secondValue!,
            phiDeg: thirdValue!,
          );
          break;

        case CoordinateSystem.cylindrical:
          conversionResult = CoordinateConverter.convertFromCylindrical(
            rho: firstValue!,
            phiDeg: secondValue!,
            z: thirdValue!,
          );
          break;
        case null:
          return;
      }
    });
  }
}
