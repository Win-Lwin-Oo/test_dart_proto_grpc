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

  @override
  Future<AlbumResponse> getAlbumWithPhotos(
      ServiceCall call, AlbumRequest request) async {
    if (request.id > 0) {
      final album = findAlbums(request.id)[0];
      final albumPhotos = findPhotos(album.id);
      return AlbumResponse()..albums.add(album..photos.addAll(albumPhotos));
    }
    return AlbumResponse()
      ..albums.addAll(albums.map((data) {
        final album = convertToAlbum(data);
        final albumPhotos = findPhotos(album.id);
        return album..photos.addAll(albumPhotos);
      }));
  }

  List<Photo> findPhotos(int id) {
    return photos
        .where((photo) => photo['albumId'] == id)
        .map(convertToPhoto)
        .toList();
  }

  Photo convertToPhoto(Map photo) => Photo.fromJson(
      '{"1": ${photo['albumId']}, "2": ${photo['id']}, "3": "${photo['title']}", "4": "${photo['url']}"}');

// Server streaming RPC
  @override
  Stream<Photo> getPhotos(ServiceCall call, AlbumRequest request) async* {
    var photoList = photos;

    if (request.id > 0) {
      photoList =
          photos.where((photo) => photo['albumId'] == request.id).toList();
    }

    for (final photo in photoList) {
      yield Photo.fromJson('''{
        "1": ${photo['albumId']},
        "2": ${photo['id']},
        "3": "${photo['title']}",
        "4": "${photo['url']}"
      }''');
    }
  }
}

void main(List<String> args) async {
  final server = Server([AlbumService()]);
  await server.serve(port: 5000);
  print('Server listening on port ${server.port}');
}
