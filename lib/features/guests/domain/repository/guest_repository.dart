import 'package:birthday_app/features/guests/domain/entities/guest.dart';
import 'package:birthday_app/features/guests/domain/entities/guest_list.dart';

abstract class GuestRepository {
  Future<void> add(Guest guest);
  Future<void> remove(int id);
  Future<Guest> get(int id);
  Future<GuestList> getAll();
}
