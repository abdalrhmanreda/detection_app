import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/strings.dart';
import '../../../core/cache/hive_cache.dart';
import '../models/user_model.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initial());
  static AuthCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(AuthState.loading());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      getUserData(userId: HiveCache.getData(key: 'userId'));
    }).catchError((error) {
      print(error.toString());
      emit(AuthState.failure(error: error.toString()));
    });
  }

  //
  void logout() {
    emit(AuthState.loading());
    FirebaseAuth.instance.signOut().then((value) {
      emit(AuthState.logoutSuccessState());
    }).catchError((error) {
      emit(AuthState.failure(error: error.toString()));
    });
  }

  void userRegister(
      {required String email,
      required String password,
      required String name,
      required String phone}) {
    emit(AuthState.loading());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      createUser(email: email, name: name, uId: value.user!.uid, phone: phone);
      HiveCache.saveData(key: 'userId', value: value.user!.uid);
      userId = value.user!.uid;
    }).catchError((error) {
      emit(AuthState.failure(error: error.toString()));
    });
  }

  void createUser({
    required String email,
    required String name,
    required String phone,
    required String uId,
  }) {
    UserModel userModel = UserModel(
      name: name,
      email: email,
      profileImage:
          'https://cdn1.iconfinder.com/data/icons/user-pictures/100/unknown-512.png',
      phone: phone,
      address: 'Assuit , Egypt',
    );
    emit(AuthState.loading());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toJson())
        .then((value) {
      getUserData(userId: uId);
      emit(AuthState.createUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AuthState.failure(error: error.toString()));
    });
  }

  UserModel? userModel;
  void getUserData({required String userId}) {
    emit(AuthState.loading());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data()!);
      name = userModel!.name;
      print(userModel!.email);

      emit(AuthState.getUserDataSuccessState());
    }).catchError((error) {
      emit(AuthState.failure(error: error.toString()));
    });
  }

  void updateUserData({
    String? name,
    String? email,
    String? phone,
    String? address,
    String? profileImage,
  }) {
    UserModel model = UserModel(
      name: name,
      email: email,
      phone: phone,
      address: address,
      profileImage: profileImage ?? userModel!.profileImage,
    );
    emit(AuthState.loading());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update(model.toJson())
        .then((value) {
      getUserData(userId: userId!);
      emit(AuthState.updateUserDataSuccessState());
    }).catchError((error) {
      emit(AuthState.failure(error: error.toString()));
    });
  }

  Future<void> resetPassword(String email) async {
    emit(AuthState.loading());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
      // Password reset email sent successfully
      print('Password reset email sent. Check your inbox.');
      emit(AuthState.resetPasswordSuccessState());
    } catch (e) {
      // Error occurred during password reset
      print('Failed to send password reset email.');
      print(e); // Optionally, print the error message for debugging
      emit(AuthState.failure(error: e.toString()));
    }
  }

  // void uploadJsonDataToFirestore() async {
  //   try {
  //     // Step 1: Read JSON data from file
  //     String jsonString = await rootBundle.loadString(Assets.dataData);
  //
  //     // Step 2: Parse JSON data into Dart objects
  //     List<Map<String, dynamic>> jsonData =
  //         List<Map<String, dynamic>>.from(json.decode(jsonString)['merlin']);
  //
  //     // Step 3: Upload Dart objects to Firestore
  //     CollectionReference collection =
  //         FirebaseFirestore.instance.collection('data');
  //     for (var item in jsonData) {
  //       await collection.add(item);
  //     }
  //
  //     print('Data uploaded to Firestore successfully!');
  //   } catch (e) {
  //     print('Error uploading data to Firestore: $e');
  //   }
  // }
}
