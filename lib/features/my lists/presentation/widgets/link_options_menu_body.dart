import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/utils/links%20lists%20utils/get_links_lists.dart';
import 'package:z_flow/core/utils/links%20lists%20utils/update_links_list.dart';
import 'package:z_flow/features/my%20lists/data/models/links%20list%20model/links_list_model.dart';
import 'package:z_flow/features/my%20lists/presentation/view%20models/update%20links%20list%20cubit/update_links_list_cubit.dart';
import 'package:z_flow/features/my%20lists/presentation/widgets/list_details_view_body.dart';

import '../../../../core/DI/service_locator.dart';
import '../../../../core/constants/app_texts.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/widgets/build_overlay_menu.dart';
import '../../../home/presentation/views/widgets/custom_pop_up_menu_item.dart';
import '../../data/models/link item model/link_item.dart';

class LinkOptionsMenuBody extends StatelessWidget {
  final LinkItem linkItem;
  final LinksListModel linksListModel;
  final int index;
  const LinkOptionsMenuBody(
      {super.key,
      required this.linkItem,
      required this.linksListModel,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UpdateLinksListCubit>(),
      child: Builder(builder: (context) {
        return Column(
          children: [
            CustomPopUpMenuItem(
                onTap: () {
                  BuildOverlayMenu.removeOverlay();
                  showAddNewLinkBottomSheet(context, linksListModel, index);
                },
                title: AppTexts.edit,
                icon: SvgPicture.asset(
                  Assets.settingsIcon,
                  width: 18.w,
                  height: 18.h,
                )),
            SizedBox(
              height: 20.h,
            ),
            CustomPopUpMenuItem(
                onTap: () async {
                  linksListModel.links.remove(linkItem);
                  await updateLinksList(
                      linksList: linksListModel, context: context);
                  BuildOverlayMenu.removeOverlay();
                  await getLinksLists();
                },
                title: AppTexts.delete,
                icon: SvgPicture.asset(
                  Assets.deleteIcon,
                  width: 18.w,
                  height: 18.h,
                )),
          ],
        );
      }),
    );
  }
}
