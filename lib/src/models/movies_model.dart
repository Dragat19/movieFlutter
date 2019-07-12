class Movies {
  List<Movie> items = new List();

  Movies();

  Movies.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final pelicula = new Movie.fromJsonMap(item);
      items.add(pelicula);
    }
  }
}

class Movie {
  int voteCount;
  int id;
  bool video;
  double voteAverage;
  String title;
  double popularity;
  String posterPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String releaseDate;
  bool isFavorite;

  Movie({
    this.voteCount,
    this.id,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
  });

  Movie.fromJsonMap(Map<String, dynamic> json) {
    voteCount = json['vote_count'];
    id = json['id'];
    video = json['video'];
    voteAverage = json['vote_average'] / 1;
    title = json['title'];
    popularity = json['popularity'] / 1;
    posterPath = json['poster_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    backdropPath = json['backdrop_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    isFavorite = false;
  }


  Map<String,dynamic> toJson () => {
    'vote_count': voteCount ,
    'id': id,
    'video': video,
    'vote_average': voteAverage,
    'title': title,
    'popularity': popularity,
    'poster_path': posterPath,
    'original_language': originalLanguage,
    'original_title': originalTitle,
    'genre_ids': genreIds,
    'backdrop_path': backdropPath,
    'adult': adult,
    'overview': overview,
    'release_date': releaseDate,
    'isFavorite': isFavorite
  };




  getPosterImg() {
    if (posterPath == null) {
      return 'https://www.themoviedb.org/assets/2/v4/logos/312x276-primary-blue-fb50dee3bf664c866fd216e6cee64af33d20707ea3091ddc65c5e8aa4c152eb2.png';
    } else {
      return 'http://image.tmdb.org/t/p/w185/$posterPath';
    }
  }

  getBackgroundImg() {
    if (backdropPath == null) {
      return 'https://www.themoviedb.org/assets/2/v4/logos/312x276-primary-blue-fb50dee3bf664c866fd216e6cee64af33d20707ea3091ddc65c5e8aa4c152eb2.png';
    } else {
      return 'http://image.tmdb.org/t/p/w500/$backdropPath';
    }
  }
}
