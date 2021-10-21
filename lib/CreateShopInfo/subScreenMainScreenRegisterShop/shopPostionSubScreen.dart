import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:shopder/CreateShopInfo/component/ButtomBarComponent.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';

// double latitude, longtitude;

class ShopPositionSubScreen extends StatefulWidget {
  final DataShopPosition dataShopPosition;
  final Function setdataShopPosition;

  ShopPositionSubScreen(
      {@required this.dataShopPosition, @required this.setdataShopPosition});
  @override
  _ShopPositionSubScreenState createState() => _ShopPositionSubScreenState();
}

class _ShopPositionSubScreenState extends State<ShopPositionSubScreen> {
  double latitude;
  double longtitude;

  void locatePosition() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    setState(() {
      latitude = _locationData.latitude;
      longtitude = _locationData.longitude;
    });

    // print(" latitude : $latitude ,longtitude : $longtitude");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (this.widget.dataShopPosition == null) {
      locatePosition();
      print("position is null");
    } else {
      setState(() {
        latitude = this.widget.dataShopPosition.latitude;
        longtitude = this.widget.dataShopPosition.longtitude;
      });
    }
  }

  Future<void> PinMark({@required CameraPosition position}) {
    print("${position.target.latitude} ${position.target.longitude}");
    setState(() {
      latitude = position.target.latitude;
      longtitude = position.target.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget ShowMap = latitude == null
        ? Container()
        : GoogleMap(
            cameraTargetBounds: CameraTargetBounds.unbounded,
            mapType: MapType.normal,
            onCameraMove: (position) => {PinMark(position: position)},
            markers: <Marker>[
              Marker(
                markerId: MarkerId("value"),
                position: LatLng(latitude, longtitude),
                // infoWindow: InfoWindow(title: "ddsdd", anchor: Offset(0.5, 0)),
              )
            ].toSet(),
            initialCameraPosition: CameraPosition(
                target: LatLng(latitude, longtitude), zoom: 17.5));

    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(10),
                  height: double.infinity,
                  width: double.infinity,
                  // color: Colors.amber,
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(child: ShowMap),
                    ],
                  )),
            ),
            ButtomBarComponent(
                textbuttom1: "กลับ",
                func1: () {
                  backSetdataShopPosition();
                },
                active1: 1,
                textbuttom2: "สำเร็จ",
                func2: () {
                  setdataShopPosition();
                },
                active2: 1)
          ],
        ),
      ),
    );
  }

  Future<void> setdataShopPosition() async {
    DataShopPosition dataShopPosition =
        DataShopPosition(latitude: latitude, longtitude: longtitude);
    this.widget.setdataShopPosition(dataShopPosition, 1);
  }

  Future<void> backSetdataShopPosition() async {
    DataShopPosition dataShopPosition =
        DataShopPosition(latitude: latitude, longtitude: longtitude);
    this.widget.setdataShopPosition(dataShopPosition, -1);
  }
}
