import 'package:flutter/material.dart';
import 'package:myapp/page2.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool colorBlack = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // Imagen de fondo
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("../assets/fondoropa.png"),
              fit: BoxFit.cover,
            ),
          ),

          // Contenido encima de la imagen de fondo
          child: SizedBox(
            width: double.infinity,
            height: 645,
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.black,
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                      Icon(Icons.store_mall_directory, color: Colors.white),
                      SizedBox(width: 30),
                      Text(
                        "Mi tienda",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Text(
                        "ORIGINAL STORE",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      Container(
                        height: 100,
                        width: 250,
                        child: Center(
                          child: Image.asset("../assets/logomarca.png"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  "¡Bienvenido!",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                SizedBox(height: 35),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => const Page2(),
                        ),
                      );
                      colorBlack = true;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Comprar",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.shopping_cart, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30), // Espaciado antes de redes sociales
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      iconsocialmedia("instagram", "www.instagram.com/"),
                      SizedBox(width: 30),
                      iconsocialmedia(
                        "facebook",
                        "www.facebook.com/?locale=es_LA",
                      ),
                      SizedBox(width: 30),
                      iconsocialmedia(
                        "whatsapp",
                        "www.whatsapp.com/?lang=es_LA",
                      ),
                      SizedBox(height: 90),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  height: 20,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Center(
                    child: Text(
                      "© 2025 Desarrollado por Pérez Griselda Soledad. Todos los derechos reservados",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ], // <- cierre de children[]
            ),
          ), // <- cierre de Column
        ), // <- cierre de Container
      ),
    ); // <- cierre de Scaffold
  }

  GestureDetector iconsocialmedia(String image, String link) {
    return GestureDetector(
      onTap: () => launchUrlString(
        mode: LaunchMode.externalApplication,
        "https://$link",
      ),
      child: Container(
        height: 50,
        width: 50,
        child: Image.asset(
          "../assets/$image.png",
          color: Colors.white,
          colorBlendMode: BlendMode.srcIn,
        ),
      ),
    );
  }
}
