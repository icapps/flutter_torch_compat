import 'dart:async';

import 'package:flutter/material.dart';
import 'package:icapps_torch_compat/icapps_torch_compat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? _hasTorch;

  @override
  void initState() {
    super.initState();
    initTorchState();
  }

  Future<void> initTorchState() async {
    _hasTorch = await TorchCompat.hasTorch;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('hasTorch: $_hasTorch'),
              ElevatedButton(
                onPressed: () async {
                  await TorchCompat.turnOn();
                  await Future.delayed(const Duration(seconds: 2));
                  await TorchCompat.turnOff();
                },
                child: const Text('Turn on torch for 2 seconds'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
