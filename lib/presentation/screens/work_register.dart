import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_project/cubit/work_cubit.dart';

class WorkRegister extends StatefulWidget {
  final String name;

  const WorkRegister({super.key, required this.name});

  @override
  _WorkRegister createState() => _WorkRegister();
}

class _WorkRegister extends State<WorkRegister> {
  @override
  void initState() {
    super.initState();
    context.read<WorkCubit>().fetchAllWorks();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void closeScreen() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: BlocBuilder<WorkCubit, WorkState>(
        builder: (context, state) {
          if (state is WorkLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WorkSuccess) {
            return ListView.builder(
              itemCount: state.works.length,
              itemBuilder: (context, index) {
                final work = state.works[index];
                return ListTile(
                  title: Text(work.title),
                  subtitle: Text(work.description),
                );
              },
            );
          } else if (state is WorkError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text("No works available"));
          }
        },
      ),
    );
  }
}
