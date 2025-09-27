import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/feature/streamsLearn/0/screen/stream_learnd.0.dart';
import 'package:flutter_bloc_example/feature/streamsLearn/0/screen/stream_learnd.1.dart';

class StreamBaseView extends StatefulWidget {
  const StreamBaseView({super.key});

  @override
  State<StreamBaseView> createState() => _StreamBaseViewState();
}

class _StreamBaseViewState extends State<StreamBaseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StreamBaseView')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StreamLearnd0()),
                );
              },
              child: Text('StreamLearnd0'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StreamLearnd1()),
                );
              },
              child: Text('StreamLearnd1'),
            ),
            ElevatedButton(onPressed: () {}, child: Text('StreamBaseView')),
            Text('StreamBaseView'),
          ],
        ),
      ),
    );
  }
}
