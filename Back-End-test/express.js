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
    res.send('Hey team(Mr.Money, Mrs.Battle-Buddy, and Mr.Scrum-Gerneral the back end has been deployed')
})
// GET request for car photos where car_id = req param id 
app.get('/:id/photos', async (req, res)=>{
    const id = req.params.id
    try {
        const photos = await pool.query('SELECT * FROM photos WHERE car_id = $1', [id])
    
        res.json(photos)
    } catch(err) {
        res.status(404).send('Not Found')
    }

})
// GET request for car at parameter id 
app.get('/car/:id', async (req, res)=>{
    const id = req.params.id
    try {
        const car = await pool.query('SELECT * FROM cars WHERE car_id = $1', [id])
    
        res.json(car)
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
                    SELECT host.* 
                    FROM car 
                    JOIN host ON car.host_id = host.id 
                    WHERE car.id = req param id`, [id])
    
        res.json(host)
    } catch(err) {
        res.status(404).send('Not Found')
    }
})
// GET REQUEST FOR car_features where car_id = param_id
app.get('/features/:id', async (req, res)=>{
    const id = req.params.id
    try {
        const features = await pool.query('SELECT * FROM car_features WHERE car_id = $1', [id])

        res.json(features)
    } catch(err) {
        res.status(404).send('Not Found')
    }
        
})
// GET Request for car_extras where car_id = req param id
app.get('/extras/:id', async (req, res)=>{
    const id = req.params.id;
    try {
        const extras = await pool.query('SELECT * FROM car_extras WHERE car_id = $1', [id])

        res.json(extras)

    } catch{
        res.status(404).send('Not Found')
    }
            /* SELECT * FROM car_extras WHERE car_id = param id */ 
})
// GET Request for reviews where car id = parm_id
app.get('/reviews/:id', async (req, res)=>{
    const id = req.params.id;
    try {
        const reviews = await pool.query('SELECT * FROM reviews WHERE car_id = $1', [id])

        res.json(reviews)

    } catch{
        res.status(404).send('Not Found')
    }
        /* SELECT * FROM reviews WHERE car_id = param id */ 
})

app.listen(port, ()=>{
    // console.log("listening on port ", port)
    // console.log("connecting to postgres pool: ", pool)
})

