import 'package:birthday_app/features/guests/data/datasource/guest_api_impl.dart';
import 'package:birthday_app/features/guests/domain/entities/guest.dart';
import 'package:birthday_app/features/guests/domain/entities/guest_list.dart';
import 'package:birthday_app/features/guests/domain/repository/guest_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class GuestRepositoryImpl extends GuestRepository {
  GuestRepositoryImpl(this.guestAPIImpl);

  final GuestAPIImpl guestAPIImpl;

  @override
  Future<void> add(Guest guest) async {
    await guestAPIImpl.load(guest);
  }

  @override
  Future<void> remove(String phone) async {
    await guestAPIImpl.remove(phone);
  }

  @override
  Future<Guest> get(String phone) async {
    return guestAPIImpl.get(phone);
  }

  @override
  Future<GuestList> getAll() async {
    return guestAPIImpl.getAll();
  }
}
