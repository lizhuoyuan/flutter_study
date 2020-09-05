import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/constant.dart';
import 'package:flutter_app/utils/HttpUtil.dart';
import 'package:mapbox_search/mapbox_search.dart';

class MapSearchPage extends StatefulWidget {
  @override
  _MapSearchPageState createState() => _MapSearchPageState();
}

class _MapSearchPageState extends State<MapSearchPage> {
  static const String key =
      'pk.eyJ1Ijoiemh1b3l1YW45OSIsImEiOiJja2VwcXducjUya291MnFucDNlMmZmeDAzIn0.JoxtgAjdqfpZZz-dUJLykQ';

  TextEditingController controller = TextEditingController();

  List addressList = [];

  var placesSearch = PlacesSearch(
    apiKey: key,
    limit: 8,
  );

  var selectAddress;
  var loadingText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: baiduSearch,
      ),
      appBar: AppBar(
        title: Text(loadingText),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView(
          children: <Widget>[
            Text('选择的地址:$selectAddress'),
            TextField(
              onChanged: (text) async {
                setState(() {
                  loadingText = '正在搜寻位置';
                });
                getGooglePlaces(text);
                var places = await getPlaces(text);

                setState(() {
                  loadingText = '搜索完成';
                  addressList = places;
                });
              },
              decoration: InputDecoration(
                hintText: '输入地址',
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: _itemBuilder,
              itemCount: addressList.length,
            )
          ],
        ),
      ),
    );
  }

  Future<List<MapBoxPlace>> getPlaces(String place) =>
      placesSearch.getPlaces(place);

  Future<void> getGooglePlaces(String place) async {
    String googleBaseUrl =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';

    Response response = await HttpUtil().get(googleBaseUrl,
        data: {'key': PLACES_API_KEY, 'input': place, 'type': 'regions'});
    print(response);
  }

  Future<void> baiduSearch() async {
    String baiduBaseUrl = 'http://api.map.baidu.com/place_abroad/v1/search';

    var response = await HttpUtil().get(baiduBaseUrl, data: {
      'ak': 'o7BxXRdG5GEZ8qbA03GGvA1Xix7UcG0P',
      'output': 'json',
      'region': '全国',
      'tab': '地级市',
      'query': 'newyo',
    });


  }

  Widget _itemBuilder(BuildContext context, int index) {
    return ListTile(
      onTap: () {
        _onTap(addressList[index]);
      },
      leading: Icon(Icons.location_city),
      title: Text('${addressList[index].text}'),
    );
  }

  void _onTap(address) {
    print('click $address');
    setState(() {
      selectAddress = address;
      addressList?.clear();
    });
  }
}
