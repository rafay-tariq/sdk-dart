import '../kuzzle.dart';
import '../kuzzle/request.dart';
import '../kuzzle/response.dart';
import '../kuzzle/user.dart';

import 'abstract.dart';

class UserSearchResult extends SearchResult {
  UserSearchResult(
    Kuzzle kuzzle, {
    KuzzleRequest request,
    KuzzleResponse response,
  }) : super(kuzzle, request: request, response: response) {
    controller = null;
    searchAction = 'searchUsers';
    scrollAction = 'scrollUsers';

    hits = response.result['hits']
        .map((hit) => KuzzleUser(kuzzle,
            uid: hit['_id'] as String,
            content: hit['_source'] as Map<String, dynamic>,
            meta: hit['_meta'] as Map<String, dynamic>))
        .toList() as List<dynamic>;
  }

  // @override
  // Future<List<dynamic>> next() => super.next().then((_) => hits =
  //     (response.result['hits'] as List).map((hit) => KuzzleUser(kuzzle,
  //         uid: hit['_id'] as String,
  //         content: hit['_source'] as Map<String, dynamic>,
  //         meta: hit['_meta'] as Map<String, dynamic>)) as List<dynamic>);

  List<KuzzleUser> getUsers() => List<KuzzleUser>.from(hits);
}
