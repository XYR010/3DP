$fn = 32;
module b_cube(
length = 5,
depth = 5,
height = 5,
b_radius = 1){
	union(){
		translate([ 0, b_radius, 0]){
			cube([ length, depth - 2* b_radius, height]);
		}
		translate([ b_radius, 0, 0]){
			cube([ length - 2* b_radius, depth, height]);
		}
		translate([ b_radius, b_radius, 0]){
			cylinder( height, b_radius, b_radius);
		}
		translate([ length - b_radius, b_radius, 0]){
			cylinder( height, b_radius, b_radius);
		}
		translate([ b_radius, depth - b_radius, 0]){
			cylinder( height, b_radius, b_radius);
		}
		translate([ length - b_radius, depth - b_radius, 0]){
			cylinder( height, b_radius, b_radius);
		}
	}
}
