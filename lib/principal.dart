import 'package:PetFinder/Category_list.dart';
import 'package:flutter/material.dart';
import './Data.dart';
import './pets_widgets.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  List<Pet> pets = getPetList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.sort,
          color: Colors.grey[800],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.notifications,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Find Your',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('Lovely pet AnyWhere ',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 24,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    fontSize: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding: EdgeInsets.only(
                    right: 30,
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                      right: 16,
                      left: 24,
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 24,
                    ),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pet Catagory',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                Icon(
                  Icons.more_horiz,
                  color: Colors.grey[800],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildpetCatagory(Category.HAMSTER, "56", Colors.orange[200]),
                  buildpetCatagory(Category.CAT, "210", Colors.blue[200]),
                  // buildpetCatagory(Category.CAT, "56", Colors.blue[200]),
                  // buildpetCatagory(Category.BUNNY, "56", Colors.amber[200])
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildpetCatagory(Category.BUNNY, "56", Colors.green[200]),
                  buildpetCatagory(Category.DOG, "210", Colors.red[200]),
                  // buildpetCatagory(Category.CAT, "56", Colors.blue[200]),
                  // buildpetCatagory(Category.BUNNY, "56", Colors.amber[200])
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Newest pets',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                Icon(
                  Icons.more_horiz,
                  color: Colors.grey[800],
                ),
              ],
            ),
          ),
          Container(
            height: 250,
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: buildnewestpet(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Vets Near You',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                Icon(
                  Icons.more_horiz,
                  color: Colors.grey[800],
                ),
              ],
            ),
          ),
          Container(
            height: 150,
            padding: EdgeInsets.only(bottom: 16),
            child: PageView(
              physics: BouncingScrollPhysics(),
              children: [
                buildVet("assets/images/vets/vet_0.png",
                    "Animal Emergency Hospital", "(360) 133-8956"),
                buildVet("assets/images/vets/vet_1.png",
                    "Artemis Veternity Center", "(120) 134-8554"),
                buildVet("assets/images/vets/vet_2.png",
                    "Big Lake Vet Hospital", "(350) 233-5556"),
                buildVet("assets/images/vets/vet_3.png",
                    "Veternity Medical Center", "(33) 433-8576"),
              ],
              //children
            ),
          ),
        ]),
      ),
    );
  }

  Widget buildpetCatagory(Category category, String total, Color color) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Categorylist(category: category)));
        },
        child: Container(
          height: 80,
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[200],
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(0.5),
                ),
                child: Center(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      "assets/images/" +
                          (category == Category.HAMSTER
                              ? "hamster"
                              : category == Category.CAT
                                  ? "cat"
                                  : category == Category.DOG
                                      ? "dog"
                                      : "bunny") +
                          ".png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (category == Category.HAMSTER
                        ? "Hamsters"
                        : category == Category.CAT
                            ? "Cats"
                            : category == Category.DOG ? "Dogs" : "Bunnies"),
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Total of " + total,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildnewestpet() {
    List<Widget> list = [];
    for (var i = 0; i < pets.length; i++) {
      if (pets[i].newest) {
        list.add(Petswidgets(
          pet: pets[i],
          index: i,
        ));
      }
    }
    return list;
  }

  Widget buildVet(String imgurl, String name, String phnum) {
    return Container(
      margin: EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 4),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          border: Border.all(
            color: Colors.grey[300],
            width: 1,
          )),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imgurl), fit: BoxFit.contain)),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(
                    Icons.phone,
                    size: 14,
                    color: Colors.grey[800],
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(phnum,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.grey,
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  "Open 24/7",
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
