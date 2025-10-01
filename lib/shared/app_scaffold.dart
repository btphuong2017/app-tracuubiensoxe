import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.child, required this.title});

  final String title;
  final Widget child;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [Padding(padding: EdgeInsets.all(16), child: child)],
        ),
      ),
    );
  }
}
