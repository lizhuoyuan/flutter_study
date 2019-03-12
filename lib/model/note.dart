/*
 * author: Created by 李卓原 on 2019/3/12.
 * email: zhuoyuan93@gmail.com
 *
 */

class Note {
  int _pointID;
  String _image;
  int _contractId;
  int _publicationId;
  double _pointLng;
  double _pointLat;

  Note(this._pointID, this._image, this._contractId, this._publicationId,
      this._pointLng, this._pointLat);

  int get pointID => _pointID;

  String get image => _image;

  int get contractId => _contractId;

  int get publicationId => _publicationId;

  double get pointLng => _pointLng;

  double get pointLat => _pointLat;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['pointid'] = _pointID;
    map['image'] = _image;
    map['contractId'] = _contractId;
    map['publicationId'] = _publicationId;
    map['pointLng'] = _pointLng;
    map['pointLat'] = _pointLat;
    return map;
  }

  Note.fromMap(Map<String, dynamic> map) {
    this._publicationId = map['publicationId'];
    this._pointID = map['pointid'];
    this._image = map['image'];
    this._contractId = map['contractId'];
    this._pointLng = map['pointLng'];
    this._pointLat = map['pointLat'];
  }
}
