// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/feature/streamsLearn/0/service/service_000.dart';

class StreamLearnd0 extends StatefulWidget {
  const StreamLearnd0({super.key});

  @override
  State<StreamLearnd0> createState() => _StreamLearnd0State();
}

class _StreamLearnd0State extends State<StreamLearnd0> {
  late final Service000 _service;

  @override
  void initState() {
    super.initState();
    _service = Service000();
  }
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StreamLearnd')),
      body: Column(
        spacing: 10,
        children: [
          ElevatedButton(
            onPressed: () async {
              final stream = _service.countStream(5);
              final result = await _service.sumStream(stream);
              setState(() {
                _counter = result;
              });
              print('Sum: $_counter');
            },
            child: Text(_counter.toString()),
          ),

          Text('StreamLearnd'),
        ],
      ),
    );
  }
}
