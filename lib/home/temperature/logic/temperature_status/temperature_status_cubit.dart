import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_auto/home/temperature/model/temperature_model.dart';
import 'package:home_auto/home/temperature/repository/temperature_status_repository.dart';
part 'temperature_status_state.dart';

class TemperatureStatusCubit extends Cubit<TemperatureStatusState> {
  final TemperatureStatusRepository temperatureStatusRepository;
  TemperatureStatusCubit({
    required this.temperatureStatusRepository,
  }) : super(TemperatureStatusInitial());

  void closeSocket() {
    temperatureStatusRepository.closeTemperatureSocket();
  }

  Stream<TemperatureModel> streamTemperatureData() {
    return temperatureStatusRepository.streamTemperatureData();
  }
}
