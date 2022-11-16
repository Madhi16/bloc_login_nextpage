import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../list_bloc/list_bloc.dart';
import '../list_bloc/list_event.dart';
import '../list_bloc/list_state.dart';
import '../services/api_repositry.dart';

class ListViewData extends StatefulWidget {
  const ListViewData({Key? key}) : super(key: key);

  @override
  State<ListViewData> createState() => _ListViewDataState();
}
class _ListViewDataState extends State<ListViewData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("List View"),backgroundColor: Colors.red,),
        body: BlocProvider(
            create: (context) =>
            ListBloc(apiRepository: ApiRepository())
              ..add(listDetails()),
            child: BlocListener<ListBloc, ListState>(
                listener: (context, state) {
                  if (state is ListError) {
                  } else if (state is ListLoaded) {
                  }
                },
                child: BlocBuilder<ListBloc, ListState>(
                    builder: (context, state) {
                      if (state is ListLoaded) {
                        return showLoader();
                      } else if (state is ListReady) {
                        return ListView.builder(
                          itemCount: state.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: ListTile(
                                title: Text(state.data[index].title),
                                subtitle: Text(state.data[index].completed.toString()),
                                trailing: Text(state.data[index].id.toString()),
                              ),
                            );
                          },
                        );
                      } else {
                        return Container();
                      }
                    }))));
  }

  Widget showLoader() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}