import 'package:countries_app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:countries_app/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/models.dart';

class DetailsScreen extends ConsumerWidget {
  
  const DetailsScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Country country = ModalRoute.of(context)?.settings.arguments as Country;

    final AsyncValue<List<String>> imgAsync = ref.watch(imgWikipediaProvider(country));
    final List<String> imgList = imgAsync.value ?? [];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(country: country, capitalImg: imgList,),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitle(country: country),
                _Overview(country: country),
                _InformationCard(country: country),
                SizedBox(height: 20,),
                CastingCards(country: country, currencyImg: imgList),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  final Country country;
  final List<String> capitalImg;

  const _CustomAppBar({required this.country, required this.capitalImg});

  @override
  Widget build(BuildContext context) {
    final String? imgUrl = capitalImg.elementAtOrNull(0);

    // Exactament igual que la AppBaer però amb bon comportament davant scroll
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.only(bottom: 10),
        ),
        background: (imgUrl != null && imgUrl.isNotEmpty) 
        ? FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(imgUrl),
          fit: BoxFit.cover,
        ) : Image.asset(
          'assets/loading.gif',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Country country;

  const _PosterAndTitle({required this.country});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage(country.fullFlagImage),
              height: 150,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                country.names["common"],
                style: textTheme.headlineSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                country.officialName,
                style: textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                country.popularCode,
                style: textTheme.bodySmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Country country;

  const _Overview({required this.country});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        country.descriptions["long"],
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}

class _InformationCard extends StatelessWidget {
  final Country country;

  const _InformationCard({required this.country});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final List<String> languages = country.getLanguagesList();
    final List<String> currencyList = country.getCurrencyList();

    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: [
          SizedBox(height: 20,),
          Text("Capital", style: textTheme.titleMedium,),
          Text(country.capitalName),
          SizedBox(height: 10,),
          Text("Population", style: textTheme.titleMedium,),
          Text(country.population.toString()),
          SizedBox(height: 10,),
          Text("Area", style: textTheme.titleMedium,),
          Text("Kilometers: ${country.area["kilometers"]}"),
          Text("Miles: ${country.area["miles"]}"),
          SizedBox(height: 10,),
          Text("Languages", style: textTheme.titleMedium,),
          for (String language in languages)
            Text(language),
          SizedBox(height: 10,),
          Text("Currencies", style: textTheme.titleMedium,),
          for (String currency in currencyList)
            Text(
              currency,
              style: textTheme.bodySmall,
            ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }

}