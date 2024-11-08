import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:easy_localization/easy_localization.dart';

class ShareBottomSheet {
  static void showFileShareBottomSheet(
      BuildContext context, Uint8List byteData) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.file_copy),
                    SizedBox(width: 8.0),
                    Text(tr('fileIsReady'), style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  final file = XFile.fromData(byteData,
                      mimeType: 'application/x-binary');
                  Share.shareXFiles([file]);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                ),
                child: Text(tr('shareButton')),
              ),
            ],
          ),
        );
      },
    );
  }
}
