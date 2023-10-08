import 'package:flutter/material.dart';

class PlacesDemo extends StatefulWidget {
  const PlacesDemo({super.key});

  @override
  State<PlacesDemo> createState() => _PlacesDemoState();
}

class _PlacesDemoState extends State<PlacesDemo> {
  int _currentIndex = 0;
  late List<PlacesModel> _restaurants;
  late List<PlacesModel> _drinkShops;
  late List<PlacesModel> _musicPlaces;
  late List<PlacesModel> _currentList;
  @override
  void initState() {
    super.initState();
    _restaurants = RestaurantItems().restaurantItems;
    _drinkShops = DrinkShopItems().drinks;
    _musicPlaces = RestaurantItems().restaurantItems;
    _currentList = _restaurants;
  }

  void placeHandler(List<PlacesModel> placeName) {
    setState(() {
      _currentList = placeName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _currentList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: ProjectPaddings().paddingAll2x,
            child: _PlaceCardWidget(place: _currentList[index]),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            if (value == PlaceTypes.food.index) {
              _currentIndex = PlaceTypes.food.index;
              placeHandler(_restaurants);
            } else if (value == PlaceTypes.drink.index) {
              _currentIndex = PlaceTypes.drink.index;
              placeHandler(_drinkShops);
            } else if (value == PlaceTypes.music.index) {
              placeHandler(_musicPlaces);
              _currentIndex = PlaceTypes.music.index;
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.food_bank_sharp), label: "Food"),
            BottomNavigationBarItem(icon: Icon(Icons.local_drink_sharp), label: "Drink"),
            BottomNavigationBarItem(icon: Icon(Icons.music_note_outlined), label: "Music"),
          ]),
    );
  }
}

enum PlaceTypes {
  food,
  drink,
  music,
}

class _PlaceCardWidget extends StatelessWidget {
  const _PlaceCardWidget({
    required PlacesModel place,
  }) : _place = place;

