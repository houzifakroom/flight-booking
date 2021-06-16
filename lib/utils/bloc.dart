import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

abstract class BlocEvent<S, B extends BaseBloc> extends Equatable {
  BlocEvent([List props = const []]) : super();

  Stream<S> toState(S current, B bloc);

  @override
  List<Object> get props => props;
}

class BaseBloc<S> extends Bloc<BlocEvent<S, BaseBloc>, S> {
  BaseBloc([this._initialState]) : super(_initialState);

  final S _initialState;

  @override
  S get initialState => _initialState;

  @override
  Stream<S> mapEventToState(BlocEvent<S, dynamic> event) async* {
    yield* event.toState(state, this);
  }

  @override
  void onEvent(event) {
    print("\n");
    print("======");
    print("Event dispatched for bloc: $this");
    print("\tevent: $event");
    print("\t currentState: $state");
    print("======");
    print("\n");
  }

  @override
  void onTransition(transition) {
    print("\n");
    print("======");
    print("Event successfully dispatched for bloc: $this");
    print("\tevent: ${transition.event}");
    print("\tcurrentState: ${transition.currentState}");
    print("\tnextState: ${transition.nextState}");
    print("======");
    print("\n");
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    print("\n");
    print("======");
    print("Error occured while dispatching event for bloc: $this");
    print("\terror: $error");
    print("\tstacktrace: $stacktrace");
    print("======");
    print("\n");
  }

  @override
  String toString() => runtimeType.toString();
}
