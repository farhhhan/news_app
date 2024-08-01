import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/domain/newsModel.dart';
import 'package:news_app/infrastructure/newsRepo.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<GetNewsEvent>(_getNews);
    on<LoadMoreNewsEvent>(_loadMoreNews);
  }

  FutureOr<void> _getNews(GetNewsEvent event, Emitter<NewsState> emit) async {
    emit(NewsLoadingState());
    try {
      List<NewsModel> newsList = await NewsRepo().fetchNews(limit: event.limit, offset: event.offset);
      emit(NewsLoadedState(newsList, hasReachedMax: newsList.length < event.limit));
    } catch (e) {
      emit(NewsErrorState(e.toString()));
    }
  }

  FutureOr<void> _loadMoreNews(LoadMoreNewsEvent event, Emitter<NewsState> emit) async {
    if (state is NewsLoadedState && !(state as NewsLoadedState).hasReachedMax) {
      try {
        List<NewsModel> currentList = (state as NewsLoadedState).newsList;
        List<NewsModel> newList = await NewsRepo().fetchNews(limit: event.limit, offset: event.offset);
        emit(NewsLoadedState(
          currentList + newList,
          hasReachedMax: newList.length < event.limit,
        ));
      } catch (e) {
        emit(NewsErrorState(e.toString()));
      }
    }
  }
}
