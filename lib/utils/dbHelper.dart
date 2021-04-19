import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:recipebook/models/recipe.dart';

class DatabaseHelper {
  static Database _database;

  String _recipeTable = "recipe";
  String _columnID = "recipeId";
  String _columnTitle = "recipeTitle";
  String _columnMaterials = "recipeMaterials";
  String _columnDescription = "recipeDescription";

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    String dbPath = join(await getDatabasesPath(), "Recipe.db");
    var recipeDb = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return recipeDb;
  }

  void createDb(Database db, int version) async {
    await db.execute(
        "Create table $_recipeTable($_columnID integer primary key, $_columnTitle text, $_columnMaterials text, $_columnDescription text)");
  }

  // Crud Methods

// Uygulama açıldığında tüm notları alıp getirmemize yardımcı olan methodumuz.
// Burada bir db değişkeni oluşturarak var olan database'imizi çağırarak değişkene atıyoruz.
// Ardından db üzerinden bir sql sorgusu ile tüm tabloyu çağırıyor
// ve listeye dönüştürmek için fromMap methodumuzu kullanıyoruz.
  Future<List<Recipe>> getAllRecipes() async {
    Database db = await this.database;
    var result = await db.query("$_recipeTable", orderBy: "$_columnID DESC");
    return List.generate(result.length, (i) {
      return Recipe.fromMap(result[i]);
    });
  }

  Future<int> insert(Recipe recipe) async {
    //Bir db değişkeni oluşturarak var olan database'imizi çağırarak değişkene atıyoruz.
    Database db = await this.database;
    //daha sonrasında db üzerinden insert methodunu kullanarak ekleme işlemini yapıyoruz.
    //insert methodu bizden gelen verinin ekleneceği tabloyu, eklenecek veriyi(burda map'e çeviriyoruz)
    var result = await db.insert("$_recipeTable", recipe.toMap());
    return result;
  }

  //Not güncelleme işleminde de ilk olarak not ekleme işlemindeki gibi database'i alıyoruz.
  Future<int> update(Recipe recipe) async {
    Database db = await this.database;
    //Daha sonra update metoduyla gelen notu güncelleme işlemine gönderiyoruz burada where ve whereArgs
    //parametreleri isteniyoruz bizden. Where için columnId değerini, whereArgs için ise gelen note objesinin
    //id değerini gönderiyoruz.
    var result = await db.update("$_recipeTable", recipe.toMap(),
        where: "recipeId=?", whereArgs: [recipe.recipeId]);
    return result;
  }

  //Not silme işleminde de ilk olarak not ekleme ve güncelleme işlemindeki gibi database'i alıyoruz.
  //Not silme işlemimiz de ise parametre olarak sadece id göndermemiz işimizi görecektir.
  Future<int> delete(int recipeId) async {
    //Not silme işleminde de ilk olarak not ekleme işlemindeki gibi database'i alıyoruz.
    Database db = await this.database;
    //Daha sonra database'den ilgili id'deki değerleri delete etmesini istiyoruz.
    var result = await db
        .rawDelete("delete from $_recipeTable where recipeId=$recipeId");
    return result;
  }
}
