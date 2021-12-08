import 'package:flutter_application_1/models/photo_model.dart';
import 'package:flutter_application_1/services/photo_model_service.dart';

class ListPhotoViewModel {
  List<PhotoViewModel> pictures;

  Future<void> fetchPictures() async {
    final apiResult = await PhotoModelService().fetchPicturesAPI();
    this.pictures = apiResult.map((e) => PhotoViewModel(e)).toList();
  }
}

class PhotoViewModel {
  final PhotoModel photoModel;

  PhotoViewModel(this.photoModel);
}
