import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/app/module/teams/controller/teams_controller.dart';
import 'package:tests/app/ui/app_bar.dart';

class TeamsView extends StatefulWidget {
  final TeamsController controller;
  const TeamsView({super.key, required this.controller});

  @override
  State<TeamsView> createState() => _TeamsViewState();
}

class _TeamsViewState extends State<TeamsView> {
  @override
  void initState() {
    widget.controller.getAllTeams();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarUi(
            title: "Teams",
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<TeamsController, TeamsState>(
              bloc: widget.controller,
              builder: (context, state) {
                if (state.teamsStatus == TeamsStatus.success) {
                  return Container(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 120),
                      child: ListView.separated(
                          separatorBuilder: (context, index) => Divider(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => print("oi"),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.memory(
                                        height: 100,
                                        width: 120,
                                        Uint8List.fromList(
                                            state.teams![index].imageBytes),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.teams![index].name,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Montserrat',
                                              ),
                                            ),
                                            Text(
                                              state.teams![index].country,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Montserrat',
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 24),
                                    child: Icon(Icons.arrow_right),
                                  )
                                ],
                              ),
                            );
                          },
                          primary: false,
                          shrinkWrap: true,
                          itemCount: state.teams!.length),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
