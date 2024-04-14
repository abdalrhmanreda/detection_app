import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:detection_app/core/components/progress_indector.dart';
import 'package:detection_app/features/chatbot/logic/chat_bot_state.dart';
import 'package:detection_app/features/custom_rooms/logic/rooms_cubit.dart';
import 'package:detection_app/features/custom_rooms/logic/rooms_state.dart';
import 'package:detection_app/features/custom_rooms/ui/widgets/custom_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/room_item.dart';

class CustomRoomsScreen extends StatelessWidget {
  const CustomRoomsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RoomsCubit, RoomsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: ConditionalBuilder(
            condition: state is! Loading &&
                context.read<RoomsCubit>().rooms.isNotEmpty,
            builder: (context) => CustomScrollView(
              slivers: [
                const CustomSliverAppBar(),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return RoomItem(
                        link: context.read<RoomsCubit>().rooms[index].link!,
                        xda: context.read<RoomsCubit>().rooms[index].xda!,
                        roomName:
                            context.read<RoomsCubit>().rooms[index].roomName!,
                        version: context
                            .read<RoomsCubit>()
                            .rooms[index]
                            .version!
                            .toString(),
                        device: context.read<RoomsCubit>().rooms[index].device!,
                      );
                    },
                    childCount: context.read<RoomsCubit>().rooms.length,
                  ),
                ),
              ],
            ),
            fallback: (context) => const Center(
              child: CustomLoadingIndicator(),
            ),
          ),
        );
      },
    );
  }
}
