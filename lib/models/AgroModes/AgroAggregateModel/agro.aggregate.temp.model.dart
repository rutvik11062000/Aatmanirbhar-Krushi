class AgroAggregateTempratureResponse {
  List<R> r;

  AgroAggregateTempratureResponse({this.r});

  AgroAggregateTempratureResponse.fromJson(Map<String, dynamic> json) {
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
  int dt;
  double temp;
  int count;

  R({this.dt, this.temp, this.count});

  R.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    temp = json['temp'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['temp'] = this.temp;
    data['count'] = this.count;
    return data;
  }
}
