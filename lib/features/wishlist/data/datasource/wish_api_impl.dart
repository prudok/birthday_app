import 'dart:async';

import 'package:birthday_app/features/wishlist/data/datasource/wish_api.dart';
import 'package:birthday_app/features/wishlist/domain/entities/wish_item.dart';
import 'package:birthday_app/features/wishlist/domain/entities/wish_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class WishAPIImpl extends WishAPI {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<WishList> getAll() async {
    try {
      final store = await db.collection('wishes').get();
      final wishes =
          store.docs.map((doc) => WishItem.fromJson(doc.data())).toList();
      return WishList(items: wishes);
    } on Object catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<void> load(WishItem wishItem) async {
    try {
      await db.collection('wishes').add(wishItem.toJson());
    } on Object catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
