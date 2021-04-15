import 'dart:async';
import 'package:edify/cubit/library_cubit.dart';
import 'package:path/path.dart';
import 'dart:io';

Future<List<FileSystemEntity>> dirContents(Directory dir) {
  var files = <FileSystemEntity>[];
  var completer = Completer<List<FileSystemEntity>>();
  var lister = dir.list(recursive: false);
  lister.listen (
          (file) => files.add(file),
      // should also register onError
      onDone:   () => completer.complete(files)
  );
  return completer.future;
}

Future<List<Audiobook>> findAudiobooks(String rootPath) async {
  List<Audiobook> found = [];

  List<FileSystemEntity> rootFiles = await dirContents(Directory(rootPath));

  for (var entry in rootFiles) {
    List<File> audioFiles = [];
    String name = '';

    if (entry is Directory) {
      List<FileSystemEntity> files = await dirContents(entry);
      for (var file in files) {
        String fileExt = extension(file.path);
        if (fileExt == '.mp3') {
          audioFiles.add(file as File);
          name = basename(entry.path);
        }
      }
    }
    audioFiles.sort((a,b) => a.path.compareTo(b.path));
    if (audioFiles.length > 0) {
      found.add(new Audiobook(name: name, audioFiles: audioFiles));
    }
  }

  return found;
}

Future<List<Audiobook>> scanRootDir() async {
  String rootPath = '/Users/brendanmullins/Documents/audio';
  print('reading');
  List<Audiobook> result = await findAudiobooks(rootPath);
  print(result);
  return result;
}

//
// void main() {
//   scanRootDir();
// }