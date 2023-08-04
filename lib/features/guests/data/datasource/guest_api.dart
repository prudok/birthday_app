import 'package:birthday_app/features/guests/domain/entities/guest.dart';
import 'package:birthday_app/features/guests/domain/entities/guest_list.dart';

abstract class GuestAPI {
  Future<void> load(Guest guest);
  Future<Guest> get(String phone);
  Future<void> remove(String phone);
  Future<GuestList> getAll();
}
