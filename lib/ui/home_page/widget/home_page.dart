import 'package:flight_booking/ui/home_page/bloc/get_trip_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue[900],
          child: Icon(Icons.add),
        ),
        resizeToAvoidBottomPadding: false,
        body: Header());
  }
}
//*************************** trip list widget  */

class TripList extends StatefulWidget {
  @override
  _TripListState createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripBloc, TripStatus>(
      builder: (context, state) {
        if (state is OnTripLoading) {
          return CircularProgressIndicator();
        } else if (state is OnTripError) {
          return Text("Plaese Check Your Internet Connection ....");
        } else {
          return Align(
            alignment: Alignment(0.0, 1.4),
            child: SizedBox(
              height: 10,
              width: 10,
              child: OverflowBox(
                minWidth: 0.0,
                maxWidth: MediaQuery.of(context).size.width,
                minHeight: 0.0,
                maxHeight: (MediaQuery.of(context).size.height / 4),
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      height: double.infinity,
                      width: double.infinity,
                      child: Card(
                        color: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 25, left: 30),
                              child: Text(
                                "Vecation in Egypt",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "SEP , 20",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "ARN",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "0:38 AM",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Expanded(
                                    child: new Container(
                                      margin: const EdgeInsets.only(
                                          left: 10.0, right: 15.0),
                                      child: Divider(
                                        color: Colors.grey,
                                        height: 10,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "SEP , 20",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "IFK",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "0:38 AM",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/airplan.com.jpeg"),
                  colorFilter:
                      ColorFilter.mode(Colors.blue[800], BlendMode.colorBurn),
                  fit: BoxFit.fill),
            ),
            child: Stack(
              children: [
                Container(
                  child: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: Text("Itneraries"),
                    actions: [Icon(Icons.settings)],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: TextField(
                    onChanged: (value) {},
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) {},
                    decoration: InputDecoration(
                      hintText: 'Searche'.toUpperCase(),
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                BlocProvider(
                  create: (context) => TripBloc(),
                  child: TripList(),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(),
        )
      ],
    );
  }
}
