/// Class where all app endpoints are stored
class AppEndpoints {
  // Base urls
  static const baseUrl = 'https://api.themoviedb.org/3/';
  static const imageBaseUrl = 'https://image.tmdb.org/t/p/w500/';

  // Endpoints
  static const movieUrl = 'movie/';
  static const popularMoviesUrl = 'movie/popular';
  static const moviesGenreUrl = 'genre/movie/list';
}

// Could use https://pub.dev/packages/flutter_dotenv to hide the token, but hardcoded it for this task
class ApiToken {
  static const token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MDk1YTJkM2JjN2M2ZDE0NDcxZjRlYjM4OGNkN2ExOCIsInN1YiI6IjY1Nzg5MWE0YTFkMzMyMDEzOGViNDhkMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.t5wNtfI7n0vIYx6l4vI1HJHL-qcBnOZP1aYed1K5LI0';
}
