import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/styles/styles.dart';

import '../cubit/stay_away_cubit.dart';

// ignore: must_be_immutable
class CustomTimePickPageView extends StatefulWidget {
  final PageController controller;
  final double currentPage;
  final List<String> list;
  final String suffixString;
  bool isMins;
  CustomTimePickPageView(
      {super.key,
      required this.controller,
      required this.currentPage,
      required this.list,
      required this.suffixString,
      this.isMins = true});

  @override
  State<CustomTimePickPageView> createState() => _CustomTimePickPageViewState();
}

class _CustomTimePickPageViewState extends State<CustomTimePickPageView> {
  late AudioPlayer player = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future<void> playSound() async {
    await player.play(AssetSource(
      Assets.counterAudio,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      width: 100.w,
      child: PageView.builder(
          scrollDirection: Axis.vertical,
          controller: widget.controller,
          itemCount: widget.list.length,
          onPageChanged: (int index) async {
            await playSound();
            if (context.mounted) {
              if (widget.isMins) {
                BlocProvider.of<StayAwayCubit>(context).mins =
                    int.parse(widget.list[index]);
              } else {
                BlocProvider.of<StayAwayCubit>(context).hours =
                    int.parse(widget.list[index]);
              }
            }
          },
          itemBuilder: (context, index) {
            bool isCenterItem = widget.currentPage.round() == index;

            return isCenterItem
                ? Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: Constants.customButtonGradient),
                    child: Center(
                      child: Text(
                        "${widget.list[index]} ${widget.suffixString}",
                        style: Styles.style20W600.copyWith(color: Colors.white),
                      ),
                    ),
                  )
                : Center(
                    child: Text(
                      "${widget.list[index]} ${widget.suffixString}",
                      style: Styles.style20W600.copyWith(color: Colors.grey),
                    ),
                  );
          }),
    );
  }
}
