$fn = 32;
module drain(
diameterx = 39,
diametery = 22,
thickness = 2,
drop_height = 2,
outline_width = 3,
hole_distance = 36/12,
hole_diameter = 2.6
){
	difference(){
		union(){
			translate([ diameterx/2, diametery/2, 0]){
				scale([( 2*outline_width + diameterx)/( 2* outline_width +  diametery), 1, 1]){
					cylinder( thickness/2 , diametery/2  + outline_width, diametery/2 + outline_width);
				}
			}
			translate([ diameterx/2, diametery/2, thickness/2]){
				scale([ diameterx/diametery, 1, 1]){
					cylinder( drop_height , diametery/2, diametery/2);
				}
			}
		}
		union(){
			translate([ diameterx/2, diametery/2, thickness/2]){
				scale([ diameterx/diametery, 1, 1]){
					cylinder( drop_height , ( diametery - thickness)/2, ( diametery - thickness)/2);
				}
			}
			intersection(){
				translate([ diameterx/2, diametery/2, 0]){
					scale([ diameterx/diametery, 1, 1]){
						cylinder( thickness/2 , ( diametery - thickness)/2, ( diametery - thickness)/2);
					}
				}
				for(x = [0:hole_distance:diameterx]){
					for(y = [1:hole_distance:diametery]){
						translate([x-1.3,y-1.8,0]){
							cube([hole_diameter, hole_diameter, thickness/2]);
						}
					}
				}
			}
		} 
	}
}

drain();
