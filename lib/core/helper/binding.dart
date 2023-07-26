import 'package:get/get.dart';
import 'package:myegypt/features/Egypt/presentation/viewmodel/places_view_model.dart';
import 'package:myegypt/features/Guide/presentation/ViewModel/tour_guide_view_model.dart';
import 'package:myegypt/features/Hotels/presentation/viewModel/book_hotel_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlacesViewModel());

    Get.put(() => TourGuideViewModel(), permanent: true);
    Get.put(() => BookHotelViewModel(), permanent: true);
  }
}
