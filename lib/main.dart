import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_auto/home/temperature/logic/temperature_status/temperature_status_cubit.dart';
import 'package:home_auto/home/temperature/screen/temperature_status_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'home/temperature/repository/temperature_status_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TemperatureStatusRepository(),
      child: BlocProvider(
        create: (context) => TemperatureStatusCubit(
          temperatureStatusRepository:
              context.read<TemperatureStatusRepository>(),
        ),
        child: MaterialApp(
          title: 'Home Automation',
          theme: ThemeData(
            primarySwatch: Colors.red,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          builder: (context, child) => ResponsiveWrapper.builder(
            child,
            maxWidth: 1920,
            minWidth: 400,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.autoScale(450, name: MOBILE),
              const ResponsiveBreakpoint.resize(450, name: MOBILE),
              const ResponsiveBreakpoint.resize(480, name: MOBILE),
              const ResponsiveBreakpoint.resize(1000, name: TABLET),
              const ResponsiveBreakpoint.resize(1920, name: DESKTOP),
            ],
          ),
          home: const TemperatureStatusScreen(),
        ),
      ),
    );
  }
}
