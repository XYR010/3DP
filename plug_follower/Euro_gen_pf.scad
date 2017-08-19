$fn = 64;
diameter = 12.55;
length = 6.5;
amount = 1;


module baseplug(){
    cylinder( length, diameter/2, diameter/2);
}

for( i = [ 0: amount-1]){
    translate([i*diameter, i*diameter, 0]){
        baseplug();
    }
}