import 'package:bloc/bloc.dart';

part 'splash_state.dart';

sealed class SplashEvent {}


class Initial extends SplashEvent {
  Initial();
}

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(_Initial()) {
    on<SplashEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
