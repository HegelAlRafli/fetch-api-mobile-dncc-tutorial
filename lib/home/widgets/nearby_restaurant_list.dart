import 'package:flutter/material.dart';
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
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.fromLTRB(30, 16, 14, 30),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: (150 / 202),
            crossAxisCount: 2,
            mainAxisSpacing: 16,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            // final restaurant = state.model.restaurants[index];
            return RestaurantCard(
              id: 'ddjan',
              pictureId:
                  'https://blog.thewonderspace.com/wp-content/uploads/2025/06/Fast-Food-Restaurant-Restoran-Cepat-Saji-1024x683.jpg',
              name: 'MCS',
              city: 'Semarang',
              rating: '5.5',
              description: 'ipsum lorem damet ngiemet',
            );
          },
        ),
      ],
    );
  }
}
