import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:shopder/function/dataManagement/storageFunction.dart';
import 'package:shopder/module/BackGroundServiceManagment.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/cupertino.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter/services.dart';

void onStartBackGroundService() async {
  WidgetsFlutterBinding.ensureInitialized();
  final service = FlutterBackgroundService();
  /////////////ส่วนของ socket io ในแบลคกราว///////////////////
  String host = await jsonDecode(
      await rootBundle.loadString('assets/config.json'))['http'];
  IO.Socket socket =
      IO.io('${host}', IO.OptionBuilder().setTransports(['websocket']).build());

  socket.onDisconnect((data) => print("Background service disconnect"));
  socket.onReconnect((data) => print("Background service Connecting........"));
  socket.onConnect((_) async {
    print('connect to ${host} in background service');

    String dataString = await ReadDataInStorage(key: 'shopInfo');
    if (dataString != null) {
      // return false;
      Map dataJson = await json.decode(dataString);
      String shop_id = dataJson['shop_id'];
      NotificationCheckOpenApp("กำลังเชื่อมต่อ id : ${shop_id}");
      socket.off("notification-shop:${shop_id}");
      socket.on('notification-shop:${shop_id}',
          (data) => BackGroundServiceManager(data, host));
    }
  });

  // Timer.periodic(Duration(seconds: 1), (timer) async {
  //   bool ss = socket.disconnected;
  //   print("check connection ${ss}");
  // });
//////////////////////////////////จบ///////////////////////////////////
  service.onDataReceived.listen((event) {
    if (event["action"] == "setAsForeground") {
      service.setForegroundMode(true);
      return;
    }

    if (event["action"] == "setAsBackground") {
      service.setForegroundMode(false);
    }

    if (event["action"] == "stopService") {
      service.stopBackgroundService();
    }

    if (event["event"] == "start_service_push_notification") {
      String shop_id = event["shop_id"];
      print("เชื่อมต่อ shop : ${shop_id} ในแบลคกราว");
      socket.on('notification-shop:${shop_id}',
          (data) => BackGroundServiceManager(data, host));

      // print("เริ่มการทำงาน ของแบลคกราว ในส่วนของ shop $ ${host}");

    }
    if (event["event"] == "stop_service_push_notification") {
      String shop_id = event["shop_id"];
      print("ยกเลิกการเชื่อมต่อ shop : ${shop_id} ในแบลคกราว");
      socket.off("notification-shop:" + shop_id);
    }

    if (event["action"] == "stopService") {
      service.stopBackgroundService();
    }
  });

  // bring to foreground
  service.setForegroundMode(true);

  Timer.periodic(Duration(seconds: 1), (timer) async {
    if (!(await service.isServiceRunning())) timer.cancel();
    service.setNotificationInfo(
      title: "My App Service",
      content: "Updated at ${DateTime.now()}",
    );

    service.sendData(
      {"current_date": DateTime.now().toIso8601String()},
    );
  });
}

// void SocketIOBackground() async {}
