import 'package:monitoring_and_control_app/models/list.dart';
import 'package:monitoring_and_control_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  
  final String uid;
  DatabaseService({this.uid});

  //collection references
  final CollectionReference dataCollection = Firestore.instance.collection('Data');
  
  Future updateUserData(String name) async {
    return await dataCollection.document(uid).setData({   //contains propertied of different values insife firestore
      'name': name,

    });
  }

  //data list from snapshot
  List<Data> _dataListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Data(
        name: doc.data['name'] ?? '', 
      );
    }).toList();
  }

  //userdata from snapshot

UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
  return UserData(
    uid: uid,
    name: snapshot.data['name'],
  );
}

  // get user stream
  Stream<List<Data>> get data {
    return dataCollection.snapshots()
    .map(_dataListFromSnapshot);
  }


  //get user doc Stream
  Stream<UserData> get userData{
    return dataCollection.document(uid).snapshots()
    .map(_userDataFromSnapshot);
  }

}