import 'package:first_flutter_app/database/entity/artist.dart';
import 'package:floor/floor.dart';

@dao
abstract class ArtistDao {
  @Query('SELECT * FROM Artist')
  Future<List<Artist>> findAllArtist();

  @Query('SELECT * FROM Artist WHERE id = :id')
  Future<Artist> findArtistById(int id);

  @insert
  Future<void> insertArtist(List<Artist> artist);

//  @Query('DELETE FROM Artist')
//  Future<void> deleteAllArtists();
}