import 'package:bloc/bloc.dart';
import 'package:inforura_task/api/fetch_token.dart';
import 'package:meta/meta.dart';

part 'fetch_event.dart';
part 'fetch_state.dart';

class FetchBloc extends Bloc<FetchEvent, FetchState> {
  FetchBloc() : super(const FetchInitial(isLoading: false, token: "")) {
    on<FetchEvent>((event, emit) {});

    on<FetchTokenEvent>((event, emit) async {
      emit(const FetchState(isLoading: true, token: ""));

      String? token = await FetchToken.registerUser();

      print(token);

      emit(FetchState(isLoading: false, token: token!));
    });
  }
}
