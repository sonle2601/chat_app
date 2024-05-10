import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commonFirebaseStrorageRepositoryProvider = Provider(
        (ref) => CommonFirebaseStrorageRepository(
            firebaseStorage: FirebaseStorage.instance
        )
);

class CommonFirebaseStrorageRepository{
   final FirebaseStorage firebaseStorage;

   CommonFirebaseStrorageRepository({
     required this.firebaseStorage
  });

   Future<String> storeFileToFirebase(String ref, File file) async {
     UploadTask uploadTask = firebaseStorage.ref().putFile(file);
     TaskSnapshot snap = await uploadTask;
     String downloadUrl = await snap.ref.getDownloadURL();
     return downloadUrl;
   }
}