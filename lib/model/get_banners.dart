class GetBanners {
  final List<Banners>? banners;

  GetBanners({
    this.banners,
  });

  GetBanners.fromJson(Map<String, dynamic> json)
      : banners = (json['banners'] as List?)?.map((dynamic e) => Banners.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'banners' : banners?.map((e) => e.toJson()).toList()
  };
}

class Banners {
  final int? id;
  final String? title;
  final String? image;

  Banners({
    this.id,
    this.title,
    this.image,
  });

  Banners.fromJson(Map<String, dynamic> json)
      : id = json['id'] ,
        title = json['title'] ,
        image = json['image'] ;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'image' : image
  };
}