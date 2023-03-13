import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:payment_app/core/networks/api_constatnts.dart';
import 'package:shimmer/shimmer.dart';

class DetailsWidget extends StatelessWidget {
  final String title;
  final String overview;
  final double voteAverage;
  final String releaseDate;
  final String imagePath;

  const DetailsWidget({Key? key, required this.title, required this.overview, required this.voteAverage, required this.releaseDate, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade800,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius:
              const BorderRadius.all(Radius.circular(8.0)),
              child: CachedNetworkImage(
                width: 120,
                height: 200,
                fit: BoxFit.fill,
                imageUrl: ApiConstants.imageUrl(imagePath),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[850]!,
                  highlightColor: Colors.grey[800]!,
                  child: Container(
                    height: 170.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
              ),
            ),
            const SizedBox(width: 16,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(title,maxLines: 1,overflow: TextOverflow.ellipsis,),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2.0,
                          horizontal: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(
                          releaseDate.split('-')[0],
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16,),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20.0,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            (voteAverage/2).toStringAsFixed(1),
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            voteAverage.toString(),
                            style: const TextStyle(
                              fontSize: 1.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                    Text(overview,maxLines: 2,overflow: TextOverflow.ellipsis,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
