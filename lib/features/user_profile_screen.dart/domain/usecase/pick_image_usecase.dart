import 'dart:io';

import 'package:neobis_android_chapter8/features/user_profile_screen.dart/domain/entities/image_entity.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/domain/repo/pick_image_repository.dart';

class UploadImageUseCase {
  final ImageRepository repository;

  UploadImageUseCase(this.repository);

  Future<ImageEntity> call(File image,
      {Map<String, dynamic>? additionalData}) async {
    return repository.uploadImage(image, additionalData: additionalData);
  }
}
