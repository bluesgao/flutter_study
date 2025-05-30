import 'constants.dart';

class Api {
  // 推荐视频
  static const String recommendListApp =
      '${HttpString.appBaseUrl}/x/v2/feed/index';
  static const String recommendListWeb = '/x/web-interface/index/top/feed/rcmd';

  // 热门视频
  static const String hotList = '/x/web-interface/popular';

  // 视频流
  // https://github.com/SocialSisterYi/bilibili-API-collect/blob/master/docs/video/videostream_url.md
  static const String videoUrl = '/x/player/wbi/playurl';

  // 视频详情
  // 竖屏 https://api.bilibili.com/x/web-interface/view?aid=527403921
  // https://api.bilibili.com/x/web-interface/view/detail  获取视频超详细信息(web端)
  static const String videoIntro = '/x/web-interface/view';

  // 视频详情 超详细
  // https://api.bilibili.com/x/web-interface/view/detail?aid=527403921

  /// https://github.com/SocialSisterYi/bilibili-API-collect/blob/master/docs/video/action.md
  // 点赞 Post
  /// aid	num	稿件avid	必要（可选）	avid与bvid任选一个
  /// bvid	str	稿件bvid	必要（可选）	avid与bvid任选一个
  /// like	num	操作方式	必要	1：点赞 2：取消赞
  // csrf	str	CSRF Token（位于cookie）	必要
  // https://api.bilibili.com/x/web-interface/archive/like
  static const String likeVideo = '/x/web-interface/archive/like';

  //判断视频是否被点赞（双端）Get
  // access_key	str	APP登录Token	APP方式必要
  /// aid	num	稿件avid	必要（可选）	avid与bvid任选一个
  /// bvid	str	稿件bvid	必要（可选）	avid与bvid任选一个
  // https://api.bilibili.com/x/web-interface/archive/has/like
  static const String hasLikeVideo = '/x/web-interface/archive/has/like';

  // 视频点踩 web端不支持

  // 投币视频（web端）POST
  /// aid	num	稿件avid	必要（可选）	avid与bvid任选一个
  /// bvid	str	稿件bvid	必要（可选）	avid与bvid任选一个
  /// multiply	num	投币数量	必要	上限为2
  /// select_like	num	是否附加点赞	非必要	0：不点赞 1：同时点赞 默认为0
  // csrf	str	CSRF Token（位于cookie）	必要
  // https://api.bilibili.com/x/web-interface/coin/add
  static const String coinVideo = '/x/web-interface/coin/add';

  // 判断视频是否被投币（双端）GET
  // access_key	str	APP登录Token	APP方式必要
  /// aid	num	稿件avid	必要（可选）	avid与bvid任选一个
  /// bvid	str	稿件bvid	必要（可选）	avid与bvid任选一个
  /// https://api.bilibili.com/x/web-interface/archive/coins
  static const String hasCoinVideo = '/x/web-interface/archive/coins';

  // 收藏视频（双端）POST
  // access_key	str	APP登录Token	APP方式必要
  /// rid	num	稿件avid	必要
  /// type	num	必须为2	必要
  /// add_media_ids	nums	需要加入的收藏夹mlid	非必要	同时添加多个，用,（%2C）分隔
  /// del_media_ids	nums	需要取消的收藏夹mlid	非必要	同时取消多个，用,（%2C）分隔
  // csrf	str	CSRF Token（位于cookie）	Cookie方式必要
  // https://api.bilibili.com/medialist/gateway/coll/resource/deal
  // https://api.bilibili.com/x/v3/fav/resource/deal
  static const String favVideo = '/x/v3/fav/resource/deal';

  // 判断视频是否被收藏（双端）GET
  /// aid
  // https://api.bilibili.com/x/v2/fav/video/favoured
  static const String hasFavVideo = '/x/v2/fav/video/favoured';

