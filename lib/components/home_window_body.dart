import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/store/store.dart';

class HomeWindowBody extends StatelessWidget {
  const HomeWindowBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          BlocBuilder<StoreCubit,StoreState>(
            builder: (context, state) {
              return Text(context.read<StoreCubit>().state.counter.toString());
            },
          ),
          TextButton(onPressed: ()=>{
            context.read<StoreCubit>().increment()
          }, child: const Text('Button')),
        ],
      ),
    );
  }
}