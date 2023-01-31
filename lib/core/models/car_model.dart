import 'package:jamal_car_buying_experience/core/gen/assets.gen.dart';

class CarModel {
  final String name;
  final double price;
  final double monthlyPrice;
  final double range;
  final double horsePower;
  final int charge;
  final double acceleration;
  final String slogan;
  final String promotionalCopy_;
  final String promotionalCopy;
  CarModel({
    required this.name,
    required this.price,
    required this.monthlyPrice,
    required this.range,
    required this.horsePower,
    required this.charge,
    required this.acceleration,
    required this.slogan,
    required this.promotionalCopy_,
    required this.promotionalCopy,
  });
}

final toyotaCHR = CarModel(
  name: 'TOYOTA C-HR',
  price: 45750.0,
  monthlyPrice: 669,
  range: 266.6,
  horsePower: 408,
  acceleration: 4.9,
  charge: 32,
  promotionalCopy_: 'For Every You. ',
  promotionalCopy: 'Smart, Versatile.Fresher than ever.Meet our pure electric compact SUV - for every version of you. Start your online order today',
  slogan: 'A pure experience. Considerate mobility has never looked so fresh.',
);

final onboardingImages = [
  Assets.images.img1.path,
  Assets.images.img2.path,
  Assets.images.img3.path,
  Assets.images.img4.path,
];
