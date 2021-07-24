import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopder/CreateShopInfo/mainScreenRegisterShop.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectCreateShopInfo.dart';

// double latitude, longtitude;
var geoLocator = Geolocator();

class ShopPosition extends StatefulWidget {
  final Function finishPage;
  final Function backPage;
  final Function updateShopPosition;
  ShopPosition({this.finishPage, this.backPage, this.updateShopPosition});
  @override
  _ShopPositionState createState() => _ShopPositionState();
}

class _ShopPositionState extends State<ShopPosition> {
  double _latitude = 0;
  double _longtitude = 0;

  void locatePosition() async {
    _latitude = 0;
    _longtitude = 0;
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    setState(() {
      _latitude = position.latitude;
      _longtitude = position.longitude;
    });

    print(" latitude : $_latitude ,longtitude : $_longtitude");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    locatePosition();
  }

  Future<void> PinMark({@required CameraPosition position}) {
    setState(() {
      _latitude = position.target.latitude;
      _longtitude = position.target.longitude;
    });

    print("$_latitude $_longtitude");
  }

  @override
  Widget build(BuildContext context) {
    Marker mark = Marker(
      markerId: MarkerId("value"),
      position: LatLng(_latitude, _longtitude),
      // infoWindow: InfoWindow(title: "ddsdd", anchor: Offset(0.5, 0)),
    );

    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Text("ปักหมุดร้านค้า"),
          Expanded(
            flex: 8,
            child: Container(
                padding: EdgeInsets.all(10),
                height: double.infinity,
                width: double.infinity,
                color: Colors.amber,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      child: _latitude == 0
                          ? Container(
                              height: 300,
                              width: 300,
                              color: Colors.green,
                            )
                          : GoogleMap(
                              cameraTargetBounds: CameraTargetBounds.unbounded,
                              mapType: MapType.hybrid,
                              onCameraMove: (position) =>
                                  {PinMark(position: position)},
                              markers: <Marker>[
                                mark,
                              ].toSet(),
                              initialCameraPosition: CameraPosition(
                                  target: LatLng(_latitude, _longtitude),
                                  zoom: 17.5)),
                    ),
                    GestureDetector(
                      onTap: () {
                        locatePosition();
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.red,
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      this.widget.backPage();
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: Text('Back'),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      UpdateShopPosition();
                      this.widget.finishPage();
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: Text('Finish'),
                    ),
                  )
                ],
              ),
            ),
            flex: 2,
          )
        ],
      ),
    );
  }

  Future UpdateShopPosition() async {
    // print("$_latitude $_longtitude");
    DataShopPosition bufferDataShopPosition =
        DataShopPosition(latitude: _latitude, longtitude: _longtitude);
    this
        .widget
        .updateShopPosition(bufferDataShopPosition: bufferDataShopPosition);
  }
}
