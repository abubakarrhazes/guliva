import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guliva/core/constants/app_helpers.dart';
import 'package:guliva/core/constants/app_image_constant.dart';
import 'package:guliva/core/error/failures.dart';
import 'package:guliva/features/vehicles/presentation/logic/fetch_vehicle/cubit/fetch_vehicle_cubit.dart';
import 'package:guliva/features/vehicles/presentation/screens/add_vehicle_screen.dart';
import 'package:guliva/core/constants/app_colors.dart';
import 'package:guliva/core/shared_components/custom_button.dart';
import 'package:guliva/features/vehicles/presentation/widgets/vehicle_details_info.dart';
import '../../../../core/constants/app_icons.dart';

class VehiclesAndPassengersScreen extends StatefulWidget {
  const VehiclesAndPassengersScreen({Key? key}) : super(key: key);

  @override
  State<VehiclesAndPassengersScreen> createState() =>
      _VehiclesAndPassengersScreenState();
}

class _VehiclesAndPassengersScreenState
    extends State<VehiclesAndPassengersScreen> {
  String selectedTab = "Vehicles";

  void _onTabSelect(String tab) {
    setState(() {
      selectedTab = tab;
    });
  }

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          _buildTab("Vehicles"),
          const SizedBox(width: 25),
          _buildTab("Passengers"),
        ],
      ),
    );
  }

  Widget _buildTab(String tab) {
    return GestureDetector(
      onTap: () => _onTabSelect(tab),
      child: Text(
        tab,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: selectedTab != tab
              ? Colors.black
              : const Color(AppColors.primaryColorTwo),
        ),
      ),
    );
  }

  Widget _buildTabIndicator() {
    return SizedBox(
      height: 4,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[200],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                _buildIndicator(selectedTab == "Vehicles", 55),
                const SizedBox(width: 25),
                _buildIndicator(selectedTab == "Passengers", 75),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(bool isActive, double width) {
    return Container(
      height: isActive ? 4 : 0,
      width: width,
      color: const Color(AppColors.primaryColorTwo),
    );
  }

  Widget _buildVehiclesView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: BlocBuilder<FetchVehicleCubit, FetchVehicleState>(
        builder: (context, state) {
          if (state is VehicleFetchLoading) {
            return _buildLoadingList();
          }

          if (state is VehicleFetchSuccess) {
            if (state.vehicles.isEmpty) {
              return _buildEmptyState();
            }
            return _buildVehicleList(state.vehicles);
          }

          if (state is VehicleFetchFail) {
            errorWidget(message: 'Error While Fetching');
          }

          return Container(); // Handle any other states
        },
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Text(
        message,
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Vehicles are empty!"),
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
      ],
    );
  }

  Widget _buildVehicleList(List vehicles) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: vehicles.length,
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: (10 + MediaQuery.of(context).padding.bottom),
        top: 10,
      ),
      itemBuilder: (context, index) => VehicleDetailsInfo(
        vehicleEntity: vehicles[index],
      ),
    );
  }

  Widget _buildLoadingList() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 6,
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: (10 + MediaQuery.of(context).padding.bottom),
        top: 10,
      ),
      itemBuilder: (context, index) => const VehicleDetailsInfo(),
    );
  }

  Widget _buildPassengersView() {
    return const Center(
      child: Text("Passengers Tab"),
    );
  }

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
          const SizedBox(height: 30),
          _buildTabBar(),
          const SizedBox(height: 10),
          _buildTabIndicator(),
          const SizedBox(height: 10),
          Expanded(
            child: selectedTab == "Vehicles"
                ? _buildVehiclesView()
                : _buildPassengersView(),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomButton(
              title: "ADD VEHICLE",
              onClick: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddVehicleScreen(),
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
