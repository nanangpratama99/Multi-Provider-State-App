import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/resources/saldo_share_state.dart';

import 'color_shared_state.dart';
import 'kerangjang_shared_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle myTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ColorState(),
        ),
        ChangeNotifierProvider(create: (context) => SaldoState()),
        ChangeNotifierProvider(
          create: (context) => KeranjangState(),
        )
      ],
      child: Consumer<ColorState>(
        builder: (contex, colorstate, child) => Scaffold(
          backgroundColor: colorstate.getColor == Colors.deepPurple
              ? Colors.deepOrange
              : Colors.deepPurple,
          appBar: AppBar(
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<ColorState>(
                    builder: (context, colorstate, child) => Switch(
                        value: colorstate.getIsOrange,
                        onChanged: ((value) {
                          colorstate.setColor = value;
                        })),
                  ),
                ],
              ),
            ],
            elevation: 0,
            backgroundColor: Colors.black.withOpacity(0.3),
            title: Consumer<ColorState>(
              builder: (context, colorstate, child) => Text(
                "State Management",
                style: TextStyle(color: colorstate.getColor),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // ============
                        // SALDO STATE
                        // ============
                        Consumer<ColorState>(
                          builder: (context, colorstate, child) =>
                              Consumer<SaldoState>(
                            builder: (context, saldostate, child) => Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: colorstate.getColor),
                              child: Center(
                                child: Text(
                                  "${saldostate.getSaldo}",
                                  style: TextStyle(
                                      fontSize: 28, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // =======================
                        // KERANJANG STATE
                        // =======================
                        Consumer<ColorState>(
                          builder: (context, colorstate, child) =>
                              Consumer<KeranjangState>(
                            builder: (context, keranjangstate, child) =>
                                Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: colorstate.getColor),
                              child: Center(
                                child: Text(
                                  "${keranjangstate.getQty}",
                                  style: TextStyle(
                                      fontSize: 28, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Consumer<ColorState>(
                          builder: (context, colorstate, child) =>
                              Consumer<KeranjangState>(
                            builder: (context, keranjangstate, child) =>
                                Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: colorstate.getColor),
                              child: Center(
                                  child: Text(
                                "${keranjangstate.getQty * 500}",
                                style: TextStyle(
                                    fontSize: 28, color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Jumlah Saldo\nAnda",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        "Jumlah Item\n Dibeli",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        "Jumlah Saldo\n Dibelanjakan",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // KERANJANG STATE
                  Consumer<ColorState>(
                    builder: (context, colorstate, child) =>
                        Consumer<KeranjangState>(
                      builder: (context, keranjangstate, child) => Column(
                        children: [
                          _cardProduct(
                              colorstate, context, "Telur", 1000, Icons.egg),
                          _cardProduct(
                              colorstate, context, "Daging", 2000, Icons.abc),
                          _cardProduct(
                              colorstate, context, "Daging", 2000, Icons.abc),
                          _cardProduct(
                              colorstate, context, "Daging", 2000, Icons.abc),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _cardProduct(ColorState colorstate, BuildContext context,
      String namaProduct, int hargaProduct, IconData icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: colorstate.getColor, borderRadius: BorderRadius.circular(20)),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 120,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Icon(
                            icon,
                            color: Colors.white,
                            size: 100,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$namaProduct",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Harga",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                    Text(
                      "($hargaProduct)",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(40)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Consumer3<ColorState, SaldoState, KeranjangState>(
                        builder: (context, colorstate, saldostate,
                                keranjangstate, child) =>
                            IconButton(
                          onPressed: () {
                            if (saldostate.getSaldo > 0) {
                              saldostate.kurangiSaldo(hargaProduct);
                              keranjangstate.tambahkeranjang();
                            }
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
