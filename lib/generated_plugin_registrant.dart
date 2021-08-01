//
// Generated file. Do not edit.
//

// ignore_for_file: lines_longer_than_80_chars

import 'package:audio_manager/audio_manager_web.dart';
import 'package:connectivity_for_web/connectivity_for_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  AudioManagerPlugin.registerWith(registrar);
  ConnectivityPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
