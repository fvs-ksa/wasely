import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/component.dart';
import 'package:wasely/component/custom_drawer.dart';
import 'package:wasely/cubit/cubit.dart';
import 'package:wasely/cubit/home_cubit/cubit.dart';
import 'package:wasely/cubit/home_cubit/state.dart';
import 'package:wasely/cubit/state.dart';
import 'package:wasely/model/bannner_model.dart';
import 'package:wasely/model/get_banners.dart';
import 'package:wasely/model/restaurant_model.dart';
import 'package:wasely/screens/main_screen/custom_restaurant.dart';
import 'package:wasely/services/base_url.dart';
import '../../component/const_color.dart';
import '../../component/constant_fonts.dart';
import '../../shimmer/shimmer_carousel.dart';
import '../../shimmer/shimmer_loading_home.dart';
import '../inner_screen/custom_order/custom_order.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<RestaurantModel> _foundUser = [];
  List<RestaurantModel> shimmerList = [];
  bool isLoading = false;

  void filterSearchResult(String query) {
    List<RestaurantModel> result = [];
    if (query.isEmpty) {
      result = restaurant;
    } else {
      result = restaurant
          .where((element) =>
          element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundUser = result;
    });
  }

  @override
  void initState() {
    _foundUser = restaurant;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var generalCubit = GeneralCubit.get(context);
    var homeCubit = HomeCubit.get(context);

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is AddAddressSuccessState) {
          return showToast(
              text: 'تم تحديث موقعك بنجاح', state: ToastState.SUCCESS);
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            key: _key,
            endDrawer: Container(
              width: 50.w,
              child: Drawer(
                child: CustomDrawer(),
              ),
            ),
            appBar: PreferredSize(
                child: Container(
                  height: 100.h,
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    AppBar(
                      actions: [
                        // IconButton(onPressed: () {
                        //   return homeCubit.getBanners(zoneId: zone_ids);
                        // }, icon: Icon(Icons.add)),
                        IconButton(
                            onPressed: () {
                              _key.currentState!.openEndDrawer();
                            },
                            icon: Icon(Icons.menu))
                      ],
                    ),
                    Positioned(
                        top: 11.h,
                        left: 0,
                        child: InkWell(
                          onTap: () {
                            homeCubit.getUserCurrentLocation();
                            // generalCubit.addAddress(address: currentLocation, lat: generalCubit.position.latitude, lng: generalCubit.position.longitude);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Text(
                                    homeCubit.isLoading
                                        ? '${currentLocation}'
                                        : '',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11.sp),
                                  ),
                                ),
                                Text(
                                  ' : توصيل الي',
                                  style: whiteHeadStyle,
                                ),
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: 7.h,
                            color: amberColor,
                          ),
                        )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: textFormField(
                          child: Icons.search,
                          onchange: (value) => filterSearchResult(value),
                          controller: searchController,
                          fct: (fct) {},
                          text: 'بحث'),
                    )
                  ]),
                ),
                preferredSize: Size.fromHeight(25.h)),
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    !homeCubit.isBannersGet ? ShimmerCarouselLoading(
                      height: 20.h,) :
                    Padding(
                      padding:  EdgeInsets.only(top: 2.h),
                      child: carouselSlider(banners: homeCubit.getBannersModel),
                    ),
                    // CarouselSlider.builder(
                    //
                    //   itemCount: homeCubit.getBannersModel.banners?.length,
                    //   itemBuilder: (context, int i, int y) {
                    //     return Card(
                    //         clipBehavior: Clip.antiAliasWithSaveLayer,
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(15)
                    //         ),
                    //         elevation: 5,
                    //         child: Image(image: NetworkImage(
                    //             homeCubit.getBannersModel.banners![0].image!),
                    //           fit: BoxFit.cover,));
                    //   },
                    //
                    //   options: CarouselOptions(
                    //
                    //     height: 20.h,
                    //     aspectRatio: 16 / 9,
                    //     viewportFraction: 0.8,
                    //     initialPage: 0,
                    //     enableInfiniteScroll: true,
                    //     reverse: false,
                    //     autoPlay: true,
                    //     autoPlayAnimationDuration:
                    //     Duration(milliseconds: 800),
                    //     autoPlayInterval: Duration(seconds: 3),
                    //     enlargeCenterPage: true,
                    //     autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                    //     scrollDirection: Axis.horizontal,
                    //
                    //   ),
                    //
                    // ),
                    SizedBox(height: 5.h,),
                    // token == null ? !homeCubit.isAddAddress ? ShimmerLoading(
                    //   height: 20.h,) :
                    Padding(
                      padding: EdgeInsets.all(10.0.sp),
                      child: InkWell(
                        onTap: () {
                          navigateTo(
                              context: context, child: CustomOrderScreen());
                        },
                        child: Container(
                          height: 12.h,
                          decoration: BoxDecoration(
                            // border: Border.all(),
                            // borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0.1.w),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1.w),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  height: 10.h,
                                  width: 27.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          fit: BoxFit.fitHeight,
                                          image: AssetImage(
                                              'assets/app icon.png')
                                      )),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.h),
                                child: Container(
                                  child: Column(

                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Container(
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width * .29,
                                            child: Text(
                                              'كل الي تحتاجه',
                                              style: TextStyle(
                                                  fontSize: 15.sp),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 2.h,),
                                      Text('ارفع طلبك مخصوص', style: TextStyle(
                                          color: redColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),)

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                       // : Container(),


                    ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if (!homeCubit.isLoadingShimmer) {
                            return InkWell(
                                onTap: () {
                                  print(restaurant[index]);
                                },
                                child: mainnContainer(
                                    context, _foundUser[index], index));
                          } else {
                            return ShimmerLoading(height: 20.h);
                          }
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            endIndent: 10.sp,
                            indent: 10.sp,
                            thickness: 2,
                          );
                        },
                        itemCount: _foundUser.length),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget carouselSlider({required GetBanners banners}) {
    return Column(
      children: [
        CarouselSlider(items: banners.banners?.map((e) =>
            Image(image: NetworkImage('${e.image}'), fit:
            BoxFit.cover, width: double.infinity,),).toList(),
            options: CarouselOptions(
              height: 20.h,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayAnimationDuration:
              Duration(milliseconds: 800),
              autoPlayInterval: Duration(seconds: 3),
              enlargeCenterPage: true,
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              scrollDirection: Axis.horizontal,

            ),)
      ],
    );
  }

  Widget mainnContainer(BuildContext context, RestaurantModel model,
      int index) {
    return mainContainer(
        context: context,
        status: model.status,
        color: model.status == 'مفتوح' ? Colors.green : redColor,
        heightMainContainer: 14.h,
        heightSecondContainer: 10.h,
        widthSecondContainer: 27.w,
        title: model.name,
        // address: 'شارع التحليه',
        distance: 1.4,
        //  rate: 4.2,
        fct: () {
          print(model.id);
          navigateTo(
              context: context,
              child: CustomRestaurant(
                index: 200,
                nameOfRestaurant: model.name,
              ));
        },
        image: NetworkImage(model.image));
  }


}
