
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/exception/server_exception.dart';
import '../model/user_model.dart';

abstract interface class AuthRemoteDataSource {
  User ? get currentUser;
  Future <UserModel> signUpWithEmailPassword ({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> logInWithEmailPassword ({
    required String email,
    required String password ,
  });

  Future<UserModel?> getCurrentUserData ();
}


class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  AuthRemoteDataSourceImpl ({
    required this.firebaseAuth,

  });

  @override
  User? get currentUser => firebaseAuth.currentUser;

  @override
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password
  }) async {
    try {
      final response = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      if (response.user == null){
        throw ServerException('user is null');
      }
      return UserModel(
        email: response.user!.email.toString(),
        id: response.user!.uid,
      );

    } catch (e){
      throw ServerException(e.toString());
    }

  }

  @override
  Future<UserModel> logInWithEmailPassword({
    required String email,
    required String password
  }) async {
    try {
      final response = await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      if(response.user == null){
        throw ServerException('user is null');
      }
      return UserModel(
        email: response.user!.email.toString(),
        id: response.user!.uid,
      );
    } catch(e){
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel?> getCurrentUserData() async{
    try {
      if(currentUser!= null){
        final userData =   firebaseAuth.currentUser;
        return UserModel(
            email: userData!.email.toString(),
            id: userData.uid
        );
      }
      return null;
    } catch(e) {
      throw ServerException(e.toString());
    }

  }



}

