import 'package:flutter/material.dart';
import './screens/sign_in_screen.dart';
import 'package:bloc/bloc.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';


void main() {  
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'ZonaPro',
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: Color(0xFF21CDA8),
        )
      ),
      home: const SignInScreen(),
    );
  }
}
