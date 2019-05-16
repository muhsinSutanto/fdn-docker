const express = require('express')
const redis = require('redis')

const redisClient = redis.createClient({
    host: "redis-server",
    port: 6379
})

const app = express()

redisClient.set("visits", 0)

app.get("/", (req, res) => {
    redisClient.get("visits", (err, visitCount) => {
        if (err) {
            console.log("Error: ", err)
        }

        res.status(200).send("Number of visits: " + visitCount)
        redisClient.set("visits", parseInt(visitCount) + 1)
    })
})

app.listen(4000, () => {
    console.log("running on port :4000")
})