import 'package:cari_kos_app/model/kost_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatelessWidget {
  final KostModel kost;

  const DetailScreen({
    Key? key,
    required this.kost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light, //top bar icons
      systemNavigationBarColor: Colors.white, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.light, //bottom bar icons
    ));
    var subhead = TextStyle(
      color: Colors.black,
      fontFamily: 'Jakarta',
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  kost.images,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 20,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: FavDetailBtn(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        kost.nama,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(kost.alamat),
                      SizedBox(height: 24),
                      Text(
                        'Deskripsi',
                        style: subhead,
                      ),
                      SizedBox(height: 12),
                      Text(kost.deskripsi),
                      SizedBox(height: 24),
                      Text(
                        'Fasilitas',
                        style: subhead,
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              children: kost.icon.map((e) {
                                return ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  horizontalTitleGap: 0,
                                  leading: Image.asset(
                                    e,
                                    width: 24,
                                    height: 24,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          Flexible(
                            flex: 8,
                            child: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              children: kost.fasilitas.map((i) {
                                return ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  horizontalTitleGap: 0,
                                  title: Text(i),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Luas Kamar',
                        style: subhead,
                      ),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Image.asset(
                            'images/luas.png',
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(width: 12),
                          Text(
                            kost.luas,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: NumberFormat.currency(
                                locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                            .format(kost.harga),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: ' / bulan',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Jakarta',
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.only(top: 8),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {},
                      child: Text(
                        'Lihat estimasi pembayaran',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 128, 128),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(width: 24),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 0, 128, 128),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize: Size.fromHeight(50),
                    ),
                    child: Text('Sewa Kamar'),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FavDetailBtn extends StatefulWidget {
  const FavDetailBtn({Key? key}) : super(key: key);

  @override
  _FavDetailBtnState createState() => _FavDetailBtnState();
}

class _FavDetailBtnState extends State<FavDetailBtn> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.grey[400],
        size: 20,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
