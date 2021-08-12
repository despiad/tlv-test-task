import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlv_test_task/injection_container.dart';
import 'package:tlv_test_task/presentation/bloc/search_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SPACEX MISSIONS'),
      ),
      body: BlocProvider(
        create: (context) => sl<SearchBloc>(),
        child: Builder(builder: (context) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    if (value.isEmpty) {
                      context.read<SearchBloc>().add(ClearSearch());
                    }
                    if (value.length < 3) {
                      return;
                    } else {
                      context.read<SearchBloc>().add(PerformSearch(value));
                    }
                  },
                  controller: _searchController,
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: BlocConsumer<SearchBloc, SearchState>(
                  listener: (context, state) {
                    if (state is SearchError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorMessage)));
                    }
                  },
                  builder: (context, state) {
                    if (state is SearchLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is SearchSuccessEmpty) {
                      return const Center(child: Text('No results'));
                    } else if (state is SearchSuccess) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.missions.length,
                        itemBuilder: (context, index) {
                          final item = state.missions[index];
                          return ListTile(
                            title: Text(item.name),
                            leading: Text(item.id),
                            subtitle: item.details != null
                                ? Text(
                                    item.details!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                : null,
                          );
                        },
                      );
                    }
                    return const Center(
                      child: Text('Start searching!'),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
