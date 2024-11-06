import 'package:digital_health_app/core/extensions/context.dart';
import 'package:digital_health_app/core/extensions/date_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/component/custom_container.dart';
import '../../../core/component/custom_list_tile.dart';
import '../../../core/utilities/colors.dart';
import '../../../core/utilities/strings.dart';
import '../bloc/check_in_bloc/check_in_bloc.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({
    super.key,
  });

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final CheckInBloc checkInBloc = CheckInBloc();

  @override
  void initState() {
    checkInBloc.add(GetCheckInHistoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 20.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "History",
                style: context.titleLarge.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: BlocConsumer<CheckInBloc, CheckInState>(
                bloc: checkInBloc,
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is CheckInLoading) {
                    return const Center(
                      child: SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(
                            color: AppColors.kOrangeColor,
                          )),
                    );
                  } else if (state is CheckInUnsuccessful) {
                    return Center(
                      child: Text(
                        state.message,
                        style: context.titleMedium,
                      ),
                    );
                  } else if (state is NoInternet) {
                    return Center(
                      child: Text(
                        Strings.noInternetConnection,
                        style: context.titleMedium,
                      ),
                    );
                  }

                  if (state is CheckInHistory) {
                    return state.checkInList.isEmpty
                        ? Center(
                            child: Text(
                              Strings.noRecordFound,
                              style: context.titleMedium,
                            ),
                          )
                        : ListView.builder(
                            itemCount: state.checkInList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: CustomContainer(
                                  children: [
                                    CustomListTile(
                                      labelFirst: "Date & time :",
                                      valueFirst: state.checkInList[index].checkInTime.toReadableDateTime(),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
