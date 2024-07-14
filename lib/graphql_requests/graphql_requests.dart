const display_all_media_anime_manga = r'''
  query ($page: Int = 1, $type: MediaType, $sort:[MediaSort] = [POPULARITY_DESC, SCORE_DESC]) {
  displaydata: Page(page: $page, perPage: 10) {
    media(sort: $sort, type: $type) {
id
  title {
    userPreferred
  }
  coverImage {
    extraLarge
    large
  }
  startDate {
    year
    month
    day
  }
  endDate {
    year
    month
    day
  }
  description
  format
  status(version: 1)
  episodes
  duration
  chapters
  volumes
  genres
  isAdult
    }
  }
}
''';

const home_page_anime_manga_query = r'''
  query ($season: MediaSeason, $seasonYear: Int, $type: MediaType ,$nextSeason: MediaSeason, $nextYear: Int) {
  trending: Page(page: 1, perPage: 10) {
    media(sort: TRENDING_DESC, type: $type) {
      ...media
    }
  }
  season: Page(page: 1, perPage: 10) {
    media(season: $season, seasonYear: $seasonYear, sort: POPULARITY_DESC, type: $type) {
      ...media
    }
  }
  nextSeason: Page(page: 1, perPage: 10) {
    media(season: $nextSeason, seasonYear: $nextYear, sort: POPULARITY_DESC, type: $type) {
      ...media
    }
  }
  popular: Page(page: 1, perPage: 10) {
    media(sort: POPULARITY_DESC, type: $type) {
      ...media
    }
  }
  top: Page(page: 1, perPage: 10) {
    media(sort: SCORE_DESC, type: $type) {
      ...media
    }
  }
}

fragment media on Media {
  id
  title {
    userPreferred
  }
  coverImage {
    extraLarge
    large
  }
  startDate {
    year
    month
    day
  }
  endDate {
    year
    month
    day
  }
  description
  format
  status(version: 1)
  episodes
  duration
  chapters
  volumes
  genres
  isAdult
  studios(isMain: true) {
    edges {
      isMain
      node {
        id
        name
      }
    }
  }
}
''';

const genre_list_request = r'''
query
{
  action: Media(genre_in: ["Action"], sort: TRENDING_DESC) {
    coverImage {
      ...imageSource
    }
  }
  adventure: Media(genre_in: ["Adventure"], sort: TRENDING_DESC) {
    coverImage {
      ...imageSource
    }
  }
  Comedy: Media(genre_in: ["Comedy"], sort: TRENDING_DESC) {
    coverImage {
      ...imageSource
    }
  }
  Drama: Media(genre_in: ["Drama"], sort: TRENDING_DESC) {
    coverImage {
      ...imageSource
    }
  }
  Ecchi: Media(genre_in: ["Ecchi"], sort: TRENDING_DESC) {
    coverImage {
      ...imageSource
    }
  }
  Fantasy: Media(genre_in: ["Fantasy"], sort: TRENDING_DESC) {
    coverImage {
      ...imageSource
    }
  }
  Hentai: Media(genre_in: ["Hentai"], sort: TRENDING_DESC) {
    coverImage {
      ...imageSource
    }
  }
  Horror: Media(genre_in: ["Horror"], sort: TRENDING_DESC) {
    coverImage {
      ...imageSource
    }
  }
  MahouShoujo: Media(genre_in: ["Mahou Shoujo"], sort: TRENDING_DESC) {
    coverImage {
      ...imageSource
    }
  }
  Mecha: Media(genre_in: ["Mecha"], sort: TRENDING_DESC) {
    coverImage {
      ...imageSource
    }
  }
  Music: Media(genre_in: ["Music"], sort: TRENDING_DESC) {
    coverImage {
      ...imageSource
    }
  }
  Mystery: Media(genre_in: ["Mystery"], sort: TRENDING_DESC) {
    coverImage {
      ...imageSource
    }
  }
  Psychological: Media(genre_in: ["Psychological"], sort: TRENDING_DESC) {
    coverImage {
      ...imageSource
    }
  }
  Romance: Media(genre_in: ["Romance"], sort: TRENDING_DESC) {
    coverImage {
      ...imageSource
    }
  }
  SciFi: Media(genre_in: ["Sci-Fi"], sort: TRENDING_DESC) {
    coverImage {
      ...imageSource
    }
  }
  SliceofLife: Media(genre_in: ["Slice of Life"], sort: TRENDING_DESC) {
    coverImage {
      ...imageSource
    }
  }
  Sports: Media(genre_in: ["Sports"], sort: TRENDING_DESC) {
    coverImage {
      ...imageSource
    }
  }
  Supernatural: Media(genre_in: ["Supernatural"], sort: TRENDING_DESC) {
    coverImage {
      ...imageSource
    }
  }
  Thriller: Media(genre_in: ["Thriller"], sort: TRENDING_DESC) {
    coverImage {
      ...imageSource
    }
  }
}

fragment imageSource on MediaCoverImage {
  large
  medium
  extraLarge
}
''';

const String request_anime_manga_for_genre = r'''
query ($genre: [String], $page: Int = 1) {
  anime: Page(page: $page, perPage: 50) {
    media(sort: POPULARITY_DESC, type: ANIME, genre_in: $genre) {
      ...media
    }
  }
  manga: Page(page: $page, perPage: 50) {
    media(sort: POPULARITY_DESC, type: MANGA, genre_in: $genre) {
      ...media
    }
  }
}

fragment media on Media {
  id
  title {
    userPreferred
  }
  coverImage {
    extraLarge
    large
  }
  startDate {
    year
    month
    day
  }
  endDate {
    year
    month
    day
  }
  description
  format
  status(version: 1)
  episodes
  duration
  chapters
  volumes
  genres
  isAdult
  studios(isMain: true) {
    edges {
      isMain
      node {
        id
        name
      }
    }
  }
}
''';
