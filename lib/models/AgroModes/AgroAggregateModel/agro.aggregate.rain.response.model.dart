class AgroAggregateRainResponse {
  List<R> r;

  AgroAggregateRainResponse({this.r});

  AgroAggregateRainResponse.fromJson(Map<String, dynamic> json) {
    if (json['r'] != null) {
      r = new List<R>();
      json['r'].forEach((v) {
        r.add(new R.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.r != null) {
      data['r'] = this.r.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class R {
  String dt;
  int rain;
  int count;

  R({this.dt, this.rain, this.count});

  R.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    rain = json['rain'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['rain'] = this.rain;
    data['count'] = this.count;
    return data;
  }
}
