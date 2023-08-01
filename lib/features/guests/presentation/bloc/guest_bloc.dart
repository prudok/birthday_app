import 'package:birthday_app/features/guests/data/repository/guest_repository_impl.dart';
import 'package:birthday_app/features/guests/domain/entities/guest.dart';
import 'package:birthday_app/features/guests/domain/entities/guest_list.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'guest_bloc.freezed.dart';
part 'guest_event.dart';
part 'guest_state.dart';

@Injectable()
class GuestBloc extends Bloc<GuestEvent, GuestState> {
  GuestBloc(this.guestRepositoryImpl) : super(const _Initial()) {
    on<AddGuestEvent>((event, emit) async {
      emit(const GuestState.processing());
      try {
        await guestRepositoryImpl.add(event.guest);
        await guestRepositoryImpl.getAll().then(
              (guests) => emit(GuestState.successfull(guestList: guests)),
            );
      } on Exception catch (error) {
        emit(GuestState.error(error: error));
      }
    });
    on<RemoveGuestEvent>((event, emit) async {
      emit(const GuestState.processing());
      try {
        await guestRepositoryImpl.remove(event.id);
        await guestRepositoryImpl.getAll().then(
              (guests) => emit(GuestState.successfull(guestList: guests)),
            );
      } on Exception catch (error) {
        emit(GuestState.error(error: error));
      }
    });
    on<ReloadGuestEvent>((event, emit) async {
      emit(const GuestState.processing());
      try {
        await guestRepositoryImpl.getAll().then(
              (guests) => emit(GuestState.successfull(guestList: guests)),
            );
      } on Exception catch (error) {
        emit(GuestState.error(error: error));
      }
    });
  }
  final GuestRepositoryImpl guestRepositoryImpl;
}
