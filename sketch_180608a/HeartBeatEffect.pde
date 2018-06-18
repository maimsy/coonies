float growth=120;                   // initial size of ellipse you can play with those
float increment=10;                 // larger increment faster pulsating-speed you can play with those


void HeartbeatEffect()
{
  fill(244,22,59); 
  
    
   ellipse(width/2, height/2, growth, growth);
    
     growth=growth+increment;
  if(growth>120) {increment=increment*-20;}  //max ellipse size you can play with those
  if(growth<60) {increment=+20;}            //min ellipse size you can play with those
  
}


 
