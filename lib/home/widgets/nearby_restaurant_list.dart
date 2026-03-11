import 'package:flutter/material.dart';
import 'package:learn_fetch_api_dncc/core/services/api_services.dart';
import 'package:learn_fetch_api_dncc/home/model/restaurants_model.dart';
import '../../core/theme/color_value.dart';
import 'restaurant_card.dart';

class NearbyRestaurantListWidget extends StatefulWidget {
  const NearbyRestaurantListWidget({super.key});

  @override
  State<NearbyRestaurantListWidget> createState() =>
      _NearbyRestaurantListWidgetState();
}

class _NearbyRestaurantListWidgetState
    extends State<NearbyRestaurantListWidget> {
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
              Text('Restoran Terdekat', style: textTheme.labelLarge),
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
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.fromLTRB(30, 16, 14, 30),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: (150 / 202),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
              ),
              itemCount: snapshot.data!.restaurants!.length,
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
            );
          },
        ),
      ],
    );
  }
}
