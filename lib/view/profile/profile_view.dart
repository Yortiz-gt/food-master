import 'package:Ubu_Shop/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          child: SingleChildScrollView(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 170,
              width: MediaQuery.sizeOf(context).width * 1,
              decoration: const BoxDecoration(
                color: DefaultColor.secondary,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage(
                        "https://learnenglish.britishcouncil.org/sites/podcasts/files/2021-10/RS8003_GettyImages-994576028-hig.jpg"),
                    backgroundColor: Colors.transparent,
                  ),
                  Text(
                    "Nombre de Usario",
                    style: GoogleFonts.montserrat(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ],
              ),
            ),
          ),
          miCard(
              title: 'Usuario',
              description: 'Julio Sicaja',
              icon: Icons.person),
          miCard(
              title: 'Direccion de entrega',
              description: 'San jose Pinula, 8-34',
              icon: Icons.home),
          const TitleSection(
            title: "Historial de compra",
          ),
          const SpacerCustom(),
          HistoryItem(
            idCompra: '1',
            fechaCompra: '21/10/2023',
            totalCompra: '254,00',
            status: "Pendiente",
            direccion: "San jose Pinula, 8-34",
          ),
        ],
      ))),
    );
  }
}

class SpacerCustom extends StatelessWidget {
  const SpacerCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 28,
    );
  }
}

// ignore: must_be_immutable
class HistoryItem extends StatelessWidget {
  String idCompra;
  String fechaCompra;
  String totalCompra;
  String status;
  String direccion;

  HistoryItem(
      {super.key,
      required this.direccion,
      required this.status,
      required this.fechaCompra,
      required this.idCompra,
      required this.totalCompra});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: DefaultColor.primaryOpacity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.fromLTRB(20, 5, 20, 20),
      elevation: 10,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "No. Compra:",
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Text(
                            "Fecha de de pedido:",
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Text(
                            "Estatus:",
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Text(
                            "Total:",
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Text(
                            "Direccion:",
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            idCompra,
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Text(
                            fechaCompra,
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Text(
                            status,
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: 13,
                                color: status.toLowerCase() == "pendiente"
                                    ? const Color.fromARGB(255, 211, 96, 96)
                                    : Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            'Q$totalCompra',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Text(
                            direccion,
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            color: DefaultColor.secondary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(color: DefaultColor.secondary),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
        child: Row(
          children: [
            Image.asset(
              "assets/onboarding/logo.png",
              width: 75,
            ),
            Text(
              "Perfil",
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Card miCard(
    {required String title,
    required String description,
    required IconData icon}) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: const EdgeInsets.fromLTRB(20, 5, 20, 20),
    elevation: 10,
    child: Column(
      children: <Widget>[
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(title),
          ),
          subtitle: Text(description),
          leading: Icon(icon),
        ),
      ],
    ),
  );
}
