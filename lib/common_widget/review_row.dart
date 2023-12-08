import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../common/color_extension.dart';

class ReviewRow extends StatelessWidget {
  final Map rObj;

  const ReviewRow({super.key, required this.rObj});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  rObj["image"],
                  width: 40,
                  height: 40,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rObj["name"],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IgnorePointer(
                          ignoring: true,
                          child: RatingBar.builder(
                              initialRating: rObj["rate"],
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 17,
                              itemPadding: const EdgeInsets.symmetric(
                                horizontal: 1.0,
                              ),
                              itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                              onRatingUpdate: (rating) {
                                // ignore: avoid_print
                                print(rating);
                              }),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          rObj["rate"].toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      rObj["message"],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.schedule,
                          size: 17,
                          color: TColor.secondaryText,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          rObj["date"].toString(),
                          style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
