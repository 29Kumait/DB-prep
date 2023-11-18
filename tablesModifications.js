const mysql = require("mysql");
const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "Kumait.Mac",
  database: "db",
});

const query = util.promisify(connection.query).bind(connection);
const connect = util.promisify(connection.connect).bind(connection);

async function modifyTables() {
  try {
    await connect();
    console.log("Connected to the database!");

    const tables = [
      "Recipes",
      "Categories",
      "Ingredients",
      "Steps",
      "RecipeCategory",
      "RecipeIngredient",
      "RecipeStep",
    ];

    for (const table of tables) {
      await query(
        `ALTER TABLE ${table} MODIFY ${table}ID INT AUTO_INCREMENT PRIMARY KEY;`
      );
      console.log(`Table ${table} modified.`);
    }
  } catch (err) {
    console.error(err.message);
  } finally {
    connection.end();
  }
}

modifyTables();
