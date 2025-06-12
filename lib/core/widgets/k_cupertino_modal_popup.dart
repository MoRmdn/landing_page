import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_router/go_router.dart';

import '../../generated/l10n.dart' show S;
import '../utilities/color_util.dart' show ColorUtil;

class KMediaPicker<T> extends StatelessWidget {
  final BuildContext context;
  final bool allowVideo;
  final bool allowCamera;
  final bool allowGallery;
  final int? maxWidth;
  final int? maxHeight;
  final int? imageQuality;
  final Function(T? result) onResult;
  final String? cancelText;
  final String? cameraText;
  final String? galleryText;
  final String? videoText;
  final Color? iconColor;
  final Color? textColor;

  const KMediaPicker({
    super.key,
    required this.context,
    required this.onResult,
    this.allowVideo = false,
    this.allowCamera = true,
    this.allowGallery = true,
    this.maxWidth,
    this.maxHeight,
    this.imageQuality,
    this.cancelText,
    this.cameraText,
    this.galleryText,
    this.videoText,
    this.iconColor,
    this.textColor,
  });

  Future<void> _showPicker() async {
    final picker = ImagePicker();
    T? pickedFile;

    await showCupertinoModalPopup(
      context: context,
      builder: (_) {
        return CupertinoActionSheet(
          cancelButton: CupertinoButton(
            onPressed: () {
              context.pop();
              onResult(null);
            },
            child: Text(
              cancelText ?? S.of(context).cancel,
              style: TextStyle(color: textColor ?? ColorUtil.primaryColor),
            ),
          ),
          actions: [
            if (allowCamera) ...[
              CupertinoButton(
                child: Row(
                  children: <Widget>[
                    Icon(
                      CupertinoIcons.photo_camera_solid,
                      color: iconColor ?? ColorUtil.primaryColor,
                    ),
                    const SizedBox(width: 15),
                    Text(
                      cameraText ?? S.of(context).takePhoto,
                      style: TextStyle(
                        color: textColor ?? ColorUtil.primaryColor,
                      ),
                    ),
                  ],
                ),
                onPressed: () async {
                  pickedFile =
                      await picker.pickImage(
                            source: ImageSource.camera,
                            maxWidth: maxWidth?.toDouble(),
                            maxHeight: maxHeight?.toDouble(),
                            imageQuality: imageQuality,
                          )
                          as T?;
                  if (!context.mounted) return;
                  context.pop();
                  onResult(pickedFile);
                },
              ),
              if (allowVideo)
                CupertinoButton(
                  onPressed: () async {
                    pickedFile =
                        await picker.pickVideo(
                              source: ImageSource.camera,
                              maxDuration: const Duration(minutes: 10),
                            )
                            as T?;
                    if (!context.mounted) return;
                    context.pop();
                    onResult(pickedFile);
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(
                        CupertinoIcons.video_camera_solid,
                        color: iconColor ?? ColorUtil.primaryColor,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        videoText ?? S.of(context).recordVideo,
                        style: TextStyle(
                          color: textColor ?? ColorUtil.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
            if (allowGallery)
              CupertinoButton(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.insert_photo,
                      color: iconColor ?? ColorUtil.primaryColor,
                    ),
                    const SizedBox(width: 15),
                    Text(
                      galleryText ?? S.of(context).chooseFromGallery,
                      style: TextStyle(
                        color: textColor ?? ColorUtil.primaryColor,
                      ),
                    ),
                  ],
                ),
                onPressed: () async {
                  if (allowVideo) {
                    pickedFile =
                        await picker.pickMedia(maxWidth: maxWidth?.toDouble())
                            as T?;
                  } else {
                    pickedFile =
                        await picker.pickImage(
                              source: ImageSource.gallery,
                              maxWidth: maxWidth?.toDouble(),
                              maxHeight: maxHeight?.toDouble(),
                              imageQuality: imageQuality,
                            )
                            as T?;
                  }
                  if (!context.mounted) return;
                  context.pop();
                  onResult(pickedFile);
                },
              ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink(); // This widget doesn't render anything
  }

  // Helper method to show the picker
  static Future<T?> show<T>({
    required BuildContext context,
    required Function(T? result) onResult,
    bool allowVideo = false,
    bool allowCamera = true,
    bool allowGallery = true,
    int? maxWidth,
    int? maxHeight,
    int? imageQuality,
    String? cancelText,
    String? cameraText,
    String? galleryText,
    String? videoText,
    Color? iconColor,
    Color? textColor,
  }) async {
    final picker = KMediaPicker<T>(
      context: context,
      onResult: onResult,
      allowVideo: allowVideo,
      allowCamera: allowCamera,
      allowGallery: allowGallery,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: imageQuality,
      cancelText: cancelText,
      cameraText: cameraText,
      galleryText: galleryText,
      videoText: videoText,
      iconColor: iconColor,
      textColor: textColor,
    );
    await picker._showPicker();
    return null;
  }
}

// Usage example:
// KMediaPicker.show<XFile>(
//   context: context,
//   onResult: (file) {
//     if (file != null) {
//       // Handle the picked file
//     }
//   },
//   allowVideo: true,
//   maxWidth: 400,
// );
