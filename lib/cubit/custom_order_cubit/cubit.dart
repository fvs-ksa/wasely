import 'package:bloc/bloc.dart';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wasely/cubit/custom_order_cubit/state.dart';

class CustomOrderCubit extends Cubit<CustomOrderState>{
  CustomOrderCubit():super(InitialCustomOrderState());
  static CustomOrderCubit get(context)=>BlocProvider.of(context);

  File? file;
  bool pickImage=false;
  pickCameraImage()async{
    final XFile? pickedFile=await ImagePicker().pickImage(source: ImageSource.camera);
    file=(File(pickedFile!.path));
    pickImage=true;
    emit(PickCameraImageCustomOrderState());
  }
  pickGalleryImage()async{
    final XFile? pickedFile=await ImagePicker().pickImage(source: ImageSource.gallery);
    file=(File(pickedFile!.path));
    pickImage=true;
    emit(PickGalleryImageCustomOrderState());
  }
  clearImage(){
    pickImage=false;
    emit(ClearImageCustomOrderState());
  }
}