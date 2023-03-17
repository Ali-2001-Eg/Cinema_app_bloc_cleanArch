import 'package:payment_app/tvs/domain/entities/tv_revommendations.dart';

class TvRecommendationsModel extends TvRecommendations {
  const TvRecommendationsModel(
      {required super.id, required super.backdropPath});
  factory TvRecommendationsModel.fromJson(Map<String, dynamic> json) =>
      TvRecommendationsModel(
        id: json['id'],
        backdropPath: json['backdrop_path'] ??  '/jsoz1HlxczSuTx0mDl2h0lxy36l.jpg',
      );
}
