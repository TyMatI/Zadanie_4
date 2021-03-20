import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      home: profil(),
    ),
  );
}

class profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CoD MW - Best Game"),
        ),
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 50,
                      ),
                      child: Column(
                        children: <Widget>[
                          imageload(30, 150, 75,
                              'https://gamenerd.pl/wp-content/webp-express/webp-images/doc-root/wp-content/uploads/2019/11/codmw.jpg.webp')
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            child: Text(
                              "Call Of Duty\n Modern Warfare",
                              style: TextStyle(fontSize: 15),
                            )),
                        StarsRow(3)
                      ],
                    )
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(
                        top: 30, left: 7, right: 7, bottom: 7),
                    decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color: Colors.black12,
                              spreadRadius: 5)
                        ]),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 20, left: 40, right: 40, bottom: 10),
                          child: Column(
                            children: <Widget>[
                              imageload(20, 400, 155,
                                  'https://img.redbull.com/images/q_auto,f_auto/redbullcom/2019/10/25/20133a4e-0a79-4cff-b69c-00cb6618a199/call-of-duty-modern-warfare-screenshot')
                            ],
                          ),
                        ),
                        Container(
                          margin:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              StarsRow(4),
                              TextButton(
                                onPressed: () {
                                  print("Like");
                                },
                                child: Text("Like"),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16),
                          child: Text(
                            "Ocenianie nowej odsłony Call of Duty przez pryzmat kampanii fabularnej to jak\n"
                                " ocenianie wina po wyglądzie butelki. Tryb dla jednego gracza to tylko przystawka przed\n"
                                " prawdziwym daniem, jakim są rozgrywki wieloosobowe. Co nie zmienia faktu, że nawet\n"
                                " w kampanii Infinity Ward pokazuje coś odświeżającego, nowego i ciekawego. Część\n"
                                " misji jest naprawdę dobra, chociaż walka o Stalingrad oraz misja w Czarnobylu z\n"
                                " poprzednich odsłon pozostają niepokonane. Z drugiej strony takie Piccadilly to klasa\n"
                                " sama w sobie.\n"
                                "Misje są bardzo zróżnicowane. W jednej z nich jesteśmy bezbronnym cywilem, aby\n"
                                " później zamienić się w uzbrojonego po zęby marine. Infinity Ward zadbało o\n"
                                " zróżnicowanie zadań, zabierając nas w bardzo nieoczekiwane miejsca. Uwielbiam na\n"
                                " przykład mocno polityczną misję w ambasadzie. Docenią ją wszyscy fani świetnego filmu\n"
                                " Argo. Może w scenariuszu pojawia się zbyt dużo personalnej dramy. Może pewne\n"
                                " postaci są momentami bardzo naiwne. Może przygoda dla jednego gracza jest\n"
                                " przesadnie feminizowana. Na pewno nie jest jednak nudno czy powtarzalnie.",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Roboto"),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}

class StarsRow extends StatelessWidget {
  final int rating;

  const StarsRow(
      this.rating, {
        Key key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      if (i < rating) {
        stars.add(Icon(Icons.star));
      } else {
        stars.add(Icon(Icons.star_border));
      }
    }
    return Row(children: stars);
  }
}

class imageload extends StatelessWidget {
  final double text;
  final double text1;
  final double text2;
  final String image;

  const imageload(
      this.text,
      this.text1,
      this.text2,
      this.image, {
        Key key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> box = [];
    return ClipRRect(
      borderRadius: BorderRadius.circular(text),
      child: Image.network(
        (image),
        width: text1,
        height: text2,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes
                  : null,
            ),
          );
        },
      ),
    );
  }
}