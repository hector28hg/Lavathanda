import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const LavathandaApp());
}

// COLORES DE LAVATHANDA
const Color azul = Color(0xFF0787B7);
const Color azulOscuro = Color(0xFF063E73);
const Color celeste = Color(0xFFEAF8FD);

// ENLACES OFICIALES
const String whatsapp = 'https://wa.me/51969402520';
const String facebook =
    'https://www.facebook.com/p/Lavathanda-Ica-100048914457108/?locale=es_LA';
const String instagram = 'https://www.instagram.com/lavathanda_ica/';
const String ubicacion =
    'https://www.google.com/maps/search/?api=1&query=Av.+San+Martin+255+Ica+Peru';

// ABRIR ENLACES
Future<void> abrirEnlace(String url) async {
  final uri = Uri.parse(url);
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}

// CONSULTAR SERVICIOS POR WHATSAPP
Future<void> consultarServicio(String servicio) async {
  final mensaje = Uri.encodeComponent(
    'Hola, quisiera información sobre $servicio en Lavathanda.',
  );

  await abrirEnlace('$whatsapp?text=$mensaje');
}

// APLICACIÓN
class LavathandaApp extends StatelessWidget {
  const LavathandaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lavathanda Ica - Lavandería',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: azul),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const PaginaPrincipal(),
    );
  }
}

