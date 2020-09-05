import 'package:flutter/material.dart';
import 'package:mapbox_search/mapbox_search.dart';

class MapSearchPage extends StatefulWidget {
  @override
  _MapSearchPageState createState() => _MapSearchPageState();
}

class _MapSearchPageState extends State<MapSearchPage> {
  static const String key =
      'pk.eyJ1Ijoiemh1b3l1YW45OSIsImEiOiJja2VwcXducjUya291MnFucDNlMmZmeDAzIn0.JoxtgAjdqfpZZz-dUJLykQ';

  TextEditingController controller = TextEditingController();

  List<MapBoxPlace> addressList = [];

  var placesSearch = PlacesSearch(
    apiKey: key,
    limit: 8,
  );

  var selectAddress;
  var loadingText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
