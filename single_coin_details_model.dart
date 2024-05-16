import 'description_model.dart';
import 'image_model.dart';
import 'market_details_model.dart';

class SingleCoinModel {
  String? id;
  String? symbol;
  String? name;
  bool? previewListing;
  String? assetPlatformId;
  Description? description;
  Images? image;
  String? contractAddress;
  MarketData? marketData;
  String? lastUpdated;

  SingleCoinModel(
      {this.id,
        this.symbol,
        this.name,
        this.previewListing,
        this.assetPlatformId,
        this.description,
        this.image,
        this.contractAddress,
        this.marketData,
        this.lastUpdated});

  SingleCoinModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    previewListing = json['preview_listing'];
    assetPlatformId = json['asset_platform_id'];
    description = json['description'] != null
        ? new Description.fromJson(json['description'])
        : null;
    image = json['image'] != null ? new Images.fromJson(json['image']) : null;
    contractAddress = json['contract_address'];
    marketData = json['market_data'] != null
        ? new MarketData.fromJson(json['market_data'])
        : null;
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['preview_listing'] = this.previewListing;
    data['asset_platform_id'] = this.assetPlatformId;
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['contract_address'] = this.contractAddress;
    if (this.marketData != null) {
      data['market_data'] = this.marketData!.toJson();
    }
    data['last_updated'] = this.lastUpdated;
    return data;
  }
}