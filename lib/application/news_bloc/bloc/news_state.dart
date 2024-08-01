part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  final List<NewsModel> newsList;
  final bool hasReachedMax;

  NewsLoadedState(this.newsList, {this.hasReachedMax = false});
}

class NewsErrorState extends NewsState {
  final String error;

  NewsErrorState(this.error);
}
