$fn = 64;
height = 2;

difference(){
    union(){
        translate([2.25,-2,0]){
            cylinder(height,2.25,2.25);
        }
        cube([25,7,height]);
     
        translate([4.2,-3,0]){
            rotate([0,0,40]){
                cube([7,3,height]);
            }
        }
        translate([4.2,-2,0]){
            rotate([0,0,20]){
                cube([7,3,height]);
            }
        }
        
    }
    union(){
        translate([2.25,-2,0]){
            cylinder(height,2.25/2,2.25/2);
        }
        translate([14.4,1,0]){
            cylinder(height,4.5/2,4.5/2);
        }
        translate([22,3.7,0]){
            cube([1.7,20,height]);
        }
        translate([20,-10,0]){
            cube([20,11.96,height]);
        }
        translate([20,6,0]){
            cube([20,2,height]);
        }
        translate([15.95,-4,0]){
            rotate([0,0,15]){
                cube([2,5,height]);
            }
        }
        translate([0,-0.75,0]){
            rotate([0,0,33]){
                cube([20,20,height]);
            }
        }
    }
}
