import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kidgo/bloc/calendar/calendar_bloc.dart';
import 'package:kidgo/commom/methods.dart';
import 'package:kidgo/components/cus_drawer.dart';
import 'package:kidgo/components/cus_text.dart';
import 'package:kidgo/components/form/cus_drop_dowm_form_field.dart';
import 'package:kidgo/components/form/form_item.dart/form_item_model.dart';
import 'package:kidgo/components/my_appbar.dart';
import 'package:kidgo/models/calendar_model.dart';
import 'package:kidgo/my_app/route/screens.dart';
import 'package:kidgo/screens/calendar/calendar_card.dart';
import 'package:kidgo/screens/calendar/skeleton_calendar_card.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalendarBloc()..add(LoadCalendarEvent()),
      child: Scaffold(
        appBar: _appBar(),
        // body: _body(),
        endDrawer: const CusDrawer(
          screen: Screens.calendar,
        ),
        body: _body(),
      ),
    );
  }

  AppBar _appBar() {
    return MyAppbar(
      avatar: null,
      onMenu: (context) => Scaffold.of(context).openEndDrawer(),
    );
  }

  Padding _body() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CusText.titleMedium('Tuần'),
          const SizedBox(height: 8),
          _dropdown(),
          const SizedBox(height: 8),
          const CusText.bodyMedium(
              'Thời gian di chuyển giao động từ 5 đến 15 phút'),
          const SizedBox(height: 16),
          Expanded(
            child: BlocBuilder<CalendarBloc, CalendarState>(
              builder: (context, state) {
                if (state is CalendarLoadingState) {
                  return _skeleton();
                }
                if (state is CalendarErrorState) {
                  return Center(
                    child: CusText.titleSmall(state.error),
                  );
                }
                if (state is CalendarLoadedState) {
                  return _calendars(state.models);
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _dropdown() {
    return Builder(builder: (context) {
      return CusDropDowmFormField(
        formItem: FormItem(
          fieldName: '',
          hintText: 'Tuần',
          initialValue: 10,
        ),
        selectItem: (data) => Methods.getString(data, fieldName: 'TITLE'),
        items: List.generate(
            50,
            (i) => {
                  'ID': i,
                  'TITLE': 'Tuần ${i + 1}',
                }).toList(),
        itemBuider: (data) {
          return CusText.titleSmall(
              Methods.getString(data, fieldName: 'TITLE'));
        },
        onChanged: (value) {
          context.read<CalendarBloc>().add(LoadCalendarEvent());
        },
      );
    });
  }

  Widget _calendars(List<CalendarModel> models) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 16),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemCount: models.length,
      itemBuilder: (_, index) {
        return CalendarCard(models[index]);
      },
    );
  }

  Widget _skeleton() {
    return SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double heightItem = SkeletonCalendarCard().height;
          double height = constraints.maxHeight != double.infinity
              ? constraints.maxHeight
              : heightItem;
          if (heightItem > height) {
            heightItem = height;
          }
          int count = (height / heightItem).round();
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemCount: count,
            itemBuilder: (_, __) {
              return SkeletonCalendarCard();
            },
          );
        },
      ),
    );
  }
}
