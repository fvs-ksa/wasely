import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:wasely/component/const_color.dart';
import 'package:wasely/cubit/cubit.dart';
import 'package:wasely/cubit/state.dart';

import '../../component/component.dart';
import '../../cubit/custom_order_cubit/cubit.dart';
import '../../cubit/custom_order_cubit/state.dart';
import '../../pallette.dart';

class CustomOrderScreen extends StatefulWidget {
  @override
  State<CustomOrderScreen> createState() => _CustomOrderScreenState();
}

class _CustomOrderScreenState extends State<CustomOrderScreen> {
  // const CustomOrderScreen({Key? key}) : super(key: key);
  List<dynamic> mainItemList = [];
  List<dynamic> DetailsItemListMaster = [];
  List<dynamic> DetailsItemList = [];
  TextEditingController orderDetailsController = TextEditingController();
  TextEditingController locationController=TextEditingController();
  String name = 'صيدليات';
  String? id;
  String? detailsId;
  String? selectVal;

  @override
  void initState() {
    super.initState();
    this.mainItemList.add({'id': 1, 'label': 'صيدليات'});
    this.mainItemList.add({'id': 2, 'label': 'هايبر ماركت'});
    this.mainItemList.add({'id': 3, 'label': 'اخرى'});
    this.DetailsItemListMaster = [
      {'ID': 1, 'Name': 'صيدليات النهدي', 'parentId': 1},
      {'ID': 2, 'Name': 'صيدليات المتحده', 'parentId': 1},
      {'ID': 3, 'Name': 'صيدليات اسيا', 'parentId': 1},
      {'ID': 1, 'Name': 'الرايه', 'parentId': 2},
      {'ID': 2, 'Name': 'باندا', 'parentId': 2},
      {'ID': 3, 'Name': 'اسواق المزرعه', 'parentId': 2},
      {'ID': 1, 'Name': 'اخرى', 'parentId': 3},
    ];
  }

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    var customOrderCubit = CustomOrderCubit.get(context);
    var generalCubit=GeneralCubit.get(context);
    return BlocConsumer<CustomOrderCubit, CustomOrderState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocConsumer<GeneralCubit,GeneralState>(listener: (context,state){},builder: (context,state){
         return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(),
              body: SingleChildScrollView(
                child: Form(
                  key: key,
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 8.6.w, vertical: 2.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // FormHelper.dropDownWidgetWithLabel(
                        //   context,
                        //   'نوع الطلب',
                        //   'اختار مكان طلبك',
                        //   id,
                        //   this.mainItemList,
                        //   (onChangedValue) {
                        //     this.id = onChangedValue.toString();
                        //     print('here we go $onChangedValue');
                        //   //  print(this.mainItemList[onChangedValue!]);
                        //     setState(() {
                        //       this.DetailsItemList =
                        //           this.DetailsItemListMaster.where((element) {
                        //        // print(element);
                        //         return element["parentId"].toString() ==
                        //             onChangedValue.toString();
                        //       }).toList();
                        //       this.detailsId = null;
                        //     });
                        //   },
                        //   (onValidate) {
                        //     if (onValidate == null) {
                        //       return 'من فضلك قم باختيار نوع الطلب';
                        //     }
                        //     return null;
                        //   },
                        //   borderRadius: 10,
                        //   borderColor: redColor,
                        //   borderFocusColor: redColor,
                        //   optionLabel: 'label',
                        //   optionValue: 'id',
                        // ),
                        // FormHelper.dropDownWidgetWithLabel(
                        //     context,
                        //     'اسم المكان',
                        //     'اختر المكان',
                        //     this.detailsId,
                        //     this.DetailsItemList, (onChanged) {
                        //   this.detailsId = onChanged;
                        // }, (onValidate) {
                        //   if (onValidate == null) {
                        //     return 'من فضلك قم باختيار مكان طلبك';
                        //   }
                        // },
                        //     borderRadius: 10,
                        //     borderColor: redColor,
                        //     borderFocusColor: redColor,
                        //     optionValue: 'ID',
                        //     optionLabel: 'Name'),
                        Align(
                            alignment: Alignment.topRight,
                            child: Text('تفاصيل الطلب',
                                style: TextStyle(
                                  fontSize: 20,

                                  fontWeight: FontWeight.bold,
                                ))),
                        TextFormField(
                          controller: orderDetailsController,
                          validator: (var value) {
                            if (value!.isEmpty) {
                              return 'تفاصيل طلبك مهمه النا';
                              // navigateAndReplacement(
                              //     context: context, child: OtpScreen());
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: 'اطلب هنا',
                          ),
                          maxLines: 5,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Text('اضافه صوره',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ))),
                        SizedBox(
                          height: 1.h,
                        ),
                        customOrderCubit.pickImage?
                        Align(
                          alignment: Alignment.topRight,
                          child: Stack(
                            children: [

                              Container(
                                  height: 10.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(),
                                    image: DecorationImage(image: FileImage(customOrderCubit.file!,),
                                        fit: BoxFit.cover
                                    ),
                                  )),
                              Positioned(
                                right: 10.w,
                                top: -1.h,
                                // alignment: Alignment.topLeft,
                                child: IconButton(onPressed: (){customOrderCubit.clearImage();}, icon: FaIcon(FontAwesomeIcons.minusCircle,color:redColor,)),
                              ),
                            ],
                          ),
                        ):  GestureDetector(
                          onTap: () {
                            customOrderCubit.pickCameraImage();
                          },
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 10.h,
                              width: 20.w,
                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all()),
                              child: Icon(Icons.add),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h,),
                        GestureDetector(
                          onTap: (){
                            generalCubit.getUserCurrentLocation();
                           // locationController.text=currentLocation;
                          },
                          child: TextFormField(
                          //  controller: currentLocation,
                            enabled: false,
                            validator: (val){
                              if(val!.isEmpty){
                                return 'يجب عليك تحديد موقعك';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                label: Text(generalCubit.isLoading?'${currentLocation}':'الموقع',softWrap: true,
                                   // overflow: TextOverflow.ellipsis
                                ),
                                icon: Icon(Icons.location_on)

                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('مبلغ التوصيل المتوقع',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
                            Text('20 ّّ~ 24 ر.س',style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height-2.h,
                        // ),
                       // Spacer(flex: 1,),
                        //SizedBox(height: MediaQuery.of(context).size.height*0.25,),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 8.0.sp),
                          child: mainButton(
                            width: 120.sp,
                            text: 'رفع الطلب',
                            color: redColor,
                            context: context,
                            fct: () {
                              if(currentLocation.isEmpty){
                                print('please fill location');
                              }
                              if (key.currentState!.validate()) {

                                print('object');
                                print('noo');
                                print('object');
                                // print(mainItemList);
                                // print(mainItemList[1].label);
                                print(detailsId);
                                // navigateAndReplacement(
                                //     context: context, child: OtpScreen());
                              }
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }, );
      },
    );
  }
}
