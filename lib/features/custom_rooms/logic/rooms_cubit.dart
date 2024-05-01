import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:detection_app/features/custom_rooms/logic/rooms_state.dart';

import '../models/room_model.dart';

class RoomsCubit extends Cubit<RoomsState> {
  RoomsCubit() : super(const RoomsState.initial());

  List<RomModel> merlin = [];
  List<RomModel> alioth = [];
  List<RomModel> crosshatch = [];

  // void fetchDataFromLocal(){
  //   rootBundle.loadString('assets/data.json').then((value) {
  //     var data = jsonDecode(value);
  //     merlin = data['devices']['merlin']
  //         .map<RomModel>((e) => RomModel.fromJson(e))
  //         .toList();
  //     alioth = data['devices']['alioth']
  //         .map<RomModel>((e) => RomModel.fromJson(e))
  //         .toList();
  //     crosshatch = data['devices']['crosshatch']
  //         .map<RomModel>((e) => RomModel.fromJson(e))
  //         .toList();
  //
  //   });
  // }
  //
  // void addToFirebase(){
  //   FirebaseFirestore.instance.collection('data').add({
  //     'devices': {
  //       'merlin': merlin.map((e) => e.toJson()).toList(),
  //       'alioth': alioth.map((e) => e.toJson()).toList(),
  //       'crosshatch': crosshatch.map((e) => e.toJson()).toList(),
  //     }
  //   });
  // }

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
