import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Örnek repository
class DenemeRepository {
  String getData() => "Repository’den veri geldi";
}

class BlocRepositoryInitialize extends StatelessWidget {
  const BlocRepositoryInitialize({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<DenemeRepository>(
          create: (context) => DenemeRepository(),
        ),
      ],
      child: child,
    );
  }
}

//lifecycle bağımlı getit gibi değil 
/*
context üzerinden erişim 
final repo = context.read<DenemeRepository>();
print(repo.getData()); 
 */