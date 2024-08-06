import 'package:equatable/equatable.dart';
import 'package:blog_explorer/services/api_service.dart';

import '../models/blog.dart';

abstract class BlogState extends Equatable {
  const BlogState();

  @override
  List<Object> get props => [];
}

class BlogInitial extends BlogState {}

class BlogLoading extends BlogState {}

class BlogLoaded extends BlogState {
  final List<Blog> blogs;
  final List<Blog> favorites;

  const BlogLoaded(this.blogs, this.favorites);

  @override
  List<Object> get props => [blogs, favorites];
}

class BlogError extends BlogState {
  final String message;

  const BlogError(this.message);

  @override
  List<Object> get props => [message];
}
