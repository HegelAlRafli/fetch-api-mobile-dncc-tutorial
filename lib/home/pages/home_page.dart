import 'package:flutter/material.dart';
import 'package:learn_fetch_api_dncc/home/widgets/nearby_restaurant_list.dart';

import '../widgets/home_header.dart';
import '../widgets/recommend_restaurant_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const HomeHeaderWidget(),
              RecommendRestaurantListWidget(),
              NearbyRestaurantListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
