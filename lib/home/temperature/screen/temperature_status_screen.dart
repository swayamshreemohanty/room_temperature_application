import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_auto/home/temperature/logic/temperature_status/temperature_status_cubit.dart';
import 'package:home_auto/home/temperature/model/temperature_model.dart';
import 'package:home_auto/home/temperature/widgets/temperature_data_widget.dart';
import 'package:home_auto/utility/widgets/theme_spinner.dart';

class TemperatureStatusScreen extends StatefulWidget {
  const TemperatureStatusScreen({super.key});

  @override
  State<TemperatureStatusScreen> createState() =>
      _TemperatureStatusScreenState();
}

class _TemperatureStatusScreenState extends State<TemperatureStatusScreen> {
  @override
  void dispose() {
    context.read<TemperatureStatusCubit>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Swayam Room Temperature"),
        centerTitle: true,
      ),
      body: StreamBuilder<TemperatureModel>(
        stream: context.read<TemperatureStatusCubit>().streamTemperatureData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ThemeSpinner(size: 40);
          } else {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            } else {
              final tempData = snapshot.data;
              return TemperatureDataWidget(
                temperatureData: tempData?.temperature,
              );
            }
          }
        },
      ),
    );
  }
}
