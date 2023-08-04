import 'package:birthday_app/features/guests/domain/entities/guest.dart';
import 'package:birthday_app/features/guests/domain/entities/guest_list.dart';

abstract class GuestRepository {
  Future<void> add(Guest guest);
  Future<void> remove(String phone);
  Future<Guest> get(String phone);
  Future<GuestList> getAll();
}
