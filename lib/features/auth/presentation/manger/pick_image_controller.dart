import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myegypt/features/auth/presentation/view/coplete_info_view.dart';

class PickImage extends GetxController{

File? image ;
final picker = ImagePicker() ;
Reference storage = FirebaseStorage.instance.ref('images/${FirebaseAuth.instance.currentUser!.email}/profile.jpg');

void upload({required ImageSource imgSource })async{

  var pickedImage = await picker.pickImage(source: imgSource) ;
  if(pickedImage != null ){
    image =  File(pickedImage.path) ;


  }
  update();
}
void removeImage(){

  image = null ;
  update() ;

}
Future<void>toFireStorage()async{

    storage.putFile(image!);
    SignUpUserInfo.imagePath = await storage.getDownloadURL();
update() ;
}

}