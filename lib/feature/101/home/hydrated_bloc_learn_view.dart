import 'package:flutter/material.dart';

class HydratedBlocLearnView extends StatefulWidget {
  const HydratedBlocLearnView({super.key});

  @override
  State<HydratedBlocLearnView> createState() => _HydratedBlocLearnViewState();
}

class _HydratedBlocLearnViewState extends State<HydratedBlocLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HydratedBlocLearnView')),
      body: Column(
        spacing: 10,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text('HydratedBlocLearnView'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('HydratedBlocLearnView'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('HydratedBlocLearnView'),
          ),
          Text('HydratedBlocLearnView'),
        ],
      ),
    );
  }
}
