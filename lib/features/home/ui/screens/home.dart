import 'package:detection_app/config/routes/routes_path.dart';
import 'package:detection_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: InkWell(
            onTap: () {
              context.navigateToWidgetByNamed(context, RoutePath.chatbot);
            },
            child: Text('Home Screen')),
      ),
    );
  }
}
