part of 'fetch_bloc.dart';

class FetchState {
  final bool isLoading;
  final String token;

  const FetchState({required this.isLoading, required this.token});
}

final class FetchInitial extends FetchState {
  const FetchInitial({required super.isLoading, required super.token});
}
