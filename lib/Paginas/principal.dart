import 'package:flutter/material.dart';
import 'package:flutter_parcial03/temas/colores.dart';

import '../modelo/gifgiphy.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
   int MenuActivo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: bgcolor,
      appBar: getAppBar(),
      body: getBody(),
    );
  }
    PreferredSizeWidget getAppBar() {
    return AppBar(
      backgroundColor: bgColor,
      centerTitle: true,
      leading: IconButton(
        icon: Text(
          "Editar",
          style: TextStyle(
              fontSize: 14, color: primary, fontWeight: FontWeight.w500),
        ),
        onPressed: null,
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.call,
            color: primary,
          ),
          onPressed: null,
        )
      ],
      title: Container(
          width: 155,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: white.withOpacity(0.05)),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      MenuActivo = 0;
                    });
                  },
                  child: Container(
                    width: 75,
                    height: 28,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: MenuActivo == 0
                            ? white.withOpacity(0.3)
                            : Colors.transparent),
                    child: Center(
                      child: Text(
                        "Datos",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      MenuActivo = 1;
                    });
                  },
                  child: Container(
                    width: 75,
                    height: 28,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: MenuActivo == 1
                            ? white.withOpacity(0.3)
                            : Colors.transparent),
                    child: Center(
                      child: Text(
                        "Apellidos",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
  Widget getBody() {
    return ListView(
      children: [
        
      ],
    );
  }
List<Widget> _listadogiphys(List<Gifgiphy> data) {
    List<Widget> gifs = [];
    for (var gif in data) {
      gifs.add(Card(
          child: Column(
        children: [
          Expanded(
            child: Image.network(
              gif.url,
              fit: BoxFit.fill,
            ),
          ),
          /*    Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(gif.nombre),
          ),*/
        ],
      )));
    }
    return gifs;
  }

}



