import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: CarritoScreen(),
  debugShowCheckedModeBanner: false,
));

class CarritoScreen extends StatefulWidget {
  const CarritoScreen({super.key});

  @override
  State<CarritoScreen> createState() => _CarritoScreenState();
}

class _CarritoScreenState extends State<CarritoScreen> {
  List<bool> selectedItems = [true, true];

  // URLs de imágenes reales para los productos
  final List<String> imagenesProductos = [
    'https://raw.githubusercontent.com/vazquezmunozsofiaximena/Imagenes_Para_Flutter_6J_11-Febrero-2026/refs/heads/main/falda.png', // Vestido/Abrigo
    'https://raw.githubusercontent.com/vazquezmunozsofiaximena/Imagenes_Para_Flutter_6J_11-Febrero-2026/refs/heads/main/top.png', // Conjunto Moda
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 239, 199, 255),
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        title: const Text(
          "Boutique Moon Sweet",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // --- PALABRA "CARRITO" DENTRO DEL BODY ---
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
            child: Text(
              "Carrito",
              style: TextStyle(
                fontSize: 32, 
                fontWeight: FontWeight.bold, 
                color: Colors.black87
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Color(0xFFF0F0F0)),
                      bottom: BorderSide(color: Color(0xFFF0F0F0)),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Izquierda: Checkbox e Imagen Real
                      Checkbox(
                        value: selectedItems[index],
                        activeColor: Colors.purpleAccent,
                        onChanged: (val) => setState(() => selectedItems[index] = val!),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imagenesProductos[index],
                          width: 90,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 15),

                      // Derecha: Datos del producto
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              index == 0 ? "Falda a Cuadros" : "Top sin Mangas",
                              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Talla: s", style: TextStyle(color: Colors.black54, fontSize: 15)),
                                Text(
                                  index == 0 ? "\$500" : "\$120",
                                  style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  child: Text(
                                    "Tela premium de alta calidad.",
                                    style: TextStyle(color: Colors.grey, fontSize: 13),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                // Contador
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.remove, size: 16),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: Text("1", style: TextStyle(fontWeight: FontWeight.bold)),
                                      ),
                                      Icon(Icons.add, size: 16),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // Basura debajo del contador
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                                iconSize: 22,
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Botón Comprar
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {},
                child: const Text(
                  "COMPRAR",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.purpleAccent,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Carrito"),
        ],
      ),
    );
  }
}