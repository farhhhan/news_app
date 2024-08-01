part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class GetNewsEvent extends NewsEvent {
  final int limit;
  final int offset;

  GetNewsEvent({this.limit = 20, this.offset = 0});
}

class LoadMoreNewsEvent extends NewsEvent {
  final int limit;
  final int offset;

  LoadMoreNewsEvent({required this.limit, required this.offset});
}
