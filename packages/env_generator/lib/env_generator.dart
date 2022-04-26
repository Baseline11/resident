library env_generator;

import 'dart:convert';
import 'dart:io';

import 'package:plist_parser/plist_parser.dart';

const String path = "../../../environments";

Map<String, dynamic> iOSOptions(Map<dynamic, dynamic> plist) {
  Map<String, dynamic> map = {};
  map.putIfAbsent('FSDK_IOS_API_KEY', () => plist['API_KEY']);
  map.putIfAbsent('FSDK_IOS_APP_ID', () => plist['GOOGLE_APP_ID']);
  map.putIfAbsent('FSDK_MESSENGER_ID', () => plist['GCM_SENDER_ID']);
  map.putIfAbsent('FSDK_PROJECT_ID', () => plist['PROJECT_ID']);
  map.putIfAbsent('FSDK_STORAGE_BUCKET', () => plist['STORAGE_BUCKET']);
  map.putIfAbsent('FSDK_IOS_CLIENT_ID', () => plist['CLIENT_ID']);
  map.putIfAbsent('FSDK_IOS_BUNDLE_ID', () => plist['BUNDLE_ID']);
  return map;
}

Map<String, dynamic> androidOptions(Map<dynamic, dynamic> json) {
  Map<String, dynamic> map = {};
  map.putIfAbsent('FSDK_ANDROID_API_KEY',
      () => json['client'][0]['api_key'][0]['current_key']);
  map.putIfAbsent('FSDK_ANDROID_APP_ID',
      () => json['client'][0]['client_info']['mobilesdk_app_id']);
  // map.putIfAbsent(
  //     'FSDK_MESSENGER_ID', () => json['project_info']['project_number']);
  // map.putIfAbsent('FSDK_PROJECT_ID', () => json['project_info']['project_id']);
  // map.putIfAbsent(
  //     'FSDK_STORAGE_BUCKET', () => json['project_info']['storage_bucket']);

  return map;
}

Future<void> createPlaceholderEnv() async {
  // This is to avoid build failures as one .env must be declared in pubspec for prod builds
  File file = File("../../../.env");
  await file.writeAsString("PLACEHOLDER", mode: FileMode.append);
}

Future<void> createEnvFile(String type,
    {required Map<String, dynamic> iOS,
    required Map<String, dynamic> android}) async {
  final fileName = ".env.$type";
  File file = File("../../../environments/$fileName");
  if (await file.exists()) {
    //Remove old file
    await file.delete();
  }

  //Append variables to environment file

  for (final key in iOS.keys) {
    await file.writeAsString("$key=${iOS[key]}\n", mode: FileMode.append);
  }

  for (final key in android.keys) {
    await file.writeAsString("$key=${android[key]}\n", mode: FileMode.append);
  }

  print("$fileName created");
  return;
}

void doEnvironmentMagic(String type) {
  // iOS dev environment
  Map<String, dynamic> iOSOption = {};
  Map<String, dynamic> androidOption = {};

  try {
    var devPlist =
        PlistParser().parseFileSync("$path/$type/GoogleService-Info.plist");
    iOSOption = iOSOptions(devPlist);
  } catch (e) {
    print("GoogleService-Info.plist not found in $path/$type");
    print("Skipping generating dev environment for iOS");
  }

  // Android dev environment
  try {
    final file = File('$path/$type/google-services.json');
    final string = file.readAsStringSync();
    final data = jsonDecode(string);
    androidOption = androidOptions(data);
  } catch (e) {
    print(e);
    print("google-services.json not found in $path/$type");
    print("Skipping generating dec environment for android");
  }

  createEnvFile(type, iOS: iOSOption, android: androidOption);
}

Future<List<String>> getSubDirectories() async {
  List<String> subDirectories = [];
  try {
    final dir = Directory(path);
    final List<FileSystemEntity> entities = await dir.list().toList();
    for (final entity in entities) {
      if (entity is Directory) {
        subDirectories.add(entity.path.split("/").last);
      }
    }
  } catch (e) {
    print(
        "Make sure a directory exists at $path with sub folders of your environments");
  }

  return subDirectories;
}

void main() async {
  final envFolders = await getSubDirectories();

  for (final type in envFolders) {
    doEnvironmentMagic(type);
  }
  createPlaceholderEnv();
}
