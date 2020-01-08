import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_bloc_example/bloc/user_details/user_details_bloc.dart';
import 'package:flutter_demo_bloc_example/bloc/user_details/user_details_event.dart';
import 'package:flutter_demo_bloc_example/bloc/user_details/user_details_state.dart';
import 'package:flutter_demo_bloc_example/constants/user_constant.dart';
import 'package:flutter_demo_bloc_example/model/network/user_data.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  ScrollController _scrollController;
  int page = 1;
  List<UserData> totalItemList;

  UserDetailsSuccessState userDetailsSuccessState;

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();

    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(UserConstant.USER_DETAILS),
        ),
        body: BlocBuilder<UserDetailsBloc, UserDetailsState>(
          builder: (context, state) {
            if (state is UserDetailsLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserDetailsSuccessState) {
              page = state.page;
              userDetailsSuccessState = state;
              totalItemList = state.userResponse.data;

              return ListView.builder(
                  controller: _scrollController,
                  itemCount: state.userResponse.data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [BoxShadow(color: Colors.grey)],
                            color: Colors.white70),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      UserConstant.ID,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(state.userResponse.data[index].id
                                        .toString()),
                                  ],
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      UserConstant.FIRST_NAME,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(state
                                        .userResponse.data[index].firstName),
                                  ],
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      UserConstant.LAST_NAME,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(state
                                        .userResponse.data[index].lastName),
                                  ],
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      UserConstant.EMAIL,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(state.userResponse.data[index].email),
                                  ],
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }

            if (state is UserDetailsFailed) {
              return Center(
                child: Text(state.e.toString()),
              );
            }

            return Container(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  void _loadMore() {
    if (userDetailsSuccessState != null &&
        userDetailsSuccessState.userResponse != null) {
      int totalPage = userDetailsSuccessState.userResponse.totalPages;
      int totalItem = userDetailsSuccessState.userResponse.total;
      if (page < totalPage && totalItemList.length < totalItem) {
        BlocProvider.of<UserDetailsBloc>(context).add(FetchUserDetailsEvent(
          ++page,
        ));
      }
    }
  }
}
