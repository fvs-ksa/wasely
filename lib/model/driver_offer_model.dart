class DriverOfferModel {
  int id;
  String name;
  String phone;
  double price;
  String image;

  DriverOfferModel(
      {required this.image, required this.name, required this.id, required this.phone, required this.price});
}

List<DriverOfferModel>driverOffer = [
  DriverOfferModel(
      image: 'https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png',
      name: 'علي السيد',
      id: 100,
      phone: '+966506977251',
      price: 25),
  DriverOfferModel(
      image: 'https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png',
      name: 'ابراهيم علاء',
      id: 120,
      phone: '+966506977255',
      price: 22),
  DriverOfferModel(
      image: 'https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png',
      name: 'محمود جابر',
      id: 569,
      phone: '+966506977269',
      price: 22.5),
  DriverOfferModel(
      image: 'https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png',
      name: 'فهد نايف',
      id: 44,
      phone: '+966506977202',
      price: 24),
  DriverOfferModel(
      image: 'https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png',
      name: 'ياسين بونو',
      id: 78,
      phone: '+966506977208',
      price: 21),
];