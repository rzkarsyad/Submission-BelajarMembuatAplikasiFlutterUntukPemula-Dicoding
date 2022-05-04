import 'package:cari_kos_app/detail.dart';
import 'package:cari_kos_app/model/kost_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  String? value;
  HomeScreen({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 0, 128, 128),
      statusBarIconBrightness: Brightness.light, //top bar icons
      systemNavigationBarColor: Colors.white, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.light, //bottom bar icons
    ));
    var headerText = TextStyle(
      fontFamily: 'Jakarta',
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  color: Color.fromARGB(255, 0, 128, 128),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Halo, ${value}!',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 2),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton.icon(
                                      onPressed: () {},
                                      icon: Text(
                                        'Purwokerto',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      label: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'images/avatar.png',
                                width: 56,
                                height: 56,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 16),
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            fillColor: Colors.white,
                            filled: true,
                            focusColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Colors.black12, width: 1)),
                            hintText: 'Cari kost idaman di sini',
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Colors.black12, width: 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kost Terdekat',
                        style: headerText,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Lihat Semua',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 0, 128, 128),
                          ),
                        ),
                      )
                    ],
                  ),
                  KostTerdekatList(),
                  SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rekomendasi Kost',
                        style: headerText,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Lihat Semua',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 0, 128, 128),
                          ),
                        ),
                      )
                    ],
                  ),
                  RekomendasiKostGrid()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RekomendasiKostGrid extends StatelessWidget {
  const RekomendasiKostGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      crossAxisCount: 2,
      children: KostRekomendasi.map((rekKost) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(
                kost: rekKost,
              );
            }));
          },
          child: Container(
            height: 400,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image.asset(
                        rekKost.images,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 12, bottom: 12, right: 12),
                    child: Text(
                      rekKost.nama,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 12),
                    child: RichText(
                      strutStyle: StrutStyle(),
                      text: TextSpan(
                        text: NumberFormat.currency(
                                locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                            .format(rekKost.harga),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                              text: ' / bulan',
                              style: TextStyle(fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              elevation: 1,
              margin: EdgeInsets.all(8),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class KostTerdekatList extends StatelessWidget {
  const KostTerdekatList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final KostModel kostDekat = KostTerdekat[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(kost: kostDekat);
            }));
          },
          child: Container(
            padding: EdgeInsets.only(top: 8),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              semanticContainer: true,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: Image.asset(
                      kostDekat.images,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 8, left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            kostDekat.nama,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Row(
                                children: [
                                  ImageIcon(
                                    AssetImage('images/wifi.png'),
                                    color: Color.fromARGB(255, 0, 128, 128),
                                    size: 12,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Wifi',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(width: 12),
                              Row(
                                children: [
                                  ImageIcon(
                                    AssetImage('images/listrik.png'),
                                    color: Color.fromARGB(255, 0, 128, 128),
                                    size: 12,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Listrik',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(width: 12),
                              Row(
                                children: [
                                  ImageIcon(
                                    AssetImage('images/wc.png'),
                                    color: Color.fromARGB(255, 0, 128, 128),
                                    size: 12,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'WC Dalam',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          RichText(
                            strutStyle: StrutStyle(),
                            text: TextSpan(
                              text: NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'Rp ',
                                      decimalDigits: 0)
                                  .format(kostDekat.harga),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                    text: ' / bulan',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FavoriteButton(),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: KostTerdekat.length,
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.grey[400],
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
