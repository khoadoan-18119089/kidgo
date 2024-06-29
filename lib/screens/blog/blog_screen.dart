import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kidgo/bloc/blog/blog_bloc.dart';
import 'package:kidgo/components/cus_drawer.dart';
import 'package:kidgo/components/cus_text.dart';
import 'package:kidgo/components/my_appbar.dart';
import 'package:kidgo/models/blog_model.dart';
import 'package:kidgo/my_app/route/screens.dart';
import 'package:kidgo/screens/blog/blog_card.dart';
import 'package:kidgo/screens/blog/skeleton_blog_card.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlogBloc()..add(LoadBlogEvent()),
      child: Scaffold(
        appBar: _appBar(),
        endDrawer: const CusDrawer(
          screen: Screens.blog,
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
        children: [
          const CusText.titleLarge('THÔNG TIN MỚI NHẤT CỦA KIDGO'),
          Expanded(
            child: BlocBuilder<BlogBloc, BlogState>(
              builder: (context, state) {
                if (state is BlogloadingState) {
                  return _skeleton();
                }
                if (state is BlogErrorState) {
                  return Center(
                    child: CusText.titleSmall(state.error),
                  );
                }
                if (state is BlogLoadedState) {
                  return _blogs(state.models);
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _blogs(List<BlogModel> models) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 16),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemCount: 8,
      itemBuilder: (_, index) {
        return BlogCard();
      },
    );
  }

  Widget _skeleton() {
    return SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double heightItem = SkeletonBlogCard().height;
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
              return SkeletonBlogCard();
            },
          );
        },
      ),
    );
  }
}
