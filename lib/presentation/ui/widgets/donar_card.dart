import 'package:flutter/material.dart';

class DonarCard extends StatelessWidget {
  const DonarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xffff0000).withOpacity(0.06),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {},
        splashColor: Colors.red.shade100,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?w=1380&t=st=1718523845~exp=1718524445~hmac=04fdacfddd221059842eada08e3e6330c3528bffb00f4a15d77a8556b1bb8045',
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.white70,
                      height: 80,
                      width: 80,
                      child: const Icon(Icons.person_2_outlined),
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Text>[
                    Text(
                      'M Tintin',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Address'),
                    Text('ID: 123'),
                  ],
                ),
              ),
              const Spacer(),
              const Column(
                children: [
                  Spacer(),
                  Text('Donation 1'),
                  Text('Age 26'),
                  Text('Male'),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                    child: Card(
                      margin: EdgeInsets.all(0.0),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'AB+',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: IconButton.filledTonal(
                      onPressed: () {
                        print('-----');
                      },
                      icon: const Icon(Icons.person_add_alt),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
