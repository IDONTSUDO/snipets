import 'package:cloud_firestore/cloud_firestore.dart';
// import 'firestore-provider.dart';
import 'package:rxdart/rxdart.dart';

import 'firestore-provider.dart';

CollectionReference users =
    FirebaseFirestore.instance.collection('users');

final p = new FireStoreProvider(users);

OrdersProvider orderService = OrdersProvider(p);

class OrdersProvider {
  OrdersProvider(this.stream);
  FireStoreProvider stream;
  Stream<dynamic> get getOrder => getOrders();

  getOrders() {
    return stream.firestoreStream$;
  }
}
