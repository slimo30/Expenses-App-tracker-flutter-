import 'package:expences_new_app/Widgets/expense_list/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  var MyColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 59, 96, 179),
  );
  var MyDarkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 59, 96, 179),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: MyColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: MyColorScheme.onPrimaryContainer,
          foregroundColor: MyColorScheme.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: MyColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: MyColorScheme.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: MyColorScheme.onSecondaryContainer,
                fontSize: 20,
              ),
              labelLarge: TextStyle(color: Colors.black),
            ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        bottomSheetTheme: BottomSheetThemeData()
            .copyWith(backgroundColor: MyDarkColorScheme.onPrimaryContainer),
        colorScheme: MyDarkColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: MyDarkColorScheme.onPrimaryContainer,
          foregroundColor: MyDarkColorScheme.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: MyDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: MyDarkColorScheme.onPrimaryContainer,
              foregroundColor: MyDarkColorScheme.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.normal,
              color: MyDarkColorScheme.onSecondaryContainer,
              fontSize: 20,
            ),
            labelLarge: TextStyle(color: Colors.white)),
      ),
      home: const Expenses(),
    );
  }
}
