$fn = 32;
D_length = 80;
D_depth = 12;
D_height = 5;
D_slot_height = 0.8;
D_slot_depth = 3.5;
D_slot_length = D_length - 20;
D_wrench_offset = 1.5;
D_wrench_height = 3.3;
D_wrench_depth = 1.3;
D_wrench_length = D_length - 15;
D_seam_height = D_height/2;
D_seam_pin_distance = 1.5;
D_seam_pin_diameter = 2;
D_lacehole_diameter = 5;
D_slider_endstop = 20;
D_slider_overhang = 1;
D_slider_length = 12;
D_slider_bridge_length = D_slider_length - 4;
D_slider_clip_length1 = 1;
D_slider_clip_length2 = 1;
D_slider_clip_depth1 = -2;
D_slider_clip_depth2 = -1;
D_knob_height = 2;
D_knob_depth = 6;
D_knob_length = 10;

module open_slide_pick(
length				= D_length,
depth				= D_depth,
height				= D_height,
slot_height			= D_slot_height,
slot_depth			= D_slot_depth,
slot_length			= D_slot_length,
slider_endstop		= D_slider_endstop,
slider_overhang 	= D_slider_overhang,
wrench_offset		= D_wrench_offset,
wrench_height		= D_wrench_height,
wrench_depth		= D_wrench_depth,
wrench_length		= D_wrench_length,
lacehole_diameter	= D_lacehole_diameter
){
	difference(){
		cube([ length, depth, height]);
		union(){
			translate([0,0,height - 1]){
				rotate([45,0,0]){
					cube([ length, height, height]);
				}
			}
			translate([0,0,1]){
				rotate([225,0,0]){
					cube([ length, height, height]);
				}
			}
			translate([0,depth,height - 1]){
				rotate([45,0,0]){
					cube([ length, height, height]);
				}
			}
			translate([0,depth,1]){
				rotate([225,0,0]){
					cube([ length, height, height]);
				}
			}
			translate([0, depth/2 - slot_depth/2, height/2 - slot_height]){
				cube([ slot_length, slot_depth, slot_height]);
			}
			translate([slider_endstop, depth/2 - ( slot_depth - slider_overhang)/2, height/2]){
				cube([slot_length - slider_endstop, slot_depth-slider_overhang, ( height + slot_height)/2]);
			}
			translate([ length - wrench_length, wrench_offset, ( height - wrench_height)/2]){
				cube([ wrench_length, wrench_depth, wrench_height]);
			}
			translate([ length - 1.5*lacehole_diameter, depth/2, 0]){
				cylinder( height, lacehole_diameter/2, lacehole_diameter/2);
			}
		}
	}
}

module seam(
seam_height = D_seam_height,
seam_pin_diameter = D_seam_pin_diameter,
seam_pin_distance = D_seam_pin_distance,
length = D_length,
depth = D_depth,
height = D_height,
slot_depth = D_slot_depth,
slot_height = D_slot_height){
	union(){
		cube([ length, depth, D_seam_height]);
		for( i = [ 22*seam_pin_distance: 4*seam_pin_distance: length - 2*seam_pin_distance]){
			translate([ i, depth - 1.5*seam_pin_distance, 0]){
				cylinder( height, seam_pin_diameter/2, seam_pin_diameter/2);
			}
		}
		translate([ length - 1.5*seam_pin_distance, depth/2, 0]){
			cylinder( height, seam_pin_diameter/2, seam_pin_diameter/2);
		}
		translate([ length - 8*seam_pin_distance, depth/2, 0]){
			cylinder( height, seam_pin_diameter/2, seam_pin_diameter/2);
		}
		translate([ length - 12*seam_pin_distance, depth/2, 0]){
			cylinder( height, seam_pin_diameter/2, seam_pin_diameter/2);
		}
		difference(){
			cube([8*seam_pin_distance, depth, height]);
			translate([0,depth/2,( height-slot_depth)/2]){
				rotate([45,0,0]){
					cube([8*seam_pin_distance,slot_depth/sqrt(2),slot_depth/sqrt(2)]);
				}
			}
		}
	}
}

module upper(){
	rotate([0,0,0]){
		difference(){
			open_slide_pick();
			seam(seam_pin_diameter = D_seam_pin_diameter + 0.8);
		}
	}
}

module lower(){
	intersection(){
		open_slide_pick();
		seam();
	}
}

module slider(
slider_height			= D_slot_height - 0.1,
slider_depth			= D_slot_depth - 0.6,
slider_length			= D_slider_length,
slider_bridge_length	= D_slider_bridge_length,
slider_bridge_depth		= D_slot_depth - D_slider_overhang - 0.6,
slider_clip_length1		= D_slider_clip_length1,
slider_clip_length2		= D_slider_clip_length2,
slider_clip_depth1		= D_slot_depth - 0.6 + D_slider_clip_depth1,
slider_clip_depth2		= D_slot_depth - 0.6 + D_slider_clip_depth2
){
	difference(){
		cube([ slider_length, slider_depth, slider_height]);
		union(){
			translate([( slider_length - slider_bridge_length + slider_clip_length1 + slider_clip_length2)/2 , (slider_depth - slider_bridge_depth)/2, 0]){
				cube([ slider_bridge_length, slider_bridge_depth, slider_height]);
			}
			translate([ 0, ( slider_depth - slider_clip_depth1)/2, 0]){
				cube([ slider_clip_length1, slider_clip_depth1, slider_height]);
			}
			translate([ slider_clip_length1, ( slider_depth - slider_clip_depth2)/2, 0]){
				cube([ slider_clip_length2, slider_clip_depth2, slider_height]);
			}
		}
	}
}

module knob(
knob_length				= D_knob_length,
knob_depth				= D_knob_depth,
knob_height				= D_knob_height,
slider_bridge_length	= D_slider_bridge_length - 0.6,
slider_bridge_depth		= D_slot_depth - D_slider_overhang - 0.8,
slider_bridge_height	= D_knob_height + D_height/2 + D_slot_height
){
	union(){
		cube([ knob_length, knob_depth, knob_height]);
		translate([( knob_length - slider_bridge_length)/2, ( knob_depth - slider_bridge_depth)/2, 0]){
			cube([ slider_bridge_length, slider_bridge_depth, slider_bridge_height]);
		}
	}
}

lower();
