import 'dart:io';

import 'package:bebks_ebooks/Library/library-page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class AddBooks extends StatelessWidget {
  const AddBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF14161B),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/images/add-books.png'),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text(
              'Tải lên cuốn sách yêu thích của bạn và bắt đầu thưởng thức!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Text(
              textAlign: TextAlign.center,
              'Bạn có thể tải lên sách có định dạng .PDF',
              style: TextStyle(
                  color: Color(0xff83899f),
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () async {
              final result = await FilePicker.platform.pickFiles(
                allowMultiple: true,
                type: FileType.custom,
                allowedExtensions: ['pdf', 'epub']
              );
              if (result == null) return;

              openFiles(result.files, context);
            },
            icon: Icon(
              Icons.add_box,
              color: Colors.white,
            ),
            label: Text(
              'Thêm sách .PDF mới',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8C31FF),
                minimumSize: Size(330, 48),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
          )
        ],
      ),
    );
  }
  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');

    return File(file.path!).copy(newFile.path);
  }

  void openFiles(List<PlatformFile> files, BuildContext context) => Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LibraryPage(
        files: files,
        onOpenedFile: openFile,
      ),
  ), );

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}
