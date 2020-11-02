import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news/news.dart';
import 'package:news/user.dart';

class DatabaseService{

  final String uid;


  DatabaseService({this.uid});
final  CollectionReference newscollection=Firestore.instance.collection('news');
  Future updateUserData(String name, String mail) async {
return await newscollection.document(uid).setData({
'name':name,
'mail':mail,

});
  }

  List<News> _newsListfromSnapshoot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return News(name: doc.data['name']??'',
      mail: doc.data['mail']??'');
    } ).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot)
  {
    return UserData(
      uid:uid,
      name: snapshot.data['name'],
      mail: snapshot.data['mail'],


    );
  }
  Stream<List<News>> get news{
    return newscollection.snapshots().map(_newsListfromSnapshoot);
  }

  Stream<UserData> get userData{

    return newscollection.document(uid).snapshots()
    .map(_userDataFromSnapshot);
  }
}