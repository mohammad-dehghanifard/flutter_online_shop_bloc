import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  setLocation(BuildContext context) async {
     final GeoPoint? picker =  await showSimplePickerLocation(
          context: context,
        title: "انتخاب موقعیت مکانی",
        textCancelPicker: "لغو",
        textConfirmPicker: "تایید",
        isDismissible: true,
        zoomOption: const ZoomOption(initZoom: 8.0),
        radius: 12.0,
       initPosition: GeoPoint(latitude: 47.4538055, longitude: 8.4737324)
      );
     if(picker == null) return;
     emit(RegisterPickLocationState(location: picker));
  }
}
