// 小肥羊点餐系统API子系统
const port=8090;
const express=require('express');
var app=express();
app.listen(port,()=>{
  console.log("服务器开始监听8090");
})
app.use(express.static("public"));