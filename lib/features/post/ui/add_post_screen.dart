

import 'package:api_request_bloc/features/post/bloc/post_bloc.dart';
import 'package:api_request_bloc/features/post/ui/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  final userIdController = TextEditingController();
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final postBloc = BlocProvider.of<PostBloc>(context);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: BlocListener<PostBloc,PostState>(
            bloc: postBloc,
            listener: (context, state) {
              if(state is PostAdditionSuccessState)
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Data Added Successfully'))
                  );
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const PostScreen()), (route) => false);
                }
              if(state is PostAdditionErrorState)
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Something went wrong'))
                  );
                }
            },
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
                Text('ADD DATA',textAlign: TextAlign.center,style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 25,
                  fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                TextFormField(
                   controller: userIdController,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 20,
                    fontWeight: FontWeight.w400
                  ),
                  cursorWidth: 2,
                  cursorColor: Colors.grey.shade700,
                  keyboardType: TextInputType.number,
                  cursorHeight: 20.0,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                    hintText: "User id",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.grey.shade700
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                        width: 2,
                        style: BorderStyle.solid
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 2,
                          style: BorderStyle.solid
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                TextFormField(
                  controller: titleController,
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                  ),
                  cursorWidth: 2,
                  cursorColor: Colors.grey.shade700,
                  keyboardType: TextInputType.text,
                  cursorHeight: 20.0,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                    hintText: "Title",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.grey.shade700
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 2,
                          style: BorderStyle.solid
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 2,
                          style: BorderStyle.solid
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                TextFormField(
                  controller: bodyController,
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                  ),
                  cursorWidth: 2,
                  cursorColor: Colors.grey.shade700,
                  keyboardType: TextInputType.multiline,
                  maxLines: 7,
                  cursorHeight: 20.0,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                    hintText: "Body",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.grey.shade700
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 2,
                          style: BorderStyle.solid
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 2,
                          style: BorderStyle.solid
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                ElevatedButton(
                    onPressed: (){
                      postBloc.add(PostAddEvent(
                          userId: userIdController.text.trim(),
                          title: titleController.text.trim(),
                          body: bodyController.text.trim())
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                    ),
                    child: Text('ADD',style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.grey.shade700
                    ),)
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
