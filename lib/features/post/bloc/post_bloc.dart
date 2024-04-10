import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:api_request_bloc/features/post/model/post_model.dart';
import 'package:api_request_bloc/features/post/repos/post_repo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent,PostState>
{
  PostBloc() : super(PostInitial())
  {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
    on<PostAddEvent>(postAddEvent);
  }

  FutureOr<void> postInitialFetchEvent(PostInitialFetchEvent event, Emitter<PostState> emit) async {
    emit(PostFetchLoadingState());
    List<PostModel> post = await PostRepo.fetchPostData();
    await Future.delayed(const Duration(seconds: 5));
    emit(PostFetchingSuccessfull(post: post));
  }

  FutureOr<void> postAddEvent(PostAddEvent event, Emitter<PostState> emit) async {
    emit(PostFetchLoadingState());
    bool result = await PostRepo.addPostData(event);
    print(result);
    if(result)
      {
        emit(PostAdditionSuccessState());
      }
    else
      {
        emit(PostAdditionErrorState());
      }
  }
}