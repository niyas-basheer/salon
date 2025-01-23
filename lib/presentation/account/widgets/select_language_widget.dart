import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/core/bloc/language_bloc/language_bloc.dart';
import 'package:salon_app/core/constants/image_type_const.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/data/language_data.dart';
import 'package:salon_app/presentation/widgets/image_widget.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// A widget for selecting the app language.
class SelectLanguageWidget extends StatelessWidget {
  /// Constructs a [SelectLanguageWidget] with the given [alignment].
  const SelectLanguageWidget({super.key, this.alignment = MainAxisAlignment.end});

  /// The alignment of the widget within its parent.
  final MainAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: alignment,
          children: [
            _buildPopupMenuButton(context, state),
          ],
        );
      },
    );
  }

  /// Builds the popup menu button for selecting the language.
  Widget _buildPopupMenuButton(BuildContext context, LanguageState state) {
    return PopupMenuButton(
      child: _buildLanguageButton(context, state),
      itemBuilder: (BuildContext context) {
        return [
          for (var item in LanguageData.list)
            PopupMenuItem(
              child: ListTile(
                leading: ImageWidget(
                    image: item['flag'],
                    height: 22,
                    width: 22,
                    type: ImageType.asset),
                title: Text('${item['title']}'),
              ),
              onTap: () {
                context
                    .read<LanguageBloc>()
                    .add(ChangeLanguage(locale: Locale(item['locale'])));
              },
            ),
        ];
      },
    );
  }

  /// Builds the button for displaying the current language.
  Widget _buildLanguageButton(BuildContext context, LanguageState state) {
    return Container(
      decoration: BoxDecoration(
          color: ColorHelper.grey20Lite(context),
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageWidget(
              image: currentLocaleFlag(state),
              height: 22,
              width: 22,
              type: ImageType.asset),
          spacing(width: 10),
          Text(
            currentLocaleTitle(state),
            style: StyleHelper.titleSmall(context)
                ?.copyWith(color: ColorHelper.titleMediumColor(context)),
          ),
          spacing(width: 2),
          const Icon(Icons.expand_more)
        ],
      ),
    );
  }

  /// Retrieves the flag for the current locale.
  String currentLocaleFlag(LanguageState state) {
    final dynamic currentFlag = LanguageData.list.singleWhere(
      (element) => element['locale'] == state.locale?.languageCode,
    );

    return currentFlag['flag'];
  }

  /// Retrieves the title for the current locale.
  String currentLocaleTitle(LanguageState state) {
    final dynamic currentTitle = LanguageData.list.singleWhere(
      (element) => element['locale'] == state.locale?.languageCode,
    );

    return currentTitle['title'];
  }
}
