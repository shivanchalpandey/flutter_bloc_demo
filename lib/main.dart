import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_bloc_example/bloc/user_details/user_details_bloc.dart';
import 'package:flutter_demo_bloc_example/bloc/user_details/user_details_event.dart';
import 'package:flutter_demo_bloc_example/ui/user_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserDetailsBloc>(
            builder: (context) =>
                UserDetailsBloc()..add(FetchUserDetailsEvent(1)),
            child: UserPage()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: UserPage(),
      ),
    );
  }
}
