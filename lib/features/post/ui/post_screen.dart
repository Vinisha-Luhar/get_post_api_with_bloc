import 'package:api_request_bloc/features/post/bloc/post_bloc.dart';
import 'package:api_request_bloc/features/post/ui/add_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  final postBloc = PostBloc();

  @override
  void initState() {
    postBloc.add(PostInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Screen'),
        actions: [
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPostScreen(),)),
            child: const SizedBox(
              width: 100,
              child: Center(child: Text('Add Data',textAlign: TextAlign.center,style: TextStyle(
                color: Colors.white,
                fontSize: 17
              ),)),
            ),
          )
        ],
      ),
      body: BlocBuilder<PostBloc,PostState>(
        bloc: postBloc,
        builder: (context, state) {
          if(state is PostFetchLoadingState)
            {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          if(state is PostFetchingSuccessfull)
            {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          //shrinkWrap: true,
                          itemCount: state.post.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey.shade500,style: BorderStyle.solid,width: 1)
                                ),
                                child: Column(
                                  children: [
                                    Text(state.post[index].title,style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                     ),
                                    ),
                                    const SizedBox(height: 10,),
                                    Text(state.post[index].body,style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                    ),
                                  ],
                                ),
                              );
                            },
                        ),
                      )
                    ],
                  )
                ),
              );
            }
          else
            {
              return Text('Something went wrong');
            }
        },
      )
    );
  }
}
