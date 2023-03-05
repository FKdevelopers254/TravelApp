class Car {
  String imageUrl;
  String name;
  String address;
  int price;
  int modelyear;
  String description;
  String geartype;

  Car({
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.price,
    required this.modelyear,
    required this.description,
    required this.geartype,
  });
}

final List<Car> cars = [
  Car(
    imageUrl: 'assets/images/toyotaaxio.jpg',
    name: 'Toyota Axio',
    address: 'Nairobi,Kenya',
    price: 175,
    modelyear: 2019,
    description: 'Axio',
    geartype: 'Auto',
  ),
  Car(
    imageUrl: 'assets/images/toyotaprius.jpg',
    name: 'Toyota Prius',
    address: 'Nairobi,Kenya',
    price: 75,
    modelyear: 2006,
    description: 'Prius',
    geartype: 'Auto',
  ),
  Car(
    imageUrl: 'assets/images/toyotamarkx.jpg',
    name: 'Toyota Mark X',
    address: 'Nairobi,Kenya',
    price: 17,
    modelyear: 2020,
    description: 'Mark X',
    geartype: 'Auto',
  ),
  Car(
    imageUrl: 'assets/images/toyotamarkx.jpg',
    name: 'Toyota Mark X',
    address: 'Nairobi,Kenya',
    price: 17,
    modelyear: 2020,
    description: 'Mark X',
    geartype: 'Manual',
  ),
  Car(
    imageUrl: 'assets/images/toyotamarkx.jpg',
    name: 'Toyota Mark X',
    address: 'Nairobi,Kenya',
    price: 17,
    modelyear: 2020,
    description: 'Mark X',
    geartype: 'Manual',
  ),
  Car(
    imageUrl: 'assets/images/toyotamarkx.jpg',
    name: 'Toyota Mark X',
    address: 'Nairobi,Kenya',
    price: 17,
    modelyear: 2020,
    description: 'Mark X',
    geartype: 'Manual',
  ),




];
