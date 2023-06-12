//import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
//import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
//import 'package:ubuntu_widgets/ubuntu_widgets.dart' show KeySearchX;

/// @internal
final log = Logger('eula');

final eulaModelProvider = ChangeNotifierProvider((ref) {
  return EulaModel(
    sound: tryGetService<SoundService>(),
  );
});

/// Implements the business logic of the locale page.
class EulaModel extends SafeChangeNotifier {
  /// Creates a model with the specified [client].
  EulaModel({
    required SoundService? sound,
  })  : _sound = sound;

  final SoundService? _sound;

  /// Loads available languages.
  Future<void> init() async {
    log.info('Eula Init');
  }


  Future<void> playWelcomeSound() async => _sound?.play('system-ready');

}
