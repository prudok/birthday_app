import 'package:birthday_app/features/guests/domain/entities/guest_list.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sorting_bloc.freezed.dart';
part 'sorting_event.dart';
part 'sorting_state.dart';

class SortingBloc extends Bloc<SortingEvent, SortingState> {
  SortingBloc() : super(const SortingState.initial()) {
    on<SortingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
