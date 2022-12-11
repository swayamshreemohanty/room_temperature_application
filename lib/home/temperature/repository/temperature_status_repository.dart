import 'dart:convert';

import 'package:home_auto/home/temperature/model/temperature_model.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class TemperatureStatusRepository {
  late IOWebSocketChannel channel;

  Stream<TemperatureModel> streamTemperatureData() {
    channel = IOWebSocketChannel.connect(
        'ws://192.168.0.2:8000/swayamroom/v1/temp/ws');
    channel.sink.add('start!');
    return channel.stream
        .map((event) => TemperatureModel.fromMap(json.decode(event)['data']));
  }

  void closeTemperatureSocket() {
    channel.sink.close(status.goingAway);
    return;
  }
}