  final PlacesModel _place;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: ProjectPaddings().paddingAll2x,
        child: Column(children: [
          Image.network(_place.placesImage),
          Padding(
            padding: ProjectPaddings().paddingAll,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_place.placesName),
                Text(_place.placesType),
              ],
            ),
          ),
          Padding(
            padding: ProjectPaddings().paddingWithoutBottom,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${_place.placesOpeningTime.toString()}:00 | ${_place.placesClosingTime.toString()}:00"),
                Text(_place.placesAddress)
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class ProjectPaddings {
  final EdgeInsets paddingWithoutBottom = const EdgeInsets.only(top: 8.0, right: 8, left: 8);
  final EdgeInsets paddingAll2x = const EdgeInsets.all(16);
  final EdgeInsets paddingAll = const EdgeInsets.all(8);
}

class PlacesModel {
  final String placesName;
  final String placesImage;
  final String placesType;
  final int placesOpeningTime;
  final int placesClosingTime;
  final String placesAddress;

  PlacesModel(
      {required this.placesName,
      required this.placesImage,
      required this.placesType,
      required this.placesOpeningTime,
      required this.placesClosingTime,
      required this.placesAddress});
}

class RestaurantItems {
  final String kilislimImage = "https://images.deliveryhero.io/image/fd-tr/LH/mit4-listing.jpg?width=400&height=292";
  final String enfesImage = "https://images.deliveryhero.io/image/fd-tr/LH/w9ni-listing.jpg?width=400&height=292";
  final String lilyImage = "https://images.deliveryhero.io/image/fd-tr/LH/uqg2-listing.jpg?width=400&height=292";
  final String pasaImage = "https://images.deliveryhero.io/image/fd-tr/LH/vxuz-listing.jpg?width=400&height=292";
  final String classImage = "https://images.deliveryhero.io/image/fd-tr/LH/t9u4-listing.jpg?width=400&height=292";
  final String mhImage = "https://images.deliveryhero.io/image/fd-tr/LH/wuoz-listing.jpg?width=400&height=292";

  late List<PlacesModel> restaurantItems;
  RestaurantItems() {
    restaurantItems = [
      PlacesModel(
          placesName: "Kilislim Kebap",
          placesType: "Kebap & Türk Mutfağı",
          placesImage: kilislimImage,
          placesOpeningTime: 10,
          placesClosingTime: 22,
          placesAddress: "İstanbul Bağcılar"),
      PlacesModel(
          placesName: "Enfes Kebap",
          placesType: "Kebap & Türk Mutfağı",
          placesImage: enfesImage,
          placesOpeningTime: 8,
          placesClosingTime: 23,
          placesAddress: "İstanbul Bahçelievler"),
      PlacesModel(
          placesName: "Lily Gelato Tatlı",
          placesType: "Tatlı  & Dondurma",
          placesImage: lilyImage,
          placesOpeningTime: 12,
          placesClosingTime: 20,
          placesAddress: "İstanbul Bebek"),
      PlacesModel(
          placesName: "Paşa Mevlana Pide",
          placesType: "Pide & Lahmacun",
          placesImage: pasaImage,
          placesOpeningTime: 9,
          placesClosingTime: 24,
          placesAddress: "İstanbul Şirinevler"),
      PlacesModel(
          placesName: "Class Burger",
          placesType: "Burger",
          placesImage: classImage,
          placesOpeningTime: 12,
          placesClosingTime: 21,
          placesAddress: "İstanbul Beşiktaş"),
      PlacesModel(
          placesName: "Mh Pizza & Döner",
          placesType: "Pizza & Döner",
          placesImage: mhImage,
          placesOpeningTime: 12,
          placesClosingTime: 21,
          placesAddress: "İstanbul Beylikdüzü"),
    ];
  }
}

class DrinkShopItems {
  final String kahveDunyasiImage =
      "https://images.deliveryhero.io/image/fd-tr/LH/blqw-listing.jpg?width=400&height=292";
  final String espressolabImage = "https://images.deliveryhero.io/image/fd-tr/LH/rvem-listing.jpg?width=400&height=292";
  final String gloriaJeansImage = "https://images.deliveryhero.io/image/fd-tr/LH/bnq1-listing.jpg?width=400&height=292";
  final String gurmaniaImage = "https://images.deliveryhero.io/image/fd-tr/LH/hnsm-listing.jpg?width=400&height=292";
  final String krispyKremeImage = "https://images.deliveryhero.io/image/fd-tr/LH/xr8d-listing.jpg?width=400&height=292";
  late List<PlacesModel> drinks;
  DrinkShopItems() {
    drinks = [
      PlacesModel(
          placesName: "Kahve Dünyası",
          placesImage: kahveDunyasiImage,
          placesType: "Kahve",
          placesOpeningTime: 8,
          placesClosingTime: 18,
          placesAddress: "İstanbul Fatih"),
      PlacesModel(
          placesName: "Gloria Jean's Coffee",
          placesImage: gloriaJeansImage,
          placesType: "Kahve",
          placesOpeningTime: 10,
          placesClosingTime: 20,
          placesAddress: "İstanbul Bebek"),
      PlacesModel(
          placesName: "Gurmania",
          placesImage: gurmaniaImage,
          placesType: "Kahve & Tatlı",
          placesOpeningTime: 9,
          placesClosingTime: 22,
          placesAddress: "İstanbul Beşiktaş"),
      PlacesModel(
          placesName: "Espressolab",
          placesImage: espressolabImage,
          placesType: "Kahve",
          placesOpeningTime: 8,
          placesClosingTime: 20,
          placesAddress: "İstanbul Kartal"),
      PlacesModel(
          placesName: "Krispy Kreme",
          placesImage: krispyKremeImage,
          placesType: "Kahve & Tatlı",
          placesOpeningTime: 8,
          placesClosingTime: 23,
          placesAddress: "İstanbul Arnavutköy"),
    ];
  }
}
