import 'package:flutter/material.dart';
import 'package:provider_state/resources/home_page.dart';

void main() {
  runApp(const ProviderState());
}

class ProviderState extends StatefulWidget {
  const ProviderState({super.key});

  @override
  State<ProviderState> createState() => _ProviderStateState();
}

class _ProviderStateState extends State<ProviderState> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
