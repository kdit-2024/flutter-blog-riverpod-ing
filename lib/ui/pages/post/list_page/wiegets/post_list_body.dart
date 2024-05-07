import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/post_detail_page.dart';
import 'package:flutter_blog/ui/pages/post/list_page/post_list_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'post_list_item.dart';

// 이 화면 빌드될 때, 창고, 창고데이터, 창고관리자 생성되어야 한다.
class PostListBody extends ConsumerWidget {
  const PostListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostListModel? model = ref.watch(postListProvider);
    PostListViewModel viewModel = ref.read(postListProvider.notifier);

    if (model == null) {
      return CircularProgressIndicator();
    } else {
      return SmartRefresher(
        controller: viewModel.refreshCtrl,
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: () async => await viewModel.notifyInit(0),
        onLoading: () async => await viewModel.nextList(),
        child: ListView.separated(
          itemCount: model.posts.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => PostDetailPage(model.posts[index].id)));
              },
              child: PostListItem(model.posts[index]),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ),
      );
    }
  }
}
