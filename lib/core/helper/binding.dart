import 'package:get/get.dart';
import 'package:myegypt/features/Egypt/presentation/viewmodel/places_view_model.dart';
import 'package:myegypt/features/Egypt/presentation/viewmodel/tourists_view_model.dart';
import 'package:myegypt/features/Guide/presentation/ViewModel/tour_guide_view_model.dart';
import 'package:myegypt/features/Hotels/presentation/viewModel/book_hotel_view_model.dart';
import 'package:myegypt/features/auth/presentation/manger/Auth_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>TouristsViewModel()) ;
    Get.lazyPut(() => PlacesViewModel() , );
    Get.lazyPut(() => TourGuideViewModel());
    Get.lazyPut(() => BookHotelViewModel(),);
  }
}