// PÁGINA PRINCIPAL
class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.sizeOf(context).width;
    final esMovil = ancho < 700;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: azulOscuro,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 45,
              width: 52,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 8),
            const Flexible(
              child: Text(
                'LAVATHANDA',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'WhatsApp',
            icon: const Icon(Icons.chat_outlined),
            onPressed: () => abrirEnlace(whatsapp),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. INICIO
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: esMovil ? 20 : 45,
                vertical: 48,
              ),
              color: celeste,
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 28,
                runSpacing: 25,
                children: [
                  SizedBox(
                    width: esMovil ? ancho - 40 : 430,
                    child: Column(
                      children: [
                        const Text(
                          'LAVANDERÍA LAVATHANDA',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: azul,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Tu ropa limpia y cuidada',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: esMovil ? 32 : 44,
                            fontWeight: FontWeight.bold,
                            color: azulOscuro,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Lavado de ropa, zapatillas, '
                          'alfombras, edredones, sábanas '
                          'y otros artículos textiles en Ica.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17, height: 1.5),
                        ),
                        const SizedBox(height: 24),
                        FilledButton.icon(
                          onPressed: () => abrirEnlace(whatsapp),
                          icon: const Icon(Icons.chat),
                          label: const Text('Contáctanos por WhatsApp'),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: esMovil ? 270 : 350,
                      height: esMovil ? 190 : 260,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),

            // 2. NOSOTROS
            const SeccionTexto(
              titulo: '¿Quiénes somos?',
              icono: Icons.storefront,
              texto:
                  'Lavathanda es una lavandería ubicada '
                  'en Ica, dedicada al lavado y cuidado '
                  'de prendas de vestir, calzado y '
                  'artículos textiles del hogar.',
            ),

            // 3. MISIÓN Y VISIÓN
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              color: celeste,
              child: const Wrap(
                alignment: WrapAlignment.center,
                spacing: 18,
                runSpacing: 18,
                children: [
                  TarjetaInformativa(
                    titulo: 'Nuestra misión',
                    icono: Icons.flag_outlined,
                    texto:
                        'Brindar servicios de lavado y cuidado '
                        'de prendas, buscando satisfacer las '
                        'necesidades de nuestros clientes '
                        'mediante una atención responsable '
                        'y comprometida.',
                  ),
                  TarjetaInformativa(
                    titulo: 'Nuestra visión',
                    icono: Icons.visibility_outlined,
                    texto:
                        'Ser una lavandería reconocida '
                        'en Ica por la calidad de sus '
                        'servicios, la confianza de sus '
                        'clientes y el cuidado de las prendas.',
                  ),
                ],
              ),
            ),

            // 4. SERVICIOS CON IMÁGENES Y PRECIOS
            const SizedBox(height: 45),
            const TituloSeccion(
              titulo: 'Nuestros servicios',
              subtitulo:
                  'Conoce nuestros servicios y consulta '
                  'los precios de lavado.',
            ),
            const SizedBox(height: 25),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 18,
                runSpacing: 18,
                children: [
                  TarjetaServicio(
                    titulo: 'Lavado de ropa',
                    descripcion:
                        'Lavado de prendas de vestir '
                        'y ropa de uso diario.',
                    precio: 'Desde S/ 5.00 por kilo',
                    imagen: 'assets/images/lavado.png',
                    icono: Icons.local_laundry_service,
                  ),
                  TarjetaServicio(
                    titulo: 'Lavado de zapatillas',
                    descripcion:
                        'Cuidado y limpieza de zapatillas '
                        'de diferentes estilos.',
                    precio: 'S/ 13.00 por par',
                    imagen: 'assets/images/calzado.png',
                    icono: Icons.dry_cleaning,
                  ),
                  TarjetaServicio(
                    titulo: 'Lavado de alfombras',
                    descripcion:
                        'Servicio de limpieza y lavado '
                        'de alfombras.',
                    precio: 'Desde S/ 30.00',
                    imagen: 'assets/images/alfombra.png',
                    icono: Icons.cleaning_services,
                  ),
                  TarjetaServicio(
                    titulo: 'Lavado de edredones',
                    descripcion:
                        'Lavado y cuidado de '
                        'edredones y ropa de cama.',
                    precio: 'Consultar precio',
                    icono: Icons.bed,
                  ),
                  TarjetaServicio(
                    titulo: 'Lavado de sábanas',
                    descripcion:
                        'Lavado de sábanas '
                        'y otros artículos textiles.',
                    precio: 'Consultar precio',
                    icono: Icons.layers,
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Los precios mostrados corresponden a '
                'anuncios de Lavathanda. Consulta su '
                'vigencia y condiciones por WhatsApp.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
            ),

            // 5. PROMOCIONES
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 45),
              color: celeste,
              child: Column(
                children: [
                  const TituloSeccion(
                    titulo: 'Promociones Lavathanda',
                    subtitulo:
                        'Conoce nuestros anuncios y '
                        'consulta las promociones disponibles.',
                  ),
                  const SizedBox(height: 28),
                  const Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      TarjetaPromocion(
                        titulo: 'Promoción de zapatillas',
                        imagen: 'assets/images/zapatillas.png',
                        descripcion:
                            'Promoción 5×4 de lavado '
                            'de zapatillas.',
                      ),
                      TarjetaPromocion(
                        titulo: 'Promociones de ropa',
                        imagen: 'assets/images/promocion.png',
                        descripcion:
                            'Promociones de lavado '
                            'por cantidad de kilos.',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 6. GALERÍA
            const SizedBox(height: 45),
            const TituloSeccion(
              titulo: 'Galería de Lavathanda',
              subtitulo: 'Conoce nuestra marca y ubicación.',
            ),
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 16,
                runSpacing: 16,
                children: [
                  ImagenGaleria(
                    ruta: 'assets/images/logo.png',
                    titulo: 'Lavathanda Ica',
                  ),
                  ImagenGaleria(
                    ruta: 'assets/images/tienda.png',
                    titulo: 'Referencia del local',
                  ),
                ],
              ),
            ),

            // 7. UBICACIÓN
            const SeccionTexto(
              titulo: 'Nuestra ubicación',
              icono: Icons.location_on_outlined,
              texto:
                  'Av. San Martín 255, '
                  'Galería El Triunfo, stand 27, '
                  'Ica, Perú.',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: OutlinedButton.icon(
                onPressed: () => abrirEnlace(ubicacion),
                icon: const Icon(Icons.map_outlined),
                label: const Text('Ver en Google Maps'),
              ),
            ),

            // 8. CONTACTO Y REDES SOCIALES
            const SizedBox(height: 45),
            Container(
              width: double.infinity,
              color: celeste,
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  const TituloSeccion(
                    titulo: 'Contáctanos',
                    subtitulo:
                        'Comunícate con Lavathanda '
                        'y conoce nuestros servicios.',
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Celular y WhatsApp: 969 402 520',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Horario publicado: '
                    '9:30 a. m. a 8:20 p. m.\n'
                    'Días de atención por confirmar.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      FilledButton.icon(
                        onPressed: () => abrirEnlace(whatsapp),
                        icon: const Icon(Icons.chat),
                        label: const Text('WhatsApp'),
                      ),
                      OutlinedButton.icon(
                        onPressed: () => abrirEnlace(facebook),
                        icon: const Icon(Icons.facebook),
                        label: const Text('Facebook'),
                      ),
                      OutlinedButton.icon(
                        onPressed: () => abrirEnlace(instagram),
                        icon: const Icon(Icons.camera_alt_outlined),
                        label: const Text('Instagram'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // PIE DE PÁGINA
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              color: azulOscuro,
              child: const Text(
                '© Lavandería Lavathanda - Ica, Perú\n'
                'Página web y aplicación informativa',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, height: 1.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TÍTULOS
class TituloSeccion extends StatelessWidget {
  final String titulo;
  final String subtitulo;

  const TituloSeccion({
    super.key,
    required this.titulo,
    required this.subtitulo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          titulo,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: azulOscuro,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subtitulo,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

// SECCIÓN INFORMATIVA
class SeccionTexto extends StatelessWidget {
  final String titulo;
  final IconData icono;
  final String texto;

  const SeccionTexto({
    super.key,
    required this.titulo,
    required this.icono,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 950),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 43),
      child: Column(
        children: [
          Icon(icono, size: 43, color: azul),
          const SizedBox(height: 12),
          Text(
            titulo,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: azulOscuro,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            texto,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 17, height: 1.6),
          ),
        ],
      ),
    );
  }
}

// MISIÓN Y VISIÓN
class TarjetaInformativa extends StatelessWidget {
  final String titulo;
  final String texto;
  final IconData icono;

  const TarjetaInformativa({
    super.key,
    required this.titulo,
    required this.texto,
    required this.icono,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 345,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(26),
          child: Column(
            children: [
              Icon(icono, color: azul, size: 42),
              const SizedBox(height: 14),
              Text(
                titulo,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: azulOscuro,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                texto,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, height: 1.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// TARJETAS DE SERVICIOS
class TarjetaServicio extends StatelessWidget {
  final String titulo;
  final String descripcion;
  final String precio;
  final IconData icono;
  final String? imagen;

  const TarjetaServicio({
    super.key,
    required this.titulo,
    required this.descripcion,
    required this.precio,
    required this.icono,
    this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: Card(
        color: Colors.white,
        elevation: 3,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 190,
              color: celeste,
              child: imagen != null
                  ? Image.asset(imagen!, fit: BoxFit.contain)
                  : Icon(icono, size: 85, color: azul),
            ),
            Padding(
              padding: const EdgeInsets.all(19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: azulOscuro,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 65,
                    child: Text(
                      descripcion,
                      style: const TextStyle(height: 1.5),
                    ),
                  ),
                  const Divider(height: 25),
                  const Text(
                    'Precio del servicio',
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    precio,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: azul,
                    ),
                  ),
                  const SizedBox(height: 17),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => consultarServicio(titulo),
                      child: const Text('Consultar por WhatsApp'),
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
}

// TARJETAS DE PROMOCIONES
class TarjetaPromocion extends StatelessWidget {
  final String titulo;
  final String descripcion;
  final String imagen;

  const TarjetaPromocion({
    super.key,
    required this.titulo,
    required this.descripcion,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      child: Card(
        color: Colors.white,
        elevation: 3,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Image.asset(imagen, height: 310, width: 330, fit: BoxFit.contain),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    titulo,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: azulOscuro,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(descripcion, textAlign: TextAlign.center),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => consultarServicio(titulo),
                      child: const Text('Consultar promoción'),
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
}

// GALERÍA
class ImagenGaleria extends StatelessWidget {
  final String ruta;
  final String titulo;

  const ImagenGaleria({super.key, required this.ruta, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 265,
      child: Card(
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Image.asset(ruta, height: 195, width: 265, fit: BoxFit.contain),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Text(
                titulo,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
