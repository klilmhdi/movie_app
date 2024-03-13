import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/core/domain/entities/media.dart';
import 'package:movie_app/core/resources/app_router.dart';
import 'package:movie_app/core/services/service_locator.dart';
import 'package:movie_app/core/resources/app_strings.dart';
import 'package:movie_app/core/resources/app_theme.dart';
import 'package:movie_app/watchlist/presentation/controllers/watchlist_bloc/watchlist_bloc.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MediaAdapter());
  await Hive.openBox('items');
  ServiceLocator.init();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();

  runApp(
    BlocProvider(
      create: (context) => sl<WatchlistBloc>(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: getApplicationTheme(),
      routerConfig: AppRouter().router,
    );
  }
}
