import 'package:flutter/material.dart';
import 'package:furuplus/utils/custom_button.dart';

class PlusPage extends StatelessWidget {
  const PlusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Plus'),),
      body: Center(
        child: AdaptiveButton(
          text: 'Réserver',
          icon: Icons.check_circle_outline,
          onPressed: () {

          },
          backgroundColor: Colors.green,
          textColor: Colors.white,
        ),
      ),
    );
  }
}
