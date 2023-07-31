import 'package:birthday_app/features/guests/domain/entities/guest.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_list.freezed.dart';
part 'guest_list.g.dart';

@freezed
class GuestList with _$GuestList {
  const factory GuestList({
    required List<Guest> guests,
  }) = _GuestList;

  const GuestList._();

  factory GuestList.fromJson(Map<String, Object?> json) =>
      _$GuestListFromJson(json);
}
