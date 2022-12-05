class RestaurantModel {
  String name;
  String status;
  int id;
  String image;
  List<AllMeals> allMeals;

  RestaurantModel(
      {required this.image,
      required this.status,
      required this.id,
      required this.name,
      required this.allMeals});
}

class AllMeals {
  int id;
  int mainId;
  String name;
  double price;
  String image;

  AllMeals(
      {required this.name,
      required this.id,
      required this.image,
      required this.price,
      required this.mainId});
}

List<RestaurantModel> restaurant = [
  RestaurantModel(
      image:
          'https://cdn4.premiumread.com/?url=https://alyaum.com/uploads/images/2021/03/07/1005793.png&w=500&q=72&f=jpg',
      status: 'مفتوح',
      id: 100,
      name: 'مطعم هيرفي',
      allMeals: [
        AllMeals(
          name: 'وجبه هيرفي كبيره',
          mainId: 100,
          id: 102,
          image:
              'https://www.offers-world.com/wp-content/uploads/2021/01/ErdbUBeXMAA4mT6.jpeg.jpg',
          price: 45,
        ),
        AllMeals(
          name: 'وجبه هيرفي الصغيره',
          mainId: 100,
          id: 103,
          image:
          'https://www.offers-world.com/wp-content/uploads/2021/01/ErdbUBeXMAA4mT6.jpeg.jpg',
          price: 45,
        ),
      ]),
  RestaurantModel(
      image:
          'https://i0.wp.com/kintakicook.com/wp-content/uploads/2020/02/1-2.png?resize=714%2C462&ssl=1',
      status: 'مغلق',
      id: 200,
      name: 'مطعم كنتاكي',
      allMeals: [
        AllMeals(
            name: 'وجبه كبيره',
            mainId: 200,
            id: 201,
            image:
                'https://joddor.com/wp-content/uploads/2021/04/%D9%85%D8%A7%D9%8A%D8%AA%D9%8A-%D8%B2%D9%86%D8%AC%D8%B1-%D8%A8%D9%88%D9%83%D8%B3.png',
            price: 22)
      ]),
  RestaurantModel(
      image: 'https://upload.wikimedia.org/wikipedia/ar/a/a7/Al-Tazaj_logo.jpg',
      status: 'مغلق',
      id: 300,
      name: 'الطازج',
      allMeals: [
        AllMeals(
            name: 'وجبه عائليه',
            mainId: 300,
            id: 301,
            image:
                'https://cdn.shopify.com/s/files/1/0612/0230/1187/products/Burger-Arabia-WB-Meal_1000x.png?v=1638179543',
            price: 63)
      ]),
  RestaurantModel(
      image:
          'https://w7.pngwing.com/pngs/542/937/png-transparent-pizza-hut-breadstick-buffalo-wing-kfc-hut-logo-signage-restaurant.png',
      status: 'مفتوح',
      id: 400,
      name: 'بيتزا هت',
      allMeals: [
        AllMeals(
            name: 'بيتزا جبن',
            mainId: 400,
            id: 401,
            image:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSp1bt8N9Wl9nwgFh4Y7Gw2hWgast_pjzQbQ&usqp=CAU',
            price: 34)
      ]),
];
