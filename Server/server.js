require('dotenv').config();
const express =require('express');
const app =express();
const bp =require('body-parser');
const port =process.env.PORT || 5000;
const Doctor =require('./database')
const cors =require('cors');
app.use(bp.urlencoded({extended:true}));
app.use(bp.json());
app.use(cors());

app.post("/insertdoctordata",async(req,res)=>
{
    let newdoctor = new Doctor({
        imageUrl :req.body.imageUrl,
        name : req.body.name,
        speciality:req.body.speciality,
        rating:req.body.rating,
        totalcheckup:req.body.totalcheckup,
        experience:req.body.experience,
        description:req.body.description
    })
    let responce = await newdoctor.save();
    if(responce)
    {
        return res.status(200).json({message:'data recorded successfully'});
    }
    return res.status(300).json({message:'data not recorded'})
})

app.get("/doctorlist",async(req,res)=>
{
    let data = await Doctor.find({});
    console.log("data from database"+JSON.stringify(data));
    return res.status(200).json(data);
})
app.listen(port,()=>{console.log('listening on port',port);})