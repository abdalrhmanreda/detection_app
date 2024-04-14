import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:detection_app/features/custom_rooms/logic/rooms_state.dart';

import '../models/room_model.dart';

class RoomsCubit extends Cubit<RoomsState> {
  RoomsCubit() : super(const RoomsState.initial());

  List<RoomModel> rooms = [];
  void fetchRooms() {
    rooms = [];
    emit(const RoomsState.loading());
    FirebaseFirestore.instance.collection('data').get().then((value) {
      rooms = value.docs.map((e) => RoomModel.fromJson(e.data())).toList();
      print(rooms[1].version);
      emit(RoomsState.loaded(value.docs));
    }).catchError((error) {
      emit(RoomsState.error(error.toString()));
    });
  }
}
