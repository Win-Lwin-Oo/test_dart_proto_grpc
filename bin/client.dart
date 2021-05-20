import 'package:grpc/grpc.dart';
import 'package:test_dart_proto_grpc/test_dart_proto_grpc.dart';

void main(List<String> args) async {
  final channel = ClientChannel(
    'localhost',
    port: 5000,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  final serviceClient = AlbumServiceClient(channel);

  var response = await serviceClient.getAlbum(AlbumRequest());
  // print('Response => \n $response');
  print('Response JSON => ${response.writeToJson()} \n');

  var responseData = await serviceClient.getAlbum(AlbumRequest()..id = 1);
  // print('Response Data => \n $responseData');
  print('Response Data JSON => ${responseData.writeToJson()}');

  await channel.shutdown();
}
