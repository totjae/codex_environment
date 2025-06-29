import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/character.dart';
import '../services/api_service.dart';
import '../widgets/character_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  List<Character> _characters = [];
  bool _loading = false;

  Future<void> _search() async {
    setState(() => _loading = true);
    try {
      final api = context.read<ApiService>();
      final result = await api.fetchCharacters(_controller.text.trim());
      setState(() => _characters = result);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('검색 실패')));
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('던담 모험단 캐릭터')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration:
                        const InputDecoration(labelText: '모험단명 입력'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _loading ? null : _search,
                )
              ],
            ),
            const SizedBox(height: 16),
            if (_loading) const CircularProgressIndicator(),
            Expanded(
              child: ListView.builder(
                itemCount: _characters.length,
                itemBuilder: (context, index) {
                  return CharacterCard(character: _characters[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
