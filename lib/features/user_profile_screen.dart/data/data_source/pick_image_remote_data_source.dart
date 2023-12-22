import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:convert';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/data/models/image_model.dart';

abstract class ImageImageRemoteDataSource {
  Future<ImageModel> uploadImage(File image,
      {Map<String, dynamic>? additionalData});
}

class ImageRemoteDataSourceImpl extends ImageImageRemoteDataSource {
  final Dio dio;

  ImageRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<ImageModel> uploadImage(File image,
      {Map<String, dynamic>? additionalData}) async {
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(image.path,
          filename: image.path.split('/').last),
      if (additionalData != null) "json_file": json.encode(additionalData),
    });

    final response = await dio.post(
      '/api/user/my-photo',
      options: Options(extra: {"requiresToken": false}),
      data: formData,
    );

    if (response.statusCode == 200) {
      return ImageModel.fromJson(response.data);
    } else {
      throw Exception('Failed to upload image: ${response.statusCode}');
    }
  }
}
