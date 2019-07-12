import 'package:flutter/material.dart';
import 'package:movies/src/models/reviews_model.dart';

class ReviewsWidget extends StatelessWidget {
  final List<Review> review;
  const ReviewsWidget({@required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: review.length,
      itemBuilder: cardItems,
    ));
  }

  Widget commetsWidget(BuildContext context, int index) {
    final rew = Column(
      children: <Widget>[
        cardItems(context, index),
        SizedBox(
          height: 10.0,
        )
      ],
    );

    return rew;
  }

  Widget commets(Review review) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        review.content,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget cardItems(BuildContext context, int index) {
    final cardItems = Card(
        color: Colors.greenAccent,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text('Nick: ${review[index].author}',style: Theme.of(context).textTheme.title,
              ),
              ),
              commets(review[index]),
            ],
        )));

    return Container(
      padding: EdgeInsets.all(10.0),
      child: cardItems,
    );
  }
}
