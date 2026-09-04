import 'package:flutter/material.dart';

const pink = Color(0xFFE91E73);
const softPink = Color(0xFFFCE4EC);
const textDark = Color(0xFF1F2430);
const muted = Color(0xFF7A7E87);

class ProductDetailsPage extends StatefulWidget {
  final VoidCallback? onProfile;

  const ProductDetailsPage({
    super.key,
    this.onProfile,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 1;
  bool favorite = false;

  final sizes = ['S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F8),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _topBar(context),

                    const SizedBox(height: 8),

                    _mainProductImage(),

                    const SizedBox(height: 12),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: Text(
                            'Vestido Floral Primavera',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF676B74),
                            ),
                          ),
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              size: 15,
                              color: pink,
                            ),
                            SizedBox(width: 3),
                            Text(
                              '4.8',
                              style: TextStyle(
                                fontSize: 11,
                                color: pink,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 3),

                    const Text(
                      '\$89.00',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: pink,
                      ),
                    ),

                    const SizedBox(height: 15),

                    _sizeSelector(),

                    const SizedBox(height: 18),

                    _description(),

                    const SizedBox(height: 16),

                    _actionRow(),

                    const SizedBox(height: 22),
                  ],
                ),
              ),
            ),

            _bottomNav(),
          ],
        ),
      ),
    );
  }

  Widget _topBar(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () => Navigator.maybePop(context),
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 22,
            ),
          ),

          const Expanded(
            child: Center(
              child: Text(
                'Product Details',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: textDark,
                ),
              ),
            ),
          ),

          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {},
            icon: const Icon(
              Icons.share_outlined,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _mainProductImage() {
    return Container(
      height: 285,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            blurRadius: 7,
            offset: Offset(0, 2),
            color: Color(0x12000000),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        'assets/img/dress_main.png.png',
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => const Center(
          child: Icon(
            Icons.image_outlined,
            size: 55,
            color: Colors.black26,
          ),
        ),
      ),
    );
  }

  Widget _sizeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Select Size',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: textDark,
              ),
            ),

            const Spacer(),

            const Text(
              'Size Guide',
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w600,
                color: pink,
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        Row(
          children: List.generate(
            sizes.length,
            (index) => Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: index == 3 ? 0 : 8,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedSize = index;
                    });
                  },
                  borderRadius: BorderRadius.circular(6),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    height: 38,
                    decoration: BoxDecoration(
                      color: selectedSize == index
                          ? const Color(0xFFFFF0F6)
                          : const Color(0xFFF9F9FA),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: selectedSize == index
                            ? pink
                            : const Color(0xFFE1E2E6),
                        width: selectedSize == index ? 1.4 : 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        sizes[index],
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color:
                              selectedSize == index ? pink : textDark,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _description() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: textDark,
          ),
        ),

        SizedBox(height: 9),

        Text(
          'Experience the beauty of spring with our signature Vestido Floral. '
          'This lightweight, breathable dress features a vibrant pink blossom '
          'pattern on high-quality silk-blend fabric. Perfect for garden parties, '
          'weddings, or a sunny afternoon out.',
          style: TextStyle(
            fontSize: 9.5,
            height: 1.45,
            color: muted,
          ),
        ),

        SizedBox(height: 9),

        Row(
          children: [
            Icon(
              Icons.check_circle_outline,
              color: pink,
              size: 13,
            ),
            SizedBox(width: 6),
            Text(
              '100% Sustainable Cotton Blend',
              style: TextStyle(
                fontSize: 9,
                color: muted,
              ),
            ),
          ],
        ),

        SizedBox(height: 6),

        Row(
          children: [
            Icon(
              Icons.check_circle_outline,
              color: pink,
              size: 13,
            ),
            SizedBox(width: 6),
            Text(
              'Adjustable waist tie for perfect fit',
              style: TextStyle(
                fontSize: 9,
                color: muted,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _actionRow() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              favorite = !favorite;
            });
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: pink,
                width: 1.2,
              ),
            ),
            child: Icon(
              favorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: pink,
              size: 20,
            ),
          ),
        ),

        const SizedBox(width: 9),

        Expanded(
          child: SizedBox(
            height: 43,
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: pink,
                foregroundColor: Colors.white,
                elevation: 3,
                shadowColor: const Color(0x40E91E73),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(
                Icons.shopping_bag_outlined,
                size: 16,
              ),
              label: const Text(
                'Add to Cart',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _bottomNav() {
    return Container(
      height: 57,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xFFEDEDEF),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(
            Icons.storefront_outlined,
            'Shop',
            true,
          ),

          _navItem(
            Icons.search_rounded,
            'Search',
            false,
          ),

          _navItem(
            Icons.shopping_bag_outlined,
            'Bag',
            false,
          ),

          GestureDetector(
            onTap: widget.onProfile,
            child: _navItem(
              Icons.person_outline_rounded,
              'Profile',
              false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(
    IconData icon,
    String label,
    bool active,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 18,
          color: active
              ? pink
              : const Color(0xFF9A9DA5),
        ),

        const SizedBox(height: 3),

        Text(
          label,
          style: TextStyle(
            fontSize: 8,
            color: active
                ? pink
                : const Color(0xFF9A9DA5),
            fontWeight:
                active ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}