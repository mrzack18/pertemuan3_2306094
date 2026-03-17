import 'package:flutter/material.dart';

void main() {
  runApp(const PremiumApp());
}

class PremiumApp extends StatelessWidget {
  const PremiumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(
          0xFFF5F7FA,
        ), // Warna background abu-abu sangat muda
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
        ), // Aksen biru modern
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // === APP BAR MODERN DENGAN SEARCH BAR ===
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Lokasi Pengiriman",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Row(
              children: const [
                Text(
                  "Garut, Indonesia",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 18,
                  color: Colors.black87,
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: Colors.black87,
                    size: 28,
                  ),
                  onPressed: () {},
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, right: 10),
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // === BODY KONTEN ===
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Search Bar
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari barang impianmu...',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
            ),

            // 2. Greeting & Avatar
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Selamat datang kembali,",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Zaki Muhamad \uD83D\uDC4B",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/200/200',
                    ),
                  ),
                ],
              ),
            ),

            // 3. Banner Carousel (Modern Style)
            Container(
              height: 160,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: NetworkImage('https://picsum.photos/800/400?random=1'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "PROMO",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Flash Sale\nUp To 50% Off',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),

            // 4. Icon Kategori Modern
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIconCategory(Icons.checkroom, 'Baju', Colors.orange),
                  _buildIconCategory(Icons.dry_cleaning, 'Celana', Colors.blue),
                  _buildIconCategory(Icons.snowshoeing, 'Sepatu', Colors.green),
                  _buildIconCategory(Icons.watch, 'Aksesoris', Colors.purple),
                  _buildIconCategory(
                    Icons.grid_view_rounded,
                    'Semua',
                    Colors.grey,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // 5. Header Grid Produk
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Rekomendasi Spesial',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Lihat Semua'),
                  ),
                ],
              ),
            ),

            // 6. Grid Produk Premium
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 0.68, // Disesuaikan agar muat tombol beli
                children: [
                  _buildPremiumProductCard(
                    'Laptop Gaming',
                    'Rp 10.000.000',
                    '4.9',
                    'https://cdn.antaranews.com/cache/1200x800/2023/03/05/00.jpg',
                  ),
                  _buildPremiumProductCard(
                    'Motor Racing',
                    'Rp 50.000.000',
                    '4.8',
                    'https://img.redbull.com/images/c_crop,x_994,y_0,h_2967,w_3462/c_fill,w_900,h_750/q_auto:low,f_auto/redbullcom/2018/03/27/f207235a-b79d-4537-a8e8-9aeff0e9bc53/motogp-rider-marc-marquez-repsol-honda',
                  ),
                  _buildPremiumProductCard(
                    'Seblak Pedas',
                    'Rp 20.000',
                    '5.0',
                    'https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/232/2025/08/14/27bf6e38a69ec4fc14d1dce5f43e81e0-945913758.jpg',
                  ),
                  _buildPremiumProductCard(
                    'Parang Jahannam',
                    'Rp 2.000.000',
                    '4.5',
                    'https://media.istockphoto.com/id/178375768/id/foto/parang.jpg?s=612x612&w=0&k=20&c=MdK9qJSF80moTU89Mk3xMn81jcm2rqgWcIA7E6PEzxs=',
                  ),
                  _buildPremiumProductCard(
                    'Kentut Berdahak',
                    'Rp 999.999',
                    '4.2',
                    'https://cdn.antaranews.com/cache/1200x800/2019/11/16/shutterstock_1219239466.jpg',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),

      // === BOTTOM NAVIGATION BAR ===
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.white,
        elevation: 10,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore),
            label: 'Eksplor',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(Icons.shopping_cart),
            label: 'Keranjang',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  // Widget Kategori Bulat
  Widget _buildIconCategory(IconData icon, String label, Color bgColor) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: bgColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: bgColor, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  // Widget Kartu Produk Premium
  Widget _buildPremiumProductCard(
    String title,
    String price,
    String rating,
    String imageUrl,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar dan Tombol Wishlist
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.9),
                    radius: 14,
                    child: const Icon(
                      Icons.favorite_border,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Info Produk
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        color: Color(0xFF2563EB),
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2563EB),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
