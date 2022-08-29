import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Protection/Blocs/application_bloc.dart';
import 'firebase_options.dart';
import 'splash.dart';
import 'home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const StudentsApp());
}

// The entry point of the app...
class StudentsApp extends StatelessWidget {
  const StudentsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
      child: MaterialApp(
        // home: const Splash(),
        initialRoute: '/',
        routes: {
          '/': (context) => const Splash(),
        },
      ),
    );
  }
}
