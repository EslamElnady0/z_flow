import 'package:flutter/material.dart';
import 'package:z_flow/core/widgets/build_custom_appbar.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';
import 'widgets/custom_bottom_nav_bar.dart';
import 'widgets/custom_drawer.dart';
import 'widgets/home_view_body.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: _scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: buildCustomAppBar(
        context: context,
        onActionPressed: () {},
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
