import 'package:graphql/client.dart';

class Config {

  GraphQLClient setup() {
    final _link = HttpLink(
      'https://api.spacex.land/graphql',
    );

    final GraphQLClient client = GraphQLClient(
      /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(),
      link: _link,
    );
    return client;
  }
}
