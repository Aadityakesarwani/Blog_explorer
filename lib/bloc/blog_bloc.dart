import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_explorer/services/api_service.dart';
import '../models/blog.dart';
import 'blog_event.dart';
import 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final ApiService apiService;

  BlogBloc(this.apiService) : super(BlogInitial()) {
    on<FetchBlogs>(_onFetchBlogs);
    on<MarkFavorite>(_onMarkFavorite);
  }

  Future<void> _onFetchBlogs(FetchBlogs event, Emitter<BlogState> emit) async {
    emit(BlogLoading());
    try {
      final blogs = await apiService.fetchBlogs();
      emit(BlogLoaded(blogs, []));
    } catch (e) {
      emit(BlogError(e.toString()));
    }
  }

  void _onMarkFavorite(MarkFavorite event, Emitter<BlogState> emit) {
    if (state is BlogLoaded) {
      final currentState = state as BlogLoaded;
      final updatedFavorites = List<Blog>.from(currentState.favorites)
        ..add(event.blog);
      emit(BlogLoaded(currentState.blogs, updatedFavorites));
    }
  }

}
