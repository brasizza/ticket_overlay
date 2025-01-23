import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPOSPlaceholder extends StatelessWidget {
  const ShimmerPOSPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade300,
            child: ListView(
              children: [
                _buildReceiptHeader(),
                const SizedBox(height: 16),
                ...List.generate(6, (index) => _buildReceiptItem()),
                const SizedBox(height: 16),
                _buildReceiptFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReceiptHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 120,
          height: 20,
          color: Colors.grey.shade300,
        ),
        const SizedBox(height: 8),
        Container(
          width: 200,
          height: 15,
          color: Colors.grey.shade300,
        ),
        const SizedBox(height: 8),
        Container(
          width: 100,
          height: 15,
          color: Colors.grey.shade300,
        ),
      ],
    );
  }

  Widget _buildReceiptItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 150,
            height: 15,
            color: Colors.grey.shade300,
          ),
          Container(
            width: 50,
            height: 15,
            color: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }

  Widget _buildReceiptFooter() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 80,
          height: 15,
          color: Colors.grey.shade300,
        ),
        const SizedBox(height: 8),
        Container(
          width: 100,
          height: 20,
          color: Colors.grey.shade300,
        ),
      ],
    );
  }
}
