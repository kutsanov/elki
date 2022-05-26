import 'dart:convert';

class House {
  final int id;
  final String name;
  final String location;
  final String description;
  final String type;
  final int rating;
  final int reviewCount;
  final int price;
  final List<String> images;

  House({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.type,
    required this.rating,
    required this.reviewCount,
    required this.price,
    required this.images,
  });

  House copyWith({
    int? id,
    String? name,
    String? location,
    String? description,
    String? type,
    int? rating,
    int? reviewCount,
    int? price,
    List<String>? images,
  }) {
    return House(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      description: description ?? this.description,
      type: type ?? this.type,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      price: price ?? this.price,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'description': description,
      'type': type,
      'rating': rating,
      'review_count': reviewCount,
      'price': price,
      'images': images,
    };
  }

  factory House.fromMap(Map<String, dynamic> map) {
    return House(
      id: map['id'],
      name: map['name'],
      location: map['location'],
      description: map['description'],
      type: map['type'],
      rating: map['rating'],
      reviewCount: map['review_count'],
      price: map['price'],
      images: List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory House.fromJson(String source) => House.fromMap(json.decode(source));

  @override
  String toString() {
    return 'House(id: $id, name: $name, location: $location, description: $description, type: $type, rating: $rating, reviewCount: $reviewCount, price: $price, images: $images)';
  }
}
