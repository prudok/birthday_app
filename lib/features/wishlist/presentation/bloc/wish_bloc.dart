import 'package:birthday_app/features/wishlist/data/repository/wish_repository.dart';
import 'package:birthday_app/features/wishlist/domain/entities/wish_item.dart';
import 'package:birthday_app/features/wishlist/domain/entities/wish_list.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'wish_bloc.freezed.dart';
part 'wish_event.dart';
part 'wish_state.dart';

@Injectable()
class WishBloc extends Bloc<WishEvent, WishState> {
  WishBloc(this._wishRepositoryImpl) : super(const WishState.initial()) {
    on<AddWishEvent>((event, emit) async {
      emit(const WishState.processing());
      try {
        await _wishRepositoryImpl.add(event.wishItem);
        await _wishRepositoryImpl.getAll().then(
              (wishes) => emit(WishState.successful(wishList: wishes)),
            );
      } on Object catch (error) {
        emit(WishState.error(error: error));
      }
    });
    on<ReloadWishEvent>((event, emit) async {
      emit(const WishState.processing());
      try {
        await _wishRepositoryImpl.getAll().then(
              (wishes) => emit(WishState.successful(wishList: wishes)),
            );
      } on Object catch (error) {
        emit(WishState.error(error: error));
      }
    });
  }
  final WishRepositoryImpl _wishRepositoryImpl;
}
