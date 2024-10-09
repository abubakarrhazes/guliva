import 'package:flutter/material.dart';
import 'package:guliva/core/shared_components/custom_button.dart';
import 'package:guliva/core/shared_components/custom_text_field.dart';

class AddVehicleScreen extends StatefulWidget {
  @override
  _AddVehicleScreenState createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form inputs
  TextEditingController vehicleNameController = TextEditingController();
  TextEditingController engineNumberController = TextEditingController();
  TextEditingController chassisNumberController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController registrationNumberController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  // Dropdown values
  String? selectedVehicleType;
  bool setAsDefaultCar = false;
  bool isPassenger = true;

  // File pickers
  String sideView = '';
  String topView = '';
  String driversLicense = '';
  String thirdPartyInsurance = '';
  String frontView = '';
  String backView = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Vehicle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Type of vehicle
              DropdownButtonFormField<String>(
                value: selectedVehicleType,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide
                        .none, // No border side to match the background color
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                ),
                hint: Text('Type of Vehicle'),
                onChanged: (value) {
                  setState(() {
                    selectedVehicleType = value;
                  });
                },
                items: ['Private', 'Truck', 'Bike', 'Bus']
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 15),

              CustomTextField(
                title: "Vehicle Name",
                isObscure: false,
                suffixIcon: null,
                controller: vehicleNameController,
                keyboardType: TextInputType.name,
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return 'This field can\'t be empty';
                  }
                  return null;
                },
              ),

              // Model
              CustomTextField(
                title: "Model",
                isObscure: false,
                hint: 'eg AL340',
                suffixIcon: null,
                controller: vehicleNameController,
                keyboardType: TextInputType.name,
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return 'This field can\'t be empty';
                  }
                  return null;
                },
              ),

              SizedBox(height: 15),

              // Color
              CustomTextField(
                title: "Color",
                isObscure: false,
                hint: 'eg Red, White or Blue',
                suffixIcon: null,
                controller: vehicleNameController,
                keyboardType: TextInputType.name,
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return 'This field can\'t be empty';
                  }
                  return null;
                },
              ),

              SizedBox(height: 15),

              // Year
              CustomTextField(
                title: "Year",
                isObscure: false,
                hint: '2024',
                suffixIcon: null,
                controller: vehicleNameController,
                keyboardType: TextInputType.name,
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return 'This field can\'t be empty';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),

              // Value
              CustomTextField(
                title: "Value",
                isObscure: false,
                hint: 'eg',
                suffixIcon: null,
                controller: vehicleNameController,
                keyboardType: TextInputType.name,
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return 'This field can\'t be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),

              // Engine Number
              CustomTextField(
                title: "Engine Number",
                isObscure: false,
                hint: 'eg AL340',
                suffixIcon: null,
                controller: vehicleNameController,
                keyboardType: TextInputType.name,
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return 'This field can\'t be empty';
                  }
                  return null;
                },
              ),

              SizedBox(height: 15),

              // Chassis Number
              CustomTextField(
                title: "Chassis Number",
                isObscure: false,
                hint: 'eg AL340',
                suffixIcon: null,
                controller: vehicleNameController,
                keyboardType: TextInputType.name,
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return 'This field can\'t be empty';
                  }
                  return null;
                },
              ),

              SizedBox(height: 15),

              // Registration Number
              CustomTextField(
                title: "Registration Number",
                isObscure: false,
                hint: 'eg AL340',
                suffixIcon: null,
                controller: vehicleNameController,
                keyboardType: TextInputType.name,
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return 'This field can\'t be empty';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),

              // Set as default car
              SwitchListTile(
                title: Text('Set as default car'),
                value: setAsDefaultCar,
                onChanged: (value) {
                  setState(() {
                    setAsDefaultCar = value;
                  });
                },
              ),
              SizedBox(height: 16),

              // Is Passenger Vehicle
              SwitchListTile(
                title: Text('Is Passenger Vehicle'),
                value: isPassenger,
                onChanged: (value) {
                  setState(() {
                    isPassenger = value;
                  });
                },
              ),

              // Add file pickers for images (Side View, Top View, etc.)

              // Submit Button
              CustomButton(
                title: 'Add Vehicle',
                onClick: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform submit logic here
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
