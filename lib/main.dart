import 'package:bloc_login_nextpage/services/api_repositry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_observer/bloc_observer.dart';
import 'login_bloc/login_bloc.dart';
import 'pages/login_page.dart';

void main() {
  Bloc.observer = FindErrorBlocObserver();
  runApp( const App(),
  );
}
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(apiRepository: ApiRepository()),
      child: const MaterialApp(
        home: MyApp(),
      ),
    );
  }
}