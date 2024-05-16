class MarketData {
  double? priceChange24h;
  double? priceChangePercentage24h;
  double? priceChangePercentage7d;
  double? priceChangePercentage14d;
  double? priceChangePercentage30d;
  double? priceChangePercentage60d;
  double? priceChangePercentage200d;
  double? priceChangePercentage1y;
  double? marketCapChange24h;
  double? marketCapChangePercentage24h;

  MarketData(
      {this.priceChange24h,
        this.priceChangePercentage24h,
        this.priceChangePercentage7d,
        this.priceChangePercentage14d,
        this.priceChangePercentage30d,
        this.priceChangePercentage60d,
        this.priceChangePercentage200d,
        this.priceChangePercentage1y,
        this.marketCapChange24h,
        this.marketCapChangePercentage24h});

  MarketData.fromJson(Map<String, dynamic> json) {
    priceChange24h = json['price_change_24h'];
    priceChangePercentage24h = json['price_change_percentage_24h'];
    priceChangePercentage7d = json['price_change_percentage_7d'];
    priceChangePercentage14d = json['price_change_percentage_14d'];
    priceChangePercentage30d = json['price_change_percentage_30d'];
    priceChangePercentage60d = json['price_change_percentage_60d'];
    priceChangePercentage200d = json['price_change_percentage_200d'];
    priceChangePercentage1y = json['price_change_percentage_1y'];
    marketCapChange24h = json['market_cap_change_24h'];
    marketCapChangePercentage24h = json['market_cap_change_percentage_24h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price_change_24h'] = this.priceChange24h;
    data['price_change_percentage_24h'] = this.priceChangePercentage24h;
    data['price_change_percentage_7d'] = this.priceChangePercentage7d;
    data['price_change_percentage_14d'] = this.priceChangePercentage14d;
    data['price_change_percentage_30d'] = this.priceChangePercentage30d;
    data['price_change_percentage_60d'] = this.priceChangePercentage60d;
    data['price_change_percentage_200d'] = this.priceChangePercentage200d;
    data['price_change_percentage_1y'] = this.priceChangePercentage1y;
    data['market_cap_change_24h'] = this.marketCapChange24h;
    data['market_cap_change_percentage_24h'] =
        this.marketCapChangePercentage24h;
    return data;
  }
}