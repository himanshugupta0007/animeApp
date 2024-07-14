import 'package:animemangaapp/graphql_requests/graphql_requests.dart';
import 'package:animemangaapp/main.dart';
import 'package:animemangaapp/modals/coverImage.dart';
import 'package:animemangaapp/modals/genres.dart';
import 'package:animemangaapp/services/graphql_service.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GenrePrvider extends ChangeNotifier {
  List<Genres> genresList = [];

  //inject the service here
  GraphQLService service = getItInstance<GraphQLService>();

  List<Genres> getGenreList() => genresList;

  Future discoverAnimeMandaGenres() async {
    final QueryOptions queryOptions = QueryOptions(
      fetchPolicy: FetchPolicy.noCache,
      document: gql(genre_list_request),
    );

    final QueryResult result =
        await service.getGraphQLClient().query(queryOptions);

    if (result.exception != null) {
      print(result.exception!.graphqlErrors.toString());
    }

    if (result.data != null && result.data!.isNotEmpty) {
      result.data!.forEach((key, value) {
        if (key != '__typename') {
          CoverImage coverImageFromResults =
              CoverImage.fromJson(value['coverImage']);
          Genres genre =
              Genres(genreName: key, coverImage: coverImageFromResults);
          genresList.add(genre);
        }
      });
    }

    notifyListeners();
  }
}
