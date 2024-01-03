class NotificationsList {
  NotificationsList({
      num? totalCount, 
      num? offset, 
      num? limit, 
      List<Notifications>? notifications,}){
    _totalCount = totalCount;
    _offset = offset;
    _limit = limit;
    _notifications = notifications;
}

  NotificationsList.fromJson(dynamic json) {
    _totalCount = json['total_count'];
    _offset = json['offset'];
    _limit = json['limit'];
    if (json['notifications'] != null) {
      _notifications = [];
      json['notifications'].forEach((v) {
        _notifications?.add(Notifications.fromJson(v));
      });
    }
  }
  num? _totalCount;
  num? _offset;
  num? _limit;
  List<Notifications>? _notifications;
NotificationsList copyWith({  num? totalCount,
  num? offset,
  num? limit,
  List<Notifications>? notifications,
}) => NotificationsList(  totalCount: totalCount ?? _totalCount,
  offset: offset ?? _offset,
  limit: limit ?? _limit,
  notifications: notifications ?? _notifications,
);
  num? get totalCount => _totalCount;
  num? get offset => _offset;
  num? get limit => _limit;
  List<Notifications>? get notifications => _notifications;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_count'] = _totalCount;
    map['offset'] = _offset;
    map['limit'] = _limit;
    if (_notifications != null) {
      map['notifications'] = _notifications?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Notifications {
  Notifications({
      dynamic admBigPicture, 
      dynamic admGroup, 
      dynamic admGroupMessage, 
      dynamic admLargeIcon, 
      dynamic admSmallIcon, 
      dynamic admSound, 
      dynamic spokenText, 
      dynamic alexaSsml, 
      dynamic alexaDisplayTitle, 
      dynamic amazonBackgroundData, 
      dynamic androidAccentColor, 
      dynamic androidGroup, 
      dynamic androidGroupMessage, 
      dynamic androidLedColor, 
      dynamic androidSound, 
      num? androidVisibility, 
      String? appId, 
      dynamic bigPicture, 
      dynamic buttons, 
      bool? canceled, 
      dynamic chromeBigPicture, 
      dynamic chromeIcon, 
      dynamic chromeWebIcon, 
      dynamic chromeWebImage, 
      dynamic chromeWebBadge, 
      dynamic contentAvailable, 
      Contents? contents, 
      num? converted, 
      dynamic data, 
      dynamic delayedOption, 
      dynamic deliveryTimeOfDay, 
      num? errored, 
      List<String>? excludedSegments, 
      num? failed, 
      dynamic firefoxIcon, 
      String? globalImage, 
      Headings? headings, 
      String? id, 
      dynamic includePlayerIds, 
      dynamic includeExternalUserIds, 
      dynamic includeAliases, 
      List<String>? includedSegments, 
      dynamic threadId, 
      dynamic iosBadgeCount, 
      dynamic iosBadgeType, 
      dynamic iosCategory, 
      dynamic iosInterruptionLevel, 
      dynamic iosRelevanceScore, 
      dynamic iosSound, 
      dynamic apnsAlert, 
      dynamic targetContentIdentifier, 
      bool? isAdm, 
      bool? isAndroid, 
      bool? isChrome, 
      bool? isChromeWeb, 
      dynamic isAlexa, 
      bool? isFirefox, 
      bool? isIos, 
      bool? isSafari, 
      bool? isWP, 
      bool? isWPWNS, 
      bool? isEdge, 
      bool? isHuawei, 
      bool? isSMS, 
      dynamic largeIcon, 
      num? priority, 
      num? queuedAt, 
      num? remaining, 
      num? sendAfter, 
      num? completedAt, 
      dynamic smallIcon, 
      num? successful, 
      dynamic received, 
      dynamic tags, 
      dynamic filters, 
      dynamic templateId, 
      num? ttl, 
      dynamic url, 
      dynamic webUrl, 
      dynamic appUrl, 
      dynamic webButtons, 
      dynamic webPushTopic, 
      dynamic wpSound, 
      dynamic wpWnsSound, 
      PlatformDeliveryStats? platformDeliveryStats, 
      dynamic iosAttachments, 
      dynamic huaweiSound, 
      dynamic huaweiLedColor, 
      dynamic huaweiAccentColor, 
      String? huaweiVisibility, 
      dynamic huaweiGroup, 
      dynamic huaweiGroupMessage, 
      dynamic huaweiChannelId, 
      dynamic huaweiExistingChannelId, 
      dynamic huaweiSmallIcon, 
      dynamic huaweiLargeIcon, 
      dynamic huaweiBigPicture, 
      dynamic huaweiMsgType, 
      dynamic throttleRatePerMinute, 
      dynamic fcapGroupIds, 
      String? fcapStatus, 
      dynamic smsFrom, 
      dynamic smsMediaUrls, 
      dynamic subtitle, 
      String? name, 
      dynamic emailClickTrackingDisabled, 
      bool? isEmail, 
      dynamic emailSubject, 
      dynamic emailFromName, 
      dynamic emailFromAddress, 
      dynamic emailPreheader, 
      dynamic emailReplyToAddress, 
      bool? includeUnsubscribed, 
      dynamic huaweiCategory, 
      dynamic huaweiBiTag,}){
    _admBigPicture = admBigPicture;
    _admGroup = admGroup;
    _admGroupMessage = admGroupMessage;
    _admLargeIcon = admLargeIcon;
    _admSmallIcon = admSmallIcon;
    _admSound = admSound;
    _spokenText = spokenText;
    _alexaSsml = alexaSsml;
    _alexaDisplayTitle = alexaDisplayTitle;
    _amazonBackgroundData = amazonBackgroundData;
    _androidAccentColor = androidAccentColor;
    _androidGroup = androidGroup;
    _androidGroupMessage = androidGroupMessage;
    _androidLedColor = androidLedColor;
    _androidSound = androidSound;
    _androidVisibility = androidVisibility;
    _appId = appId;
    _bigPicture = bigPicture;
    _buttons = buttons;
    _canceled = canceled;
    _chromeBigPicture = chromeBigPicture;
    _chromeIcon = chromeIcon;
    _chromeWebIcon = chromeWebIcon;
    _chromeWebImage = chromeWebImage;
    _chromeWebBadge = chromeWebBadge;
    _contentAvailable = contentAvailable;
    _contents = contents;
    _converted = converted;
    _data = data;
    _delayedOption = delayedOption;
    _deliveryTimeOfDay = deliveryTimeOfDay;
    _errored = errored;
    _excludedSegments = excludedSegments;
    _failed = failed;
    _firefoxIcon = firefoxIcon;
    _globalImage = globalImage;
    _headings = headings;
    _id = id;
    _includePlayerIds = includePlayerIds;
    _includeExternalUserIds = includeExternalUserIds;
    _includeAliases = includeAliases;
    _includedSegments = includedSegments;
    _threadId = threadId;
    _iosBadgeCount = iosBadgeCount;
    _iosBadgeType = iosBadgeType;
    _iosCategory = iosCategory;
    _iosInterruptionLevel = iosInterruptionLevel;
    _iosRelevanceScore = iosRelevanceScore;
    _iosSound = iosSound;
    _apnsAlert = apnsAlert;
    _targetContentIdentifier = targetContentIdentifier;
    _isAdm = isAdm;
    _isAndroid = isAndroid;
    _isChrome = isChrome;
    _isChromeWeb = isChromeWeb;
    _isAlexa = isAlexa;
    _isFirefox = isFirefox;
    _isIos = isIos;
    _isSafari = isSafari;
    _isWP = isWP;
    _isWPWNS = isWPWNS;
    _isEdge = isEdge;
    _isHuawei = isHuawei;
    _isSMS = isSMS;
    _largeIcon = largeIcon;
    _priority = priority;
    _queuedAt = queuedAt;
    _remaining = remaining;
    _sendAfter = sendAfter;
    _completedAt = completedAt;
    _smallIcon = smallIcon;
    _successful = successful;
    _received = received;
    _tags = tags;
    _filters = filters;
    _templateId = templateId;
    _ttl = ttl;
    _url = url;
    _webUrl = webUrl;
    _appUrl = appUrl;
    _webButtons = webButtons;
    _webPushTopic = webPushTopic;
    _wpSound = wpSound;
    _wpWnsSound = wpWnsSound;
    _platformDeliveryStats = platformDeliveryStats;
    _iosAttachments = iosAttachments;
    _huaweiSound = huaweiSound;
    _huaweiLedColor = huaweiLedColor;
    _huaweiAccentColor = huaweiAccentColor;
    _huaweiVisibility = huaweiVisibility;
    _huaweiGroup = huaweiGroup;
    _huaweiGroupMessage = huaweiGroupMessage;
    _huaweiChannelId = huaweiChannelId;
    _huaweiExistingChannelId = huaweiExistingChannelId;
    _huaweiSmallIcon = huaweiSmallIcon;
    _huaweiLargeIcon = huaweiLargeIcon;
    _huaweiBigPicture = huaweiBigPicture;
    _huaweiMsgType = huaweiMsgType;
    _throttleRatePerMinute = throttleRatePerMinute;
    _fcapGroupIds = fcapGroupIds;
    _fcapStatus = fcapStatus;
    _smsFrom = smsFrom;
    _smsMediaUrls = smsMediaUrls;
    _subtitle = subtitle;
    _name = name;
    _emailClickTrackingDisabled = emailClickTrackingDisabled;
    _isEmail = isEmail;
    _emailSubject = emailSubject;
    _emailFromName = emailFromName;
    _emailFromAddress = emailFromAddress;
    _emailPreheader = emailPreheader;
    _emailReplyToAddress = emailReplyToAddress;
    _includeUnsubscribed = includeUnsubscribed;
    _huaweiCategory = huaweiCategory;
    _huaweiBiTag = huaweiBiTag;
}

  Notifications.fromJson(dynamic json) {
    _admBigPicture = json['adm_big_picture'];
    _admGroup = json['adm_group'];
    _admGroupMessage = json['adm_group_message'];
    _admLargeIcon = json['adm_large_icon'];
    _admSmallIcon = json['adm_small_icon'];
    _admSound = json['adm_sound'];
    _spokenText = json['spoken_text'];
    _alexaSsml = json['alexa_ssml'];
    _alexaDisplayTitle = json['alexa_display_title'];
    _amazonBackgroundData = json['amazon_background_data'];
    _androidAccentColor = json['android_accent_color'];
    _androidGroup = json['android_group'];
    _androidGroupMessage = json['android_group_message'];
    _androidLedColor = json['android_led_color'];
    _androidSound = json['android_sound'];
    _androidVisibility = json['android_visibility'];
    _appId = json['app_id'];
    _bigPicture = json['big_picture'];
    _buttons = json['buttons'];
    _canceled = json['canceled'];
    _chromeBigPicture = json['chrome_big_picture'];
    _chromeIcon = json['chrome_icon'];
    _chromeWebIcon = json['chrome_web_icon'];
    _chromeWebImage = json['chrome_web_image'];
    _chromeWebBadge = json['chrome_web_badge'];
    _contentAvailable = json['content_available'];
    _contents = json['contents'] != null ? Contents.fromJson(json['contents']) : null;
    _converted = json['converted'];
    _data = json['data'];
    _delayedOption = json['delayed_option'];
    _deliveryTimeOfDay = json['delivery_time_of_day'];
    _errored = json['errored'];
    _excludedSegments = json['excluded_segments'] != null ? json['excluded_segments'].cast<String>() : [];
    _failed = json['failed'];
    _firefoxIcon = json['firefox_icon'];
    _globalImage = json['global_image'];
    _headings = json['headings'] != null ? Headings.fromJson(json['headings']) : null;
    _id = json['id'];
    _includePlayerIds = json['include_player_ids'];
    _includeExternalUserIds = json['include_external_user_ids'];
    _includeAliases = json['include_aliases'];
    _includedSegments = json['included_segments'] != null ? json['included_segments'].cast<String>() : [];
    _threadId = json['thread_id'];
    _iosBadgeCount = json['ios_badgeCount'];
    _iosBadgeType = json['ios_badgeType'];
    _iosCategory = json['ios_category'];
    _iosInterruptionLevel = json['ios_interruption_level'];
    _iosRelevanceScore = json['ios_relevance_score'];
    _iosSound = json['ios_sound'];
    _apnsAlert = json['apns_alert'];
    _targetContentIdentifier = json['target_content_identifier'];
    _isAdm = json['isAdm'];
    _isAndroid = json['isAndroid'];
    _isChrome = json['isChrome'];
    _isChromeWeb = json['isChromeWeb'];
    _isAlexa = json['isAlexa'];
    _isFirefox = json['isFirefox'];
    _isIos = json['isIos'];
    _isSafari = json['isSafari'];
    _isWP = json['isWP'];
    _isWPWNS = json['isWP_WNS'];
    _isEdge = json['isEdge'];
    _isHuawei = json['isHuawei'];
    _isSMS = json['isSMS'];
    _largeIcon = json['large_icon'];
    _priority = json['priority'];
    _queuedAt = json['queued_at'];
    _remaining = json['remaining'];
    _sendAfter = json['send_after'];
    _completedAt = json['completed_at'];
    _smallIcon = json['small_icon'];
    _successful = json['successful'];
    _received = json['received'];
    _tags = json['tags'];
    _filters = json['filters'];
    _templateId = json['template_id'];
    _ttl = json['ttl'];
    _url = json['url'];
    _webUrl = json['web_url'];
    _appUrl = json['app_url'];
    _webButtons = json['web_buttons'];
    _webPushTopic = json['web_push_topic'];
    _wpSound = json['wp_sound'];
    _wpWnsSound = json['wp_wns_sound'];
    _platformDeliveryStats = json['platform_delivery_stats'] != null ? PlatformDeliveryStats.fromJson(json['platform_delivery_stats']) : null;
    _iosAttachments = json['ios_attachments'];
    _huaweiSound = json['huawei_sound'];
    _huaweiLedColor = json['huawei_led_color'];
    _huaweiAccentColor = json['huawei_accent_color'];
    _huaweiVisibility = json['huawei_visibility'];
    _huaweiGroup = json['huawei_group'];
    _huaweiGroupMessage = json['huawei_group_message'];
    _huaweiChannelId = json['huawei_channel_id'];
    _huaweiExistingChannelId = json['huawei_existing_channel_id'];
    _huaweiSmallIcon = json['huawei_small_icon'];
    _huaweiLargeIcon = json['huawei_large_icon'];
    _huaweiBigPicture = json['huawei_big_picture'];
    _huaweiMsgType = json['huawei_msg_type'];
    _throttleRatePerMinute = json['throttle_rate_per_minute'];
    _fcapGroupIds = json['fcap_group_ids'];
    _fcapStatus = json['fcap_status'];
    _smsFrom = json['sms_from'];
    _smsMediaUrls = json['sms_media_urls'];
    _subtitle = json['subtitle'];
    _name = json['name'];
    _emailClickTrackingDisabled = json['email_click_tracking_disabled'];
    _isEmail = json['isEmail'];
    _emailSubject = json['email_subject'];
    _emailFromName = json['email_from_name'];
    _emailFromAddress = json['email_from_address'];
    _emailPreheader = json['email_preheader'];
    _emailReplyToAddress = json['email_reply_to_address'];
    _includeUnsubscribed = json['include_unsubscribed'];
    _huaweiCategory = json['huawei_category'];
    _huaweiBiTag = json['huawei_bi_tag'];
  }
  dynamic _admBigPicture;
  dynamic _admGroup;
  dynamic _admGroupMessage;
  dynamic _admLargeIcon;
  dynamic _admSmallIcon;
  dynamic _admSound;
  dynamic _spokenText;
  dynamic _alexaSsml;
  dynamic _alexaDisplayTitle;
  dynamic _amazonBackgroundData;
  dynamic _androidAccentColor;
  dynamic _androidGroup;
  dynamic _androidGroupMessage;
  dynamic _androidLedColor;
  dynamic _androidSound;
  num? _androidVisibility;
  String? _appId;
  dynamic _bigPicture;
  dynamic _buttons;
  bool? _canceled;
  dynamic _chromeBigPicture;
  dynamic _chromeIcon;
  dynamic _chromeWebIcon;
  dynamic _chromeWebImage;
  dynamic _chromeWebBadge;
  dynamic _contentAvailable;
  Contents? _contents;
  num? _converted;
  dynamic _data;
  dynamic _delayedOption;
  dynamic _deliveryTimeOfDay;
  num? _errored;
  List<String>? _excludedSegments;
  num? _failed;
  dynamic _firefoxIcon;
  String? _globalImage;
  Headings? _headings;
  String? _id;
  dynamic _includePlayerIds;
  dynamic _includeExternalUserIds;
  dynamic _includeAliases;
  List<String>? _includedSegments;
  dynamic _threadId;
  dynamic _iosBadgeCount;
  dynamic _iosBadgeType;
  dynamic _iosCategory;
  dynamic _iosInterruptionLevel;
  dynamic _iosRelevanceScore;
  dynamic _iosSound;
  dynamic _apnsAlert;
  dynamic _targetContentIdentifier;
  bool? _isAdm;
  bool? _isAndroid;
  bool? _isChrome;
  bool? _isChromeWeb;
  dynamic _isAlexa;
  bool? _isFirefox;
  bool? _isIos;
  bool? _isSafari;
  bool? _isWP;
  bool? _isWPWNS;
  bool? _isEdge;
  bool? _isHuawei;
  bool? _isSMS;
  dynamic _largeIcon;
  num? _priority;
  num? _queuedAt;
  num? _remaining;
  num? _sendAfter;
  num? _completedAt;
  dynamic _smallIcon;
  num? _successful;
  dynamic _received;
  dynamic _tags;
  dynamic _filters;
  dynamic _templateId;
  num? _ttl;
  dynamic _url;
  dynamic _webUrl;
  dynamic _appUrl;
  dynamic _webButtons;
  dynamic _webPushTopic;
  dynamic _wpSound;
  dynamic _wpWnsSound;
  PlatformDeliveryStats? _platformDeliveryStats;
  dynamic _iosAttachments;
  dynamic _huaweiSound;
  dynamic _huaweiLedColor;
  dynamic _huaweiAccentColor;
  String? _huaweiVisibility;
  dynamic _huaweiGroup;
  dynamic _huaweiGroupMessage;
  dynamic _huaweiChannelId;
  dynamic _huaweiExistingChannelId;
  dynamic _huaweiSmallIcon;
  dynamic _huaweiLargeIcon;
  dynamic _huaweiBigPicture;
  dynamic _huaweiMsgType;
  dynamic _throttleRatePerMinute;
  dynamic _fcapGroupIds;
  String? _fcapStatus;
  dynamic _smsFrom;
  dynamic _smsMediaUrls;
  dynamic _subtitle;
  String? _name;
  dynamic _emailClickTrackingDisabled;
  bool? _isEmail;
  dynamic _emailSubject;
  dynamic _emailFromName;
  dynamic _emailFromAddress;
  dynamic _emailPreheader;
  dynamic _emailReplyToAddress;
  bool? _includeUnsubscribed;
  dynamic _huaweiCategory;
  dynamic _huaweiBiTag;
Notifications copyWith({  dynamic admBigPicture,
  dynamic admGroup,
  dynamic admGroupMessage,
  dynamic admLargeIcon,
  dynamic admSmallIcon,
  dynamic admSound,
  dynamic spokenText,
  dynamic alexaSsml,
  dynamic alexaDisplayTitle,
  dynamic amazonBackgroundData,
  dynamic androidAccentColor,
  dynamic androidGroup,
  dynamic androidGroupMessage,
  dynamic androidLedColor,
  dynamic androidSound,
  num? androidVisibility,
  String? appId,
  dynamic bigPicture,
  dynamic buttons,
  bool? canceled,
  dynamic chromeBigPicture,
  dynamic chromeIcon,
  dynamic chromeWebIcon,
  dynamic chromeWebImage,
  dynamic chromeWebBadge,
  dynamic contentAvailable,
  Contents? contents,
  num? converted,
  dynamic data,
  dynamic delayedOption,
  dynamic deliveryTimeOfDay,
  num? errored,
  List<String>? excludedSegments,
  num? failed,
  dynamic firefoxIcon,
  String? globalImage,
  Headings? headings,
  String? id,
  dynamic includePlayerIds,
  dynamic includeExternalUserIds,
  dynamic includeAliases,
  List<String>? includedSegments,
  dynamic threadId,
  dynamic iosBadgeCount,
  dynamic iosBadgeType,
  dynamic iosCategory,
  dynamic iosInterruptionLevel,
  dynamic iosRelevanceScore,
  dynamic iosSound,
  dynamic apnsAlert,
  dynamic targetContentIdentifier,
  bool? isAdm,
  bool? isAndroid,
  bool? isChrome,
  bool? isChromeWeb,
  dynamic isAlexa,
  bool? isFirefox,
  bool? isIos,
  bool? isSafari,
  bool? isWP,
  bool? isWPWNS,
  bool? isEdge,
  bool? isHuawei,
  bool? isSMS,
  dynamic largeIcon,
  num? priority,
  num? queuedAt,
  num? remaining,
  num? sendAfter,
  num? completedAt,
  dynamic smallIcon,
  num? successful,
  dynamic received,
  dynamic tags,
  dynamic filters,
  dynamic templateId,
  num? ttl,
  dynamic url,
  dynamic webUrl,
  dynamic appUrl,
  dynamic webButtons,
  dynamic webPushTopic,
  dynamic wpSound,
  dynamic wpWnsSound,
  PlatformDeliveryStats? platformDeliveryStats,
  dynamic iosAttachments,
  dynamic huaweiSound,
  dynamic huaweiLedColor,
  dynamic huaweiAccentColor,
  String? huaweiVisibility,
  dynamic huaweiGroup,
  dynamic huaweiGroupMessage,
  dynamic huaweiChannelId,
  dynamic huaweiExistingChannelId,
  dynamic huaweiSmallIcon,
  dynamic huaweiLargeIcon,
  dynamic huaweiBigPicture,
  dynamic huaweiMsgType,
  dynamic throttleRatePerMinute,
  dynamic fcapGroupIds,
  String? fcapStatus,
  dynamic smsFrom,
  dynamic smsMediaUrls,
  dynamic subtitle,
  String? name,
  dynamic emailClickTrackingDisabled,
  bool? isEmail,
  dynamic emailSubject,
  dynamic emailFromName,
  dynamic emailFromAddress,
  dynamic emailPreheader,
  dynamic emailReplyToAddress,
  bool? includeUnsubscribed,
  dynamic huaweiCategory,
  dynamic huaweiBiTag,
}) => Notifications(  admBigPicture: admBigPicture ?? _admBigPicture,
  admGroup: admGroup ?? _admGroup,
  admGroupMessage: admGroupMessage ?? _admGroupMessage,
  admLargeIcon: admLargeIcon ?? _admLargeIcon,
  admSmallIcon: admSmallIcon ?? _admSmallIcon,
  admSound: admSound ?? _admSound,
  spokenText: spokenText ?? _spokenText,
  alexaSsml: alexaSsml ?? _alexaSsml,
  alexaDisplayTitle: alexaDisplayTitle ?? _alexaDisplayTitle,
  amazonBackgroundData: amazonBackgroundData ?? _amazonBackgroundData,
  androidAccentColor: androidAccentColor ?? _androidAccentColor,
  androidGroup: androidGroup ?? _androidGroup,
  androidGroupMessage: androidGroupMessage ?? _androidGroupMessage,
  androidLedColor: androidLedColor ?? _androidLedColor,
  androidSound: androidSound ?? _androidSound,
  androidVisibility: androidVisibility ?? _androidVisibility,
  appId: appId ?? _appId,
  bigPicture: bigPicture ?? _bigPicture,
  buttons: buttons ?? _buttons,
  canceled: canceled ?? _canceled,
  chromeBigPicture: chromeBigPicture ?? _chromeBigPicture,
  chromeIcon: chromeIcon ?? _chromeIcon,
  chromeWebIcon: chromeWebIcon ?? _chromeWebIcon,
  chromeWebImage: chromeWebImage ?? _chromeWebImage,
  chromeWebBadge: chromeWebBadge ?? _chromeWebBadge,
  contentAvailable: contentAvailable ?? _contentAvailable,
  contents: contents ?? _contents,
  converted: converted ?? _converted,
  data: data ?? _data,
  delayedOption: delayedOption ?? _delayedOption,
  deliveryTimeOfDay: deliveryTimeOfDay ?? _deliveryTimeOfDay,
  errored: errored ?? _errored,
  excludedSegments: excludedSegments ?? _excludedSegments,
  failed: failed ?? _failed,
  firefoxIcon: firefoxIcon ?? _firefoxIcon,
  globalImage: globalImage ?? _globalImage,
  headings: headings ?? _headings,
  id: id ?? _id,
  includePlayerIds: includePlayerIds ?? _includePlayerIds,
  includeExternalUserIds: includeExternalUserIds ?? _includeExternalUserIds,
  includeAliases: includeAliases ?? _includeAliases,
  includedSegments: includedSegments ?? _includedSegments,
  threadId: threadId ?? _threadId,
  iosBadgeCount: iosBadgeCount ?? _iosBadgeCount,
  iosBadgeType: iosBadgeType ?? _iosBadgeType,
  iosCategory: iosCategory ?? _iosCategory,
  iosInterruptionLevel: iosInterruptionLevel ?? _iosInterruptionLevel,
  iosRelevanceScore: iosRelevanceScore ?? _iosRelevanceScore,
  iosSound: iosSound ?? _iosSound,
  apnsAlert: apnsAlert ?? _apnsAlert,
  targetContentIdentifier: targetContentIdentifier ?? _targetContentIdentifier,
  isAdm: isAdm ?? _isAdm,
  isAndroid: isAndroid ?? _isAndroid,
  isChrome: isChrome ?? _isChrome,
  isChromeWeb: isChromeWeb ?? _isChromeWeb,
  isAlexa: isAlexa ?? _isAlexa,
  isFirefox: isFirefox ?? _isFirefox,
  isIos: isIos ?? _isIos,
  isSafari: isSafari ?? _isSafari,
  isWP: isWP ?? _isWP,
  isWPWNS: isWPWNS ?? _isWPWNS,
  isEdge: isEdge ?? _isEdge,
  isHuawei: isHuawei ?? _isHuawei,
  isSMS: isSMS ?? _isSMS,
  largeIcon: largeIcon ?? _largeIcon,
  priority: priority ?? _priority,
  queuedAt: queuedAt ?? _queuedAt,
  remaining: remaining ?? _remaining,
  sendAfter: sendAfter ?? _sendAfter,
  completedAt: completedAt ?? _completedAt,
  smallIcon: smallIcon ?? _smallIcon,
  successful: successful ?? _successful,
  received: received ?? _received,
  tags: tags ?? _tags,
  filters: filters ?? _filters,
  templateId: templateId ?? _templateId,
  ttl: ttl ?? _ttl,
  url: url ?? _url,
  webUrl: webUrl ?? _webUrl,
  appUrl: appUrl ?? _appUrl,
  webButtons: webButtons ?? _webButtons,
  webPushTopic: webPushTopic ?? _webPushTopic,
  wpSound: wpSound ?? _wpSound,
  wpWnsSound: wpWnsSound ?? _wpWnsSound,
  platformDeliveryStats: platformDeliveryStats ?? _platformDeliveryStats,
  iosAttachments: iosAttachments ?? _iosAttachments,
  huaweiSound: huaweiSound ?? _huaweiSound,
  huaweiLedColor: huaweiLedColor ?? _huaweiLedColor,
  huaweiAccentColor: huaweiAccentColor ?? _huaweiAccentColor,
  huaweiVisibility: huaweiVisibility ?? _huaweiVisibility,
  huaweiGroup: huaweiGroup ?? _huaweiGroup,
  huaweiGroupMessage: huaweiGroupMessage ?? _huaweiGroupMessage,
  huaweiChannelId: huaweiChannelId ?? _huaweiChannelId,
  huaweiExistingChannelId: huaweiExistingChannelId ?? _huaweiExistingChannelId,
  huaweiSmallIcon: huaweiSmallIcon ?? _huaweiSmallIcon,
  huaweiLargeIcon: huaweiLargeIcon ?? _huaweiLargeIcon,
  huaweiBigPicture: huaweiBigPicture ?? _huaweiBigPicture,
  huaweiMsgType: huaweiMsgType ?? _huaweiMsgType,
  throttleRatePerMinute: throttleRatePerMinute ?? _throttleRatePerMinute,
  fcapGroupIds: fcapGroupIds ?? _fcapGroupIds,
  fcapStatus: fcapStatus ?? _fcapStatus,
  smsFrom: smsFrom ?? _smsFrom,
  smsMediaUrls: smsMediaUrls ?? _smsMediaUrls,
  subtitle: subtitle ?? _subtitle,
  name: name ?? _name,
  emailClickTrackingDisabled: emailClickTrackingDisabled ?? _emailClickTrackingDisabled,
  isEmail: isEmail ?? _isEmail,
  emailSubject: emailSubject ?? _emailSubject,
  emailFromName: emailFromName ?? _emailFromName,
  emailFromAddress: emailFromAddress ?? _emailFromAddress,
  emailPreheader: emailPreheader ?? _emailPreheader,
  emailReplyToAddress: emailReplyToAddress ?? _emailReplyToAddress,
  includeUnsubscribed: includeUnsubscribed ?? _includeUnsubscribed,
  huaweiCategory: huaweiCategory ?? _huaweiCategory,
  huaweiBiTag: huaweiBiTag ?? _huaweiBiTag,
);
  dynamic get admBigPicture => _admBigPicture;
  dynamic get admGroup => _admGroup;
  dynamic get admGroupMessage => _admGroupMessage;
  dynamic get admLargeIcon => _admLargeIcon;
  dynamic get admSmallIcon => _admSmallIcon;
  dynamic get admSound => _admSound;
  dynamic get spokenText => _spokenText;
  dynamic get alexaSsml => _alexaSsml;
  dynamic get alexaDisplayTitle => _alexaDisplayTitle;
  dynamic get amazonBackgroundData => _amazonBackgroundData;
  dynamic get androidAccentColor => _androidAccentColor;
  dynamic get androidGroup => _androidGroup;
  dynamic get androidGroupMessage => _androidGroupMessage;
  dynamic get androidLedColor => _androidLedColor;
  dynamic get androidSound => _androidSound;
  num? get androidVisibility => _androidVisibility;
  String? get appId => _appId;
  dynamic get bigPicture => _bigPicture;
  dynamic get buttons => _buttons;
  bool? get canceled => _canceled;
  dynamic get chromeBigPicture => _chromeBigPicture;
  dynamic get chromeIcon => _chromeIcon;
  dynamic get chromeWebIcon => _chromeWebIcon;
  dynamic get chromeWebImage => _chromeWebImage;
  dynamic get chromeWebBadge => _chromeWebBadge;
  dynamic get contentAvailable => _contentAvailable;
  Contents? get contents => _contents;
  num? get converted => _converted;
  dynamic get data => _data;
  dynamic get delayedOption => _delayedOption;
  dynamic get deliveryTimeOfDay => _deliveryTimeOfDay;
  num? get errored => _errored;
  List<String>? get excludedSegments => _excludedSegments;
  num? get failed => _failed;
  dynamic get firefoxIcon => _firefoxIcon;
  String? get globalImage => _globalImage;
  Headings? get headings => _headings;
  String? get id => _id;
  dynamic get includePlayerIds => _includePlayerIds;
  dynamic get includeExternalUserIds => _includeExternalUserIds;
  dynamic get includeAliases => _includeAliases;
  List<String>? get includedSegments => _includedSegments;
  dynamic get threadId => _threadId;
  dynamic get iosBadgeCount => _iosBadgeCount;
  dynamic get iosBadgeType => _iosBadgeType;
  dynamic get iosCategory => _iosCategory;
  dynamic get iosInterruptionLevel => _iosInterruptionLevel;
  dynamic get iosRelevanceScore => _iosRelevanceScore;
  dynamic get iosSound => _iosSound;
  dynamic get apnsAlert => _apnsAlert;
  dynamic get targetContentIdentifier => _targetContentIdentifier;
  bool? get isAdm => _isAdm;
  bool? get isAndroid => _isAndroid;
  bool? get isChrome => _isChrome;
  bool? get isChromeWeb => _isChromeWeb;
  dynamic get isAlexa => _isAlexa;
  bool? get isFirefox => _isFirefox;
  bool? get isIos => _isIos;
  bool? get isSafari => _isSafari;
  bool? get isWP => _isWP;
  bool? get isWPWNS => _isWPWNS;
  bool? get isEdge => _isEdge;
  bool? get isHuawei => _isHuawei;
  bool? get isSMS => _isSMS;
  dynamic get largeIcon => _largeIcon;
  num? get priority => _priority;
  num? get queuedAt => _queuedAt;
  num? get remaining => _remaining;
  num? get sendAfter => _sendAfter;
  num? get completedAt => _completedAt;
  dynamic get smallIcon => _smallIcon;
  num? get successful => _successful;
  dynamic get received => _received;
  dynamic get tags => _tags;
  dynamic get filters => _filters;
  dynamic get templateId => _templateId;
  num? get ttl => _ttl;
  dynamic get url => _url;
  dynamic get webUrl => _webUrl;
  dynamic get appUrl => _appUrl;
  dynamic get webButtons => _webButtons;
  dynamic get webPushTopic => _webPushTopic;
  dynamic get wpSound => _wpSound;
  dynamic get wpWnsSound => _wpWnsSound;
  PlatformDeliveryStats? get platformDeliveryStats => _platformDeliveryStats;
  dynamic get iosAttachments => _iosAttachments;
  dynamic get huaweiSound => _huaweiSound;
  dynamic get huaweiLedColor => _huaweiLedColor;
  dynamic get huaweiAccentColor => _huaweiAccentColor;
  String? get huaweiVisibility => _huaweiVisibility;
  dynamic get huaweiGroup => _huaweiGroup;
  dynamic get huaweiGroupMessage => _huaweiGroupMessage;
  dynamic get huaweiChannelId => _huaweiChannelId;
  dynamic get huaweiExistingChannelId => _huaweiExistingChannelId;
  dynamic get huaweiSmallIcon => _huaweiSmallIcon;
  dynamic get huaweiLargeIcon => _huaweiLargeIcon;
  dynamic get huaweiBigPicture => _huaweiBigPicture;
  dynamic get huaweiMsgType => _huaweiMsgType;
  dynamic get throttleRatePerMinute => _throttleRatePerMinute;
  dynamic get fcapGroupIds => _fcapGroupIds;
  String? get fcapStatus => _fcapStatus;
  dynamic get smsFrom => _smsFrom;
  dynamic get smsMediaUrls => _smsMediaUrls;
  dynamic get subtitle => _subtitle;
  String? get name => _name;
  dynamic get emailClickTrackingDisabled => _emailClickTrackingDisabled;
  bool? get isEmail => _isEmail;
  dynamic get emailSubject => _emailSubject;
  dynamic get emailFromName => _emailFromName;
  dynamic get emailFromAddress => _emailFromAddress;
  dynamic get emailPreheader => _emailPreheader;
  dynamic get emailReplyToAddress => _emailReplyToAddress;
  bool? get includeUnsubscribed => _includeUnsubscribed;
  dynamic get huaweiCategory => _huaweiCategory;
  dynamic get huaweiBiTag => _huaweiBiTag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adm_big_picture'] = _admBigPicture;
    map['adm_group'] = _admGroup;
    map['adm_group_message'] = _admGroupMessage;
    map['adm_large_icon'] = _admLargeIcon;
    map['adm_small_icon'] = _admSmallIcon;
    map['adm_sound'] = _admSound;
    map['spoken_text'] = _spokenText;
    map['alexa_ssml'] = _alexaSsml;
    map['alexa_display_title'] = _alexaDisplayTitle;
    map['amazon_background_data'] = _amazonBackgroundData;
    map['android_accent_color'] = _androidAccentColor;
    map['android_group'] = _androidGroup;
    map['android_group_message'] = _androidGroupMessage;
    map['android_led_color'] = _androidLedColor;
    map['android_sound'] = _androidSound;
    map['android_visibility'] = _androidVisibility;
    map['app_id'] = _appId;
    map['big_picture'] = _bigPicture;
    map['buttons'] = _buttons;
    map['canceled'] = _canceled;
    map['chrome_big_picture'] = _chromeBigPicture;
    map['chrome_icon'] = _chromeIcon;
    map['chrome_web_icon'] = _chromeWebIcon;
    map['chrome_web_image'] = _chromeWebImage;
    map['chrome_web_badge'] = _chromeWebBadge;
    map['content_available'] = _contentAvailable;
    if (_contents != null) {
      map['contents'] = _contents?.toJson();
    }
    map['converted'] = _converted;
    map['data'] = _data;
    map['delayed_option'] = _delayedOption;
    map['delivery_time_of_day'] = _deliveryTimeOfDay;
    map['errored'] = _errored;
    map['excluded_segments'] = _excludedSegments;
    map['failed'] = _failed;
    map['firefox_icon'] = _firefoxIcon;
    map['global_image'] = _globalImage;
    if (_headings != null) {
      map['headings'] = _headings?.toJson();
    }
    map['id'] = _id;
    map['include_player_ids'] = _includePlayerIds;
    map['include_external_user_ids'] = _includeExternalUserIds;
    map['include_aliases'] = _includeAliases;
    map['included_segments'] = _includedSegments;
    map['thread_id'] = _threadId;
    map['ios_badgeCount'] = _iosBadgeCount;
    map['ios_badgeType'] = _iosBadgeType;
    map['ios_category'] = _iosCategory;
    map['ios_interruption_level'] = _iosInterruptionLevel;
    map['ios_relevance_score'] = _iosRelevanceScore;
    map['ios_sound'] = _iosSound;
    map['apns_alert'] = _apnsAlert;
    map['target_content_identifier'] = _targetContentIdentifier;
    map['isAdm'] = _isAdm;
    map['isAndroid'] = _isAndroid;
    map['isChrome'] = _isChrome;
    map['isChromeWeb'] = _isChromeWeb;
    map['isAlexa'] = _isAlexa;
    map['isFirefox'] = _isFirefox;
    map['isIos'] = _isIos;
    map['isSafari'] = _isSafari;
    map['isWP'] = _isWP;
    map['isWP_WNS'] = _isWPWNS;
    map['isEdge'] = _isEdge;
    map['isHuawei'] = _isHuawei;
    map['isSMS'] = _isSMS;
    map['large_icon'] = _largeIcon;
    map['priority'] = _priority;
    map['queued_at'] = _queuedAt;
    map['remaining'] = _remaining;
    map['send_after'] = _sendAfter;
    map['completed_at'] = _completedAt;
    map['small_icon'] = _smallIcon;
    map['successful'] = _successful;
    map['received'] = _received;
    map['tags'] = _tags;
    map['filters'] = _filters;
    map['template_id'] = _templateId;
    map['ttl'] = _ttl;
    map['url'] = _url;
    map['web_url'] = _webUrl;
    map['app_url'] = _appUrl;
    map['web_buttons'] = _webButtons;
    map['web_push_topic'] = _webPushTopic;
    map['wp_sound'] = _wpSound;
    map['wp_wns_sound'] = _wpWnsSound;
    if (_platformDeliveryStats != null) {
      map['platform_delivery_stats'] = _platformDeliveryStats?.toJson();
    }
    map['ios_attachments'] = _iosAttachments;
    map['huawei_sound'] = _huaweiSound;
    map['huawei_led_color'] = _huaweiLedColor;
    map['huawei_accent_color'] = _huaweiAccentColor;
    map['huawei_visibility'] = _huaweiVisibility;
    map['huawei_group'] = _huaweiGroup;
    map['huawei_group_message'] = _huaweiGroupMessage;
    map['huawei_channel_id'] = _huaweiChannelId;
    map['huawei_existing_channel_id'] = _huaweiExistingChannelId;
    map['huawei_small_icon'] = _huaweiSmallIcon;
    map['huawei_large_icon'] = _huaweiLargeIcon;
    map['huawei_big_picture'] = _huaweiBigPicture;
    map['huawei_msg_type'] = _huaweiMsgType;
    map['throttle_rate_per_minute'] = _throttleRatePerMinute;
    map['fcap_group_ids'] = _fcapGroupIds;
    map['fcap_status'] = _fcapStatus;
    map['sms_from'] = _smsFrom;
    map['sms_media_urls'] = _smsMediaUrls;
    map['subtitle'] = _subtitle;
    map['name'] = _name;
    map['email_click_tracking_disabled'] = _emailClickTrackingDisabled;
    map['isEmail'] = _isEmail;
    map['email_subject'] = _emailSubject;
    map['email_from_name'] = _emailFromName;
    map['email_from_address'] = _emailFromAddress;
    map['email_preheader'] = _emailPreheader;
    map['email_reply_to_address'] = _emailReplyToAddress;
    map['include_unsubscribed'] = _includeUnsubscribed;
    map['huawei_category'] = _huaweiCategory;
    map['huawei_bi_tag'] = _huaweiBiTag;
    return map;
  }

}

class PlatformDeliveryStats {
  PlatformDeliveryStats({
      Android? android,}){
    _android = android;
}

  PlatformDeliveryStats.fromJson(dynamic json) {
    _android = json['android'] != null ? Android.fromJson(json['android']) : null;
  }
  Android? _android;
PlatformDeliveryStats copyWith({  Android? android,
}) => PlatformDeliveryStats(  android: android ?? _android,
);
  Android? get android => _android;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_android != null) {
      map['android'] = _android?.toJson();
    }
    return map;
  }

}

