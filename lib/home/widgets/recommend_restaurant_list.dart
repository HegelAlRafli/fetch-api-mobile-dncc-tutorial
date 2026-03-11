import 'package:flutter/material.dart';
import 'package:learn_fetch_api_dncc/core/theme/color_value.dart';

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
        Container(
          height: 215,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 16, bottom: 24),
          padding: EdgeInsets.zero,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 30, right: 14),
            shrinkWrap: true,
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
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
        ),
      ],
    );
  }
}
