const express = require("express")
const routes = require("./routes")

const app = express();

app.use(routes)

app.listen(8888, ()=>{
    console.log("Servidor rodando...")
})