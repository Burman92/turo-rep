const { Pool } = require('pg');

const pool = new Pool({
    user: 'oxubpjhkxcbbwh' || 'postgres',
    host: 'ec2-3-208-74-199.compute-1.amazonaws.com'||'127.0.0.1',
    database: 'db2a924gf5p4sd' || 'Turo_webpage',
    password: 'e07dcf9f202d697e727fa8e907dbad13523c5c0386de42f3bbee94920f09fd70' || 'password',
    port: 5432,
    connectionString: process.env.DATABASE_URL, 
    ssl: {
        rejectUnauthorized: false
    }
});

pool.connect((err, client, release) => {
    if (err) {
      return console.error('Error acquiring client', err.stack)
    }
    console.log(process.env.DATABASE_URL)
    console.log('Connected to database')
  })

// imports express 
const express = require('express');
// creates an express application
const app = express();
app.use(express.json())
// sets up port to first look for an env file for port number, then defaults to port 8001
const port = process.env.PORT || 8001;
// imports cors for allowing cross origin requests
const cors = require('cors');
app.use(
    cors({
      origin:"*"
    })
  );
// imports and mounts body-parser middleware to access contents of request body
const bodyParser = require('body-parser');

app.use(bodyParser.json());

//making sure that the port is working we can commit the below out after
app.get("/", (req, res)=>{
    pool.query(`SELECT * FROM cars`, (error, data)=>{
        if(error){
            console.log(error)
            res.send(error)
        }
        
        res.send(data.rows);
    })
})
// GET request for car photos where car_id = req param id 
app.get('/:id/photos', async (req, res)=>{
    const id = req.params.id
    try {
        const photos = await pool.query('SELECT * FROM photos WHERE car_id = $1', [id])
    
        res.json(photos.rows)
    } catch(err) {
        res.status(404).send('Not Found')
    }
})

// GET request for car at parameter id 
app.get('/car/:id', async (req, res)=>{
    const id = req.params.id
    try {
        const car = await pool.query('SELECT * FROM cars WHERE id = $1', [id])
    
        res.json(car.rows)
    } catch(err) {
        res.status(404).send('Not Found')
    }
            /* SELECT * FROM cars WHERE car_id = param id */ 
     
})

// GET Request for host info for the owner of car
app.get('/host/:id', async (req, res)=>{
    const id = req.params.id
    try {
        const host = await pool.query(`
                    SELECT hosts.* 
                    FROM cars 
                    JOIN hosts ON cars.host_id = hosts.id 
                    WHERE cars.id = $1`, [id])
    
        res.json(host.rows)
    } catch(err) {
        res.status(404).send('Not Found')
    }
})
// GET REQUEST FOR car_features where car_id = param_id
app.get('/features/:id', async (req, res)=>{
    const id = req.params.id
    try {
        const features = await pool.query(`
        SELECT features.*, car_features.id AS car_feature_id
        FROM car_features
        JOIN features ON car_features.feature_id = features.id
        WHERE car_features.car_id = $1`, [id]);

        res.json(features.rows)
    } catch(err) {
        res.status(404).send('Not Found')
    }
        
})
// GET Request for car_extras where car_id = req param id
app.get('/extras/:id', async (req, res)=>{
    const id = req.params.id;
    try {
        const extras = await pool.query('SELECT * FROM extras WHERE car_id = $1', [id])

        res.json(extras.rows)

    } catch{
        res.status(404).send('Not Found')
    }
            /* SELECT * FROM car_extras WHERE car_id = param id */ 
})
// GET Request for reviews where car id = parm_id
app.get('/reviews/:id', async (req, res)=>{
    const id = req.params.id;
    try {
        const reviews = await pool.query(`
        SELECT reviews.*, users.user_name, users.user_profile_pic AS picture
        FROM reviews
        JOIN users ON reviews.user_id = users.id
        WHERE car_id = $1`, [id])

        res.json(reviews.rows)

    } catch{
        res.status(404).send('Not Found')
    }
        /* SELECT * FROM reviews WHERE car_id = param id */ 
})

app.listen(port, ()=>{
    console.log("listening on port ", port)
    // console.log("connecting to postgres pool: ", pool)
})
