import 'package:flutter/material.dart';

class AgentDetailsPage extends StatefulWidget {
  const AgentDetailsPage(Object? arguments, {super.key});

  @override
  State<AgentDetailsPage> createState() => _AgentDetailsPageState();
}

class _AgentDetailsPageState extends State<AgentDetailsPage> {
  late ScrollController _scrollController;
  int _currentImageIndex = 0;
  List<String> _images = [
    'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/fullportrait.png',
    'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/killfeedportrait.png',
    'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/background.png',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    // Calculate the position of the scroll relative to the maximum scroll extent
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    double delta = 100.0; // Adjust this value to your preference

    // If the scroll position is close to the bottom of the scroll view, change the image
    if (maxScroll - currentScroll <= delta) {
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % _images.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll Control'),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _images
              .map((imagePath) => Image.network(imagePath, fit: BoxFit.cover))
              .toList(),
        ),
      ),
    );
  }
}
