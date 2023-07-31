import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest.freezed.dart';
part 'guest.g.dart';

@freezed
class Guest with _$Guest {
  const factory Guest({
    required int id,
    required String name,
    required String surname,
    required String birthday,
    required String phoneNumber,
    required String profession,
    required int age,
  }) = _Guest;

  const Guest._();

  factory Guest.fromJson(Map<String, Object?> json) => _$GuestFromJson(json);
}
