import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PodcastWindowHeader extends StatelessWidget {
  const PodcastWindowHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: Row(
          children: [
            Text(AppLocalizations.of(context)!.podcasts),
          ],
        ));
  }
}