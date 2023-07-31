import 'package:birthday_app/features/guests/domain/entities/guest.dart';
import 'package:birthday_app/features/guests/domain/repository/guest_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_bloc.freezed.dart';
part 'guest_event.dart';
part 'guest_state.dart';

class GuestBloc extends Bloc<GuestEvent, GuestState> {
  GuestBloc(this.guestRepositoryImpl) : super(const _Initial()) {
    on<AddGuestEvent>((event, emit) {});
    on<RemoveGuestEvent>((event, emit) {});
  }
  final GuestRepository guestRepositoryImpl;
}