  // 分享视频 （Web端） POST
  // https://api.bilibili.com/x/web-interface/share/add
  // aid	num	稿件avid	必要（可选）	avid与bvid任选一个
  // bvid	str	稿件bvid	必要（可选）	avid与bvid任选一个
  // csrf	str	CSRF Token（位于cookie）	必要

  // 一键三连
  // https://api.bilibili.com/x/web-interface/archive/like/triple
  // aid	num	稿件avid	必要（可选）	avid与bvid任选一个
  // bvid	str	稿件bvid	必要（可选）	avid与bvid任选一个
  // csrf	str	CSRF Token（位于cookie）	必要
  static const String oneThree = '/x/web-interface/archive/like/triple';

  // 获取指定用户创建的所有收藏夹信息
  // 该接口也能查询目标内容id存在于那些收藏夹中
  // up_mid	num	目标用户mid	必要
  // type	num	目标内容属性	非必要	默认为全部 0：全部 2：视频稿件
  // rid	num	目标 视频稿件avid
  static const String videoInFolder = '/x/v3/fav/folder/created/list-all';

  // 视频详情页 相关视频
  static const String relatedList = '/x/web-interface/archive/related';

  // 查询用户与自己关系_仅查关注
  static const String hasFollow = '/x/relation';

  // 操作用户关系
  static const String relationMod = '/x/relation/modify';

  // 相互关系查询 // 失效
  // static const String relationSearch = '/x/space/wbi/acc/relation';

  // 评论列表
  // https://api.bilibili.com/x/v2/reply/main?csrf=6e22efc1a47225ea25f901f922b5cfdd&mode=3&oid=254175381&pagination_str=%7B%22offset%22:%22%22%7D&plat=1&seek_rpid=0&type=11
  static const String replyList = '/x/v2/reply';

  // 楼中楼
  static const String replyReplyList = '/x/v2/reply/reply';

  // 评论点赞
  static const String likeReply = '/x/v2/reply/action';

  // 发表评论
  // https://github.com/SocialSisterYi/bilibili-API-collect/blob/master/docs/comment/action.md
  static const String replyAdd = '/x/v2/reply/add';

  // 用户(被)关注数、投稿数
  // https://api.bilibili.com/x/relation/stat?vmid=697166795
  static const String userStat = '/x/relation/stat';

  // 获取用户信息
  static const String userInfo = '/x/web-interface/nav';

  // 获取当前用户状态
  static const String userStatOwner = '/x/web-interface/nav/stat';

  // 收藏夹
  // https://api.bilibili.com/x/v3/fav/folder/created/list?pn=1&ps=10&up_mid=17340771
  static const String userFavFolder = '/x/v3/fav/folder/created/list';

  /// 收藏夹 详情
  /// media_id  当前收藏夹id 搜索全部时为默认收藏夹id
  /// pn int 当前页
  /// ps int pageSize
  /// keyword String 搜索词
  /// order String 排序方式 view 最多播放 mtime 最近收藏 pubtime 最近投稿
  /// tid int 分区id
  /// platform web
  /// type 0 当前收藏夹 1 全部收藏夹
  // https://api.bilibili.com/x/v3/fav/resource/list?media_id=76614671&pn=1&ps=20&keyword=&order=mtime&type=0&tid=0
  static const String userFavFolderDetail = '/x/v3/fav/resource/list';

  // 正在直播的up & 关注的up
  // https://api.bilibili.com/x/polymer/web-dynamic/v1/portal
  static const String followUp = '/x/polymer/web-dynamic/v1/portal';

  // 关注的up动态
  // https://api.bilibili.com/x/polymer/web-dynamic/v1/feed/all
  // https://api.bilibili.com/x/polymer/web-dynamic/v1/feed/all?timezone_offset=-480&type=video&page=1&features=itemOpusStyle
  // https://api.bilibili.com/x/polymer/web-dynamic/v1/feed/all?host_mid=548196587&offset=&page=1&features=itemOpusStyle
  static const String followDynamic = '/x/polymer/web-dynamic/v1/feed/all';

