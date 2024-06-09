import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/app_state.dart';
import 'ui/home_page.dart';
import 'utils/app_theme.dart';
import 'services/camera_service.dart';

Future<void> main() async {
  await initializeCamera();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: AppTheme.themeData,
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}
