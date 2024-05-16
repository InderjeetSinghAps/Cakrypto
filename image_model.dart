class Images {
  String? thumb;
  String? small;
  String? large;

  Images({this.thumb, this.small, this.large});

  Images.fromJson(Map<String, dynamic> json) {
    thumb = json['thumb'];
    small = json['small'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumb'] = this.thumb;
    data['small'] = this.small;
    data['large'] = this.large;
    return data;
  }
}