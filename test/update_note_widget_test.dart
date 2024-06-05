import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notes/domain/note/note.dart';
import 'package:notes/presentation/widgets/update_note_widget.dart';

void main() {
  group(UpdateNoteWidget, () {
    Future<void> renderUpdateNoteWidget(
      WidgetTester tester, {
      Note? noteDetails,
    }) async {
      await tester.pumpWidget(
        MaterialApp(
          home: UpdateNoteWidget(
            note: noteDetails,
          ),
        ),
      );
    }

    testWidgets(
      'behaves correctly when note is not passed.',
      (WidgetTester tester) async {
        await renderUpdateNoteWidget(tester);

        expect(find.text("Enter note details"), findsOneWidget);
        expect(find.byKey(const Key("titleField")), findsOneWidget);
        expect(find.byKey(const Key("descriptionField")), findsOneWidget);
        expect(find.byType(TextButton), findsOneWidget);
      },
    );
  });
}
