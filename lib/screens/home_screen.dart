import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inforura_task/bloc/fetch/fetch_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: const Text('You can fetch the details?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  context.read<FetchBloc>().add(FetchTokenEvent());
                  Navigator.of(context).pop();
                },
                child: const Text('Fetch'),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(child: BlocBuilder<FetchBloc, FetchState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const CircularProgressIndicator(
              color: Colors.black,
            );
          } else {
            return Text(
              "Your Token is ${state.token}",
              style: const TextStyle(color: Colors.black),
            );
          }
        },
      )),
    );
  }
}
