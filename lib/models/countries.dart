class Countries {
  List<CountriesData>? data;
  String? message;

  Countries({this.data, this.message});

  Countries.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CountriesData>[];
      json['data'].forEach((v) {
        data!.add(CountriesData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class CountriesData {
  int? id;
  String? flagImage;
  String? name;
  String? currency;
  String? prefixNumber;

  CountriesData({this.id, this.flagImage, this.name, this.currency, this.prefixNumber});

  CountriesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    flagImage = json['flag_image'];
    name = json['name'];
    currency = json['currency'];
    prefixNumber = json['prefix_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['flag_image'] = this.flagImage;
    data['name'] = this.name;
    data['currency'] = this.currency;
    data['prefix_number'] = this.prefixNumber;
    return data;
  }
}
