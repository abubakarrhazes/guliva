import 'package:flutter/material.dart';

import '../../../../core/constants/app_icons.dart';

class AddVehicleScreen extends StatefulWidget {
  const AddVehicleScreen({super.key});

  @override
  State<AddVehicleScreen> createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Image.asset(
          AppIcons.appLogo,
          scale: 1.5,
        ),
        centerTitle: true,
      ),
    );
  }
}
