import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';

class PostWriteOption_DatePickerComponent extends StatefulWidget {
  DateBox date;
  String title;
  final Function fun;
  PostWriteOption_DatePickerComponent(
      {@required this.date, @required this.title, @required this.fun});
  @override
  _PostWriteOption_DatePickerComponentState createState() =>
      _PostWriteOption_DatePickerComponentState();
}

class _PostWriteOption_DatePickerComponentState
    extends State<PostWriteOption_DatePickerComponent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("datedatedatedatedatedatedatedatedatedatedatedatedate");
    if (this.widget.date.datetime() == null) {
      return Container();
    } else {
      Widget DatePickerss = DateTimePicker(
        type: DateTimePickerType.dateTimeSeparate,
        dateMask: 'd MMM, yyyy',
        initialValue: this.widget.date.datetime().toString(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        icon: Icon(Icons.event),
        dateLabelText: 'วันที่',
        timeLabelText: "เวลา",
        onChanged: (val) async {
          DateBox dateBox = await DateStringTransformInt(dateString: val);

          this.widget.fun(dateBox);
        },
        validator: (val) {
          print(val);
          return null;
        },
        onSaved: (val) => print(val),
      );
      return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("${this.widget.title}"), DatePickerss],
        ),
      );
    }
  }
}
