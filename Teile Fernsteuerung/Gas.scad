$fn = 64;
height = 0.2;
depth = 0.7;

difference(){
    union(){
        translate([0.225,0,0]){
            cylinder(height,0.225,0.225);
        }
        cube([2.56,depth,height]);
    }
    union(){
        translate([0.225,0,-1]){
            cylinder(2,0.213/2,0.213/2);
        }
        translate([1.42,0,-1]){
            cylinder(2,0.28,0.28);
        }
        translate([2.286,0.405,-1]){
            cube([0.137,2,2]);
        }
        translate([2.03,-1,-1]){
            cube([2,1.196,2]);
        }
        translate([0,0.15,-1]){
            rotate([0,0,30]){
                cube([2,2,2]);
            }
        }
    }
}