import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/domain/newsModel.dart';
import 'package:news_app/utils/color_theme.dart';

class CustomNewsCard extends StatelessWidget {
  const CustomNewsCard({
    Key? key,
    required this.news,
  }) : super(key: key);

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white, 
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), 
              spreadRadius: 1, 
              blurRadius: 5, 
              offset: Offset(0, 3), 
            ),
          ],
        ),
        height: 340,
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.grey,
              ),
              height: 220, 
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.network(
                  "https://kumudam.com/${news.imageBig}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title!,
                    style: TextStyle(
                      color: ColorThemes.bkcolor, 
                      fontSize: 14,
                      fontWeight: FontWeight.normal, 
                    ),
                    overflow: TextOverflow.ellipsis, 
                    maxLines: 3,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 5,),
                      Text(
                        "${daysDifferenceFromToday(news.createdAt!)} days",
                        style: TextStyle(
                          color: ColorThemes.news_daysColors, 
                          fontSize: 14, 
                          fontWeight: FontWeight.normal, 
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
int daysDifferenceFromToday(String dateString) {
  try {
    DateTime givenDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateString);
    DateTime today = DateTime.now();
    Duration difference = today.difference(givenDate);
    return difference.inDays.abs();
  } catch (e) {
    print("Error parsing date: $e");
    return 0;
  }
}