const mysql = require("mysql");
const util = require("util");
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
  } catch (err) {
    console.error(err.message);
  } finally {
    connection.end();
  }
}

modifyTables();
