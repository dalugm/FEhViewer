import 'package:FEhViewer/common/global.dart';
import 'package:FEhViewer/generated/l10n.dart';
import 'package:FEhViewer/models/galleryItem.dart';
import 'package:FEhViewer/models/states/ehconfig_model.dart';
import 'package:FEhViewer/models/states/gallery_model.dart';
import 'package:FEhViewer/pages/gallery_detail/gallery_detail_widget.dart';
import 'package:FEhViewer/pages/gallery_detail/gallery_favcat.dart';
import 'package:FEhViewer/route/navigator_util.dart';
import 'package:FEhViewer/utils/utility.dart';
import 'package:FEhViewer/values/const.dart';
import 'package:FEhViewer/values/theme_colors.dart';
import 'package:FEhViewer/widget/rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

const kHeaderHeight = 200.0;

class GalleryDetailPageLess extends StatelessWidget {
  GalleryDetailPageLess({Key key}) : super(key: key);

  final ScrollController _controller = ScrollController();

  /// 异步请求数据
  Future<GalleryItem> _loadData(context) async {
    final _galleryModel = Provider.of<GalleryModel>(context, listen: false);
    if (!_galleryModel.detailLoadFinish) {
      var _galleryItemFromApi =
          await Api.getGalleryDetail(_galleryModel.galleryItem.url);

      _galleryModel.currentPreviewPage = 0;
      _galleryModel.galleryItem.tagGroup = _galleryItemFromApi.tagGroup;
      _galleryModel.galleryItem.galleryComment =
          _galleryItemFromApi.galleryComment;
      _galleryModel.setGalleryPreview(_galleryItemFromApi.galleryPreview);
      _galleryModel.setFavTitle(_galleryItemFromApi.favTitle,
          favcat: _galleryItemFromApi.favcat);
      _galleryModel.galleryItem.showKey = _galleryItemFromApi.showKey;

      _galleryModel.detailLoadFinish = true;

      return _galleryItemFromApi;
    } else {
      return _galleryModel.galleryItem;
    }
  }

