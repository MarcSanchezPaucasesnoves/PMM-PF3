import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:countries_app/providers/countries_provider.dart';
import 'package:countries_app/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget{
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countries = ref.watch(countriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartellera'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // Targetes principals
              CardSwiper(countries: countries.tenCountries),

              // Slider de pel·licules
              MovieSlider(countries: countries.europeCountries, widgetTitle: "Europe Countries",),
              // Poodeu fer la prova d'afegir-ne uns quants, veureu com cada llista és independent
              MovieSlider(countries: countries.africaCountries, widgetTitle: "Africa Countries",),
              MovieSlider(countries: countries.americasCountries, widgetTitle: "America Countries",),
              MovieSlider(countries: countries.antarcticCountries, widgetTitle: "Antarctic Countries",),
              MovieSlider(countries: countries.asiaCountries, widgetTitle: "Asia Countries",),
              MovieSlider(countries: countries.oceaniaCountries, widgetTitle: "Oceania Countries",),
            ],
          ),
        ),
      ),
    );
  }
}
