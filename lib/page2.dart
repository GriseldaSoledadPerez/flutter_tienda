import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int total = 0;
  int cantidad = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // Imagen de fondo
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/fondoropa2.jpg"),
                  fit: BoxFit.cover,
                ),
              ),

              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: double.infinity,
                    color: Colors.black,
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Icon(
                          Icons.checkroom,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        SizedBox(width: 30),
                        Text(
                          "Productos",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                  SizedBox(height: 80),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Center(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            runAlignment: WrapAlignment.center,
                            spacing: 40, // espacio horizontal entre productos
                            runSpacing: 30, //centra las filas
                            children: [
                              //espacio
                              productoRopa(
                                "Remera Over",
                                15000,
                                "assets/remera.jpg",
                              ),

                              productoRopa(
                                "Remera pink",
                                16000,
                                "assets/remera2.jpg",
                              ),

                              productoRopa(
                                "Remera pink",
                                12000,
                                "assets/remera3.jpg",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 36, 35, 34),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Productos en carrito:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "$cantidad",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => launchUrlString(
                                  mode: LaunchMode.externalApplication,
                                  "https://www.whatsapp.com/?lang=es_LA",
                                ),
                                child: Container(
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "\$$total",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Icon(Icons.savings_outlined),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.black),
                    child: Center(
                      child: Text(
                        "© 2025 Desarrollado por Pérez Griselda Soledad. Todos los derechos reservados.",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container productoRopa(String titulo, int precio, String imagen) {
    return Container(
      height: 320,
      width: 200,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 241, 238, 238),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(
              153,
              2,
              36,
              61,
            ), // Sombra con color y transparencia definidos
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3), // Desplazamiento
          ),
        ],
      ),
      child: Column(
        //adentro del conteiner
        children: [
          SizedBox(height: 2),
          Container(height: 200, child: Image.asset(imagen)),
          Container(
            height: 1,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.black),
          ), //placeholder para la X
          SizedBox(height: 10),
          Text(titulo, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(
            "\$" + precio.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                cantidad++;
                total = total + precio;
              });
            },
            child: Container(
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Agregar",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.shopping_cart),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
