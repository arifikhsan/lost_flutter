import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_flutter/data/datasources/lost_remote_data_source.dart';
import 'package:lost_flutter/data/repositories/lost_repository_impl.dart';
import 'package:lost_flutter/domain/usecases/get_all_items_usecase.dart';
import 'package:lost_flutter/feature/home/presentation/bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildBlocProvider(context),
    );
  }

  BlocProvider<HomeBloc> buildBlocProvider(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(
        getAllItemsUsecase: GetAllItemsUsecase(
          repository: LostRepositoryImpl(
            remoteDataSource: LostRemoteDataSourceImpl(
              dio: Dio(),
            ),
          ),
        ),
      ),
      child: Column(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeInitial) {
                return Container(
                  // child: ListView.builder(
                  //   itemCount: 3,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return Text('aaa');
                  //   },
                  // ),
                  child: Text('aaa'),
                );
              } else if (state is HomeLoading) {
                return Text('Loading...');
              } else if (state is HomeError) {
                return Text('Error: ${state.messages}');
              } else {
                return Text('Apa saja');
              }
            },
          ),
          RaisedButton(
            child: Text('aaa'),
            onPressed: () async {
              // context.read<HomeBloc>().add(GetAllItems());
              // final response =
              //     await Dio().get('http://localhost:3000/api/v1/items');
              // print(response);
              Response response = await Dio().get("localhost:3000/api/v1/items");
              print(response.data);
            },
          ),
        ],
      ),
    );
  }
}
