import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:detection_app/core/components/progress_indector.dart';
import 'package:detection_app/features/chatbot/logic/chat_bot_state.dart';
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
              condition: state is! Loading,
              builder: (context) => context
                      .read<RoomsCubit>()
                      .roms(context.read<RoomsCubit>().deviceName)
                      .isEmpty
                  ? Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'No Custom ROMs Available For This Device',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : CustomScrollView(
                      slivers: [
                        CustomSliverAppBar(
                            leading: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.black,
                              ),
                            ),
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
                                    .deviceName
                                    .toUpperCase(),
                                romModel: context
                                    .read<RoomsCubit>()
                                    .roms(deviceName)[index],
                              );
                            },
                            childCount: context
                                .read<RoomsCubit>()
                                .roms(deviceName)
                                .length,
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
