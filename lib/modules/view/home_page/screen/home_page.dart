import 'package:flutter/material.dart';
import 'package:gov_services_app/modules/provider/connectivity_provider.dart';
import 'package:gov_services_app/modules/provider/goverment_service_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<GovermentServiceProvider>(context, listen: false).getData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Government Services'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: (Provider.of<ConnectivityProvider>(context)
                    .connectionModel
                    .connectionStr ==
                'Offline')
            ? const Text('offline')
            : GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                children: Provider.of<GovermentServiceProvider>(context)
                    .govServiceData
                    .map((e) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('webPage', arguments: e);
                    },
                    child: Card(
                      margin: const EdgeInsets.all(2),
                      shape: const Border.symmetric(
                        vertical: BorderSide(
                          width: 1,
                        ),
                        horizontal: BorderSide(width: 2),
                      ),
                      elevation: 8,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image(
                                image: AssetImage(e.logo),
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                            height: 1,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                e.name,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
      ),
    );
  }
}
