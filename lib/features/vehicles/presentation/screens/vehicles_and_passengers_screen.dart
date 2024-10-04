import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guliva/core/constants/app_image_constant.dart';
import 'package:guliva/features/vehicles/presentation/screens/add_vehicle_screen.dart';
import 'package:guliva/core/constants/app_colors.dart';
import 'package:guliva/core/shared_components/custom_button.dart';
import '../../../../core/constants/app_icons.dart';

class VehiclesAndPassengersScreen extends StatefulWidget {
  const VehiclesAndPassengersScreen({super.key});

  @override
  State<VehiclesAndPassengersScreen> createState() =>
      _VehiclesAndPassengersScreenState();
}

class _VehiclesAndPassengersScreenState
    extends State<VehiclesAndPassengersScreen> {
  String selectedTab = "Vehicles";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Image.asset(
          AppImageConstant.appLogo,
          scale: 1.5,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Vehicles/Passengers",
              style: TextStyle(fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = "Vehicles";
                        });
                      },
                      child: Text(
                        "Vehicles",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: selectedTab != "Vehicles"
                                ? Colors.black
                                : const Color(AppColors.primaryColorTwo)),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = "Passengers";
                        });
                      },
                      child: Text(
                        "Passengers",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: selectedTab != "Passengers"
                                ? Colors.black
                                : const Color(AppColors.primaryColorTwo)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 4,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: Colors.grey[200]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Container(
                            height: selectedTab != "Vehicles" ? 0 : 4,
                            width: 55,
                            decoration: const BoxDecoration(
                                color: Color(AppColors.primaryColorTwo)),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Container(
                            height: selectedTab != "Passengers" ? 0 : 4,
                            width: 75,
                            decoration: const BoxDecoration(
                                color: Color(AppColors.primaryColorTwo)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          selectedTab == "Vehicles"
              ? SingleChildScrollView(
                  child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          title: "ADD VEHICLE",
                          onClick: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const AddVehicleScreen()));
                          })
                    ],
                  ),
                ))
              : const SingleChildScrollView(child: Column())
        ],
      ),
    );
  }
}
