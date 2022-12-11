// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
          temperatureData == null
              ? Text(
                  "No Data",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: temperatureData == null ? 20 : 40,
                  ),
                )
              : SfRadialGauge(
                  animationDuration: 3500,
                  enableLoadingAnimation: true,
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: -10,
                      maximum: 100,
                      interval: 20,
                      minorTicksPerInterval: 9,
                      showAxisLine: false,
                      radiusFactor: 0.9,
                      labelOffset: 8,
                      ranges: <GaugeRange>[
                        GaugeRange(
                            startValue: -10,
                            endValue: 0,
                            startWidth: 0.265,
                            sizeUnit: GaugeSizeUnit.factor,
                            endWidth: 0.265,
                            color: const Color.fromRGBO(34, 144, 199, 0.75)),
                        GaugeRange(
                            startValue: 0,
                            endValue: 10,
                            startWidth: 0.265,
                            sizeUnit: GaugeSizeUnit.factor,
                            endWidth: 0.265,
                            color: const Color.fromRGBO(34, 195, 199, 0.75)),
                        GaugeRange(
                            startValue: 10,
                            endValue: 30,
                            startWidth: 0.265,
                            sizeUnit: GaugeSizeUnit.factor,
                            endWidth: 0.265,
                            color: const Color.fromRGBO(123, 199, 34, 0.75)),
                        GaugeRange(
                            startValue: 30,
                            endValue: 40,
                            startWidth: 0.265,
                            sizeUnit: GaugeSizeUnit.factor,
                            endWidth: 0.265,
                            color: const Color.fromRGBO(238, 193, 34, 0.75)),
                        GaugeRange(
                            startValue: 40,
                            endValue: 100,
                            startWidth: 0.265,
                            sizeUnit: GaugeSizeUnit.factor,
                            endWidth: 0.265,
                            color: const Color.fromRGBO(238, 79, 34, 0.65)),
                      ],
                      annotations: <GaugeAnnotation>[
                        const GaugeAnnotation(
                          angle: 90,
                          positionFactor: 0.35,
                          widget: Text(
                            'Temp.°C',
                            style: TextStyle(
                              color: Color(0xFFF8B195),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        GaugeAnnotation(
                          angle: 90,
                          positionFactor: 0.8,
                          widget: Text(
                            temperatureData!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                      pointers: <GaugePointer>[
                        NeedlePointer(
                          value: double.tryParse(temperatureData!) ?? 0,
                          needleStartWidth: 1,
                          needleEndWidth: 8,
                          animationType: AnimationType.easeOutBack,
                          enableAnimation: true,
                          animationDuration: 1200,
                          knobStyle: const KnobStyle(
                            knobRadius: 0.09,
                            borderColor: Color(0xFFF8B195),
                            color: Colors.white,
                            borderWidth: 0.05,
                          ),
                          tailStyle: const TailStyle(
                            color: Color(0xFFF8B195),
                            width: 8,
                            length: 0.2,
                          ),
                          needleColor: const Color(0xFFF8B195),
                        )
                      ],
                    )
                  ],
                ),
        ],
      ),
    );
  }
}
