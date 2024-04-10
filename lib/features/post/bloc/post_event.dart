
part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class PostInitialFetchEvent extends PostEvent {}

class PostAddEvent extends PostEvent {
  final String title;
  final String body;
  final String userId;

  PostAddEvent({required this.userId,required this.title, required this.body});
}