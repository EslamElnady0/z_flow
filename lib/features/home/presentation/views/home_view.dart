import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z_flow/core/routes/app_router.dart';
import 'package:z_flow/core/widgets/build_custom_appbar.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';
import 'package:z_flow/features/home/presentation/ui%20logic/ui%20cubits/cubit/bottom_nav_bar_cubit.dart';
import 'widgets/custom_bottom_nav_bar.dart';
import 'widgets/custom_drawer.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: _scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: buildCustomAppBar(
        index: context.read<BottomNavBarCubit>().selectedIndex,
        context: context,
        onActionPressed: () {
          Navigator.pushNamed(context, AppRouter.search);
        },
        onLeadingPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ),
      extendBody: true,
      body: const HomeViewBody(),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
