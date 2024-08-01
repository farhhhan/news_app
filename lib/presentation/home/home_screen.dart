import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/application/news_bloc/bloc/news_bloc.dart';
import 'package:news_app/domain/newsModel.dart';
import 'package:news_app/presentation/home/widgets/custom_newsCard.dart';
import 'package:news_app/presentation/home/widgets/custom_skell.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isFetchingMore = false;
  int _offset = 0;
  final int _limit = 20;

  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(GetNewsEvent(limit: _limit, offset: _offset));
    
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _fetchMoreNews();
      }
    });
  }

  void _fetchMoreNews() {
    if (!_isFetchingMore) {
      _isFetchingMore = true;
      context.read<NewsBloc>().add(LoadMoreNewsEvent(limit: _limit, offset: _offset));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoadingState) {
          return ListView.builder(
            itemCount: _limit, 
            itemBuilder: (context, index) {
              return  custom_skel(); // Your skeleton loader widget
            },
          );
        } else if (state is NewsLoadedState) {
          _isFetchingMore = false;
          _offset = state.newsList.length;
          
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: state.newsList.length + 1,
                  itemBuilder: (context, index) {
                    if (index == state.newsList.length) {
                      return state.hasReachedMax
                          ?const SizedBox.shrink() 
                          :const Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                    }

                    NewsModel news = state.newsList[index];
                    return CustomNewsCard(news: news);
                  },
                ),
              ),
            ],
          );
        } else if (state is NewsErrorState) {
          return Center(
            child: Text('Error: ${state.error}'),
          );
        } else {
          return Center(
            child: Text('No news available'),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