class Android {
  Android({
      num? successful, 
      num? failed, 
      num? errored, 
      num? converted, 
      num? received, 
      num? suppressed,}){
    _successful = successful;
    _failed = failed;
    _errored = errored;
    _converted = converted;
    _received = received;
    _suppressed = suppressed;
}

  Android.fromJson(dynamic json) {
    _successful = json['successful'];
    _failed = json['failed'];
    _errored = json['errored'];
    _converted = json['converted'];
    _received = json['received'];
    _suppressed = json['suppressed'];
  }
  num? _successful;
  num? _failed;
  num? _errored;
  num? _converted;
  num? _received;
  num? _suppressed;
Android copyWith({  num? successful,
  num? failed,
  num? errored,
  num? converted,
  num? received,
  num? suppressed,
}) => Android(  successful: successful ?? _successful,
  failed: failed ?? _failed,
  errored: errored ?? _errored,
  converted: converted ?? _converted,
  received: received ?? _received,
  suppressed: suppressed ?? _suppressed,
);
  num? get successful => _successful;
  num? get failed => _failed;
  num? get errored => _errored;
  num? get converted => _converted;
  num? get received => _received;
  num? get suppressed => _suppressed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['successful'] = _successful;
    map['failed'] = _failed;
    map['errored'] = _errored;
    map['converted'] = _converted;
    map['received'] = _received;
    map['suppressed'] = _suppressed;
    return map;
  }

}

class Headings {
  Headings({
      String? en,}){
    _en = en;
}

  Headings.fromJson(dynamic json) {
    _en = json['en'];
  }
  String? _en;
Headings copyWith({  String? en,
}) => Headings(  en: en ?? _en,
);
  String? get en => _en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['en'] = _en;
    return map;
  }

}

class Contents {
  Contents({
      String? en,}){
    _en = en;
}

  Contents.fromJson(dynamic json) {
    _en = json['en'];
  }
  String? _en;
Contents copyWith({  String? en,
}) => Contents(  en: en ?? _en,
);
  String? get en => _en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['en'] = _en;
    return map;
  }

}