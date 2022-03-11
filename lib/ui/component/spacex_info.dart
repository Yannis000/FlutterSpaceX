import 'package:flutter/material.dart';
import 'package:flutter_space_x/core/model/company.dart';

import '../../core/manager/api_manager.dart';
import '../../core/manager/locator.dart';
import '../../core/model/crew.dart';

class SpacexInfo extends StatelessWidget {
  const SpacexInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder(
            future: locator<ApiManager>().getCompanyInformation(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var companyInformation = snapshot.data as Company;
                return Column(
                  children: [
                    Image.network(
                        "https://logo-marque.com/wp-content/uploads/2020/09/SpaceX-Logo.png",
                        width: 250,
                        height: 150),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 32, 0),
                          child: Row(
                            children: [
                              const Icon(Icons.person_outline),
                              Text(companyInformation.founder)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 32, 0),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today),
                              Text(companyInformation.founded.toString())
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 32, 0),
                          child: Row(
                            children: [
                              const Icon(Icons.people),
                              Text(companyInformation.employees.toString())
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                companyInformation.summary,
                                maxLines: 6,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        )),
                    const Text("Crew members"),
                    Center(
                      child: FutureBuilder(
                          future: locator<ApiManager>().getAllCrewMembers(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var crew = snapshot.data as List<Crew>;
                              return SizedBox(
                                height: 230,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount: crew.length,
                                          itemBuilder: (context, i) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 16, 32, 0),
                                              child: Column(
                                                children: [
                                                  ClipOval(
                                                    child: Image.network(
                                                      crew[i].image ?? "",
                                                      width: 180,
                                                      height: 180,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 16, 0, 0),
                                                    child: Text(
                                                        crew[i].name ?? ""),
                                                  )
                                                ],
                                              ),
                                            );
                                          }),
                                    )
                                  ],
                                ),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    )
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
