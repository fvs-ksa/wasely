import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:wasely/component/component.dart';
import 'package:wasely/component/custom_drawer.dart';
import 'package:wasely/cubit/cubit.dart';
import 'package:wasely/cubit/home_cubit/cubit.dart';
import 'package:wasely/cubit/home_cubit/state.dart';
import 'package:wasely/cubit/state.dart';
import 'package:wasely/model/restaurant_model.dart';
import 'package:wasely/screens/main_screen/custom_restaurant.dart';
import '../../component/const_color.dart';
import '../../component/constant_fonts.dart';
import '../../shimmer/shimmer_loading_home.dart';

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
    var generalCubit = GeneralCubit.get(context);
    var homeCubit = HomeCubit.get(context);

    return BlocConsumer<GeneralCubit, GeneralState>(
      listener: (context, state) {
        if (state is GetCurrentAddressLoadingState) {
          return showLoaderDialog(context: context);
        } else if (state is GetCurrentAddressSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              key: _key,
              endDrawer: Container(
                width: 170.sp,
                child: Drawer(
                  child: CustomDrawer(),
                ),
              ),
              appBar: PreferredSize(
                  child: Container(
                    height: 180.sp,
                    child: Stack(alignment: Alignment.bottomCenter, children: [
                      AppBar(
                        actions: [
                          IconButton(
                              onPressed: () {
                                _key.currentState!.openEndDrawer();
                              },
                              icon: Icon(Icons.menu))
                        ],
                      ),
                      Positioned(
                          top: 70.sp,
                          left: 0,
                          child: InkWell(
                            onTap: () {
                              generalCubit.getUserCurrentLocation();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Text(
                                      generalCubit.isLoading ? '${currentLocation}' : '',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13),
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
                              width: MediaQuery.of(context).size.width,
                              height: 40.sp,

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
                  preferredSize: Size.fromHeight(170.sp)),
              body: Directionality(
                textDirection: TextDirection.rtl,
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (!homeCubit.isLoadingShimmer) {
                        return InkWell(
                            onTap: () {
                              print(restaurant[index]);
                            },
                            child: mainnContainer(
                                context, _foundUser[index], index));
                      } else {
                        return ShimmerLoading(height: 200.sp);
                      }
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        endIndent: 10.sp,
                        indent: 10.sp,
                      //  color: Colors.green,
                        thickness: 2,
                      );
                    },
                    itemCount: _foundUser.length),
              ),
            );
          },
        );
      },
    );
  }

  Widget mainnContainer(
      BuildContext context, RestaurantModel model, int index) {
    return mainContainer(
        context: context,
        status: model.status,
        color: model.status == 'مفتوح' ? Colors.green : redColor,
        heightMainContainer: 95.sp,
        heightSecondContainer: 60.sp,
        widthSecondContainer: 76.sp,
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

  showLoaderDialog({required BuildContext context}) {
    AlertDialog alertDialog = AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 100.sp),
      // contentPadding: EdgeInsets.zero,
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      content: Builder(builder: (context) {
        return Container(
          //  width: 80,
          height: 50.sp,
          child: Center(child: CircularProgressIndicator()),
        );
      }),
    );
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }
}
