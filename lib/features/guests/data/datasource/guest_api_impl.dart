import 'dart:async';

import 'package:birthday_app/features/guests/data/datasource/guest_api.dart';
import 'package:birthday_app/features/guests/domain/entities/guest.dart';
import 'package:birthday_app/features/guests/domain/entities/guest_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class GuestAPIImpl extends GuestAPI {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<Guest> get(String phone) async {
    try {
      final store =
          await db.collection('guests').where('phone', isEqualTo: phone).get();
      final guest = store.docs.map((doc) => Guest.fromJson(doc.data())).single;
      return guest;
    } on Object catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<void> load(Guest guest) async {
    try {
      await db.collection('guests').add(guest.toJson());
    } on Object catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<GuestList> getAll() async {
    try {
      final store = await db.collection('guests').get();
      final guests =
          store.docs.map((doc) => Guest.fromJson(doc.data())).toList();
      return GuestList(guests: guests);
    } on Object catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<void> remove(String phone) async {
    try {
      final doc = await db
          .collection('guests')
          .where('phoneNumber', isEqualTo: phone)
          .get();
      await db.collection('guests').doc(doc.docs.first.id).delete();
    } on Object catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
