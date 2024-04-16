import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../auth/data/repositories/users_repository_impl.dart';
import '../../domain/repositories/classes_repository.dart';
import '../models/class_model.dart';

class ClasessRepositoryImpl implements ClassRepository {
  ClasessRepositoryImpl();

  @override
  Future<Either<String, String>> addClass(ClassModel classToAdd) async {
    try {
      FirebaseAuth _auth = FirebaseAuth.instance;
      String userId = _auth.currentUser?.uid ?? '';
      UsersRepositoryImpl userData = UsersRepositoryImpl();
      Map<String, dynamic> rawData =
          await userData.getUser(userId) ?? <String, dynamic>{};
      List<String> listClasses = (rawData['myClasses']as List<dynamic>?) 
            ?.cast<String>() 
            ?? const <String>[]
        ..add(classToAdd.uid);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update(<String, dynamic>{'myClasses': listClasses});
      return Right<String, String>(
        '''Se a añadido la clase \' ${classToAdd.className} \' correctamente''',
      );
    } catch (e) {
      return Left<String, String>(e.toString());
    }
  }

  @override
  Future<Either<String, List<ClassModel>>> fetchAllClasess() async {
    try {
      CollectionReference<Object?> _collectionRef =
          FirebaseFirestore.instance.collection('classses');
      QuerySnapshot<Object?> querySnapshot = await _collectionRef.get();
      List<ClassModel> allData = querySnapshot.docs
          .map(
            (QueryDocumentSnapshot<Object?> doc) => ClassModel.fromJson(
              doc.data()! as Map<String, dynamic>,
            ),
          )
          .toList();
      return Right<String, List<ClassModel>>(allData);
    } catch (e) {
      return Left<String, List<ClassModel>>(e.toString());
    }
  }

  @override
  Future<String> updateClasess(
    String uid,
    Map<String, dynamic> changingClass,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('classes')
          .doc(uid)
          .update(changingClass);
      return 'Se cambio la informacion correctamente';
    } catch (e) {
      return 'No se encontro usuario';
    }
  }

  @override
  Future<String> deleteClasess(String uid) async {
    try {
      await FirebaseFirestore.instance.collection('classes').doc(uid).delete();
      return 'Se elimino la clase';
    } catch (e) {
      return 'No se encontro la clase';
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>?>> getMyClasess(String uid) {
    throw UnimplementedError();
  }
}
