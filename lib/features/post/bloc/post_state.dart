
part of 'post_bloc.dart';

@immutable
abstract class PostState {}
abstract class PostActionState extends PostState {}

class PostInitial extends PostState {}

class PostFetchingSuccessfull extends PostState {
  final List<PostModel> post;

  PostFetchingSuccessfull({required this.post});
}

class PostFetchLoadingState extends PostState {}

class PostFetchingErrorState extends PostState {}

class PostAdditionSuccessState extends PostActionState {}

class PostAdditionErrorState extends PostActionState {}