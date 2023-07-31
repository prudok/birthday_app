import 'package:birthday_app/features/guests/data/datasource/guest_api.dart';
import 'package:birthday_app/features/guests/domain/entities/guest.dart';
import 'package:birthday_app/features/guests/domain/entities/guest_list.dart';
import 'package:birthday_app/features/guests/domain/repository/guest_repository.dart';

class GuestRepositoryImpl extends GuestRepository {
  GuestRepositoryImpl(this.guestAPIImpl);

  final GuestAPI guestAPIImpl;

  @override
  Future<void> add(Guest guest) async {
    await guestAPIImpl.load(guest);
  }

  @override
  Future<void> remove(int id) async {
    await guestAPIImpl.remove(id);
  }

  @override
  Future<Guest> get(int id) async {
    return guestAPIImpl.get(id);
  }

  @override
  Future<GuestList> getAll() async {
    return guestAPIImpl.getAll();
  }
}
