part of 'fetch_bloc.dart';

@immutable
sealed class FetchEvent {}

class FetchTokenEvent extends FetchEvent {}
