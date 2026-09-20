class Listing {
  final String title;
  final String subtitle;
  final int price;
  final String gameTag;
  final String sellerName;
  final double sellerRating;
  final int sellerDeals;
  final bool isVerifiedSeller;
  final bool isPromoted;
  final bool isOfficial;

  const Listing({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.gameTag,
    required this.sellerName,
    required this.sellerRating,
    required this.sellerDeals,
    this.isVerifiedSeller = false,
    this.isPromoted = false,
    this.isOfficial = false,
  });
}
