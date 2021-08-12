class Queries {
  static const String getMissions = r'''
  query getMissionsByName($name: String!) {
   launches(find: {mission_name: $name}) {
     id
     mission_name
     details
    }
  }
  ''';
}
