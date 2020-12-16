import 'package:FEhViewer/models/galleryComment.dart';
import 'package:FEhViewer/models/states/gallery_model.dart';
import 'package:FEhViewer/pages/gallery_detail/comment_page.dart';
import 'package:FEhViewer/pages/gallery_detail/gallery_detail_page.dart';
import 'package:FEhViewer/pages/gallery_view/gallery_view_page.dart';
import 'package:FEhViewer/pages/tab/controller/gallery_controller.dart';
import 'package:FEhViewer/pages/tab/view/gallery_page.dart';
import 'package:FEhViewer/pages/tab/view/search_page.dart';
import 'package:FEhViewer/utils/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class NavigatorUtil {
  /// 转到画廊列表页面
  static void goGalleryList({int cats = 0}) {
    Get.to(const GalleryListTab(),
        binding: BindingsBuilder<GalleryController>(() {
      Get.put(GalleryController(cats: cats));
    }));
  }

  static void goGalleryListBySearch({
    String simpleSearch,
  }) {
    Get.to(GallerySearchPage(searchText: simpleSearch));
  }

  /// 转到画廊页面
  /// [GalleryModel] 复用画廊状态Provider
  /// fluro的方式不知道怎么处理 使用默认路由方式
  static void goGalleryDetailPr(BuildContext context, {String url}) {
    logger.d(' goGalleryDetailPr');
    if (url != null && url.isNotEmpty) {
      final GalleryModel galleryModel = GalleryModel.initUrl(url: url);
      Get.to(
        ChangeNotifierProvider<GalleryModel>.value(
          value: galleryModel,
          child: const GalleryDetailPage(),
        ),
        preventDuplicates: false,
      );
    } else {
      final GalleryModel galleryModel =
          Provider.of<GalleryModel>(context, listen: false);
      Get.to(
        ChangeNotifierProvider<GalleryModel>.value(
          value: galleryModel,
          child: const GalleryDetailPage(),
        ),
        preventDuplicates: false,
      );
    }
  }

  static void goGalleryDetailReplace(BuildContext context, {String url}) {
    if (url != null && url.isNotEmpty) {
      final GalleryModel galleryModel = GalleryModel.initUrl(url: url);
      Get.off(
        ChangeNotifierProvider<GalleryModel>.value(
          value: galleryModel,
          child: const GalleryDetailPage(),
        ),
        preventDuplicates: false,
      );
    } else {
      final GalleryModel galleryModel =
          Provider.of<GalleryModel>(context, listen: false);
      Get.off(
        ChangeNotifierProvider<GalleryModel>.value(
          value: galleryModel,
          child: const GalleryDetailPage(),
        ),
        preventDuplicates: false,
      );
    }
  }

  static void showSearch() {
    Get.to(const GallerySearchPage());
  }

  /// 转到画廊评论页面
  static void goGalleryDetailComment(List<GalleryComment> comments) {
    Get.to(CommentPage(galleryComments: comments));
  }

  // 转到大图浏览
  static void goGalleryViewPage(BuildContext context, int index) {
    logger.d('goGalleryViewPage');

    final GalleryModel galleryModel =
        Provider.of<GalleryModel>(context, listen: false);

    Get.to(
      ChangeNotifierProvider<GalleryModel>.value(
        value: galleryModel,
        child: GalleryViewPage(index: index),
      ),
      preventDuplicates: false,
    );
  }
}
