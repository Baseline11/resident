library env_generator;

import 'dart:convert';
import 'dart:io';

import 'package:plist_parser/plist_parser.dart';

enum EnvironmentType {
  dev,
  staging,
}

extension EnvTypeExt on EnvironmentType {
  String get fileName {
    switch (this) {
      case EnvironmentType.dev:
        return ".env.dev";

      case EnvironmentType.staging:
        return ".env.staging";
    }
  }

  String get name {
    return this.toString().split(".").last;
  }
}

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

Future<void> createEnvFile(EnvironmentType type,
    {required Map<String, dynamic> iOS,
    required Map<String, dynamic> android}) async {
  File file = new File("../../../environments/${type.fileName}");
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

  print("${type.fileName} created");
  return;
}

void doEnvironmentMagic(EnvironmentType type) {
  // iOS dev environment
  Map<String, dynamic> iOSOption = {};
  Map<String, dynamic> androidOption = {};

  try {
    var devPlist = PlistParser().parseFileSync(
        "../../../environments/${type.name}/GoogleService-Info.plist");
    iOSOption = iOSOptions(devPlist);
  } catch (e) {
    print("GoogleService-Info.plist not found in ../../../environments/dev");
    print("Skipping generating dev environment for iOS");
  }

  // Android dev environment
  try {
    final file =
        File('../../../environments/${type.name}/google-services.json');
    final string = file.readAsStringSync();
    final data = jsonDecode(string);
    androidOption = androidOptions(data);
  } catch (e) {
    print("google-services.json not found in ../../../environments/dev");
    print("Skipping generating dec environment for android");
  }

  createEnvFile(type, iOS: iOSOption, android: androidOption);
}

void main() {
  for (final type in EnvironmentType.values) {
    doEnvironmentMagic(type);
  }
}
