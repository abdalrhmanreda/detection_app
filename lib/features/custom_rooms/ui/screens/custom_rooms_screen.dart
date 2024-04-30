import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:detection_app/core/components/progress_indector.dart';
import 'package:detection_app/features/custom_rooms/logic/rooms_cubit.dart';
import 'package:detection_app/features/custom_rooms/logic/rooms_state.dart';
import 'package:detection_app/features/custom_rooms/ui/widgets/custom_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/assets.dart';
import '../widgets/room_item.dart';

class CustomRoomsScreen extends StatelessWidget {
  const CustomRoomsScreen({
    super.key,
    required this.deviceName,
  });
  final String deviceName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoomsCubit()..fetchRooms(),
      child: BlocConsumer<RoomsCubit, RoomsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body: ConditionalBuilder(
              condition: context.read<RoomsCubit>().merlin.isNotEmpty &&
                  context.read<RoomsCubit>().alioth.isNotEmpty &&
                  context.read<RoomsCubit>().crosshatch.isNotEmpty,
              builder: (context) => CustomScrollView(
                slivers: [
                  CustomSliverAppBar(
                      background: Image.asset(
                    Assets.imagesInstallationBro,
                    fit: BoxFit.cover,
                  )),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return RoomItem(
                          link: context
                              .read<RoomsCubit>()
                              .roms(deviceName)[index]
                              .downloadLink!,
                          xda: context
                              .read<RoomsCubit>()
                              .roms(deviceName)[index]
                              .xda!,
                          roomName: context
                              .read<RoomsCubit>()
                              .roms(deviceName)[index]
                              .romName!,
                          version: context
                              .read<RoomsCubit>()
                              .roms(deviceName)[index]
                              .version!
                              .toString(),
                          device: context
                              .read<RoomsCubit>()
                              .roms(deviceName)[index]
                              .xda!,
                        );
                      },
                      childCount:
                          context.read<RoomsCubit>().roms(deviceName).length,
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
      ),
    );
  }
}
