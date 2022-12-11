// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TemperatureDataWidget extends StatelessWidget {
  final String? temperatureData;
  const TemperatureDataWidget({
    Key? key,
    required this.temperatureData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Temperature",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            temperatureData == null ? "No Data" : "$temperatureData °C",
            style: TextStyle(
              color: Colors.black,
              fontSize: temperatureData == null ? 20 : 40,
            ),
          ),
        ],
      ),
    );
  }
}
