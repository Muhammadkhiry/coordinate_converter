// User interface...................................
import 'package:coordinate_converter/functions/covert_functions.dart';
import 'package:flutter/material.dart';

class ConverterView extends StatefulWidget {
  const ConverterView({super.key});

  @override
  State<ConverterView> createState() => _ConverterViewState();
}

class _ConverterViewState extends State<ConverterView> {
  Map<String, String>? returnedMap;
  double? X, Y, Z;
  String dropdownValue = 'Select Coordinate System';

  final items = [
    'Select Coordinate System',
    'Cartesian',
    'Spherical',
    'Cylindrical',
  ];

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
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            spacing: 15,
            children: [
              /////////////////////////////////////////////
              // ---------------- Dropdown List ----------------
              /////////////////////////////////////////////
              DropdownButton<String>(
                isExpanded: true,
                style: const TextStyle(fontSize: 20),
                value: dropdownValue,
                icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                items: items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                    returnedMap = null;
                    X = Y = Z = null;
                  });
                },
              ),

              const SizedBox(height: 10),
              ..._buildInputFields(),
              const SizedBox(height: 10),
              /////////////////////////////////////////////
              // ---------------- Converting Button ----------------
              /////////////////////////////////////////////
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (X != null && Y != null && Z != null) {
                      setState(() {
                        if (dropdownValue == "Cartesian") {
                          returnedMap = converterFromCartesian(
                            x: X!,
                            y: Y!,
                            z: Z!,
                          );
                        } else if (dropdownValue == "Spherical") {
                          returnedMap = converterFromSpherical(
                            r: X!,
                            thetaDeg: Y!,
                            phiDeg: Z!,
                          );
                        } else if (dropdownValue == "Cylindrical") {
                          returnedMap = converterFromCylindrical(
                            rho: X!,
                            phiDeg: Y!,
                            z: Z!,
                          );
                        }
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  child: const Text("Convert"),
                ),
              ),

              if (returnedMap != null) ...[
                _buildResultBox("Cartesian", returnedMap!["cartesian"]!),
                _buildResultBox("Spherical", returnedMap!["spherical"]!),
                _buildResultBox("Cylindrical", returnedMap!["cylindrical"]!),
              ],
            ],
          ),
        ),
      ),
    );
  }

  /////////////////////////////////////////////////////////
  // ---------------- Building the system ----------------
  /////////////////////////////////////////////////////////

  List<Widget> _buildInputFields() {
    switch (dropdownValue) {
      case 'Cartesian':
        return [
          _buildField("X", (v) => X = double.tryParse(v)),
          _buildField("Y", (v) => Y = double.tryParse(v)),
          _buildField("Z", (v) => Z = double.tryParse(v)),
        ];
      case 'Spherical':
        return [
          _buildField("r", (v) => X = double.tryParse(v)),
          _buildField("θ (Theta)", (v) => Y = double.tryParse(v)),
          _buildField("φ (Phi)", (v) => Z = double.tryParse(v)),
        ];
      case 'Cylindrical':
        return [
          _buildField("ρ (Rho)", (v) => X = double.tryParse(v)),
          _buildField("φ (Phi)", (v) => Y = double.tryParse(v)),
          _buildField("z", (v) => Z = double.tryParse(v)),
        ];
      default:
        return [const Text("Please select a coordinate system.")];
    }
  }

  //////////////////////////////////////////////////////
  // ---------------- Text Field Widget ----------------
  //////////////////////////////////////////////////////
  Widget _buildField(String label, Function(String) onChange) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        onChanged: onChange,
      ),
    );
  }

  ///////////////////////////////////////////////////
  // ---------------- Box Result -------------------
  //////////////////////////////////////////////////
  Widget _buildResultBox(String title, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.red, fontSize: 18)),
          const SizedBox(height: 5),
          Text(value, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
