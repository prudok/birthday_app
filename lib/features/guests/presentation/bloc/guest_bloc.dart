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
  GuestBloc(this._guestRepositoryImpl) : super(const _Initial()) {
    on<AddGuestEvent>((event, emit) async {
      emit(const GuestState.processing());
      try {
        await _guestRepositoryImpl.add(event.guest);
        await _guestRepositoryImpl.getAll().then(
              (guests) => emit(GuestState.successful(guestList: guests)),
            );
      } on Object catch (error) {
        emit(GuestState.error(error: error));
      }
    });
    on<RemoveGuestEvent>((event, emit) async {
      emit(const GuestState.processing());
      try {
        await _guestRepositoryImpl.remove(event.phoneNumber);
        await _guestRepositoryImpl.getAll().then(
              (guests) => emit(GuestState.successful(guestList: guests)),
            );
      } on Object catch (error) {
        emit(GuestState.error(error: error));
      }
    });
    on<ReloadGuestEvent>((event, emit) async {
      emit(const GuestState.processing());
      try {
        await _guestRepositoryImpl.getAll().then(
              (guests) => emit(GuestState.successful(guestList: guests)),
            );
      } on Object catch (error) {
        emit(GuestState.error(error: error));
      }
    });
  }
  final GuestRepositoryImpl _guestRepositoryImpl;
}
