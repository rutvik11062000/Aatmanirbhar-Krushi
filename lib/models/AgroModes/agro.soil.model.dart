class AgroSoilResponse {
  int dt;
  double t10;
  double moisture;
  double t0;

  AgroSoilResponse({this.dt, this.t10, this.moisture, this.t0});

  AgroSoilResponse.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    t10 = json['t10'];
    moisture = json['moisture'];
    t0 = json['t0'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['t10'] = this.t10;
    data['moisture'] = this.moisture;
    data['t0'] = this.t0;
    return data;
  }
}
