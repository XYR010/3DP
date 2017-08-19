$fn = 64;
diameter = 1;
length = 5;
width = 0.3;
height = 0.5;


module baseplug(){
    cylinder( length, diameter/2, diameter/2);
}

module gap(){
    translate([ -width/2, -1.5*diameter, -height]){
        cube([ width, 3*diameter, 2*height]);
    }
}

difference(){
    baseplug();
    gap();
}