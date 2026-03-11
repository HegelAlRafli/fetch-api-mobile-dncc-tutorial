import 'package:flutter/material.dart';
import 'package:learn_fetch_api_dncc/core/services/api_services.dart';
import 'package:learn_fetch_api_dncc/core/theme/color_value.dart';
import 'package:learn_fetch_api_dncc/home/model/restaurants_model.dart';

import 'restaurant_card.dart';

class RecommendRestaurantListWidget extends StatefulWidget {
  const RecommendRestaurantListWidget({super.key});

  @override
  State<RecommendRestaurantListWidget> createState() =>
      _RecommendRestaurantListWidgetState();
}

class _RecommendRestaurantListWidgetState
    extends State<RecommendRestaurantListWidget> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Rekomendasi Restoran', style: textTheme.labelLarge),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const AllRestaurantPage(),
                  //   ),
                  // );
                },
                child: Text(
                  'Lihat Semua',
                  style: textTheme.labelSmall?.copyWith(
                    color: ColorValue.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        FutureBuilder<RestaurantModel>(
          future: ApiServices.fetchRestaurant(),
          builder: (context, snapshot) {
            print(snapshot);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            return Container(
              height: 215,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 16, bottom: 24),
              padding: EdgeInsets.zero,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 30, right: 14),
                shrinkWrap: true,
                itemCount: snapshot.data!.restaurants!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final restaurants = snapshot.data!.restaurants![index];
                  return RestaurantCard(
                    id: restaurants.id.toString(),
                    pictureId:
                        "https://restaurant-api.dicoding.dev/images/medium/${snapshot.data!.restaurants![index].pictureId}",
                    name: restaurants.name.toString(),
                    city: restaurants.city.toString(),
                    rating: restaurants.rating.toString(),
                    description: restaurants.description.toString(),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
