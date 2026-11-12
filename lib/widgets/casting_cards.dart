import 'package:flutter/material.dart';

import '../models/models.dart';

class CastingCards extends StatelessWidget {

  final Country country;
  final Map<String, List<String>> currencyImg;

  const CastingCards({super.key, required this.country, required this.currencyImg});
  

  @override
  Widget build(BuildContext context) {
    final List<String> cardsTitles = ["Currency", "Region", "Subregion"];
    final List<String> nameCardsTitles = [country.currencyName, country.region, country.subregion];

    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 200,
      // color: Colors.red,
      child: ListView.builder(
          itemCount: cardsTitles.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) => _CastCard(country: country, currencyImg: currencyImg, cardTitle: cardsTitles[index], nameCardTitle: nameCardsTitles[index], indexImage: index+1,)),
    );
  }
}

class _CastCard extends StatelessWidget {
  final Country country;
  final Map<String, List<String>> currencyImg;
  final String cardTitle;
  final String nameCardTitle;
  final int indexImage;

  const _CastCard({required this.country, required this.currencyImg, required this.cardTitle, required this.nameCardTitle, required this.indexImage});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final String? imgUrl = currencyImg[country.commonName]?.elementAtOrNull(indexImage);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      // color: Colors.green,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: (imgUrl != null && imgUrl.isNotEmpty) 
              ? FadeInImage(
                  placeholder: AssetImage('assets/loading.gif'),
                  image: NetworkImage(imgUrl),
                  height: 140,
                  width: 100,
                  fit: BoxFit.cover,
                ) : Image.asset(
                  'assets/loading.gif',
                  fit: BoxFit.cover,
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Text(
                cardTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              Text(
                nameCardTitle,
                style: textTheme.bodySmall,
              ),
            ]
          )
        ],
      ),
    );
  }
}
