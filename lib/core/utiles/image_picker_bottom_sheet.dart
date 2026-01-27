import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';

Future<XFile?> showImagePickerBottomSheet({
    required BuildContext context,
  }) async {
    ImagePicker imagePicker = ImagePicker();

    return await showModalBottomSheet<XFile>(
      context: context,
      builder: (_) {
        return Center(
          child: Column(
            children: [
              ListTile(
                title: const Text('Camera'),
                onTap: () async {
                  final image = await imagePicker.pickImage(
                    source: ImageSource.camera,
                  );
                  context.navigateBack<XFile>(image);
                },
              ),
              ListTile(
                title: const Text('Gallery'),
                onTap: () async {
                  final image = await imagePicker.pickImage(
                    source: ImageSource.gallery,
                  );
                  context.navigateBack<XFile>(image);
                },
              ),
            ],
          ),
        );
      },
    );
  }

