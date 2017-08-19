$fn = 64;
boom_diameter = 7.1;
boom_length = 12;
boom_wall_thickness = 2.5;
motor_diameter = 6.4;
motor_position = -6;
motor_extra_material = 2;
outside_length = 22.3;
hole_position = 6.5;
hole_diameter = 1.5;
number_channels = 2;
channel_offset = 3;
channel_length = 8;
channel_depth = 4.5;
channel_height = 5;
rest_length = 2.5;
rest_depth = 1.2;
rest_overhang = 0.5;
cone_diameter = motor_diameter +1;
cone_height = 2;

difference(){
	union(){
		translate([ 0, boom_diameter/2, boom_diameter/2]){rotate([0,90,0]){
			cylinder(boom_length, boom_diameter/2, boom_diameter/2);
		}}
		translate([ boom_length, 0, 0]){
			cube([ outside_length + motor_position, boom_diameter, boom_diameter]);
		}
		translate([ boom_length - rest_length, ( boom_diameter - rest_depth)/2, 0]){
			cube([ rest_length, rest_depth, boom_diameter+rest_overhang]);
		}
		translate([ boom_length + outside_length + motor_position, boom_diameter/2, 0]){
			cylinder( boom_diameter, motor_diameter/2 + motor_extra_material, motor_diameter/2 + motor_extra_material);
		}
	}
	union(){
		translate([ hole_position, boom_diameter/2, 0]){
			cylinder( boom_diameter, hole_diameter/2, hole_diameter/2);
		}
		translate([ boom_length + outside_length + motor_position, boom_diameter/2, 0]){
			cylinder( boom_diameter, motor_diameter/2, motor_diameter/2);
		}
		translate([ 0, boom_diameter/2, boom_diameter/2]){rotate([0,90,0]){
			cylinder( boom_length + channel_offset, ( boom_diameter - boom_wall_thickness)/2, ( boom_diameter - boom_wall_thickness)/2);
		}}
		translate([ boom_length + channel_offset, ( boom_diameter - channel_depth)/2, boom_diameter - channel_height]){
			cube([ channel_length, channel_depth, channel_height]);
		}
        translate([0,-5,0]){
            cube([50,50,0.5]);
        }
		translate([ boom_length + outside_length + motor_position, boom_diameter/2, boom_diameter - cone_height]){
			cylinder( cone_height, motor_diameter/2, cone_diameter/2);
		}
	}
}
