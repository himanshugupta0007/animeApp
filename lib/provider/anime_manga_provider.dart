import 'package:animemangaapp/graphql_requests/graphql_requests.dart';
import 'package:animemangaapp/helper/text_constants.dart';
import 'package:animemangaapp/main.dart';
import 'package:animemangaapp/modals/display_all_data.dart';
import 'package:animemangaapp/modals/media.dart';
import 'package:animemangaapp/services/graphql_service.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AnimeMangaProvider extends ChangeNotifier {
  List<Media> mediaList = [];

  //inject the service here
  GraphQLService service = getItInstance<GraphQLService>();

  List<Media> getMediaList() => mediaList;

  void clearList() {
    this.mediaList.clear();
  }

  Future getAllAnimeMangaDetails(String type, int page, String sortType) async {
    final QueryOptions queryOptions = QueryOptions(
      fetchPolicy: FetchPolicy.noCache,
      document: gql(display_all_media_anime_manga),
      variables: <String, dynamic>{
        'type': type,
        'page': page,
        'sort': service.getSortType(sortType)
      },
    );

    final QueryResult result =
        await service.getGraphQLClient().query(queryOptions);

    if (result.exception != null) {
      print(result.exception!.graphqlErrors.toString());
    }

    if (result.data != null && result.data!.isNotEmpty) {
      var displayAllData =
          Map<String, dynamic>.from(result.data?[DISPLAY_ALL_DATA]);
      DisplayAllData allData = DisplayAllData.fromJson(displayAllData);

      if (mediaList.isEmpty) {
        mediaList = allData.media!.toList(growable: true);
      } else {
        mediaList.addAll(allData.media!.toList(growable: true));
      }
      notifyListeners();
    }
  }
}
