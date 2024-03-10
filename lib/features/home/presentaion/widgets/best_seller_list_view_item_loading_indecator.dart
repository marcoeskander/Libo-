import 'package:flutter/material.dart';

class BestSellerListViewItemLoadingIndecator extends StatelessWidget {
  const BestSellerListViewItemLoadingIndecator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.0,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.5 / 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                color: Colors.grey[50],
              ),
            ),
          ),
          const SizedBox(
            width: 30.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: Container(
                    height: 20,
                    color: Colors.grey[50],
                  ),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Container(
                  height: 20,
                  color: Colors.grey[50],
                ),
                Row(
                  children: [
                    Container(
                      width: 15,
                      height: 20,
                      color: Colors.grey[50],
                    ),
                    const Spacer(),
                    Container(
                      width: 15,
                      height: 20,
                      color: Colors.grey[50],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
