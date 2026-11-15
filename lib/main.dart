import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/app_data_provider.dart';
import 'pages/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (ctx) => AppDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Earthquake App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
       // Aktualizácia riadku
        home: const HomePage(),
      ),
    ),
  );
}