  // 滚动监听
  void _controllerLister(context) {
    final GalleryModel _galleryModel =
        Provider.of<GalleryModel>(context, listen: false);
    if (_controller.offset < kHeaderHeight &&
        !_galleryModel.hideNavigationBtn) {
      _galleryModel.hideNavigationBtn = true;
    } else if (_controller.offset >= kHeaderHeight &&
        _galleryModel.hideNavigationBtn) {
      _galleryModel.hideNavigationBtn = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Global.logger.v('build GalleryDetailPageLess');

    _controller.addListener(() => {_controllerLister(context)});

    /// 因为 CupertinoNavigationBar的特殊 不能直接用Selector包裹控制build 所以在
    /// CupertinoPageScaffold 外层加了 Selector , hideNavigationBtn变化才会重绘
    /// 内容作为 child 缓存避免重绘
    ///
    /// 增加 oriGalleryPreview 变化时可重绘的控制
    return Selector<GalleryModel, Tuple2<bool, bool>>(
      selector: (context, galleryModel) => Tuple2(
          galleryModel.hideNavigationBtn,
          galleryModel.oriGalleryPreview.isNotEmpty),
      shouldRebuild: (pre, next) =>
          pre.item1 != next.item1 || pre.item2 != next.item2,
      builder: (context, _tuple, child) {
        return CupertinoPageScaffold(
          navigationBar:
              _buildNavigationBar(context, hideNavigationBtn: _tuple.item1),
          child: child,
        );
      },
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 12),
          child: ListView(
            physics: AlwaysScrollableScrollPhysics(),
            controller: _controller,
            dragStartBehavior: DragStartBehavior.down,
            children: <Widget>[
              _buildGalletyHead(context),
              Container(
                height: 0.5,
                color: CupertinoColors.systemGrey4,
              ),
              _buildDetail(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetail(context) {
    return Selector<GalleryModel, bool>(
      selector: (_, gllaeryModel) => gllaeryModel.detailLoadFinish,
      builder: (context, loadFinish, child) {
        return FutureBuilder<GalleryItem>(
            future: _loadData(context),
            builder: (context, snapshot) {
              if (loadFinish) {
                return child;
              } else {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.active:
//                    Global.logger.v('active');
                    return _buildLoading(context);
                  case ConnectionState.waiting:
//                    Global.logger.v('waiting');
                    return _buildLoading(context);
                  case ConnectionState.done:
                    Global.logger.v('done');
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return child;
                    }
                }
                return null;
              }
            });
      },
      child: _buildLoadSuccessful(),
    );
  }

  Widget _buildLoading(context) {
    // 加载中 显示一个菊花
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: CupertinoActivityIndicator(
        radius: 15.0,
      ),
    );
  }

  Widget _buildLoadSuccessful() {
    // 加载完成 显示内容
    return GalleryDetailInfo();
  }

  Widget _buildNavigationBar(context, {bool hideNavigationBtn = true}) {
    return hideNavigationBtn
        ? CupertinoNavigationBar()
        : CupertinoNavigationBar(
            middle: _buildNavigationBarImage(context),
            trailing: _buildNavigationBarReadButton(context),
          );
  }

  /// 独立出导航栏的阅读按钮
  Widget _buildNavigationBarReadButton(context) {
    final GalleryModel _galleryModel =
        Provider.of<GalleryModel>(context, listen: false);

    var _hasPreview = _galleryModel.oriGalleryPreview.isNotEmpty;

    var ln = S.of(context);
    return CupertinoButton(
        child: Text(
          ln.READ,
          style: TextStyle(fontSize: 15),
        ),
        minSize: 20,
        padding: const EdgeInsets.fromLTRB(15, 2.5, 15, 2.5),
        borderRadius: BorderRadius.circular(50),
        color: CupertinoColors.activeBlue,
        onPressed: _hasPreview
            ? () {
                NavigatorUtil.goGalleryViewPagePr(context, 0);
              }
            : null);
  }

  Widget _buildNavigationBarImage(context) {
    double _statusBarHeight = MediaQuery.of(context).padding.top;
    final GalleryModel _galleryModel =
        Provider.of<GalleryModel>(context, listen: false);

    return GestureDetector(
      onTap: () {
        _controller.animateTo(0,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      },
      child: Container(
        child: CoveTinyImage(
          imgUrl: _galleryModel.galleryItem.imgUrl,
          statusBarHeight: _statusBarHeight,
        ),
      ),
    );
  }

  /// 构建标题
  /// [EhConfigModel] eh设置的state 控制显示日文还是英文标题
  /// [GalleryModel] 画廊数据
  Widget _buildTitle() {
    return Selector2<EhConfigModel, GalleryModel, String>(
      selector: (context, ehconfig, gallery) {
        var _titleEn = gallery?.galleryItem?.englishTitle ?? '';
        var _titleJpn = gallery?.galleryItem?.japaneseTitle ?? '';

        // 日语标题判断
        var _title =
            ehconfig.isJpnTitle && _titleJpn != null && _titleJpn.isNotEmpty
                ? _titleJpn
                : _titleEn;

        return _title;
      },
      builder: (context, title, child) {
        return Text(
          title,
          maxLines: 5,
          textAlign: TextAlign.left, // 对齐方式
          overflow: TextOverflow.ellipsis, // 超出部分省略号
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
//            fontFamilyFallback: EHConst.FONT_FAMILY_FB,
          ),
        );
      },
    );
  }

  Widget _buildGalletyHead(context) {
    var ln = S.of(context);
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 12, 12),
      child: Column(
        children: [
          Container(
            height: kHeaderHeight,
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              children: <Widget>[
                // 封面
                _buildCoverImage(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // 标题
                      _buildTitle(),
                      // 上传用户
                      _buildUploader(context),
                      Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          // 阅读按钮
                          _buildReadButton(),
                          Spacer(),
                          // 收藏按钮
                          _buildFavIcon(),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: <Widget>[
                // 评分
                _buildRating(context),
                Spacer(),
                // 类型
                _buildCategory(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// 封面图片
  Widget _buildCoverImage() {
    return Selector<GalleryModel, GalleryModel>(
        shouldRebuild: (pre, next) => false,
        selector: (context, provider) => provider,
        builder: (context, GalleryModel galleryModel, child) {
          return ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 150.0),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              child: Hero(
                tag: galleryModel.galleryItem.url +
                    '_cover_${galleryModel.tabIndex}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: galleryModel.galleryItem.imgUrl,
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget _buildReadButton() {
    return Selector<GalleryModel, bool>(
        selector: (context, provider) => provider.oriGalleryPreview.length > 0,
        builder: (context, value, child) {
          var ln = S.of(context);
          return CupertinoButton(
              child: Text(
                ln.READ,
                style: TextStyle(fontSize: 15),
              ),
              minSize: 20,
              padding: const EdgeInsets.fromLTRB(15, 2.5, 15, 2.5),
              borderRadius: BorderRadius.circular(50),
              color: CupertinoColors.activeBlue,
              onPressed: value
                  ? () {
                      NavigatorUtil.goGalleryViewPagePr(context, 0);
                    }
                  : null);
        });
  }

  // 类别 点击可跳转搜索
  Widget _buildCategory(context) {
    final GalleryModel _galleryModel =
        Provider.of<GalleryModel>(context, listen: false);

    Color _colorCategory =
        ThemeColors.nameColor[_galleryModel?.galleryItem?.category ?? "defaule"]
                ["color"] ??
            CupertinoColors.white;

    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          padding: const EdgeInsets.fromLTRB(6, 3, 6, 3),
          color: _colorCategory,
          child: Text(
            _galleryModel?.galleryItem?.category ?? '',
            style: TextStyle(
              fontSize: 14.5,
              // height: 1.1,
              color: CupertinoColors.white,
            ),
          ),
        ),
      ),
      onTap: () {
        final iCat =
            EHConst.cats[_galleryModel?.galleryItem?.category?.trim() ?? ''];
        final cats = EHConst.sumCats - iCat;
        NavigatorUtil.goGalleryList(context, cats: cats);
      },
    );
  }

  Widget _buildRating(context) {
    final GalleryModel _galleryModel =
        Provider.of<GalleryModel>(context, listen: false);

    return Row(
      children: <Widget>[
        Container(
            padding: const EdgeInsets.only(right: 8),
            child: Text("${_galleryModel?.galleryItem?.rating ?? ''}")),
        // 星星
        StaticRatingBar(
          size: 18.0,
          rate: _galleryModel?.galleryItem?.rating ?? 0,
          radiusRatio: 1.5,
        ),
      ],
    );
  }

  Widget _buildFavIcon() {
    return GalleryFavButton();
  }

  // 上传用户
  Widget _buildUploader(context) {
    final GalleryModel _galleryModel =
        Provider.of<GalleryModel>(context, listen: false);

    var _uploader = _galleryModel?.galleryItem?.uploader ?? '';
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: const EdgeInsets.only(top: 8, bottom: 8),
        child: Text(
          _uploader,
          maxLines: 1,
          textAlign: TextAlign.left, // 对齐方式
          overflow: TextOverflow.ellipsis, // 超出部分省略号
          style: TextStyle(
            fontSize: 13,
            color: Colors.brown,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      onTap: () {
        Global.logger.v('search uploader:$_uploader');
        NavigatorUtil.goGalleryList(context,
            simpleSearch: 'uploader:$_uploader');
      },
    );
  }
}
