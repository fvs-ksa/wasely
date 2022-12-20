import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasely/cubit/order_details_cubit/state.dart';
import 'package:wasely/model/palce_location_model.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(InitialOrderDetailsState());

  static OrderDetailsCubit get(context) => BlocProvider.of(context);
  late Position position;

  void getCurrentLocation() async {
    emit(GetCurrentLocOrderDetailsLoadingState());
    position = await GeolocatorPlatform.instance.getCurrentPosition();
    print(position.latitude);
    emit(GetCurrentLocOrderDetailsSuccessState());

  }
  Set<Marker> markers = Set();
  Future<Uint8List> getBytesFromAsset({required String path, required int width}) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
  late final Uint8List customMarkerDriver;
  late final Uint8List customMarkerRestaurant;
  addMarkers() async {
    customMarkerDriver = await getBytesFromAsset(
        path: 'assets/car.png', //paste the custom image path
        width: 100 // size of custom image as marker
    );
    customMarkerRestaurant = await getBytesFromAsset(
         path: 'assets/restaurantLogo.png', //paste the custom image path
         width: 100 // size of custom image as marker
     );
    markers.add(
        Marker( //add start location marker
          markerId: MarkerId('driver'),
          position: LatLng(21.552383, 39.178743), //position of marker
          infoWindow: InfoWindow( //popup info
            title: 'Starting Point ',
            snippet: 'Start Marker',
          ),
          icon: BitmapDescriptor.fromBytes(customMarkerDriver), //Icon for Marker
        ),

    );
     markers.add(
       Marker( //add start location marker
         markerId: MarkerId('restaurant'),
         position: LatLng(21.562475, 39.178850), //position of marker
         infoWindow: InfoWindow( //popup info
           title: 'Starting Point ',
           snippet: 'Start Marker',
         ),
         icon: BitmapDescriptor.fromBytes(customMarkerRestaurant), //Icon for Marker
       ),

     );
    // emit(AddDriverMarkerState());
  }


 //BitmapDescriptor markBitMap= BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/car.png') as BitmapDescriptor;

  // Marker driverMarker =
}
