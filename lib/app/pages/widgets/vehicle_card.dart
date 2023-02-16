import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vehicle_app/app/models/vehicle.dart';
import 'package:vehicle_app/app/utils/helpers.dart';
import 'package:vehicle_app/app/utils/text_style.dart';

class VehicleCard extends StatelessWidget {
  const VehicleCard({
    super.key,
    required this.vehcle,
  });
  final VehicleModel vehcle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 7.0,
      ),
      decoration: BoxDecoration(
        color: getCarColorCode(vehcle.yearService!, vehcle.consumption!),
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 20, 20, 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10.0),
              topRight: Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(
                0.1,
              ),
              blurRadius: 5.0,
              spreadRadius: 2.0,
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              vehcle.image!,
              fit: BoxFit.cover,
              width: 100.0,
              height: 100.0,
            ),
            const SizedBox(
              width: 25.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vehcle.modelName!,
                      style: nameTextStyle,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '\$${NumberFormat.decimalPattern().format(vehcle.price)}',
                      style: priceTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    buildConsumptionAndService(
                      icon: Icons.schedule,
                      data: '${vehcle.yearService} years',
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    buildConsumptionAndService(
                        icon: Icons.speed, data: '${vehcle.consumption}Km/l')
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildConsumptionAndService({
    required IconData icon,
    required String data,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(
            0xffe06d14,
          ),
          size: 20.0,
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          data,
          style: yearConsumptionTextStyle,
        )
      ],
    );
  }
}
