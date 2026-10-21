class BrandConfig {
  const BrandConfig({
    required this.productName,
    required this.tagline,
  });

  final String productName;
  final String tagline;
}

const brandConfig = BrandConfig(
  productName: 'NIVA',
  tagline: 'Your day, looked after.',
);
