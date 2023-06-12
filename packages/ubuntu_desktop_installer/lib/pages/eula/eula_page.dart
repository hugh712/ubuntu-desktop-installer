import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
//import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'eula_model.dart';

class EulaPage extends ConsumerWidget {
  const EulaPage({super.key});

  static Future<bool> load(BuildContext context, WidgetRef ref) {
    final model = ref.read(eulaModelProvider);
    return model.init().then((_) {
      return model.playWelcomeSound();
    }).then((_) => true);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flavor = Flavor.of(context);
    //final model = ref.watch(eulaModelProvider);
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.welcomePageTitle(flavor.name)),
      ),
      content: FractionallySizedBox(
        widthFactor: 0.5,
        child: Column(
          children: [
            const SizedBox(height: kContentSpacing / 2),
            const MascotAvatar(),
            const SizedBox(height: kContentSpacing),
            Text(lang.welcomeHeader),
            const SizedBox(height: kContentSpacing / 2),

            const SizedBox(height: kContentSpacing),
          ],
        ),
      ),
      bottomBar: WizardBar(
        leading: WizardButton.previous(context),
        trailing: [
          WizardButton.next(
            context,
            onNext: () {
              log.info('Eula Next');
            },
          ),
        ],
      ),
    );
  }
}
