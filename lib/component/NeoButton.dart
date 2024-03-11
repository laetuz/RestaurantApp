import "package:flutter/material.dart";

class NeoButton extends StatelessWidget {
  const NeoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {

        },
        child: const Text("Text button")
    );
  }
}

class NBTextButton extends StatelessWidget {
  const NBTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {

        },
        child: const Text("Text button")
    );
  }
}

class NBOutlineButton extends StatelessWidget {
  const NBOutlineButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {

        },
        child: const Text("Outline button")
    );
  }
}

class NBIconButton extends StatelessWidget {
  const NBIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.volume_up),
        tooltip: "Increase",
        onPressed: () {

        },
    );
  }
}

class NBDropDown extends StatefulWidget {
  const NBDropDown({Key? key}) : super(key: key);

  @override
  State<NBDropDown> createState() => _NBDropDown();
}

class _NBDropDown extends State<NBDropDown> {
  String? language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("dfsds"),
      ),
      body: DropdownButton<String>(
          items: const <DropdownMenuItem<String>>[
            DropdownMenuItem<String>(
              value: "Kotlin",
              child: Text("Kotlin"),
            )
          ],
        value: language,
        hint: const Text("Select language"),
        onChanged: (String? value) {
            setState(() {
              language = value;
            });
        },
      ),
    );
  }
}