  // 动态点赞
  static const String likeDynamic =
      '${HttpString.tUrl}/dynamic_like/v1/dynamic_like/thumb';

  // 获取稍后再看
  static const String seeYouLater = '/x/v2/history/toview';

  // 获取历史记录
  static const String historyList = '/x/web-interface/history/cursor';

  // 暂停历史记录
  static const String pauseHistory = '/x/v2/history/shadow/set';

  // 查询历史记录暂停状态
  static const String historyStatus = '/x/v2/history/shadow?jsonp=jsonp';

  // 清空历史记录
  static const String clearHistory = '/x/v2/history/clear';

  // 删除某条历史记录
  static const String delHistory = '/x/v2/history/delete';

  // 搜索历史记录
  static const String searchHistory = '/x/web-goblin/history/search';

  // 热搜
  static const String hotSearchList =
      'https://s.search.bilibili.com/main/hotword';

  // 默认搜索词
  static const String searchDefault = '/x/web-interface/wbi/search/default';

  // 搜索关键词
  static const String searchSuggest =
      'https://s.search.bilibili.com/main/suggest';

  // 分类搜索
  static const String searchByType = '/x/web-interface/wbi/search/type';

  // 记录视频播放进度
  // https://github.com/SocialSisterYi/bilibili-API-collect/blob/master/docs/video/report.md
  static const String heartBeat = '/x/click-interface/web/heartbeat';

  // 查询视频分P列表 (avid/bvid转cid)
  static const String ab2c = '/x/player/pagelist';

  // 番剧/剧集明细
  static const String bangumiInfo = '/pgc/view/web/season';

  // 全部关注的up
  // vmid 用户id pn 页码 ps 每页个数，最大50 order: desc
  // order_type 排序规则 最近访问传空，最常访问传 attention
  static const String followings = '/x/relation/followings';

  // 指定分类的关注
  // https://api.bilibili.com/x/relation/tag?mid=17340771&tagid=-10&pn=1&ps=20
  static const String tagFollowings = '/x/relation/tag';

  // 关注分类
  // https://api.bilibili.com/x/relation/tags
  static const String followingsClass = '/x/relation/tags';

  // 搜索follow
  static const followSearch = '/x/relation/followings/search';

  // 粉丝
  // vmid 用户id pn 页码 ps 每页个数，最大50 order: desc
  // order_type 排序规则 最近访问传空，最常访问传 attention
  static const String fans = '/x/relation/fans';

  // 直播
  // ?page=1&page_size=30&platform=web
  static const String liveList =
      '${HttpString.liveBaseUrl}/xlive/web-interface/v1/second/getUserRecommend';

  // 直播间详情
  // cid roomId
  // qn 80:流畅，150:高清，400:蓝光，10000:原画，20000:4K, 30000:杜比
  static const String liveRoomInfo =
      '${HttpString.liveBaseUrl}/xlive/web-room/v2/index/getRoomPlayInfo';

  // 直播间详情 H5
  static const String liveRoomInfoH5 =
      '${HttpString.liveBaseUrl}/xlive/web-room/v1/index/getH5InfoByRoom';

  // 用户信息 需要Wbi签名
  // https://api.bilibili.com/x/space/wbi/acc/info?mid=503427686&token=&platform=web&web_location=1550101&w_rid=d709892496ce93e3d94d6d37c95bde91&wts=1689301482
  static const String memberInfo = '/x/space/wbi/acc/info';

  // 用户名片信息
  static const String memberCardInfo = '/x/web-interface/card';

  // 用户投稿
  // https://api.bilibili.com/x/space/wbi/arc/search?
  // mid=85754245&
  // ps=30&
  // tid=0&
  // pn=1&
  // keyword=&
  // order=pubdate&
  // platform=web&
  // web_location=1550101&
  // order_avoided=true&
  // w_rid=d893cf98a4e010cf326373194a648360&
  // wts=1689767832
  static const String memberArchive = '/x/space/wbi/arc/search';

