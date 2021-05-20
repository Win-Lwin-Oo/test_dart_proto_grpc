# test_dart_proto_grpc

## Install guide
- [Quick start](https://grpc.io/docs/languages/dart/quickstart/)
- Install [Protocol Buffer Compiler](https://grpc.io/docs/protoc-installation/)
- Install [protoc_plugin](https://pub.dev/packages/protoc_plugin/install)

### Command
```
$ protoc --dart_out=grpc:[outputFolder] -Iprotos [protoFilePath]
```
`Sample`
```
$ protoc --dart_out=grpc:lib/src/generated -Iprotos protos/album.proto
```

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).
