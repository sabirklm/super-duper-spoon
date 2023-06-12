import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/asset_image.dart';

class ExplorationCard extends StatelessWidget {
  final String? title;
  final String? desc;
  final String? imgUrl;

  const ExplorationCard({
    super.key,
    this.title,
    this.desc, this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(imgUrl!=null)
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imgUrl??AppAsset.networkImage,
              height: 180,
              width: width,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Mathematics",
            style: GoogleFonts.lato(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            title ?? "Pi is irrational and non-repeating.",
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              letterSpacing: .310,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            desc ??
                "The decimal representation of pi goes on infinitely without any repeating pattern.",
            style: GoogleFonts.lato(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