  // 用户动态搜索
  static const String memberDynamicSearch = '/x/space/dynamic/search';

  // 用户动态
  static const String memberDynamic = '/x/polymer/web-dynamic/v1/feed/space';

  // 稍后再看
  static const String toViewLater = '/x/v2/history/toview/add';

  // 移除已观看
  static const String toViewDel = '/x/v2/history/toview/del';

  // 清空稍后再看
  static const String toViewClear = '/x/v2/history/toview/clear';

  // 追番
  static const String bangumiAdd = '/pgc/web/follow/add';

  // 取消追番
  static const String bangumiDel = '/pgc/web/follow/del';

  // 番剧列表
  // https://api.bilibili.com/pgc/season/index/result?
  // st=1&
  // order=3
  // season_version=-1  全部-1 正片1 电影2 其他3
  // spoken_language_type=-1  全部-1 原生1 中文配音2
  // area=-1&
  // is_finish=-1&
  // copyright=-1&
  // season_status=-1&
  // season_month=-1&
  // year=-1&
  // style_id=-1&
  // sort=0&
  // page=1&
  // season_type=1&
  // pagesize=20&
  // type=1
  static const String bangumiList =
      '/pgc/season/index/result?st=1&order=3&season_version=-1&spoken_language_type=-1&area=-1&is_finish=-1&copyright=-1&season_status=-1&season_month=-1&year=-1&style_id=-1&sort=0&season_type=1&pagesize=20&type=1';

  // 我的订阅
  static const String bangumiFollow =
      '/x/space/bangumi/follow/list?type=1&follow_status=0&pn=1&ps=15&ts=1691544359969';

  // 黑名单
  static const String blackLst = '/x/relation/blacks';

  // 移除黑名单
  static const String removeBlack = '/x/relation/modify';

  // github 获取最新版
  static const String latestApp =
      'https://api.github.com/repos/guozhigq/pilipala/releases/latest';

  // 多少人在看
  // https://api.bilibili.com/x/player/online/total?aid=913663681&cid=1203559746&bvid=BV1MM4y1s7NZ&ts=56427838
  static const String onlineTotal = '/x/player/online/total';

  static const String webDanmaku = '/x/v2/dm/web/seg.so';

  //发送视频弹幕
  //https://github.com/SocialSisterYi/bilibili-API-collect/blob/master/docs/danmaku/action.md
  static const String shootDanmaku = '/x/v2/dm/post';

  // up主分组
  static const String followUpTag = '/x/relation/tags';

  // 设置Up主分组
  // 0 添加至默认分组  否则使用,分割tagid
  static const String addUsers = '/x/relation/tags/addUsers';

  // 获取指定分组下的up
  static const String followUpGroup = '/x/relation/tag';

  /// 私聊
  ///  'https://api.vc.bilibili.com/session_svr/v1/session_svr/get_sessions?
  /// session_type=1&
  /// group_fold=1&
  /// unfollow_fold=0&
  /// sort_rule=2&
  /// build=0&
  /// mobi_app=web&
  /// w_rid=8641d157fb9a9255eb2159f316ee39e2&
  /// wts=1697305010

  static const String sessionList =
      '${HttpString.tUrl}/session_svr/v1/session_svr/get_sessions';

  /// 私聊用户信息
  /// uids
  /// build=0&mobi_app=web
  static const String sessionAccountList =
      '${HttpString.tUrl}/account/v1/user/cards';

  /// https://api.vc.bilibili.com/svr_sync/v1/svr_sync/fetch_session_msgs?
  /// talker_id=400787461&
  /// session_type=1&
  /// size=20&
  /// sender_device_id=1&
  /// build=0&
  /// mobi_app=web&
  /// web_location=333.1296&
  /// w_rid=cfe3bf58c9fe181bbf4dd6c75175e6b0&
  /// wts=1697350697

