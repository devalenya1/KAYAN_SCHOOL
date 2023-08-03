import 'package:eschool/cubits/appSettingsCubit.dart';
import 'package:eschool/data/repositories/systemInfoRepository.dart';
import 'package:eschool/ui/widgets/appSettingsBlocBuilder.dart';
import 'package:eschool/ui/widgets/customAppbar.dart';
import 'package:eschool/utils/labelKeys.dart';
import 'package:eschool/utils/uiUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatTeachers extends StatefulWidget {
  const ChatTeachers({Key? key}) : super(key: key);

  @override
  State<ChatTeachers> createState() => _ChatTeachersState();

  static Route route(RouteSettings routeSettings) {
    return CupertinoPageRoute(
        builder: (_) => BlocProvider<AppSettingsCubit>(
              create: (context) => AppSettingsCubit(SystemRepository()),
              child: const ChatTeachers(),
            ),);
  }
}

class _ChatTeachersState extends State<ChatTeachers> {
  final String chatTeachersType = "chat_teachers";

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context
          .read<AppSettingsCubit>()
          .fetchAppSettings(type: chatTeachersType);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppSettingsBlocBuilder(
            appSettingsType: chatTeachersType,
          ),
          CustomAppBar(
              title: UiUtils.getTranslatedLabel(context, teacherschatKey),)
        ],
      ),
    );
  }
}
