include <bezledcube.scad>
module railstop(
length = 10.5,
depth = 6.5,
height = 5,
bezle = 1){
	difference(){
		b_cube(length + 2* bezle, depth + 2* bezle, height + bezle, depth/2 + bezle);
		translate([ bezle, bezle, bezle]){
			b_cube(length,depth,height,depth/2);
		}
	}
}

railstop();
