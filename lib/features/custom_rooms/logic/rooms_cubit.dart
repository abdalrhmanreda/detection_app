import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:detection_app/features/custom_rooms/logic/rooms_state.dart';

import '../models/room_model.dart';

class RoomsCubit extends Cubit<RoomsState> {
  RoomsCubit() : super(const RoomsState.initial());

  List<RomModel> merlin = [];
  List<RomModel> alioth = [];
  List<RomModel> crosshatch = [];

  void fetchRooms() {
    emit(const RoomsState.loading());
    FirebaseFirestore.instance.collection('data').get().then((value) {
      merlin = value.docs.first
          .data()['devices']['merlin']
          .map<RomModel>((e) => RomModel.fromJson(e))
          .toList();
      alioth = value.docs.first
          .data()['devices']['alioth']
          .map<RomModel>((e) => RomModel.fromJson(e))
          .toList();
      crosshatch = value.docs.first
          .data()['devices']['crosshatch']
          .map<RomModel>((e) => RomModel.fromJson(e))
          .toList();

      emit(RoomsState.loaded([merlin, alioth, crosshatch]));
    }).catchError((error) {
      emit(RoomsState.error(error.toString()));
    });
  }

  String deviceName = "";
  List<RomModel> roms(String device) {
    deviceName = device;
    switch (device) {
      case 'merlin':
        return merlin;
      case 'alioth':
        return alioth;
      case 'crosshatch':
        return crosshatch;
      default:
        return [];
    }
  }
}
