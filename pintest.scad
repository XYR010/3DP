$fn = 64;
cube([5,5,2]);
translate([2.5,2.5,0]){
	cylinder(4,1.5,1.5);
}

translate([7,0,0]){
	difference(){
		cube([5,5,2]);
		translate([2.5,2.5,0]){
			cylinder(4,1.9,1.9);
		}
	}
}
