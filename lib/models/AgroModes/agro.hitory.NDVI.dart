class AgroHistoryNDVI {
  List<R> r;

  AgroHistoryNDVI({this.r});

  AgroHistoryNDVI.fromJson(Map<String, dynamic> json) {
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
  String source;
  int zoom;
  int dc;
  int cl;
  Data data;

  R({this.dt, this.source, this.zoom, this.dc, this.cl, this.data});

  R.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    source = json['source'];
    zoom = json['zoom'];
    dc = json['dc'];
    cl = json['cl'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['source'] = this.source;
    data['zoom'] = this.zoom;
    data['dc'] = this.dc;
    data['cl'] = this.cl;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  double std;
  double p75;
  double min;
  double max;
  double median;
  double p25;
  int num;
  double mean;

  Data(
      {this.std,
      this.p75,
      this.min,
      this.max,
      this.median,
      this.p25,
      this.num,
      this.mean});

  Data.fromJson(Map<String, dynamic> json) {
    std = json['std'];
    p75 = json['p75'];
    min = json['min'];
    max = json['max'];
    median = json['median'];
    p25 = json['p25'];
    num = json['num'];
    mean = json['mean'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['std'] = this.std;
    data['p75'] = this.p75;
    data['min'] = this.min;
    data['max'] = this.max;
    data['median'] = this.median;
    data['p25'] = this.p25;
    data['num'] = this.num;
    data['mean'] = this.mean;
    return data;
  }
}
