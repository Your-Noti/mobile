class Subscription {
  Subscription({
    required this.category,
    required this.type,
    this.isExpanded = false,
  });

  String category;
  Map<String, bool> type;
  bool isExpanded;
}
