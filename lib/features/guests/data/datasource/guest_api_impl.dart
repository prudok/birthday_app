import 'dart:async';

import 'package:birthday_app/features/guests/data/datasource/guest_api.dart';
import 'package:birthday_app/features/guests/domain/entities/guest.dart';
import 'package:birthday_app/features/guests/domain/entities/guest_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GuestAPIImpl extends GuestAPI {
  GuestAPIImpl(this.db);

  final FirebaseFirestore db;

  @override
  Future<Guest> get(int id) async {
    try {
      final store =
          await db.collection('guests').where('id', isEqualTo: id).get();
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
  Future<void> remove(int id) async {
    try {
      final doc =
          await db.collection('guests').where('id', isEqualTo: id).get();
      db.collection('guests').doc(doc.docs.first.id);
    } on Object catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
