class CitiesResponse {
  List<CitiesResponseData>? data;
  String? message;

  CitiesResponse({this.data, this.message});

  CitiesResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CitiesResponseData>[];
      json['data'].forEach((v) {
        data!.add(CitiesResponseData.fromJson(v));
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

class CitiesResponseData {
  int? id;
  String? name;

  CitiesResponseData({this.id, this.name});

  CitiesResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
