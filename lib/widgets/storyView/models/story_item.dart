class StoryItemType {
  static const String image = "image";
  static const String video = "video";
}

/// Represents a story with a URL, viewers and type.
class StoryItem {
  /// The URL of the story.
  final String url;
  final String btnText;
  final String shareContent;

  /// The viewers of the story.
  final List<dynamic>? viewers;

  /// The type of the story.
  final String type;

  // Add a duration property for each StoryItem
  final int? duration;

  /// Constructs a new [StoryItem] instance with the given [url], [viewers], [type] and [duration].
  const StoryItem(
      {required this.url, required this.btnText, required this.shareContent, this.viewers, required this.type, this.duration = 3});

  /// Converts this [StoryItem] instance to a JSON format.
  Map<String, dynamic> toJson() =>
      {"url": url, "btnText": btnText, "shareContent": shareContent, "viewers": viewers, "type": type, "duration": duration};

  /// Converts this [StoryItem] instance to a list of [StoryItem].
  List<StoryItem> toList() => List<StoryItem>.of([this]);
}
