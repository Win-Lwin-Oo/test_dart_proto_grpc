import 'package:test_dart_proto_grpc/test_dart_proto_grpc.dart';

void main(List<String> arguments) {
  final album = Album()
    ..id = 1
    ..title = 'Album title';
  print(album);

  final album2 = Album.fromJson(
      '{"1": ${albums[0]['id']}, "2": "${albums[0]['title']}" }');
  print(album2);

  print(album.writeToJson());
  print(album2.writeToBuffer());
}
