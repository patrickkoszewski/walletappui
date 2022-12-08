import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:walletappui/util/my_balance.dart';
import 'package:walletappui/util/my_button.dart';
import 'package:walletappui/util/my_list_tile.dart';
//mając home_page i main dart w takiej formie możemy myślec nad pomysłem
//nad ui lub się inspirować z neta i rozpisać po // jaki jest plan na wykonanie aplikacji

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //page controller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange[600],
        child: const Icon(
          Icons.monetization_on,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.home,
                  size: 35,
                  color: Colors.orange,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  size: 35,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(children: [
          //app bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'My',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Balance',
                          style: TextStyle(fontSize: 28),
                        ),
                      ],
                    ),

                    //plus button
                    Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.add)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          //cards
          Container(
            height: 200,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              children: [
                MyBalance(
                  balance: 2500.20,
                  cardNumber: 12345631,
                  expiryMonth: 10,
                  expiryYear: 24,
                  color: Colors.orange[700],
                ),
                MyBalance(
                  balance: 700.20,
                  cardNumber: 12334697,
                  expiryMonth: 15,
                  expiryYear: 23,
                  color: Colors.green[600],
                ),
                MyBalance(
                  balance: 32500.20,
                  cardNumber: 12398678,
                  expiryMonth: 06,
                  expiryYear: 32,
                  color: Colors.blue[700],
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.grey.shade700,
            ),
          ),

          const SizedBox(height: 40),
          //3 buttons -> send + pay + bill
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, //szybsze od sizedbox

              children: const [
                //send button
                //SizedBox(width: 22), bez sensu w row już lepiej równo rozmieścić
                MyButton(
                  iconImagePath: 'lib/icons/banknote.png',
                  buttonText: 'Send',
                ),

                //pay button
                MyButton(
                  iconImagePath: 'lib/icons/cryptowallet.png',
                  buttonText: 'pay',
                ),

                //bills button
                MyButton(
                  iconImagePath: 'lib/icons/bill.png',
                  buttonText: 'Bills',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //column -> stats + transactions
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: const [
                //statistics
                MyListTile(
                  iconImagePath: 'lib/icons/graph.png',
                  tileTitle: 'Statistics',
                  tileSubTitle: 'Payments and Income',
                ),
                MyListTile(
                  iconImagePath: 'lib/icons/trader.png',
                  tileTitle: 'Transactions',
                  tileSubTitle: 'Transaction History',
                ),

                //transaction
              ],
            ),
          )
        ]),
      ),
    );
  }
}