  static const String sessionMsg =
      '${HttpString.tUrl}/svr_sync/v1/svr_sync/fetch_session_msgs';

  /// 标记已读 POST
  /// talker_id:
  /// session_type: 1
  /// ack_seqno: 920224140918926
  /// build: 0
  /// mobi_app: web
  /// csrf_token:
  /// csrf:
  static const String updateAck =
      '${HttpString.tUrl}/session_svr/v1/session_svr/update_ack';

  // 获取某个动态详情
  // timezone_offset=-480
  // id=849312409672744983
  // features=itemOpusStyle
  static const String dynamicDetail = '/x/polymer/web-dynamic/v1/detail';

  // AI总结
  /// https://api.bilibili.com/x/web-interface/view/conclusion/get?
  /// bvid=BV1ju4y1s7kn&
  /// cid=1296086601&
  /// up_mid=4641697&
  /// w_rid=1607c6c5a4a35a1297e31992220900ae&
  /// wts=1697033079
  static const String aiConclusion = '/x/web-interface/view/conclusion/get';

  // captcha验证码
  static const String getCaptcha =
      '${HttpString.passBaseUrl}/x/passport-login/captcha?source=main_web';

  // web端短信验证码
  static const String webSmsCode =
      '${HttpString.passBaseUrl}/x/passport-login/web/sms/send';

  // web端验证码登录
  static const String webSmsLogin =
      '${HttpString.passBaseUrl}/x/passport-login/web/login/sms';

  // web端密码登录
  static const String loginInByWebPwd =
      '${HttpString.passBaseUrl}/x/passport-login/web/login';

  // web端二维码
  static const String qrCodeApi =
      '${HttpString.passBaseUrl}/x/passport-login/web/qrcode/generate';

  // 扫码登录
  static const String loginInByQrcode =
      '${HttpString.passBaseUrl}/x/passport-login/web/qrcode/poll';

  // app端短信验证码
  static const String appSmsCode =
      '${HttpString.passBaseUrl}/x/passport-login/sms/send';

  // app端验证码登录

  // 获取短信验证码
  // static const String appSafeSmsCode =
  //     'https://passport.bilibili.com/x/safecenter/common/sms/send';

  /// app端密码登录
  /// username
  /// password
  /// key
  /// rhash
  static const String loginInByPwdApi =
      '${HttpString.passBaseUrl}/x/passport-login/oauth2/login';

  /// 密码加密密钥
  /// disable_rcmd
  /// local_id
  static const getWebKey = '${HttpString.passBaseUrl}/x/passport-login/web/key';

  /// cookie转access_key
  static const cookieToKey =
      '${HttpString.passBaseUrl}/x/passport-tv-login/h5/qrcode/confirm';

  /// 申请二维码(TV端)
  static const getTVCode =
      'https://passport.snm0516.aisee.tv/x/passport-tv-login/qrcode/auth_code';

  ///扫码登录（TV端）
  static const qrcodePoll =
      '${HttpString.passBaseUrl}/x/passport-tv-login/qrcode/poll';

  /// 置顶视频
  static const getTopVideoApi = '/x/space/top/arc';

  /// 主页 - 最近投币的视频
  /// vmid
  /// gaia_source = main_web
  /// web_location
  /// w_rid
  /// wts
  static const getRecentCoinVideoApi = '/x/space/coin/video';

  /// 最近点赞的视频
  static const getRecentLikeVideoApi = '/x/space/like/video';

  /// 最近追番
  static const getRecentBangumiApi = '/x/space/bangumi/follow/list';

  /// 用户专栏
  static const getMemberSeasonsApi = '/x/polymer/web-space/home/seasons_series';

  /// 获赞数 播放数
  /// mid
  static const getMemberViewApi = '/x/space/upstat';

  /// 查询某个专栏
  /// mid
  /// season_id
  /// sort_reverse
  /// page_num
  /// page_size
  static const getSeasonDetailApi =
      '/x/polymer/web-space/seasons_archives_list';

