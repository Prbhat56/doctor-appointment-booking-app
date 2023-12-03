const mongoose =require('mongoose');
mongoose.connect(process.env.MONGO_LINK).then(console.log('database connected'));

const schema = new mongoose.Schema({
    imageUrl: {type: String, required: true},
    name:{type:String,required:true},
    speciality:{type:String,required:true},
    rating:{type:String,required:true},
    totalcheckup:{type:String,required:true},
    experience:{type:String,required:true},
    description:{type:String,required:true}

})

const Doctor = mongoose.model('doctor',schema);
module.exports=Doctor;