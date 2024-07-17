import 'package:flutter/material.dart';
import 'package:furuplus/models/pack_model.old.dart';
import 'package:furuplus/screens/pack_detail_page.dart';
import 'package:furuplus/themes/theme_helper.dart';

class PacksPage extends StatefulWidget {
  const PacksPage({super.key});

  @override
  State<PacksPage> createState() => _PacksPageState();
}

class _PacksPageState extends State<PacksPage> {

  TextEditingController searchController = TextEditingController();
  List<PackModelOld> packList = [
    PackModelOld(nom: 'Pack Lafia', description:  'Pack simple lafia', prix: 1200000, details: 'Pack Vraiement lafia'),
    PackModelOld(nom: 'Pack Pro', description:  'Pack pour les pro', prix: 1200000, details: 'Pack Ultra bien'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Liste des packs dispo'),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
                controller: searchController,
                decoration: ThemeHelper().textInputDecoration("Rechercher", "Tapez le d'un pack", Theme.of(context).primaryColor),
                //onChanged: (value) => factureController.filterFacture(value),
                onChanged: (value) {
                  print('*** Recherche : $value');
                  //factureController.filterFacture(value);
                }
            ),
          ),
          packList.isEmpty ?
          Center(child: Text('Aucun Pack Disponible'),) :
          Expanded(
            child: ListView.builder(
                itemCount: packList.length,
                itemBuilder: (BuildContext context, index) {
                  PackModelOld pack = packList[index];
                  return Card(
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (builder) => PackDetailPage(pack: pack,),
                        //   ),
                        // );
                      },
                      child: ListTile(
                        leading: Icon(Icons.card_giftcard, color: Colors.red,),
                        title: Text(pack.nom!),
                        subtitle: Text(pack.description!),
                        trailing: Wrap(
                          spacing: 1,
                          children: [
                            IconButton(
                                onPressed: () {

                                },
                                icon: Icon(Icons.edit, color: Colors.blue,)
                            ),
                            IconButton(
                                onPressed: () {
                                  packList.removeAt(index);
                                  setState(() {

                                  });
                                },
                                icon: Icon(Icons.delete, color: Colors.red,)
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}

