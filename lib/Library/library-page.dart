import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  final List<PlatformFile>  files;
  final ValueChanged<PlatformFile> onOpenedFile;
  const LibraryPage({
    Key? key,
    required this.files,
    required this.onOpenedFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF14161B),
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled)
          => [SliverAppBar(
            backgroundColor: const Color(0xFF14161B),
            automaticallyImplyLeading: false,
            floating: true,
            snap: true,
            centerTitle: true,
            title: const Text(
              'Thư viện',
              style: TextStyle(
                  color: Color(0xFF83899F),
                  fontSize: 25,
                  fontWeight: FontWeight.w400
              ),
            ),
          )],
          body: ListView()
      ),
    );
  }
}
