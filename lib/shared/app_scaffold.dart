import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required Widget this.child,
    required String this.title,
  });

  final String title;
  final Widget child;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: Padding(padding: EdgeInsets.all(16), child: child),
    );
  }
}
