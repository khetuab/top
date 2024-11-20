
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wkumsurh/models/user_model.dart';

class FirebaseService{
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addUser(UserModel user) async{
    try{
      DocumentReference docRef = _db.collection('Users').doc(user.id);
      await docRef.set(user.toMap());
    }catch (e){
      print(' the error ${e} thrown');
    }
  }

  Future<UserModel?> readUser(String id) async{
    try{
      DocumentSnapshot snapshot = await _db.collection('Users').doc(id).get();
      if(snapshot.exists){
        return UserModel.fromMap(snapshot.data() as Map<String ,dynamic>);
      }
      return null;
    }catch (e){
      print(' the error ${e} thrown');
      return null;
    }
  }

  Future<void> updateUser (UserModel user) async {
    try{
      await _db.collection('Users').doc(user.id).update(user.toMap());
    }catch (e){
      print(' the error ${e} thrown');
    }
  }

  Future<void> deleteUser (String id) async {
    try{
      await _db.collection('Users').doc(id).delete();
    }catch (e){
      print('The error ${e} thrown');
    }
  }

  Future<List<UserModel>> getAllUsers() async {
    try{
      QuerySnapshot snapshot =await _db.collection('Users').get();
      return snapshot.docs.map((doc)=>UserModel.fromMap(doc.data() as Map<String,dynamic>)).toList();
    }catch (e){
      print('The error ${e} thrown');
      return [];
    }
  }
}