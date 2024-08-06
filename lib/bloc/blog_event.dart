import 'package:equatable/equatable.dart';

import '../models/blog.dart';
import '../services/api_service.dart';

abstract class BlogEvent extends Equatable {
  const BlogEvent();

  @override
  List<Object> get props => [];
}

class FetchBlogs extends BlogEvent {}

class MarkFavorite extends BlogEvent {
  final Blog blog;
  const MarkFavorite(this.blog);
}
