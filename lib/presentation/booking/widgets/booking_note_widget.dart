import 'package:flutter/material.dart';
import 'package:salon_app/core/utils/global_methods.dart';
import 'package:salon_app/presentation/widgets/spacing.dart';

/// This widget provides a text input field for users to enter additional notes.
class BookingNoteWidget extends StatelessWidget {
  /// Constructor for the [BookingNoteWidget] class.
  ///
  /// The [key] parameter is optional and is used to uniquely identify the widget.
  /// The [controller] parameter is a [TextEditingController] used to control the text input field.
  const BookingNoteWidget({super.key, required this.controller});

  /// Controller for the text input field.
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            trans(context, key: 'note'),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          spacing(height: 10),
          TextFormField(
            controller: controller,
            keyboardType: TextInputType.emailAddress,
            minLines: 4,
            maxLines: null,
            decoration: fieldDeco(
                hintText: trans(context, key: 'type_your_note_here'),
                borderRadius: BorderRadius.circular(15)),
          ),
        ],
      ),
    );
  }
}
