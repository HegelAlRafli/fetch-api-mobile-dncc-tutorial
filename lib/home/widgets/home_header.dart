import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24),
                  Text('Hi, Hegel', style: textTheme.titleLarge),
                  Text(
                    'Temukan Restoran Terbaik di DineSpot!',
                    style: textTheme.bodySmall,
                  ),
                  SizedBox(height: 16),
                ],
              ),
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Fitur ini belum tersedia",
                        style: textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
                child: SvgPicture.asset(
                  'assets/icons/search.svg',
                  height: 24,
                  width: 24,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SearchPage()),
              // );
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5),
                color: Color(0XFFF9F9F9),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/search.svg',
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Cari restoran favoritmu...",
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
