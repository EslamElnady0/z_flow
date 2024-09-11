import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/utils/links%20lists%20utils/generate_platform_logo.dart';
import 'package:z_flow/core/utils/links%20lists%20utils/get_links_lists.dart';
import 'package:z_flow/core/utils/links%20lists%20utils/update_links_list.dart';
import 'package:z_flow/features/my%20lists/data/models/link%20item%20model/link_item.dart';
import 'package:z_flow/features/my%20lists/presentation/view%20models/update%20links%20list%20cubit/update_links_list_cubit.dart';
import '../../../../core/DI/service_locator.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/styles/styles.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/presentation/views/widgets/custom_auth_textfield.dart';
import '../../../home/presentation/views/widgets/save_cancel_actions_row.dart';
import '../../data/models/links list model/links_list_model.dart';

class AddNewLinkBottomSheetBody extends StatefulWidget {
  final LinksListModel linksListModel;
  final int? index;
  const AddNewLinkBottomSheetBody(
      {super.key, required this.linksListModel, this.index});

  @override
  State<AddNewLinkBottomSheetBody> createState() =>
      _AddNewLinkBottomSheetBodyState();
}

class _AddNewLinkBottomSheetBodyState extends State<AddNewLinkBottomSheetBody> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController linkController;
  String platformLogo = '';
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    titleController = TextEditingController(
        text: widget.index == null
            ? ""
            : widget.linksListModel.links[widget.index!].name);
    descriptionController = TextEditingController(
        text: widget.index == null
            ? ""
            : widget.linksListModel.links[widget.index!].description);
    linkController = TextEditingController(
        text: widget.index == null
            ? ""
            : widget.linksListModel.links[widget.index!].url);
    linkController.addListener(() {
      setState(() {
        platformLogo = getPlatformLogo(linkController.text);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UpdateLinksListCubit>(),
      child: Builder(builder: (context) {
        return Container(
          decoration: BoxDecoration(
              gradient: Constants.drawerGradient,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r))),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(Icons.close))),
                        Text(
                          S.of(context).addNewLink,
                          style:
                              Styles.style18w500.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    Divider(
                      height: 25.h,
                    ),
                    Text(S.of(context).easilyAddANewLink,
                        style: Styles.style14w400),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomAuthTextField(
                        hintText: S.of(context).title,
                        suffix: Padding(
                          padding: EdgeInsets.all(12.r),
                          child: SvgPicture.asset(
                            Assets.linksPin,
                            height: 16.h,
                            width: 16.w,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        icon: null,
                        controller: titleController),
                    SizedBox(
                      height: 12.h,
                    ),
                    CustomAuthTextField(
                        hintText: S.of(context).description,
                        suffix: Padding(
                          padding: EdgeInsets.all(13.5.r),
                          child: SvgPicture.asset(
                            Assets.editIcon,
                            height: 8.h,
                            width: 8.w,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        icon: null,
                        controller: descriptionController),
                    SizedBox(
                      height: 12.h,
                    ),
                    CustomAuthTextField(
                        hintText: "ex: https://www.google.com",
                        icon: null,
                        onChanged: (p0) {
                          setState(() {
                            getPlatformLogo(linkController.text);
                          });
                        },
                        validator: (value) {
                          String pattern =
                              r"^(https?:\/\/)?([a-zA-Z0-9\-_]+\.)+[a-zA-Z]{2,}(:\d{1,5})?(\/[^\s]*)?$";
                          RegExp regExp = RegExp(pattern);
                          if (value == null || value.isEmpty) {
                            return "this field is required";
                          } else if (!regExp.hasMatch(value)) {
                            return "invalid url";
                          }
                          return null;
                        },
                        suffix: Padding(
                          padding: EdgeInsets.all(12.r),
                          child: SvgPicture.asset(
                            platformLogo == ""
                                ? Assets.defaultWebSite
                                : getPlatformLogo(linkController.text),
                            height: 16.h,
                            width: 16.w,
                          ),
                        ),
                        controller: linkController),
                    SizedBox(
                      height: 25.h,
                    ),
                    BottomScreenActions(
                        onOtherButtonPressed: () {
                          Navigator.of(context).pop();
                        },
                        otherButtonText: S.of(context).cancel,
                        onPrimaryButtonPressed: () async {
                          if (formKey.currentState!.validate()) {
                            LinkItem linkItem = LinkItem(
                                name: titleController.text,
                                description: descriptionController.text,
                                url: linkController.text);
                            if (widget.index == null) {
                              widget.linksListModel.links.add(linkItem);
                            } else {
                              widget.linksListModel.links[widget.index!] =
                                  linkItem;
                            }
                            await updateLinksList(
                                linksList: widget.linksListModel,
                                context: context);
                            if (context.mounted) {
                              await getLinksLists(context);
                            }
                            if (context.mounted) {
                              Navigator.of(context).pop();
                            }
                          }
                        })
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
