import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/presentation/state/notes_cubit.dart';
import 'package:notes/presentation/widgets/notes_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (notesProvider) => NotesCubit(NotesState.initial()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const NotesListScreen(),
      ),
    );
  }
}
