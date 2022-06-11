// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:testes_de_estudos/App/Controller/AppController.dart';
import 'package:testes_de_estudos/App/Data_Source/Domain/Data_Source_UserCase.dart';
import 'package:testes_de_estudos/App/Data_Source/Externo/FirebaseCloud.dart';
import 'package:testes_de_estudos/App/Data_Source/Infra/Repository/DataSourceRepositore.dart';
import 'package:testes_de_estudos/Pages/Auth_Check_Page.dart';
import 'Pages/PageView/pageView.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        Provider<DataSourceUsercaseUserCase>(
          create: (context) => DataSourceUsercaseUserCaseIMPL(
            DataSourceRepositoriyIMPL(FirebaseCloud()),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

late AppController app;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'pages': (context) => Pages()},
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF081720),
        textTheme: TextTheme(
          bodyText2: TextStyle(
              fontSize: 14,
              color: Color(0xffD6D6D6),
              fontWeight: FontWeight.w100),
        ),
      ),
      home: AuthCheckPage(),
    );
  }
}
