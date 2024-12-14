import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bioenergy'),
        backgroundColor: const Color.fromARGB(255, 48, 4, 124),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildHomeContent(),
          _buildNewsContent(),
          _buildMapsContent(),
          _buildLayananContent(),
          _buildProfilContent(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.article_outlined),
            selectedIcon: Icon(Icons.article),
            label: 'News',
          ),
          NavigationDestination(
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map),
            label: 'Maps',
          ),
          NavigationDestination(
            icon: Icon(Icons.support_agent_outlined),
            selectedIcon: Icon(Icons.support_agent),
            label: 'Layanan',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
      ),
    );
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section with App Icon and Title
          Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 48, 4, 124),
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.energy_savings_leaf,
                  size: 100,
                  color: Colors.white,
                ),
                const SizedBox(height: 16),
                const Text(
                  'BIOMASA',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Energi Berkelanjutan untuk Masa Depan',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // About the App Section
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Apa Itu Biomassa?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Biomassa adalah bahan organik yang berasal dari tanaman dan hewan yang dapat digunakan sebagai energi terbarukan. Dengan aplikasi ini, Anda dapat memahami pentingnya biomassa untuk masa depan yang lebih hijau.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),

          // Latest News Section
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'News Terkini',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: Image.asset(
                          'lib/assets/notfound.webp',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          'Judul Berita $index',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Deskripsi singkat berita $index tentang perkembangan energi terbarukan.',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsContent() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'News',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('All News'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: Image.asset(
                      'lib/assets/notfound.webp',
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                    title: const Text(
                      'Energi Terbarukan untuk Masa Depan',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('April 25, 2023'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMapsContent() {
    return Center(
      child: const Text(
        'Maps Page Content',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget _buildLayananContent() {
    return Center(
      child: const Text(
        'Layanan Page Content',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget _buildProfilContent() {
    return Center(
      child: const Text(
        'Profil Page Content',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
