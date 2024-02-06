import 'package:flutter/material.dart';

class ApplicationFrame extends StatefulWidget {
  const ApplicationFrame({super.key});

  @override
  State<ApplicationFrame> createState() => _ApplicationFrameState();
}

class _ApplicationFrameState extends State<ApplicationFrame> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // // ヘッダー
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //   title: Text(""),
        // ),
        // body: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       const Text(
        //         'You have pushed the button this many times:',
        //       ),
        //       Text(
        //         '$_counter',
        //         style: Theme.of(context).textTheme.headlineMedium,
        //       ),
        //     ],
        //   ),
        // ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: _incrementCounter,
        //   tooltip: 'Increment',
        //   child: const Icon(Icons.add),
        // ), // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
