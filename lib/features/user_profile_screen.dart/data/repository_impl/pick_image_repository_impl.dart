import 'dart:io';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/data/data_source/pick_image_remote_data_source.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/domain/entities/image_entity.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/domain/repo/pick_image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageImageRemoteDataSource remoteDataSource;

  ImageRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ImageEntity> uploadImage(File image,
      {Map<String, dynamic>? additionalData}) async {
    final imageModel = await remoteDataSource.uploadImage(image,
        additionalData: additionalData);
    return ImageEntity(
      name: imageModel.name ?? '',
      imageUrl: imageModel.imageUrl ?? '',
      imageId: imageModel.imageId ?? '',
    );
  }
}
