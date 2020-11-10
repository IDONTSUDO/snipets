import 'package:cloud_firestore/cloud_firestore.dart';
// import 'firestore-provider.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users').limit(20);



final p = new FireStoreProvider(users);


OrdersProvider orderService = OrdersProvider(p);

class OrdersProvider {
  OrdersProvider(this.stream);
  FireStoreProvider stream;
  getOrders(){

  }
}

class FireStoreProvider {
  FireStoreProvider(this.reference);
  dynamic obj;
  CollectionReference reference;
  List<dynamic> cache;

  get() async {
    final p = await reference.get();
    final res = p.docChanges;
    res.forEach((change) {
      // ignore: unrelated_type_equality_checks
      if (change.type == 'added') {
        cache.add(change.doc.id);
      }
      // ignore: unrelated_type_equality_checks
      if (change.type == 'modified') {
        for (var i = 0; i < cache.length; i += 1) {
          if (cache[i]['id'] == change.doc.id) {
            cache[i] = change.doc;
          }
        }
      }
      // ignore: unrelated_type_equality_checks
      if (change.type == 'removed') {
        for (var i = 0; i < cache.length; i += 1) {
          if (cache[i]['id'] == change.doc.id) {
            cache[i] = change.doc;
          }
        }
      }
    });
  }
}
