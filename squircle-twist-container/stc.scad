linear_extrude( height = 10, center = false, convexity = 10, twist = 72, slices = 100, scale = 1){
	difference(){
		scale([10,10,1]){
			circle(1);
		}
		fillet(5,5);
	}
}

module fillet( r, h){
	translate([ r/2, r/2, 0])

		difference(){
			cube([ r + 0.01, r + 0.01, h], center = true);

			translate([ r/2, r/2, 0])
				cylinder( r = r, h = h, center = true);
		}
}
