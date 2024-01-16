import 'package:ecom/consts/consts.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: "Seller name".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.blue,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Message"
                    ),
                  ),
                ),
                IconButton(
                    onPressed: (){},
                    style: IconButton.styleFrom(
                        // side: const BorderSide(color: Colors.blueAccent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    icon: const Icon(
                      Icons.send,
                      size: 30.0,
                      // color: Colors.blueAccent,
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
