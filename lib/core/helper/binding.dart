import 'package:get/get.dart';
import 'package:myegypt/features/Egypt/presentation/viewmodel/places_view_model.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
Get.lazyPut(() => PlacesViewModel());
  }







}