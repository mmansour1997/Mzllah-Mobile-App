import 'package:flutter/material.dart';
import '../l10n/L10n.dart';
import '../providers/locale_provider.dart';
import 'package:provider/provider.dart';

class LanguageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final flag = L10n.getFlag(locale.languageCode);

    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 72,
        child: Text(
          flag,
          style: TextStyle(fontSize: 80),
        ),
      ),
    );
  }
}

class LanguagePickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale ?? Locale('en');

    return DropdownButtonHideUnderline(
      child: Padding(
        padding: provider.locale.toString() == "en"
            ? const EdgeInsets.fromLTRB(13, 0, 0, 0)
            : const EdgeInsets.fromLTRB(0, 0, 13, 0),
        child: DropdownButton(
          value: locale,
          icon: Container(width: 12),
          items: L10n.all.map(
            (locale) {
              final flag = L10n.getFlag(locale.languageCode);

              return DropdownMenuItem(
                child: Center(
                  child: Text(
                    flag,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                value: locale,
                onTap: () {
                  final provider =
                      Provider.of<LocaleProvider>(context, listen: false);

                  provider.setLocale(locale);
                },
              );
            },
          ).toList(),
          onChanged: (_) {},
        ),
      ),
    );
  }
}
