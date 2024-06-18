import 'package:flutter/material.dart';

import '../../../models/donar_model_data.dart';
import 'donar_detail_screen.dart';

class DonarCard extends StatelessWidget {
  final DonarData donarData;
  const DonarCard({super.key, required this.donarData});

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
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const DonarDetailScreen();
              },
            ),
          );
        },
        splashColor: Colors.red.shade100,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  '${donarData.image}',
                  // 'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?w=1380&t=st=1718523845~exp=1718524445~hmac=04fdacfddd221059842eada08e3e6330c3528bffb00f4a15d77a8556b1bb8045',
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Text>[
                    Text(
                      donarData.fullName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('${donarData.address}'),
                    Text('ID: ${donarData.id}'),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  Spacer(),
                  Text('Donation 1'),
                  Text('Age 26'),
                  Text('${donarData.gender}'),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Card(
                      margin: const EdgeInsets.all(0.0),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          '${donarData.bloodGroup}',
                          style: const TextStyle(
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
