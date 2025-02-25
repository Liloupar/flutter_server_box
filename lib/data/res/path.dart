import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:toolbox/core/utils/platform.dart';

Future<Directory> get docDir async {
  if (isAndroid) {
    final dir = await getExternalStorageDirectory();
    if (dir != null) {
      return dir;
    }
    // fallthrough to getApplicationDocumentsDirectory
  }
  return await getApplicationDocumentsDirectory();
}

Future<Directory> get sftpDir async {
  final dir = Directory('${(await docDir).path}/sftp');
  return dir.create(recursive: true);
}

Future<Directory> get fontDir async {
  final dir = Directory('${(await docDir).path}/font');
  return dir.create(recursive: true);
}
