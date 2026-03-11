import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learn_fetch_api_dncc/core/theme/color_value.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.id,
    required this.pictureId,
    required this.name,
    required this.city,
    required this.rating,
    required this.description,
  });

  final String id, pictureId, name, city, rating, description;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => DetailRestaurantPage(id: id),
        //   ),
        // );
      },
      child: Container(
        height: 202,
        width: 149,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.5),
          border: Border.all(color: ColorValue.borderColor),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7.5),
          child: Column(
            children: [
              FadeInImage.assetNetwork(
                width: MediaQuery.of(context).size.width,
                height: 99,
                fit: BoxFit.fill,
                placeholder: 'assets/images/placeholder.png',
                placeholderFit: BoxFit.fill,
                image: pictureId,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/image-error.png',
                    height: 99,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/location.svg',
                          width: 13,
                          height: 13,
                        ),
                        SizedBox(width: 4),
                        Text(city, style: textTheme.labelSmall),
                        const Spacer(),
                        SvgPicture.asset(
                          'assets/icons/star.svg',
                          width: 13,
                          height: 13,
                        ),
                        SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: textTheme.labelSmall?.copyWith(
                            color: ColorValue.goldColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
