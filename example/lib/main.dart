import 'package:flutter/material.dart';
import 'package:screenshot_security/screenshot_security.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isSafe = false;
  final _screenshotSecurity = ScreenshotSecurity();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Screenshot Security Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Screenshot is ${isSafe ? 'safe' : 'not safe'}'),
              const SizedBox(height: 50,),
              ElevatedButton(
                onPressed: () async {
                  await _screenshotSecurity.setSecurityScreen(enabled: !isSafe);

                  setState(() {
                    isSafe = !isSafe;
                  });
                },
                child: const Text('Change status'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
