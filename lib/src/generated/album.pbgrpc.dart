///
//  Generated code. Do not modify.
//  source: album.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'album.pb.dart' as $0;
export 'album.pb.dart';

class AlbumServiceClient extends $grpc.Client {
  static final _$getAlbum =
      $grpc.ClientMethod<$0.AlbumRequest, $0.AlbumResponse>(
          '/AlbumService/getAlbum',
          ($0.AlbumRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.AlbumResponse.fromBuffer(value));
  static final _$getAlbumWithPhotos =
      $grpc.ClientMethod<$0.AlbumRequest, $0.AlbumResponse>(
          '/AlbumService/getAlbumWithPhotos',
          ($0.AlbumRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.AlbumResponse.fromBuffer(value));
  static final _$getPhotos = $grpc.ClientMethod<$0.AlbumRequest, $0.Photo>(
      '/AlbumService/getPhotos',
      ($0.AlbumRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Photo.fromBuffer(value));

  AlbumServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.AlbumResponse> getAlbum($0.AlbumRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAlbum, request, options: options);
  }

  $grpc.ResponseFuture<$0.AlbumResponse> getAlbumWithPhotos(
      $0.AlbumRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAlbumWithPhotos, request, options: options);
  }

  $grpc.ResponseStream<$0.Photo> getPhotos($0.AlbumRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getPhotos, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class AlbumServiceBase extends $grpc.Service {
  $core.String get $name => 'AlbumService';

  AlbumServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AlbumRequest, $0.AlbumResponse>(
        'getAlbum',
        getAlbum_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AlbumRequest.fromBuffer(value),
        ($0.AlbumResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AlbumRequest, $0.AlbumResponse>(
        'getAlbumWithPhotos',
        getAlbumWithPhotos_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AlbumRequest.fromBuffer(value),
        ($0.AlbumResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AlbumRequest, $0.Photo>(
        'getPhotos',
        getPhotos_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.AlbumRequest.fromBuffer(value),
        ($0.Photo value) => value.writeToBuffer()));
  }

  $async.Future<$0.AlbumResponse> getAlbum_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AlbumRequest> request) async {
    return getAlbum(call, await request);
  }

  $async.Future<$0.AlbumResponse> getAlbumWithPhotos_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AlbumRequest> request) async {
    return getAlbumWithPhotos(call, await request);
  }

  $async.Stream<$0.Photo> getPhotos_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AlbumRequest> request) async* {
    yield* getPhotos(call, await request);
  }

  $async.Future<$0.AlbumResponse> getAlbum(
      $grpc.ServiceCall call, $0.AlbumRequest request);
  $async.Future<$0.AlbumResponse> getAlbumWithPhotos(
      $grpc.ServiceCall call, $0.AlbumRequest request);
  $async.Stream<$0.Photo> getPhotos(
      $grpc.ServiceCall call, $0.AlbumRequest request);
}
