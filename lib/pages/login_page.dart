import 'package:bloc_login_nextpage/constant/validation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../login_bloc/login_bloc.dart';
import '../services/api_repositry.dart';



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool isvalid = false;
  bool isLoading = false;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  DateTime? loginClickTime;

  bool buttonClick(DateTime currentTime){
    if(loginClickTime==null){
      loginClickTime = currentTime;
      if (kDebugMode) {
        print("first click");
      }
      return false;
    }
    if(currentTime.difference(loginClickTime!).inSeconds<2){//set this difference time in seconds
      return true;
    }

    loginClickTime = currentTime;
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Login Api'),
      ),
      body: BlocProvider(
        create: (context) => LoginBloc(apiRepository: ApiRepository()),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginError) {
              '==========================errrrrrrrrorrrrrrrrr';
            } else if (state is LoginLoaded) {
              // Navigator.pop(context, true);
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                        child: Row(
                          children: [
                            Container(
                              width: 90,
                              child: const Text('Email'),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                    hintText: 'Enter the email',
                                    label: Text('Email'),
                                    border: OutlineInputBorder()),
                                validator: (val) => TestCase.emailValidation(val!),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                        child: Row(
                          children: [
                            Container(
                              width: 90,
                              child: const Text('Password'),
                            ),
                            Expanded(
                              child: TextFormField(
                                obscureText: false,
                                controller: passwordController,
                                decoration: const InputDecoration(
                                    hintText: 'Enter the password',
                                    label: Text('Password'),
                                    border: OutlineInputBorder()),
                                validator: (val) => TestCase.passwordValidation(val!),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if(buttonClick(DateTime.now())){
                              print('hold on, processing');
                              return;
                            }
                            print('run process');

                            trysubmit(context);
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.red,
                              side: const BorderSide(color: Colors.black)),
                          child: const Text(
                            'Login',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void trysubmit(BuildContext context){
    setState(() {
      context.read<LoginBloc>().add(
          LoginDetails(
            context: context,
            email: emailController.text??'',
            password: passwordController.text??'',
          ));
      isvalid = _formkey.currentState!.validate();
    });
  }
  Widget showLoader() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

