import 'package:birthday_app/features/guests/domain/entities/guest.dart';
import 'package:birthday_app/features/guests/domain/entities/guest_list.dart';

abstract class GuestAPI {
  Future<void> load(Guest guest);
  Future<Guest> get(int id);
  Future<void> remove(int id);
  Future<GuestList> getAll();
}
