import 'package:grpc/grpc.dart';
import 'package:test_dart_proto_grpc/test_dart_proto_grpc.dart';

class AlbumService extends AlbumServiceBase {
  @override
  Future<AlbumResponse> getAlbum(ServiceCall call, AlbumRequest request) async {
    if (request.id > 0) {
      final album = findAlbums(request.id);
      return AlbumResponse()..albums.addAll(album);
    }
    final albumList = albums
        .map((album) =>
            Album.fromJson('{"1": ${album['id']}, "2": "${album['title']}" }'))
        .toList();
    return AlbumResponse()..albums.addAll(albumList);
  }

  List<Album> findAlbums(int id) {
    return albums
        .where((album) => album['id'] == id)
        .map(convertToAlbum)
        .toList();
  }

  Album convertToAlbum(Map album) =>
      Album.fromJson('{"1": ${album['id']}, "2": "${album['title']}" }');
}

void main(List<String> args) async {
  final server = Server([AlbumService()]);
  await server.serve(port: 5000);
  print('Server listening on port ${server.port}');
}
