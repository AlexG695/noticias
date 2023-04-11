import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/src/blocs/notice/notice_state.dart';
import 'package:news/src/models/notice.dart';
import 'package:news/src/ui/navegacion/noticias/noticias_crear.dart';
import 'package:news/src/widgets/empty_widget.dart';

class NoticiasPage extends StatefulWidget {
  const NoticiasPage({super.key});

  @override
  State<NoticiasPage> createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<NoticiasPage> {
  List<Notice> noticias = [];

  final db = FirebaseFirestore.instance;

  fetchNotices() async {
    var records = FirebaseFirestore.instance.collection('notice').get();
    mapRecords(records as QuerySnapshot<Map<String, dynamic>>);
  }

  mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
    var _list = records.docs
        .map((notice) => Notice(
            id: notice.id,
            title: notice["title"],
            description: notice["description"],
            time: notice["time"],
            autor: notice["autor"]))
        .toList();
    setState(() {
      noticias = _list;
    });
  }

  @override
  initState() {
    fetchNotices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NoticiasCrear()));
          },
          child: const Icon(Icons.add),
        ),
        body: Center(
          child: EmptyWidget(
            text: 'No hay noticias',
            ruta: 'assets/json/news_error.json',
            alto: 250,
            ancho: 250,
          ),
        ));
  }
}
