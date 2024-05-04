// Instala:
// npm init -y
// npm install express
// npm install cors
// npm install request
// npm install bcrypt
// npm install body-parser
// npm install mysql
// npm install axios

// Importa el módulo 'express'
const express = require("express");

// Importa el módulo
const mysql = require("mysql");
// Importa el módulo
const bodyParser = require("body-parser");
// Importa el módulo, Instala npm install bcrypt
const bcrypt = require("bcrypt");

// Importa el paquete 'cors'
const cors = require("cors");

// Crea una instancia de la aplicación Express
const app = express();

// Habilita el middleware 'cors'
app.use(cors());

// Define el puerto en el que se ejecutará el servidor
const port = 2100;

app.use(cors());

app.use(bodyParser.json());

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "$Yrsa6662$",
  database: "turistear",
});

db.connect((err) => {
  if (err) {
    console.log("Error de conexión a MySQL: " + err);
    return;
  }
  console.log("Conexión a MySQL establecida");
});

// Middleware para habilitar el parseo de JSON en las solicitudes entrantes
app.use(express.json());

// Configura ruta raíz para mostrar mensaje de bienvenida
app.get("/", (req, res) => {
  res.send("Bienvenido a mi API REST con Flutter y Node.js");
});

// Endpoint para registrar un nuevo usuario organizador
app.post("/registerUser", async (req, res) => {
  const { firstname, lastname, email, password } = req.body;
  console.log(
    "Datos recibidos para registro:",
    firstname,
    lastname,
    email,
    password
  );

  // Hash the password
  const hashedPassword = await bcrypt.hash(password, 10);

  // Insert the user into the database
  db.query(
    "INSERT INTO users (firstname, lastname, email, password) VALUES (?, ?, ?, ?)",
    [firstname, lastname, email, hashedPassword],
    (err, result) => {
      if (err) {
        console.log(err);
        res.status(500).send("Error al registrar usuario");
      } else {
        console.log("Registro exitoso:", result); // Registrar operación exitosa
        console.log(
          "Datos enviados a la API:",
          firstname,
          lastname,
          email,
          hashedPassword
        );
        res.status(200).send("Usuario registrado correctamente");
      }
    }
  );
});

// Endpoint para autenticar un usuario Organizador
app.post("/loginUser", async (req, res) => {
  const { email, password } = req.body;
  console.log("Datos recibidos para inicio de sesión:", email, password);

  // Query the database for the user with the given email
  db.query(
    "SELECT * FROM users WHERE email = ?",
    [email],
    async (err, result) => {
      if (err) {
        console.log(err);
        res.status(500).send("Error al autenticar usuario");
      } else {
        if (result.length > 0) {
          const user = result[0];
          const match = await bcrypt.compare(password, user.password);

          if (match) {
            console.log("Autenticación exitosa:", user);
            // Enviar un objeto JSON con los datos del usuario
            res.status(200).json({
              id: user.id,
              email: user.email,
              firstname: user.firstname,
              lastname: user.lastname,
            });
          } else {
            res.status(401).send("Credenciales incorrectas");
          }
        } else {
          res.status(404).send("Usuario no encontrado");
        }
      }
    }
  );
});

// Endpoint mejorado para obtener un usuario registrado por su ID
app.get("/getUsers/:id", (req, res) => {
  const userId = req.params.id;

  // Lógica para obtener el usuario por su ID desde la base de datos
  db.query("SELECT * FROM users WHERE id = ?", [userId], (err, result) => {
    if (err) {
      console.log(err);
      res.status(500).send("Error al obtener el usuario registrado");
    } else {
      if (result.length > 0) {
        console.log("Usuario registrado obtenido:", result);
        res.status(200).json(result);
      } else {
        res.status(404).send("Usuario no encontrado");
      }
    }
  });
});

// Endpoint mejorado para obtener un museo registrado por su ID
app.get("/museum/:id", (req, res) => {
  const id = req.params.id; // Asegúrate de usar el nombre correcto para el parámetro
  console.log("El Id recibido desde la App es: ", id);
  db.query("SELECT * FROM museos WHERE id =?", [id], (err, result) => {
    if (err) {
      console.log(err);
      res.status(500).send("Error al obtener el museo");
    } else {
      if (result.length > 0) {
        console.log("Museo obtenido:", result[0]); // Asegúrate de acceder al primer elemento del resultado
        res.status(200).json(result[0]); // Envía el primer elemento del resultado
      } else {
        res.status(404).send("Museo no encontrado");
      }
    }
  });
});

// Endpoint mejorado para obtener un museo registrado por su ID
app.get("/park/:id", (req, res) => {
  const id = req.params.id; // Asegúrate de usar el nombre correcto para el parámetro
  console.log("El Id recibido desde la App es: ", id);
  db.query("SELECT * FROM parques WHERE id =?", [id], (err, result) => {
    if (err) {
      console.log(err);
      res.status(500).send("Error al obtener el museo");
    } else {
      if (result.length > 0) {
        console.log("Parque obtenido:", result[0]); // Asegúrate de acceder al primer elemento del resultado
        res.status(200).json(result[0]); // Envía el primer elemento del resultado
      } else {
        res.status(404).send("Parque no encontrado");
      }
    }
  });
});

app.listen(port, () => {
  console.log(`Servidor Node.js ejecutándose en http://localhost:${port}`);
});