  static const getSeriesDetailApi = '/x/series/archives';

  /// 获取未读动态数
  static const getUnreadDynamic = '/x/web-interface/dynamic/entrance';

  /// 用户动态主页
  static const dynamicSpmPrefix = 'https://space.bilibili.com/1/dynamic';

  /// 激活buvid3
  static const activateBuvidApi = '/x/internal/gaia-gateway/ExClimbWuzhi';

  /// 获取字幕配置
  static const getSubtitleConfig = '/x/player/v2';

  /// 我的订阅
  static const userSubFolder = '/x/v3/fav/folder/collected/list';

  /// 我的订阅详情 type 21
  static const userSeasonList = '/x/space/fav/season/list';

  /// 我的订阅详情 type 11
  static const userResourceList = '/x/v3/fav/resource/list';

  /// 表情
  static const emojiList = '/x/emote/user/panel/web';

  /// 已读标记
  static const String ackSessionMsg =
      '${HttpString.tUrl}/session_svr/v1/session_svr/update_ack';

  /// 发送私信
  static const String sendMsg = '${HttpString.tUrl}/web_im/v1/web_im/send_msg';

  /// 排行榜
  static const String getRankApi = "/x/web-interface/ranking/v2";

  /// 取消订阅
  static const String cancelSub = '/x/v3/fav/season/unfav';

  /// 动态转发
  static const String dynamicForwardUrl = '/x/dynamic/feed/create/submit_check';

  /// 创建动态
  static const String dynamicCreate = '/x/dynamic/feed/create/dyn';

  /// 删除收藏夹
  static const String delFavFolder = '/x/v3/fav/folder/del';

  /// 搜索结果计数
  static const String searchCount = '/x/web-interface/wbi/search/all/v2';

  /// 关闭会话
  static const String removeSession =
      '${HttpString.tUrl}/session_svr/v1/session_svr/remove_session';

  /// 消息未读数
  static const String unread = '${HttpString.tUrl}/x/im/web/msgfeed/unread';

  /// 回复我的
  static const String messageReplyAPi = '/x/msgfeed/reply';

  /// 收到的赞
  static const String messageLikeAPi = '/x/msgfeed/like';

  /// 系统通知
  static const String messageSystemAPi =
      '${HttpString.messageBaseUrl}/x/sys-msg/query_unified_notify';

  /// 系统通知 个人
  static const String userMessageSystemAPi =
      '${HttpString.messageBaseUrl}/x/sys-msg/query_user_notify';

  /// 系统通知标记已读
  static const String systemMarkRead =
      '${HttpString.messageBaseUrl}/x/sys-msg/update_cursor';

  /// 编辑收藏夹
  static const String editFavFolder = '/x/v3/fav/folder/edit';

  /// 新建收藏夹
  static const String addFavFolder = '/x/v3/fav/folder/add';

  /// 直播间弹幕信息
  static const String getDanmuInfo =
      '${HttpString.liveBaseUrl}/xlive/web-room/v1/index/getDanmuInfo';

  /// 直播间发送弹幕
  static const String sendLiveMsg = '${HttpString.liveBaseUrl}/msg/send';

  /// 我的关注 - 正在直播
  static const String getFollowingLive =
      '${HttpString.liveBaseUrl}/xlive/web-ucenter/user/following';

  /// 稍后再看&收藏夹视频列表
  static const String mediaList = '/x/v2/medialist/resource/list';

  /// 用户专栏
  static const String opusList = '/x/polymer/web-dynamic/v1/opus/feed/space';

  ///
  static const String getViewInfo = '/x/article/viewinfo';

  /// 直播间记录
  static const String liveRoomEntry =
      '${HttpString.liveBaseUrl}/xlive/web-room/v1/index/roomEntryAction';

  /// 删除评论
  static const String replyDel = '/x/v2/reply/del';
}
