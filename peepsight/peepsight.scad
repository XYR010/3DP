$fn =32;
module peep(
height			= 4,
outer_diameter	= 10,
inner_diameter	= 6,
string_width	= 1,
angle			= 60,
stem_diameter	= 3){
	difference(){
		scale([ 2, 1, 1]){
			union(){
				cylinder( height, outer_diameter/2 - string_width, outer_diameter/2 - string_width);
				cylinder( height /2 - string_width, outer_diameter/2, outer_diameter/2);
				translate([ 0, 0, height /2 - string_width]){
					cylinder( string_width/2, outer_diameter/2, inner_diameter/2);
				}
				translate([ 0, 0, height /2 + string_width/2]){
					cylinder( string_width/2, inner_diameter/2, outer_diameter/2);
				}
				translate([ 0, 0, height/2 + string_width]){
					cylinder(( height/2 - string_width) , outer_diameter/2, outer_diameter/2); 
				}
				translate([ 0, 0, height/2]){rotate([ 0, angle, 0]){ translate([ 0, 0, - 2*height]){
					cylinder( height*2, stem_diameter/2, stem_diameter/2);
				}}}
			}
		}
		union(){
			translate([ 0, 0, height/2]){rotate([ 0, angle, 0]){ translate([ 0, 0, - 2*height]){
				cylinder( height*5, inner_diameter/2, inner_diameter/2);
			}}}
		}
	}
}
peep();
