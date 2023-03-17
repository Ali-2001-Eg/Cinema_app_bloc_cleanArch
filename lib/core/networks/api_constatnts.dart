class ApiConstants{
  static const String baseUrl = 'https://api.themoviedb.org/3' ;

  static const String apiKey = '75fcd3172e855f2031b6858f4b7108b7' ;

  static const String nowPlayingPath = '$baseUrl/movie/now_playing?api_key=$apiKey';

  static const String popularPath = '$baseUrl/movie/popular?api_key=$apiKey';

  static const String topRatedPath = '$baseUrl/movie/top_rated?api_key=$apiKey';

  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  static String movieDetails(int movieId) => '$baseUrl/movie/$movieId?api_key=$apiKey';

  static String tvDetails(int tvId) => '$baseUrl/tv/$tvId?api_key=$apiKey';

  static String recommendationPath(int movieId) => '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';

  static String recommendationTvsPath(int tvId) => '$baseUrl/tv/$tvId/recommendations?api_key=$apiKey';

  static String imageUrl (String path)=> '$imageBaseUrl$path';
  
  static const  String tvOnAirPath = '$baseUrl/tv/on_the_air?api_key=$apiKey';

  static const String tvPopularPath = '$baseUrl/tv/popular?api_key=$apiKey';

  static const String tvTopRatedPath = '$baseUrl/tv/top_rated?api_key=$apiKey';
}
//https://image.tmdb.org/t/p/w500/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg