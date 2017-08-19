$fn = 40;
STEPSIZE = 0.04;
PI = 180;
SIZE = 0.5;

scale([SIZE*10,SIZE*10,SIZE*35]){
    translate([0,0,-0.3]){
        for( i = [0.3:STEPSIZE:1-STEPSIZE]){
            translate([0,0,i]){
                cylinder(STEPSIZE,sin(i*PI),sin((i+STEPSIZE)*PI));
            }
        }
    }
}
