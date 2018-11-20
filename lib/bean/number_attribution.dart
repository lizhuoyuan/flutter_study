/*
 * author: Created by 李卓原 on 2018/11/19.
 * email: zhuoyuan93@gmail.com
 * 号码归属地信息的实体类
 */

class NumberAttribution {
  String province;
  String city;
  String areacode;
  String zip;
  String company;
  String card;

  NumberAttribution(
      {this.province,
      this.city,
      this.areacode,
      this.zip,
      this.company,
      this.card});

  NumberAttribution.fromJson(Map<String, dynamic> json) {
    province = json['province'];
    city = json['city'];
    areacode = json['areacode'];
    zip = json['zip'];
    company = json['company'];
    card = json['card'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['province'] = this.province;
    data['city'] = this.city;
    data['areacode'] = this.areacode;
    data['zip'] = this.zip;
    data['company'] = this.company;
    data['card'] = this.card;
    return data;
  }
}
