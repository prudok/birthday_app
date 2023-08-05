import 'package:birthday_app/features/guests/domain/entities/guest_list.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sorting_bloc.freezed.dart';
part 'sorting_event.dart';
part 'sorting_state.dart';

@Injectable()
class SortingBloc extends Bloc<SortingEvent, SortingState> {
  SortingBloc() : super(const SortingState.initial()) {
    on<SortByName>((event, emit) {
      emit(const SortingState.sorting());
      event.guests.guests.sort(
        (first, second) => first.name.toLowerCase().compareTo(
              second.name.toLowerCase(),
            ),
      );
      emit(SortingState.sortedByName(guests: event.guests));
    });
    on<SortByAge>((event, emit) {
      emit(const SortingState.sorting());
      event.guests.guests.sort(
        (first, second) => first.age.compareTo(second.age),
      );
      emit(SortingState.sortedByAge(guests: event.guests));
    });
  }
}
