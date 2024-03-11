
class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  factory Restaurant.fromJson(Map<String, dynamic> restaurants) => Restaurant(
    id: restaurants['id'],
    name: restaurants['name'],
    description: restaurants['description'],
    pictureId: restaurants['pictureId'],
    city: restaurants['city'],
    rating: restaurants['rating']?.toDouble(),
  );
}