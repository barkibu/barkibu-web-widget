import 'package:common_barkibu_dart/models/breed.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_breeds.g.dart';

@JsonSerializable()
class SearchBreedResponse {
  final String key;
  final String breedUuid;
  final String name;
  final String size;

  SearchBreedResponse(this.key, this.breedUuid, this.name, this.size);

  factory SearchBreedResponse.fromJson(Map<String, dynamic> json) => _$SearchBreedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchBreedResponseToJson(this);

  Breed toBreed() => Breed(
        key: key,
        name: name,
        breedUuid: breedUuid,
        size: size,
      );
}

class SearchBreedsResponse {
  static List<SearchBreedResponse> fromJson(List<dynamic> json) =>
      json?.map((dynamic breed) => SearchBreedResponse.fromJson(breed))?.toList() ?? [];
}
