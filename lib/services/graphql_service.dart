import 'package:animemangaapp/enums/sorting_types.dart';
import 'package:animemangaapp/graphql_requests/graphql_requests.dart';
import 'package:animemangaapp/modals/anime_list.dart';
import 'package:animemangaapp/modals/genre_data.dart';
import 'package:animemangaapp/modals/manga_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
//import 'package:animemangaapp/modals/page.dart' as PageResponse;

class GraphQLService {
  static final HttpLink httpLink = HttpLink("https://graphql.anilist.co");

  static ValueNotifier<GraphQLClient> initailizeClient() {
    ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
        link: httpLink, cache: GraphQLCache(store: InMemoryStore())));
    return client;
  }

  GraphQLClient getGraphQLClient() => GraphQLClient(
      link: httpLink, cache: GraphQLCache(store: InMemoryStore()));

  String getSortType(String sortType) {
    String sortTypeValue = describeEnum(Sorting_Types.SCORE_DESC);
    switch (sortType.toUpperCase()) {
      case 'TRENDING':
        sortTypeValue = describeEnum(Sorting_Types.TRENDING_DESC);
        break;
      case 'POPULAR':
        sortTypeValue = describeEnum(Sorting_Types.POPULARITY_DESC);
        break;
      case 'TOP':
        sortTypeValue = describeEnum(Sorting_Types.SCORE_DESC);
        break;
      default:
        sortTypeValue = describeEnum(Sorting_Types.TRENDING_DESC);
        break;
    }

    return sortTypeValue;
  }

  Future<GenreData> fetchGenreData(String genreType, int page) async {
    List<String> genreTypes = [genreType];

    final QueryOptions queryOptions = QueryOptions(
      fetchPolicy: FetchPolicy.noCache,
      document: gql(request_anime_manga_for_genre),
      variables: <String, dynamic>{'page': page, 'genre': genreTypes},
    );

    final QueryResult result = await getGraphQLClient().query(queryOptions);

    if (result.exception != null) {
      print(result.exception!.graphqlErrors.toString());
    }

    if (result.data!.isNotEmpty) {
      AnimeList animeList = AnimeList.fromJson(result.data?['anime']);
      MangaList mangaList = MangaList.fromJson(result.data?['manga']);
      return GenreData(animeList: animeList, mangaList: mangaList);
    }

    throw Exception('Failed to load album');
  }
}
