import 'package:ficha_app_01/pages/Pfd_Viewer_Page.dart';
import 'package:flutter/material.dart';



class HomePdfWidget extends StatelessWidget {
  final List<String> pdfFiles;

  const HomePdfWidget({super.key, required this.pdfFiles});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: pdfFiles.length,
        itemBuilder: (context, index) {
          final pdfFile = pdfFiles[index];
          return Card(
            color: Colors.grey[200],
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.picture_as_pdf),
              ),
              title: Text(pdfFile),
              onTap: () {
                openPfd(context, "resumo-classes.pdf");
              },
            ),
          );
        },
      ),
    );
  }
  
  void openPfd(BuildContext context, String path) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewerPage(path: path),
      ),
    );
    
    
    }
}