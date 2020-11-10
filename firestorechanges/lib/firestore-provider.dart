import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class FireStoreProvider {
  FireStoreProvider(this.reference);
  dynamic obj;
  CollectionReference reference;
  BehaviorSubject<List<dynamic>> cache;

  BehaviorSubject changesList;
  dynamic get firestoreStream$ => get();

  get() async {
    var p1 = Stream.fromFuture(asyncFunction(reference));
    // final p = await reference.get();
    // final res = p.docChanges;

    // res.forEach((change) {
    // changesList.add(change);
    // print(change.runtimeType);
    // ignore: unrelated_type_equality_checks
    // if (change.type == 'added') {

    //   cache.add(change.doc.id);
    // }
    // // ignore: unrelated_type_equality_checks
    // if (change.type == 'modified') {
    //   for (var i = 0; i < cache.length; i += 1) {
    //     if (cache[i]['id'] == change.doc.id) {
    //       cache[i] = change.doc;
    //     }
    //   }
    // }
    // // ignore: unrelated_type_equality_checks
    // if (change.type == 'removed') {
    //   for (var i = 0; i < cache.length; i += 1) {
    //     if (cache[i]['id'] == change.doc.id) {
    //       cache[i] = change.doc;
    //     }
    //   }
    // }
    // });
  }
}
 Future<dynamic> asyncFunction(CollectionReference reference) async {
    final p = await reference.get();
    final res = p.docChanges;
    return res;
  }
