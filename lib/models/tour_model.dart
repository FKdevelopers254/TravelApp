class Tour {
  String imageUrl;
  String name;
  String address;
  int price;
  int days;
  int nights;
  String description;

  Tour({
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.price,
    required this.days,
    required this.nights,
    required this.description,
  });
}

final List<Tour> tours = [
  Tour(
    imageUrl: 'assets/images/radissonblu.jpg',
    name: 'Kenya at a Glance Safari',
    address: 'Nairobi,Kenya',
    price: 175,
    days: 6,
    nights: 5,
    description: 'rdfgfdffgfdfgbvfdf',
  ),
  Tour(
    imageUrl: 'assets/images/radissonblu.jpg',
    name: 'Rift Valley Trails Safari',
    address: 'Nairobi,Kenya',
    price: 175,
    days: 6,
    nights: 5,
    description: 'rdfgfdffgfdfgbvfdf',
  ),
  Tour(
    imageUrl: 'assets/images/radissonblu.jpg',
    name: 'Kenya at a Glance Safari',
    address: 'Nairobi,Kenya',
    price: 175,
    days: 6,
    nights: 5,
    description: 'rdfgfdffgfdfgbvfdf',
  ),



];
