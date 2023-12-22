import 'dart:io';

import 'package:neobis_android_chapter8/features/user_profile_screen.dart/domain/entities/image_entity.dart';

abstract class ImageRepository {
  Future<ImageEntity> uploadImage(File image,
      {Map<String, dynamic>? additionalData});
}
