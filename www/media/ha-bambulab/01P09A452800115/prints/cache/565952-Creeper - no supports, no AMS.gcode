; HEADER_BLOCK_START
; BambuStudio 02.07.01.59
; model printing time: 3m 2s; total estimated time: 9m 18s
; total layer number: 10
; total filament length [mm] : 395.09
; total filament volume [cm^3] : 950.30
; total filament weight [g] : 1.17
; filament_density: 1.23,1.23
; filament_diameter: 1.75,1.75
; max_z_height: 2.00
; filament: 2
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,0
; additional_cooling_fan_speed = 70,70
; additional_fan_full_speed_layer = 0,0
; alternate_extra_wall = 0
; apply_scarf_seam_on_circles = 1
; auxiliary_fan = 1
; avoid_crossing_wall_includes_support = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_density = 100%
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0,0
; change_filament_gcode = ;=P1S 20251031=\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{else}\nM620.11 S0\n{endif}\nM400\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\n\n{if next_extruder < 255}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\nG92 E0\n{if flush_length_1 > 1}\nM83\n; FLUSH_START\n; always use highest temperature to flush\nM400\n{if filament_type[next_extruder] == \"PETG\"}\nM109 S260\n{elsif filament_type[next_extruder] == \"PVA\"}\nM109 S210\n{else}\nM109 S{flush_temperatures[next_extruder]}\n{endif}\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X105 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\n\nG1 X70 F10000\nG1 X80 F15000\nG1 X60\nG1 X80\nG1 X60\nG1 X80 ; shake to put down garbage\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200,200
; close_additional_fan_first_x_layers = 1,1
; close_fan_the_first_x_layers = 1,1
; compatible_printers_condition = 
; complete_print_exhaust_fan_speed = 70,70
; cool_plate_temp = 35,35
; cool_plate_temp_initial_layer = 35,35
; cooling_filter_enabled = 0
; cooling_perimeter_transition_distance = 10,10
; cooling_slowdown_logic = uniform_cooling,uniform_cooling
; counter_coef_1 = 0,0
; counter_coef_2 = 0.008,0.008
; counter_coef_3 = -0.041,-0.041
; counter_limit_max = 0.033,0.033
; counter_limit_min = -0.035,-0.035
; curr_bed_type = Textured PEI Plate
; default_acceleration = 6000
; default_filament_colour = ;
; default_filament_profile = "Bambu PLA Basic @BBL P1S 0.4 nozzle"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL X1C
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50,50
; different_settings_to_system = sparse_infill_pattern;compatible_printers;enable_prime_tower;;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70,70
; elefant_foot_compensation = 0.075
; embedding_wall_into_infill = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_filament_dynamic_map = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_mixed_color_sublayer = 0
; enable_order_independent_overlap_carving = 0
; enable_overhang_bridge_fan = 1,1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0,0
; enable_prime_tower = 0
; enable_support = 0
; enable_support_ironing = 0
; enable_tower_interface_features = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 0,0
; eng_plate_temp_initial_layer = 0,0
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;1#0|4#0
; extruder_clearance_dist_to_rod = 33
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 34
; extruder_clearance_max_radius = 68
; extruder_colour = #018001
; extruder_max_nozzle_count = 1
; extruder_nozzle_stats = 
; extruder_offset = 0x2
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard,Direct Drive High Flow"
; fan_cooling_layer_time = 100,100
; fan_direction = left
; fan_max_speed = 100,100
; fan_min_speed = 100,100
; filament_adaptive_volumetric_speed = 0,0
; filament_adhesiveness_category = 100,100
; filament_bridge_speed = 25,25
; filament_change_length = 10,10
; filament_change_length_nc = 10
; filament_colour = #00AE42;#161616FF
; filament_cooling_before_tower = 0,0
; filament_cost = 18.99,18.99
; filament_density = 1.23,1.23
; filament_dev_ams_drying_ams_limitations = 1;1
; filament_dev_ams_drying_heat_distortion_temperature = 45,45
; filament_dev_ams_drying_temperature = 45,45
; filament_dev_ams_drying_time = 12,12
; filament_dev_chamber_drying_bed_temperature = 70,70
; filament_dev_chamber_drying_time = 12,12
; filament_dev_drying_cooling_temperature = 45,45
; filament_dev_drying_softening_temperature = 50,50
; filament_diameter = 1.75,1.75
; filament_enable_overhang_speed = 1,1
; filament_end_gcode = "; filament end gcode \n\n";"; filament end gcode \n\n"
; filament_extruder_compatibility = 0,0
; filament_extruder_variant = "Direct Drive Standard";"Direct Drive Standard"
; filament_flow_ratio = 1,1
; filament_flush_temp = 0,0
; filament_flush_temp_fast = 0,0
; filament_flush_volumetric_speed = 0,0
; filament_ids = GFSNL03;GFSNL03
; filament_is_mixed = 0
; filament_is_support = 0,0
; filament_long_retractions_when_cut = 1,1
; filament_map = 1,1
; filament_map_2 = 0,0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 12,12
; filament_metal_stickiness = None,None
; filament_minimal_purge_on_wipe_tower = 15,15
; filament_mixed_components = ""
; filament_mixed_gradient = 0
; filament_mixed_gradient_curve = ""
; filament_mixed_gradient_per_part = 0
; filament_mixed_gradient_range = ""
; filament_mixed_sublayer_ratios = ""
; filament_notes = 
; filament_nozzle_map = 0,0
; filament_overhang_1_4_speed = 0,0
; filament_overhang_2_4_speed = 50,50
; filament_overhang_3_4_speed = 30,30
; filament_overhang_4_4_speed = 10,10
; filament_overhang_totally_speed = 10,10
; filament_pre_cooling_temperature = 0,0
; filament_pre_cooling_temperature_nc = 0,0
; filament_preheat_temperature_delta = 10,10
; filament_prime_volume = 45,45
; filament_prime_volume_nc = 60,60
; filament_printable = 3,3
; filament_ramming_travel_time = 0,0
; filament_ramming_travel_time_nc = 0,0
; filament_ramming_volumetric_speed = -1,-1
; filament_ramming_volumetric_speed_nc = -1,-1
; filament_retract_length_nc = 14,14
; filament_retraction_distances_when_cut = 18,18
; filament_scarf_gap = 0%,0%
; filament_scarf_height = 5%,5%
; filament_scarf_length = 10,10
; filament_scarf_seam_type = none,none
; filament_self_index = 1,2
; filament_settings_id = "SUNLU PLA+ @BBL X1C";"SUNLU PLA+ @BBL X1C"
; filament_shrink = 100%,100%
; filament_soluble = 0,0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\nM142 P1 R35 S40\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\nM142 P1 R35 S40\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_tower_interface_pre_extrusion_dist = 10,10
; filament_tower_interface_pre_extrusion_length = 0,0
; filament_tower_interface_print_temp = -1,-1
; filament_tower_interface_purge_volume = 20,20
; filament_tower_ironing_area = 4,4
; filament_type = PLA;PLA
; filament_velocity_adaptation_factor = 1,1
; filament_vendor = SUNLU;SUNLU
; filament_volume_map = 0,0
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; fill_multiline = 1
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0
; first_x_layer_part_fan_speed = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_multiplier_fast = 1.2
; flush_volumes_matrix = 0,145,433,0
; flush_volumes_vector = 140,140,140,140
; full_fan_speed_layer = 0,0
; fuzzy_skin = none
; fuzzy_skin_first_layer = 0
; fuzzy_skin_mode = displacement
; fuzzy_skin_noise_type = classic
; fuzzy_skin_octaves = 4
; fuzzy_skin_persistence = 0.5
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_scale = 1
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 0
; group_algo_with_time = 0
; has_filament_switcher = 0
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 
; hole_coef_1 = 0,0
; hole_coef_2 = -0.008,-0.008
; hole_coef_3 = 0.23415,0.23415
; hole_limit_max = 0.22,0.22
; hole_limit_min = 0.088,0.088
; host_type = octoprint
; hot_plate_temp = 55,55
; hot_plate_temp_initial_layer = 55,55
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 10,10
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_instead_top_bottom_surfaces = 0
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; inherits_group = ;;;
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250
; ironing_direction = 45
; ironing_fan_speed = -1
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0,0
; machine_bed_mass_Y = 0
; machine_end_gcode = ;===== date: 20230428 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos \nG1 Y265 F3000\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S3 ;wait for last picture to be taken\nM623; end of \"timelapse_record_flag\"\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\n
; machine_hotend_change_time = 0
; machine_load_filament_time = 29
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 500,500
; machine_max_force_Y = 0
; machine_max_jerk_e = 2.5,2.5
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_printed_mass = 0
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,500
; machine_max_speed_y = 500,500
; machine_max_speed_z = 20,20
; machine_min_extruding_rate = 0
; machine_min_travel_rate = 0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: P1S-0.4 ========================\n;===== date: 20251031 =====================\n;===== turn on the HB fan & MC board fan =================\nM104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle\nM710 A1 S255 ;turn on MC fan by default(P1S)\n;===== reset machine status =================\nM290 X40 Y40 Z2.6666666\nG91\nM17 Z0.4 ; lower the z-motor current\nG380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed\nG380 S2 Z-25 F300 ;\nG1 Z5 F300;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\nG29.1 Z{+0.0} ; clear z-trim value first\nM204 S10000 ; init ACC set to 10m/s^2\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action:54\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]==\"PLA\"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on\nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_extruder]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_extruder]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_extruder]A\nM620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T{flush_temperatures[initial_no_support_extruder]}\n\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S250 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X230 Y15\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]==\"PLA\"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY\n;===== fmech mode fast check============================\n\n\n;===== nozzle load line ===============================\nM975 S1\nG90\nM83\nT1000\nG1 X18.0 Y1.0 Z0.8 F18000;Move to start position\nM109 S{nozzle_temperature_initial_layer[initial_extruder]}\nG1 Z0.2\nG0 E2 F300\nG0 X240 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 Y11 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E0.2\nG0 Y1.5 E0.700\nG0 X18 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type==\"Textured PEI Plate\"}\nG29.1 Z{-0.04} ; for Textured PEI Plate\n{endif}\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 28
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; monotonic_travel_into_wall = 0%
; no_slow_down_for_cooling_on_outwalls = 0,0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.2
; nozzle_temperature = 220,220
; nozzle_temperature_initial_layer = 220,220
; nozzle_temperature_range_high = 240,240
; nozzle_temperature_range_low = 190,190
; nozzle_type = stainless_steel
; nozzle_volume = 107
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100,100
; overhang_fan_threshold = 50%,50%
; overhang_threshold_participating_cooling = 95%,95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; override_process_overhang_speed = 0,0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02,0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; prime_volume_mode = Default
; print_compatible_printers = "Bambu Lab A1 0.4 nozzle";"Bambu Lab P1S 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_in_clockwise = 0
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL A1
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 250
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab P1S
; printer_notes = 
; printer_settings_id = Bambu Lab P1S 0.4 nozzle
; printer_structure = corexy
; printer_technology = FFF
; printer_variant = 0.4
; printhost_authorization_type = key
; printhost_ssl_ignore_revoke = 0
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = 2
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1,1
; reduce_infill_retraction_mode = Auto
; required_nozzle_HRC = 3,3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 249
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0,0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; skirt_per_object = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1,1
; slow_down_layer_time = 4,4
; slow_down_min_speed = 20,20
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 80
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 0
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 0
; sparse_infill_lattice_angle_1 = -45
; sparse_infill_lattice_angle_2 = 45
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = zig-zag
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 45,45
; supertack_plate_temp_initial_layer = 45,45
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_cooling_filter = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_fast_purge_mode = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_ironing_direction = 0
; support_ironing_flow = 10%
; support_ironing_inset = 0
; support_ironing_pattern = zig-zag
; support_ironing_spacing = 0.15
; support_ironing_speed = 30
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_skip_flush = 0
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 54,54
; template_custom_gcode = 
; textured_plate_temp = 55,55
; textured_plate_temp_initial_layer = 55,55
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;========Date 20250206========\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\nM1004 S5 P1  ; external shutter\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n; SKIPPABLE_END
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_density = 100%
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; top_z_overrides_xy_distance = 0
; travel_acceleration = 10000
; travel_jerk = 9
; travel_short_distance_acceleration = 250
; travel_speed = 500
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle";"Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle";"Bambu Lab P2S 0.4 nozzle";"Bambu Lab H2C 0.4 nozzle";"Bambu Lab X2D 0.4 nozzle";"Bambu Lab A2L 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = "0 0 0 0 0 0";"0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 0
; wall_generator = classic
; wall_loops = 2
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 147,10.1623
; wipe_tower_y = 353.164,215.64
; wrapping_detection_gcode = 
; wrapping_detection_layers = 20
; wrapping_exclude_area = 
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R9
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z20 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: P1S-0.4 ========================
;===== date: 20251031 =====================
;===== turn on the HB fan & MC board fan =================
M104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle
M710 A1 S255 ;turn on MC fan by default(P1S)
;===== reset machine status =================
M290 X40 Y40 Z2.6666666
G91
M17 Z0.4 ; lower the z-motor current
G380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed
G380 S2 Z-25 F300 ;
G1 Z5 F300;
G90
M17 X1.2 Y1.2 Z0.75 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 5
M221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem
G29.1 Z0 ; clear z-trim value first
M204 S10000 ; init ACC set to 10m/s^2

;===== heatbed preheat ====================
M1002 gcode_claim_action:54
M140 S55 ;set bed temp
M190 S55 ;wait for bed temp



;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead

;===== prepare print temperature and material ==========
M104 S220 ;set extruder temp
G91
G0 Z10 F1200
G90
G28 X
M975 S1 ; turn on
G1 X60 F12000
G1 Y245
G1 Y265 F3000
M620 M
M620 S1A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T1
    G1 X54 F12000
    G1 Y265
    M400
M621 S1A
M620.1 E F299.339 T240


M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
M73 P6 R8
G1 E50 F200
M400
M104 S220
G92 E0
M73 P52 R4
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P55 R4
G1 E-0.5 F300

M73 P58 R3
G1 X70 F9000
G1 X76 F15000
G1 X65 F15000
G1 X76 F15000
G1 X65 F15000; shake to put down garbage
G1 X80 F6000
G1 X95 F15000
G1 X80 F15000
G1 X165 F15000; wipe and shake
M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1
M106 S255
G1 X65 Y230 F18000
G1 Y264 F6000
M109 S200
G1 X100 F18000 ; first wipe mouth

G0 X135 Y253 F20000  ; move to exposed steel surface edge
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
G0 Z5 F20000

G1 X60 Y265
G92 E0
G1 E-0.5 F300 ; retrack more
G1 X100 F5000; second wipe mouth
G1 X70 F15000
G1 X100 F5000
M73 P59 R3
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X90 F5000
G0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle
M104 S140 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)

M221 S; push soft endstop status
M221 Z0 ;turn off Z axis endstop
G0 Z0.5 F20000
G0 X125 Y259.5 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 X128
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300

M109 S140 ; wait nozzle temp down to heatbed acceptable
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000

M221 R; pop softend status
G1 Z10 F1200
M400
G1 Z10
M73 P60 R3
G1 F30000
G1 X230 Y15
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X117.112 Y122.137 I29.7751 J29.725
    M400
    M500 ; save cali data

M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623
;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression


;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead


M104 S220 ; set extrude temp earlier, to reduce wait time

;===== mech mode fast check============================
G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q1 A7 B30 C80  H15 K0
M974 Q1 S2 P0

G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q0 A7 B30 C90 Q0 H15 K0
M974 Q0 S2 P0

M975 S1
G1 F30000
M73 P61 R3
G1 X230 Y15
G28 X ; re-home XY
;===== fmech mode fast check============================


;===== nozzle load line ===============================
M975 S1
G90
M83
T1000
G1 X18.0 Y1.0 Z0.8 F18000;Move to start position
M109 S220
G1 Z0.2
G0 E2 F300
G0 X240 E15 F4800
G0 Y11 E0.700 F1200
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X18 E15 F4800
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.04 ; for Textured PEI Plate

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S150

M142 P1 R35 S40
;VT1 H-1
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/10
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
M204 S6000
G1 Z.4 F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 132
G1 X136.03 Y133.955
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
M73 P62 R3
G1 X136.03 Y138.955 E.19003
G1 X127.995 Y138.955 E.30541
G1 X127.995 Y133.955 E.19003
G1 X122.995 Y133.955 E.19003
G1 X122.995 Y120.92 E.49545
G1 X126.03 Y120.92 E.11538
M73 P63 R3
G1 X126.03 Y125.92 E.19003
G1 X137.995 Y125.92 E.45471
G1 X137.995 Y120.92 E.19003
G1 X141.03 Y120.92 E.11538
G1 X141.03 Y133.955 E.49545
G1 X136.09 Y133.955 E.18775
M204 S6000
G1 X136.487 Y134.412 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X136.487 Y139.413 E.19003
M73 P64 R3
G1 X127.537 Y139.413 E.34016
G1 X127.537 Y134.412 E.19003
G1 X122.537 Y134.412 E.19003
G1 X122.537 Y120.462 E.53019
G1 X126.487 Y120.462 E.15013
M73 P65 R3
G1 X126.487 Y125.462 E.19003
G1 X137.537 Y125.462 E.41997
G1 X137.537 Y120.462 E.19003
G1 X141.487 Y120.462 E.15013
G1 X141.487 Y134.412 E.53019
G1 X136.547 Y134.412 E.18775
; WIPE_START
G1 X136.523 Y136.412 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X138.177 Y128.961 Z.6 F30000
G1 X139.922 Y121.102 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50076
G1 F6300
M204 S500
G1 X140.642 Y121.822 E.03876
G1 X140.642 Y122.47 E.02465
G1 X139.48 Y121.308 E.06254
G1 X138.833 Y121.308 E.02465
G1 X140.642 Y123.117 E.0974
M73 P66 R3
G1 X140.642 Y123.765 E.02465
G1 X138.383 Y121.506 E.12162
G1 X138.383 Y122.153 E.02465
G1 X140.642 Y124.412 E.12162
G1 X140.642 Y125.06 E.02465
G1 X138.383 Y122.801 E.12162
M73 P67 R3
G1 X138.383 Y123.448 E.02465
G1 X140.642 Y125.707 E.12162
G1 X140.642 Y126.355 E.02465
G1 X138.383 Y124.096 E.12162
G1 X138.383 Y124.743 E.02465
G1 X140.642 Y127.002 E.12162
G1 X140.642 Y127.65 E.02465
G1 X138.383 Y125.39 E.12162
G1 X138.383 Y126.038 E.02465
G1 X140.642 Y128.297 E.12162
G1 X140.642 Y128.944 E.02465
G1 X138.005 Y126.308 E.14195
G1 X137.358 Y126.308 E.02465
G1 X140.642 Y129.592 E.17681
G1 X140.642 Y130.239 E.02465
G1 X136.71 Y126.308 E.21167
G1 X136.063 Y126.308 E.02465
G1 X140.642 Y130.887 E.24653
G1 X140.642 Y131.534 E.02465
G1 X135.415 Y126.308 E.28138
G1 X134.768 Y126.308 E.02465
G1 X140.642 Y132.182 E.31624
G1 X140.642 Y132.829 E.02465
G1 X134.121 Y126.308 E.3511
G1 X133.473 Y126.308 E.02465
M73 P67 R2
G1 X140.642 Y133.477 E.38596
G1 X140.642 Y133.567 E.00343
G1 X140.085 Y133.567 E.02122
M73 P68 R2
G1 X132.826 Y126.308 E.39082
G1 X132.178 Y126.308 E.02465
G1 X139.437 Y133.567 E.39082
G1 X138.79 Y133.567 E.02465
G1 X131.531 Y126.308 E.39082
G1 X130.883 Y126.308 E.02465
G1 X138.142 Y133.567 E.39082
G1 X137.495 Y133.567 E.02465
G1 X130.236 Y126.308 E.39082
G1 X129.588 Y126.308 E.02465
G1 X136.847 Y133.567 E.39082
G1 X136.2 Y133.567 E.02465
G1 X128.941 Y126.308 E.39082
G1 X128.293 Y126.308 E.02465
G1 X135.642 Y133.657 E.39565
G1 X135.642 Y134.304 E.02465
G1 X127.646 Y126.308 E.43051
G1 X126.998 Y126.308 E.02465
G1 X135.642 Y134.952 E.46537
G1 X135.642 Y135.599 E.02465
G1 X126.145 Y126.102 E.5113
; WIPE_START
G1 X127.559 Y127.516 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X125.848 Y121.92 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X125.236 Y121.308 E.03295
G1 X124.588 Y121.308 E.02465
G1 X125.642 Y122.362 E.05674
G1 X125.642 Y123.009 E.02465
G1 X123.941 Y121.308 E.0916
G1 X123.383 Y121.308 E.02123
G1 X123.383 Y121.398 E.00342
G1 X125.642 Y123.657 E.12162
G1 X125.642 Y124.304 E.02465
G1 X123.383 Y122.045 E.12162
G1 X123.383 Y122.693 E.02465
G1 X125.642 Y124.952 E.12162
G1 X125.642 Y125.599 E.02465
G1 X123.383 Y123.34 E.12162
G1 X123.383 Y123.988 E.02465
G1 X135.642 Y136.247 E.66001
G1 X135.642 Y136.894 E.02465
G1 X123.383 Y124.635 E.66001
G1 X123.383 Y125.283 E.02465
G1 X135.642 Y137.542 E.66001
G1 X135.642 Y138.189 E.02465
G1 X123.383 Y125.93 E.66001
G1 X123.383 Y126.578 E.02465
G1 X135.372 Y138.567 E.64549
G1 X134.725 Y138.567 E.02465
G1 X123.383 Y127.225 E.61063
G1 X123.383 Y127.873 E.02465
G1 X134.077 Y138.567 E.57577
M73 P69 R2
G1 X133.43 Y138.567 E.02465
G1 X123.383 Y128.52 E.54092
G1 X123.383 Y129.168 E.02465
G1 X127.782 Y133.567 E.23686
G1 X128.383 Y133.567 E.02286
G1 X128.383 Y134.168 E.02286
G1 X132.782 Y138.567 E.23686
G1 X132.135 Y138.567 E.02465
G1 X128.383 Y134.815 E.202
G1 X128.383 Y135.462 E.02465
G1 X131.487 Y138.567 E.16714
G1 X130.84 Y138.567 E.02465
G1 X128.383 Y136.11 E.13228
G1 X128.383 Y136.757 E.02465
G1 X130.192 Y138.567 E.09742
G1 X129.545 Y138.567 E.02465
G1 X128.383 Y137.405 E.06257
G1 X128.383 Y138.052 E.02465
G1 X129.103 Y138.773 E.03878
; WIPE_START
G1 X128.383 Y138.052 E-.38708
G1 X128.383 Y137.405 E-.24605
G1 X128.619 Y137.641 E-.12687
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X127.341 Y133.773 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X123.383 Y129.815 E.21308
G1 X123.383 Y130.462 E.02465
G1 X126.487 Y133.567 E.16714
G1 X125.84 Y133.567 E.02465
G1 X123.383 Y131.11 E.13228
G1 X123.383 Y131.757 E.02465
G1 X125.192 Y133.567 E.09742
G1 X124.545 Y133.567 E.02465
G1 X123.383 Y132.405 E.06256
G1 X123.383 Y133.052 E.02465
G1 X124.103 Y133.773 E.03878
; WIPE_START
G1 X123.383 Y133.052 E-.38708
G1 X123.383 Y132.405 E-.24604
G1 X123.619 Y132.641 E-.12688
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X125.859 Y139.937 Z.6 F30000
G1 X126.13 Y140.82 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X126.13 Y149.055 E.31302
M73 P70 R2
G1 X117.895 Y149.055 E.31302
G1 X117.895 Y140.82 E.31302
G1 X126.07 Y140.82 E.31073
M204 S6000
G1 X126.587 Y140.362 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X126.587 Y149.513 E.34776
G1 X117.437 Y149.513 E.34776
G1 X117.437 Y140.362 E.34776
G1 X126.527 Y140.362 E.34548
; WIPE_START
G1 X126.541 Y142.362 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X125.948 Y141.946 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50938
G1 F6300
M204 S500
G1 X125.209 Y141.208 E.04049
G1 X124.55 Y141.208 E.02559
G1 X125.742 Y142.4 E.06539
G1 X125.742 Y143.06 E.02559
G1 X123.89 Y141.208 E.10158
G1 X123.23 Y141.208 E.02559
G1 X125.742 Y143.719 E.13776
G1 X125.742 Y144.379 E.02559
G1 X122.571 Y141.208 E.17395
G1 X121.911 Y141.208 E.02559
G1 X125.742 Y145.039 E.21013
G1 X125.742 Y145.699 E.02559
G1 X121.251 Y141.208 E.24632
G1 X120.592 Y141.208 E.02559
G1 X125.742 Y146.358 E.2825
G1 X125.742 Y147.018 E.02559
G1 X119.932 Y141.208 E.31868
G1 X119.272 Y141.208 E.02559
G1 X125.742 Y147.678 E.35487
G1 X125.742 Y148.337 E.02559
G1 X118.613 Y141.208 E.39105
G1 X118.283 Y141.208 E.01279
G1 X118.283 Y141.538 E.01279
G1 X125.412 Y148.667 E.39105
G1 X124.752 Y148.667 E.02559
G1 X118.283 Y142.198 E.35487
G1 X118.283 Y142.857 E.02559
G1 X124.093 Y148.667 E.31868
G1 X123.433 Y148.667 E.02559
G1 X118.283 Y143.517 E.2825
G1 X118.283 Y144.177 E.02559
G1 X122.773 Y148.667 E.24631
G1 X122.114 Y148.667 E.02559
G1 X118.283 Y144.836 E.21013
G1 X118.283 Y145.496 E.02559
G1 X121.454 Y148.667 E.17394
G1 X120.794 Y148.667 E.02559
G1 X118.283 Y146.156 E.13776
G1 X118.283 Y146.815 E.02559
G1 X120.135 Y148.667 E.10157
G1 X119.475 Y148.667 E.02559
G1 X118.283 Y147.475 E.06539
G1 X118.283 Y148.135 E.02559
G1 X119.021 Y148.873 E.04049
; WIPE_START
M73 P71 R2
G1 X118.283 Y148.135 E-.39666
G1 X118.283 Y147.475 E-.25067
G1 X118.493 Y147.685 E-.11267
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X125.69 Y145.144 Z.6 F30000
G1 X137.87 Y140.845 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X146.105 Y140.845 E.31302
G1 X146.105 Y149.08 E.31302
G1 X137.87 Y149.08 E.31302
G1 X137.87 Y140.905 E.31074
M204 S6000
G1 X137.413 Y140.387 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X146.563 Y140.387 E.34776
G1 X146.563 Y149.538 E.34776
G1 X137.413 Y149.538 E.34776
G1 X137.413 Y140.447 E.34548
; WIPE_START
G1 X139.412 Y140.434 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X145.923 Y141.971 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50938
G1 F6300
M204 S500
G1 X145.185 Y141.233 E.04049
G1 X144.525 Y141.233 E.02559
G1 X145.717 Y142.425 E.06539
G1 X145.717 Y143.085 E.02559
G1 X143.865 Y141.233 E.10158
G1 X143.206 Y141.233 E.02559
G1 X145.717 Y143.745 E.13776
G1 X145.717 Y144.404 E.02559
G1 X142.546 Y141.233 E.17395
G1 X141.886 Y141.233 E.02559
G1 X145.717 Y145.064 E.21013
G1 X145.717 Y145.724 E.02559
G1 X141.227 Y141.233 E.24632
G1 X140.567 Y141.233 E.02559
G1 X145.717 Y146.383 E.2825
G1 X145.717 Y147.043 E.02559
G1 X139.907 Y141.233 E.31868
G1 X139.248 Y141.233 E.02559
G1 X145.717 Y147.703 E.35487
G1 X145.717 Y148.362 E.02559
G1 X138.588 Y141.233 E.39105
G1 X138.258 Y141.233 E.01279
G1 X138.258 Y141.563 E.01279
G1 X145.387 Y148.692 E.39105
G1 X144.728 Y148.692 E.02559
G1 X138.258 Y142.223 E.35486
G1 X138.258 Y142.882 E.02559
G1 X144.068 Y148.692 E.31868
G1 X143.408 Y148.692 E.02559
G1 X138.258 Y143.542 E.2825
G1 X138.258 Y144.202 E.02559
G1 X142.748 Y148.692 E.24631
G1 X142.089 Y148.692 E.02559
G1 X138.258 Y144.861 E.21013
G1 X138.258 Y145.521 E.02559
G1 X141.429 Y148.692 E.17394
G1 X140.769 Y148.692 E.02559
M73 P72 R2
G1 X138.258 Y146.181 E.13776
G1 X138.258 Y146.84 E.02559
G1 X140.11 Y148.692 E.10157
G1 X139.45 Y148.692 E.02559
G1 X138.258 Y147.5 E.06539
G1 X138.258 Y148.16 E.02559
G1 X138.996 Y148.898 E.04049
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6300
G1 X138.258 Y148.16 E-.39666
G1 X138.258 Y147.5 E-.25067
G1 X138.468 Y147.71 E-.11267
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/10
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S255
M106 P2 S178
; open powerlost recovery
M1003 S1
M204 S10000
G17
G3 Z.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 132
G1 X136.21 Y134.135
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X136.21 Y139.135 E.16924
G1 X127.815 Y139.135 E.28419
G1 X127.815 Y134.135 E.16924
G1 X122.815 Y134.135 E.16924
G1 X122.815 Y120.74 E.45343
G1 X126.21 Y120.74 E.11495
G1 X126.21 Y125.74 E.16924
G1 X137.815 Y125.74 E.39279
G1 X137.815 Y120.74 E.16924
G1 X141.21 Y120.74 E.11495
G1 X141.21 Y134.135 E.45343
G1 X136.27 Y134.135 E.16721
M204 S250
G1 X136.602 Y134.527 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X136.602 Y139.528 E.15677
G1 X127.422 Y139.528 E.28783
G1 X127.422 Y134.527 E.15677
G1 X122.422 Y134.527 E.15677
G1 X122.422 Y120.347 E.4446
G1 X126.602 Y120.347 E.13106
G1 X126.602 Y125.347 E.15677
G1 X137.422 Y125.347 E.33925
G1 X137.422 Y120.347 E.15677
G1 X141.602 Y120.347 E.13106
G1 X141.602 Y134.527 E.4446
G1 X136.662 Y134.527 E.15489
; WIPE_START
M204 S6000
G1 X136.638 Y136.527 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.047 Y133.202 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42345
G1 F9460.489
M204 S6000
G1 X140.447 Y133.802 E.02684
G1 X139.909 Y133.802 E.01703
M73 P73 R2
G1 X140.877 Y132.834 E.04333
G1 X140.877 Y132.296 E.01703
G1 X139.371 Y133.802 E.06741
G1 X138.833 Y133.802 E.01703
G1 X140.877 Y131.758 E.09149
G1 X140.877 Y131.219 E.01703
G1 X138.294 Y133.802 E.11557
G1 X137.756 Y133.802 E.01703
G1 X140.877 Y130.681 E.13966
G1 X140.877 Y130.143 E.01703
G1 X137.218 Y133.802 E.16374
G1 X136.68 Y133.802 E.01703
G1 X140.877 Y129.605 E.18782
G1 X140.877 Y129.067 E.01703
G1 X131.142 Y138.802 E.43564
G1 X131.68 Y138.802 E.01703
G1 X135.877 Y134.605 E.18782
G1 X135.877 Y135.143 E.01703
G1 X132.218 Y138.802 E.16374
G1 X132.756 Y138.802 E.01703
G1 X135.877 Y135.681 E.13966
G1 X135.877 Y136.219 E.01703
G1 X133.294 Y138.802 E.11557
G1 X133.833 Y138.802 E.01703
G1 X135.877 Y136.758 E.09149
G1 X135.877 Y137.296 E.01703
G1 X134.371 Y138.802 E.06741
G1 X134.909 Y138.802 E.01703
G1 X135.877 Y137.834 E.04333
G1 X135.877 Y138.372 E.01703
G1 X135.277 Y138.972 E.02684
; WIPE_START
G1 X135.877 Y138.372 E-.32239
G1 X135.877 Y137.834 E-.2045
G1 X135.443 Y138.268 E-.23311
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.899 Y130.775 Z.8 F30000
G1 X138.816 Y120.903 Z.8
G1 Z.4
G1 E.8 F1800
G1 F9460.489
M204 S6000
G1 X138.148 Y121.572 E.02991
G1 X138.148 Y122.11 E.01703
G1 X139.185 Y121.073 E.0464
G1 X139.723 Y121.073 E.01703
G1 X138.148 Y122.648 E.07048
G1 X138.148 Y123.186 E.01703
G1 X140.261 Y121.073 E.09456
G1 X140.799 Y121.073 E.01703
G1 X138.148 Y123.724 E.11864
G1 X138.148 Y124.262 E.01703
G1 X140.877 Y121.533 E.12214
G1 X140.877 Y122.071 E.01703
G1 X138.148 Y124.8 E.12214
G1 X138.148 Y125.339 E.01703
G1 X140.877 Y122.609 E.12214
G1 X140.877 Y123.147 E.01703
G1 X128.148 Y135.877 E.56962
G1 X128.148 Y136.415 E.01703
G1 X140.877 Y123.685 E.56961
G1 X140.877 Y124.223 E.01703
G1 X128.148 Y136.953 E.56961
G1 X128.148 Y137.491 E.01703
G1 X140.877 Y124.762 E.56961
G1 X140.877 Y125.3 E.01703
G1 X128.148 Y138.029 E.56961
G1 X128.148 Y138.568 E.01703
G1 X140.877 Y125.838 E.56961
G1 X140.877 Y126.376 E.01703
G1 X128.451 Y138.802 E.55604
G1 X128.989 Y138.802 E.01703
G1 X140.877 Y126.914 E.53196
G1 X140.877 Y127.452 E.01703
G1 X129.527 Y138.802 E.50788
G1 X130.065 Y138.802 E.01703
G1 X140.877 Y127.991 E.4838
G1 X140.877 Y128.529 E.01703
G1 X130.434 Y138.972 E.46731
M204 S10000
G1 X127.978 Y135.508 F30000
G1 F9460.489
M204 S6000
G1 X137.414 Y126.073 E.42222
G1 X136.875 Y126.073 E.01703
G1 X128.148 Y134.8 E.39054
G1 X128.148 Y134.262 E.01703
G1 X136.337 Y126.073 E.36646
G1 X135.799 Y126.073 E.01703
G1 X128.07 Y133.802 E.34588
G1 X127.531 Y133.802 E.01703
G1 X135.261 Y126.073 E.34588
G1 X134.723 Y126.073 E.01703
G1 X126.993 Y133.802 E.34588
G1 X126.455 Y133.802 E.01703
G1 X134.185 Y126.073 E.34588
G1 X133.647 Y126.073 E.01703
G1 X125.917 Y133.802 E.34588
G1 X125.379 Y133.802 E.01703
G1 X133.108 Y126.073 E.34588
G1 X132.57 Y126.073 E.01703
G1 X124.841 Y133.802 E.34588
G1 X124.302 Y133.802 E.01703
G1 X132.032 Y126.073 E.34588
G1 X131.494 Y126.073 E.01703
G1 X123.764 Y133.802 E.34588
G1 X123.226 Y133.802 E.01703
G1 X130.956 Y126.073 E.34588
G1 X130.418 Y126.073 E.01703
G1 X123.148 Y133.343 E.32531
G1 X123.148 Y132.804 E.01703
G1 X129.879 Y126.073 E.30123
G1 X129.341 Y126.073 E.01703
G1 X123.148 Y132.266 E.27715
G1 X123.148 Y131.728 E.01703
G1 X128.803 Y126.073 E.25307
G1 X128.265 Y126.073 E.01703
G1 X123.148 Y131.19 E.22899
G1 X123.148 Y130.652 E.01703
G1 X127.727 Y126.073 E.20491
G1 X127.189 Y126.073 E.01703
G1 X123.148 Y130.114 E.18083
G1 X123.148 Y129.576 E.01703
G1 X126.651 Y126.073 E.15674
G1 X126.112 Y126.073 E.01703
G1 X123.148 Y129.037 E.13266
G1 X123.148 Y128.499 E.01703
M73 P74 R2
G1 X125.877 Y125.77 E.12214
G1 X125.877 Y125.232 E.01703
G1 X123.148 Y127.961 E.12214
G1 X123.148 Y127.423 E.01703
G1 X125.877 Y124.693 E.12214
G1 X125.877 Y124.155 E.01703
G1 X123.148 Y126.885 E.12214
G1 X123.148 Y126.347 E.01703
G1 X125.877 Y123.617 E.12214
G1 X125.877 Y123.079 E.01703
G1 X123.148 Y125.809 E.12214
G1 X123.148 Y125.27 E.01703
G1 X125.877 Y122.541 E.12214
G1 X125.877 Y122.003 E.01703
G1 X123.148 Y124.732 E.12214
G1 X123.148 Y124.194 E.01703
G1 X125.877 Y121.465 E.12214
G1 X125.877 Y121.073 E.0124
G1 X125.731 Y121.073 E.00463
G1 X123.148 Y123.656 E.11559
G1 X123.148 Y123.118 E.01703
G1 X125.193 Y121.073 E.09151
G1 X124.655 Y121.073 E.01703
G1 X123.148 Y122.58 E.06743
G1 X123.148 Y122.041 E.01703
G1 X124.116 Y121.073 E.04335
G1 X123.578 Y121.073 E.01703
G1 X122.978 Y121.673 E.02686
; WIPE_START
G1 X123.578 Y121.073 E-.32261
G1 X124.116 Y121.073 E-.2045
G1 X123.683 Y121.506 E-.2329
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.721 Y129.068 Z.8 F30000
G1 X126.31 Y140.64 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X126.31 Y149.235 E.29096
G1 X117.715 Y149.235 E.29096
G1 X117.715 Y140.64 E.29096
G1 X126.25 Y140.64 E.28893
M204 S250
G1 X126.702 Y140.247 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X126.702 Y149.628 E.2941
G1 X117.322 Y149.628 E.2941
G1 X117.322 Y140.247 E.2941
G1 X126.642 Y140.247 E.29222
; WIPE_START
M204 S6000
G1 X126.655 Y142.247 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.144 Y140.893 Z.8 F30000
G1 X118.644 Y140.803 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42186
G1 F9500.185
M204 S6000
G1 X118.048 Y141.4 E.02659
G1 X118.048 Y141.936 E.01689
G1 X119.011 Y140.973 E.04291
G1 X119.546 Y140.973 E.01689
G1 X118.048 Y142.472 E.06679
G1 X118.048 Y143.007 E.01689
G1 X120.082 Y140.973 E.09067
G1 X120.618 Y140.973 E.01689
G1 X118.048 Y143.543 E.11455
G1 X118.048 Y144.079 E.01689
G1 X121.154 Y140.973 E.13843
G1 X121.69 Y140.973 E.01689
G1 X118.048 Y144.615 E.16231
G1 X118.048 Y145.151 E.01689
G1 X122.226 Y140.973 E.18619
G1 X122.762 Y140.973 E.01689
G1 X118.048 Y145.687 E.21007
G1 X118.048 Y146.223 E.01689
G1 X123.298 Y140.973 E.23395
G1 X123.834 Y140.973 E.01689
G1 X118.048 Y146.759 E.25783
G1 X118.048 Y147.295 E.01689
G1 X124.37 Y140.973 E.28171
G1 X124.905 Y140.973 E.01689
G1 X118.048 Y147.831 E.30559
G1 X118.048 Y148.366 E.01689
G1 X125.441 Y140.973 E.32947
G1 X125.977 Y140.973 E.01688
G1 X118.048 Y148.902 E.35334
G1 X118.584 Y148.902 E.01689
G1 X125.977 Y141.509 E.32946
G1 X125.977 Y142.045 E.01689
G1 X119.12 Y148.902 E.30558
G1 X119.655 Y148.902 E.01689
G1 X125.977 Y142.58 E.2817
G1 X125.977 Y143.116 E.01689
G1 X120.191 Y148.902 E.25782
G1 X120.727 Y148.902 E.01689
G1 X125.977 Y143.652 E.23394
G1 X125.977 Y144.188 E.01689
G1 X121.263 Y148.902 E.21006
G1 X121.799 Y148.902 E.01689
G1 X125.977 Y144.724 E.18618
G1 X125.977 Y145.26 E.01689
G1 X122.335 Y148.902 E.1623
G1 X122.871 Y148.902 E.01689
G1 X125.977 Y145.796 E.13842
G1 X125.977 Y146.332 E.01689
G1 X123.407 Y148.902 E.11454
G1 X123.943 Y148.902 E.01689
G1 X125.977 Y146.868 E.09066
G1 X125.977 Y147.404 E.01689
G1 X124.479 Y148.902 E.06678
G1 X125.014 Y148.902 E.01689
G1 X125.977 Y147.94 E.0429
G1 X125.977 Y148.475 E.01689
G1 X125.381 Y149.072 E.02658
; WIPE_START
G1 X125.977 Y148.475 E-.32058
G1 X125.977 Y147.94 E-.20364
G1 X125.538 Y148.378 E-.23577
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.982 Y144.288 Z.8 F30000
G1 X137.69 Y140.665 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X146.285 Y140.665 E.29096
G1 X146.285 Y149.26 E.29096
G1 X137.69 Y149.26 E.29096
G1 X137.69 Y140.725 E.28893
M204 S250
G1 X137.298 Y140.272 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X146.678 Y140.272 E.2941
G1 X146.678 Y149.653 E.2941
G1 X137.298 Y149.653 E.2941
G1 X137.298 Y140.332 E.29222
; WIPE_START
M204 S6000
G1 X139.297 Y140.32 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.619 Y140.828 Z.8 F30000
M73 P75 R2
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42186
G1 F9500.185
M204 S6000
G1 X138.023 Y141.425 E.02659
G1 X138.023 Y141.961 E.01689
G1 X138.986 Y140.998 E.04291
G1 X139.522 Y140.998 E.01689
G1 X138.023 Y142.497 E.06679
G1 X138.023 Y143.032 E.01689
G1 X140.057 Y140.998 E.09067
G1 X140.593 Y140.998 E.01689
G1 X138.023 Y143.568 E.11455
G1 X138.023 Y144.104 E.01689
G1 X141.129 Y140.998 E.13843
G1 X141.665 Y140.998 E.01689
G1 X138.023 Y144.64 E.16231
G1 X138.023 Y145.176 E.01689
G1 X142.201 Y140.998 E.18619
G1 X142.737 Y140.998 E.01689
G1 X138.023 Y145.712 E.21007
G1 X138.023 Y146.248 E.01689
G1 X143.273 Y140.998 E.23395
G1 X143.809 Y140.998 E.01689
G1 X138.023 Y146.784 E.25783
G1 X138.023 Y147.32 E.01689
G1 X144.345 Y140.998 E.28171
G1 X144.881 Y140.998 E.01689
G1 X138.023 Y147.856 E.30559
G1 X138.023 Y148.391 E.01689
G1 X145.416 Y140.998 E.32947
G1 X145.952 Y140.998 E.01688
G1 X138.023 Y148.927 E.35334
G1 X138.559 Y148.927 E.01689
G1 X145.952 Y141.534 E.32946
G1 X145.952 Y142.07 E.01689
G1 X139.095 Y148.927 E.30558
G1 X139.631 Y148.927 E.01689
G1 X145.952 Y142.605 E.2817
G1 X145.952 Y143.141 E.01689
G1 X140.166 Y148.927 E.25782
G1 X140.702 Y148.927 E.01689
G1 X145.952 Y143.677 E.23394
G1 X145.952 Y144.213 E.01689
G1 X141.238 Y148.927 E.21006
G1 X141.774 Y148.927 E.01689
G1 X145.952 Y144.749 E.18618
G1 X145.952 Y145.285 E.01689
G1 X142.31 Y148.927 E.1623
G1 X142.846 Y148.927 E.01689
G1 X145.952 Y145.821 E.13842
G1 X145.952 Y146.357 E.01689
G1 X143.382 Y148.927 E.11454
G1 X143.918 Y148.927 E.01689
G1 X145.952 Y146.893 E.09066
G1 X145.952 Y147.429 E.01689
G1 X144.454 Y148.927 E.06678
G1 X144.99 Y148.927 E.01689
G1 X145.952 Y147.965 E.0429
G1 X145.952 Y148.5 E.01689
G1 X145.356 Y149.097 E.02658
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9500.185
G1 X145.952 Y148.5 E-.32058
G1 X145.952 Y147.965 E-.20364
G1 X145.514 Y148.403 E-.23578
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/10
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 132
G1 X136.21 Y134.135
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X136.21 Y139.135 E.16924
G1 X127.815 Y139.135 E.28419
G1 X127.815 Y134.135 E.16924
G1 X122.815 Y134.135 E.16924
G1 X122.815 Y120.74 E.45343
G1 X126.21 Y120.74 E.11495
G1 X126.21 Y125.74 E.16924
G1 X137.815 Y125.74 E.39279
G1 X137.815 Y120.74 E.16924
G1 X141.21 Y120.74 E.11495
G1 X141.21 Y134.135 E.45343
G1 X136.27 Y134.135 E.16721
M204 S250
G1 X136.602 Y134.527 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X136.602 Y139.528 E.15677
G1 X127.422 Y139.528 E.28783
G1 X127.422 Y134.527 E.15677
G1 X122.422 Y134.527 E.15677
G1 X122.422 Y120.347 E.4446
G1 X126.602 Y120.347 E.13106
G1 X126.602 Y125.347 E.15677
G1 X137.422 Y125.347 E.33925
G1 X137.422 Y120.347 E.15677
G1 X141.602 Y120.347 E.13106
G1 X141.602 Y134.527 E.4446
G1 X136.662 Y134.527 E.15489
; WIPE_START
M204 S6000
G1 X136.638 Y136.527 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.047 Y136.584 Z1 F30000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42345
G1 F9460.489
M204 S6000
G1 X123.148 Y123.685 E.57721
G1 X123.148 Y124.223 E.01703
G1 X135.877 Y136.953 E.56962
G1 X135.877 Y137.491 E.01703
G1 X123.148 Y124.761 E.56962
G1 X123.148 Y125.299 E.01703
G1 X135.877 Y138.029 E.56962
G1 X135.877 Y138.567 E.01703
G1 X123.148 Y125.838 E.56962
G1 X123.148 Y126.376 E.01703
G1 X135.574 Y138.802 E.55606
G1 X135.036 Y138.802 E.01703
G1 X123.148 Y126.914 E.53198
G1 X123.148 Y127.452 E.01703
G1 X134.498 Y138.802 E.5079
G1 X133.96 Y138.802 E.01703
G1 X123.148 Y127.99 E.48381
G1 X123.148 Y128.528 E.01703
G1 X133.422 Y138.802 E.45973
G1 X132.883 Y138.802 E.01703
G1 X123.148 Y129.066 E.43565
G1 X123.148 Y129.605 E.01703
G1 X127.345 Y133.802 E.18783
G1 X126.807 Y133.802 E.01703
G1 X123.148 Y130.143 E.16375
G1 X123.148 Y130.681 E.01703
G1 X126.269 Y133.802 E.13967
G1 X125.731 Y133.802 E.01703
G1 X123.148 Y131.219 E.11559
G1 X123.148 Y131.757 E.01703
G1 X125.193 Y133.802 E.09151
G1 X124.655 Y133.802 E.01703
G1 X123.148 Y132.295 E.06743
G1 X123.148 Y132.834 E.01703
G1 X124.116 Y133.802 E.04335
G1 X123.578 Y133.802 E.01703
M73 P76 R2
G1 X122.978 Y133.202 E.02686
; WIPE_START
G1 X123.578 Y133.802 E-.32259
G1 X124.116 Y133.802 E-.2045
G1 X123.683 Y133.369 E-.23291
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.748 Y138.972 Z1 F30000
G1 Z.6
G1 E.8 F1800
G1 F9460.489
M204 S6000
G1 X128.148 Y138.372 E.02686
G1 X128.148 Y137.834 E.01703
G1 X129.116 Y138.802 E.04335
G1 X129.655 Y138.802 E.01703
G1 X128.148 Y137.295 E.06743
G1 X128.148 Y136.757 E.01703
G1 X130.193 Y138.802 E.09151
G1 X130.731 Y138.802 E.01703
G1 X128.148 Y136.219 E.11559
G1 X128.148 Y135.681 E.01703
G1 X131.269 Y138.802 E.13967
G1 X131.807 Y138.802 E.01703
G1 X128.148 Y135.143 E.16375
G1 X128.148 Y134.605 E.01703
G1 X132.515 Y138.972 E.19543
M204 S10000
G1 X141.047 Y121.673 F30000
G1 F9460.489
M204 S6000
G1 X140.447 Y121.073 E.02684
G1 X139.909 Y121.073 E.01703
G1 X140.877 Y122.041 E.04333
G1 X140.877 Y122.579 E.01703
G1 X139.371 Y121.073 E.06741
G1 X138.833 Y121.073 E.01703
G1 X140.877 Y123.117 E.09149
G1 X140.877 Y123.656 E.01703
G1 X138.294 Y121.073 E.11558
G1 X138.148 Y121.073 E.00464
G1 X138.148 Y121.464 E.01239
G1 X140.877 Y124.194 E.12214
G1 X140.877 Y124.732 E.01703
G1 X138.148 Y122.002 E.12214
G1 X138.148 Y122.54 E.01703
G1 X140.877 Y125.27 E.12214
G1 X140.877 Y125.808 E.01703
G1 X138.148 Y123.079 E.12214
G1 X138.148 Y123.617 E.01703
G1 X140.877 Y126.346 E.12214
G1 X140.877 Y126.884 E.01703
G1 X138.148 Y124.155 E.12214
G1 X138.148 Y124.693 E.01703
G1 X140.877 Y127.423 E.12214
G1 X140.877 Y127.961 E.01703
G1 X138.148 Y125.231 E.12214
G1 X138.148 Y125.769 E.01703
G1 X140.877 Y128.499 E.12214
G1 X140.877 Y129.037 E.01703
G1 X137.913 Y126.073 E.13265
G1 X137.375 Y126.073 E.01703
G1 X140.877 Y129.575 E.15673
G1 X140.877 Y130.113 E.01703
G1 X136.837 Y126.073 E.18081
G1 X136.298 Y126.073 E.01703
G1 X140.877 Y130.652 E.20489
G1 X140.877 Y131.19 E.01703
G1 X135.76 Y126.073 E.22897
G1 X135.222 Y126.073 E.01703
G1 X140.877 Y131.728 E.25305
G1 X140.877 Y132.266 E.01703
G1 X134.684 Y126.073 E.27713
G1 X134.146 Y126.073 E.01703
G1 X140.877 Y132.804 E.30121
G1 X140.877 Y133.342 E.01703
G1 X133.608 Y126.073 E.32529
G1 X133.07 Y126.073 E.01703
G1 X140.799 Y133.802 E.34588
G1 X140.261 Y133.802 E.01703
G1 X132.531 Y126.073 E.34588
G1 X131.993 Y126.073 E.01703
G1 X139.723 Y133.802 E.34588
G1 X139.185 Y133.802 E.01703
G1 X131.455 Y126.073 E.34588
G1 X130.917 Y126.073 E.01703
G1 X138.646 Y133.802 E.34588
G1 X138.108 Y133.802 E.01703
G1 X130.379 Y126.073 E.34588
G1 X129.841 Y126.073 E.01703
G1 X137.57 Y133.802 E.34588
G1 X137.032 Y133.802 E.01703
G1 X129.302 Y126.073 E.34588
G1 X128.764 Y126.073 E.01703
G1 X136.494 Y133.802 E.34588
G1 X135.956 Y133.802 E.01703
G1 X128.226 Y126.073 E.34588
G1 X127.688 Y126.073 E.01703
G1 X135.877 Y134.262 E.36645
G1 X135.877 Y134.8 E.01703
G1 X127.15 Y126.073 E.39053
G1 X126.612 Y126.073 E.01703
G1 X135.877 Y135.338 E.41461
G1 X135.877 Y135.876 E.01703
G1 X123.148 Y123.147 E.56962
G1 X123.148 Y122.609 E.01703
G1 X125.877 Y125.338 E.12214
G1 X125.877 Y124.8 E.01703
G1 X123.148 Y122.07 E.12214
G1 X123.148 Y121.532 E.01703
G1 X125.877 Y124.262 E.12214
G1 X125.877 Y123.724 E.01703
G1 X123.226 Y121.073 E.11863
G1 X123.764 Y121.073 E.01703
G1 X125.877 Y123.186 E.09455
G1 X125.877 Y122.647 E.01703
G1 X124.302 Y121.073 E.07047
G1 X124.841 Y121.073 E.01703
G1 X125.877 Y122.109 E.04638
G1 X125.877 Y121.571 E.01703
G1 X125.209 Y120.903 E.0299
; WIPE_START
G1 X125.877 Y121.571 E-.35905
G1 X125.877 Y122.109 E-.2045
G1 X125.512 Y121.744 E-.19645
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.834 Y129.369 Z1 F30000
G1 X126.31 Y140.64 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X126.31 Y149.235 E.29096
G1 X117.715 Y149.235 E.29096
G1 X117.715 Y140.64 E.29096
G1 X126.25 Y140.64 E.28893
M204 S250
G1 X126.702 Y140.247 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X126.702 Y149.628 E.2941
M73 P77 R2
G1 X117.322 Y149.628 E.2941
G1 X117.322 Y140.247 E.2941
G1 X126.642 Y140.247 E.29222
; WIPE_START
M204 S6000
G1 X126.655 Y142.247 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.147 Y141.569 Z1 F30000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42186
G1 F9500.185
M204 S6000
G1 X125.55 Y140.973 E.02658
G1 X125.014 Y140.973 E.01689
G1 X125.977 Y141.935 E.0429
G1 X125.977 Y142.471 E.01689
G1 X124.479 Y140.973 E.06678
G1 X123.943 Y140.973 E.01689
G1 X125.977 Y143.007 E.09066
G1 X125.977 Y143.543 E.01689
G1 X123.407 Y140.973 E.11454
G1 X122.871 Y140.973 E.01689
G1 X125.977 Y144.079 E.13842
G1 X125.977 Y144.615 E.01689
G1 X122.335 Y140.973 E.1623
G1 X121.799 Y140.973 E.01689
G1 X125.977 Y145.151 E.18618
G1 X125.977 Y145.687 E.01689
G1 X121.263 Y140.973 E.21006
G1 X120.727 Y140.973 E.01689
G1 X125.977 Y146.223 E.23394
G1 X125.977 Y146.759 E.01689
G1 X120.191 Y140.973 E.25782
G1 X119.655 Y140.973 E.01689
G1 X125.977 Y147.295 E.2817
G1 X125.977 Y147.83 E.01689
G1 X119.12 Y140.973 E.30558
G1 X118.584 Y140.973 E.01689
G1 X125.977 Y148.366 E.32946
G1 X125.977 Y148.902 E.01689
G1 X118.048 Y140.973 E.35334
G1 X118.048 Y141.509 E.01688
G1 X125.441 Y148.902 E.32947
G1 X124.905 Y148.902 E.01689
G1 X118.048 Y142.044 E.30559
G1 X118.048 Y142.58 E.01689
G1 X124.37 Y148.902 E.28171
G1 X123.834 Y148.902 E.01689
G1 X118.048 Y143.116 E.25783
G1 X118.048 Y143.652 E.01689
G1 X123.298 Y148.902 E.23395
G1 X122.762 Y148.902 E.01689
G1 X118.048 Y144.188 E.21007
G1 X118.048 Y144.724 E.01689
G1 X122.226 Y148.902 E.18619
G1 X121.69 Y148.902 E.01689
G1 X118.048 Y145.26 E.16231
G1 X118.048 Y145.796 E.01689
G1 X121.154 Y148.902 E.13843
G1 X120.618 Y148.902 E.01689
G1 X118.048 Y146.332 E.11455
G1 X118.048 Y146.868 E.01689
G1 X120.082 Y148.902 E.09067
G1 X119.546 Y148.902 E.01689
G1 X118.048 Y147.403 E.06679
G1 X118.048 Y147.939 E.01689
G1 X119.011 Y148.902 E.04291
G1 X118.475 Y148.902 E.01689
G1 X117.878 Y148.306 E.02659
; WIPE_START
G1 X118.475 Y148.902 E-.32065
G1 X119.011 Y148.902 E-.20364
G1 X118.572 Y148.464 E-.23571
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.639 Y145.581 Z1 F30000
G1 X137.69 Y140.665 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X146.285 Y140.665 E.29096
G1 X146.285 Y149.26 E.29096
G1 X137.69 Y149.26 E.29096
G1 X137.69 Y140.725 E.28893
M204 S250
G1 X137.298 Y140.272 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X146.678 Y140.272 E.2941
G1 X146.678 Y149.653 E.2941
G1 X137.298 Y149.653 E.2941
G1 X137.298 Y140.332 E.29222
; WIPE_START
M204 S6000
G1 X139.297 Y140.32 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.943 Y147.831 Z1 F30000
G1 X137.853 Y148.331 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42186
G1 F9500.185
M204 S6000
G1 X138.45 Y148.927 E.02659
G1 X138.986 Y148.927 E.01689
G1 X138.023 Y147.964 E.04291
G1 X138.023 Y147.428 E.01689
G1 X139.522 Y148.927 E.06679
G1 X140.057 Y148.927 E.01689
G1 X138.023 Y146.893 E.09067
G1 X138.023 Y146.357 E.01689
G1 X140.593 Y148.927 E.11455
G1 X141.129 Y148.927 E.01689
G1 X138.023 Y145.821 E.13843
G1 X138.023 Y145.285 E.01689
G1 X141.665 Y148.927 E.16231
G1 X142.201 Y148.927 E.01689
G1 X138.023 Y144.749 E.18619
G1 X138.023 Y144.213 E.01689
G1 X142.737 Y148.927 E.21007
G1 X143.273 Y148.927 E.01689
G1 X138.023 Y143.677 E.23395
G1 X138.023 Y143.141 E.01689
G1 X143.809 Y148.927 E.25783
G1 X144.345 Y148.927 E.01689
G1 X138.023 Y142.605 E.28171
G1 X138.023 Y142.069 E.01689
G1 X144.881 Y148.927 E.30559
G1 X145.416 Y148.927 E.01689
G1 X138.023 Y141.534 E.32947
G1 X138.023 Y140.998 E.01688
G1 X145.952 Y148.927 E.35334
G1 X145.952 Y148.391 E.01689
G1 X138.559 Y140.998 E.32946
G1 X139.095 Y140.998 E.01689
G1 X145.952 Y147.855 E.30558
G1 X145.952 Y147.32 E.01689
G1 X139.631 Y140.998 E.2817
G1 X140.166 Y140.998 E.01689
G1 X145.952 Y146.784 E.25782
G1 X145.952 Y146.248 E.01689
G1 X140.702 Y140.998 E.23394
G1 X141.238 Y140.998 E.01689
G1 X145.952 Y145.712 E.21006
G1 X145.952 Y145.176 E.01689
G1 X141.774 Y140.998 E.18618
M73 P78 R2
G1 X142.31 Y140.998 E.01689
G1 X145.952 Y144.64 E.1623
G1 X145.952 Y144.104 E.01689
G1 X142.846 Y140.998 E.13842
G1 X143.382 Y140.998 E.01689
G1 X145.952 Y143.568 E.11454
G1 X145.952 Y143.032 E.01689
G1 X143.918 Y140.998 E.09066
G1 X144.454 Y140.998 E.01689
G1 X145.952 Y142.496 E.06678
G1 X145.952 Y141.96 E.01689
G1 X144.99 Y140.998 E.0429
G1 X145.525 Y140.998 E.01689
G1 X146.122 Y141.594 E.02658
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9500.185
G1 X145.525 Y140.998 E-.32058
G1 X144.99 Y140.998 E-.20364
G1 X145.428 Y141.436 E-.23577
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/10
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 132
G1 X136.21 Y134.135
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8447
M204 S6000
G1 X136.21 Y139.135 E.16924
G1 X127.815 Y139.135 E.28419
G1 X127.815 Y134.135 E.16924
G1 X122.815 Y134.135 E.16924
G1 X122.815 Y120.74 E.45343
G1 X126.21 Y120.74 E.11495
G1 X126.21 Y125.74 E.16924
G1 X137.815 Y125.74 E.39279
G1 X137.815 Y120.74 E.16924
G1 X141.21 Y120.74 E.11495
G1 X141.21 Y134.135 E.45343
G1 X136.27 Y134.135 E.16721
M204 S250
G1 X136.602 Y134.527 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8447
M204 S5000
G1 X136.602 Y139.528 E.15677
G1 X127.422 Y139.528 E.28783
G1 X127.422 Y134.527 E.15677
G1 X122.422 Y134.527 E.15677
G1 X122.422 Y120.347 E.4446
G1 X126.602 Y120.347 E.13106
G1 X126.602 Y125.347 E.15677
G1 X137.422 Y125.347 E.33925
G1 X137.422 Y120.347 E.15677
G1 X141.602 Y120.347 E.13106
G1 X141.602 Y134.527 E.4446
G1 X136.662 Y134.527 E.15489
; WIPE_START
G1 F9547.055
M204 S6000
G1 X136.638 Y136.527 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.868 Y138.97 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8447
M204 S6000
G1 X135.862 Y134.976 E.19122
G1 X135.862 Y133.787 E.04023
G1 X137.051 Y133.787 E.04023
G1 X140.862 Y129.976 E.18245
G1 X140.862 Y126.138 E.12991
G1 X128.163 Y138.787 E.60672
G1 X128.163 Y134.999 E.12822
G1 X137.074 Y126.088 E.4266
G1 X133.236 Y126.088 E.12991
G1 X125.537 Y133.787 E.36857
G1 X123.163 Y133.787 E.08036
G1 X123.163 Y132.323 E.04955
G1 X129.398 Y126.088 E.2985
G1 X125.862 Y126.088 E.11969
G1 X125.862 Y125.786 E.01022
G1 X123.163 Y128.485 E.12923
G1 X123.163 Y124.647 E.12991
G1 X126.045 Y121.765 E.13799
; WIPE_START
G1 F8843.478
G1 X124.631 Y123.179 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.193 Y122.14 Z1.2 F30000
G1 X137.979 Y121.345 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F8447
M204 S6000
G1 X138.236 Y121.088 E.01229
G1 X140.862 Y121.088 E.08888
G1 X140.862 Y122.3 E.04103
G1 X137.979 Y125.183 E.13799
; WIPE_START
M73 P78 R1
G1 F8843.478
G1 X139.394 Y123.768 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.716 Y129.8 Z1.2 F30000
G1 X126.31 Y140.64 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8447
M204 S6000
G1 X126.31 Y149.235 E.29096
G1 X117.715 Y149.235 E.29096
G1 X117.715 Y140.64 E.29096
G1 X126.25 Y140.64 E.28893
M204 S250
G1 X126.702 Y140.247 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8447
M204 S5000
G1 X126.702 Y149.628 E.2941
G1 X117.322 Y149.628 E.2941
G1 X117.322 Y140.247 E.2941
G1 X126.642 Y140.247 E.29222
; WIPE_START
G1 F9547.055
M204 S6000
G1 X126.655 Y142.247 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.14 Y140.915 Z1.2 F30000
G1 X118.519 Y140.805 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8447
M204 S6000
G1 X118.063 Y141.261 E.02187
G1 X118.063 Y145.099 E.12991
G1 X122.174 Y140.988 E.19682
G1 X125.962 Y140.988 E.12822
G1 X125.962 Y141.038 E.00169
G1 X118.113 Y148.887 E.37575
G1 X121.951 Y148.887 E.12991
G1 X125.962 Y144.876 E.19203
G1 X125.962 Y148.714 E.12991
G1 X125.605 Y149.07 E.01708
; WIPE_START
G1 F8843.478
G1 X125.962 Y148.714 E-.1917
G1 X125.962 Y147.218 E-.5683
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.625 Y143.495 Z1.2 F30000
M73 P79 R1
G1 X137.69 Y140.665 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8447
M204 S6000
G1 X146.285 Y140.665 E.29096
G1 X146.285 Y149.26 E.29096
G1 X137.69 Y149.26 E.29096
G1 X137.69 Y140.725 E.28893
M204 S250
G1 X137.298 Y140.272 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8447
M204 S5000
G1 X146.678 Y140.272 E.2941
G1 X146.678 Y149.653 E.2941
G1 X137.298 Y149.653 E.2941
G1 X137.298 Y140.332 E.29222
; WIPE_START
G1 F9547.055
M204 S6000
G1 X139.297 Y140.32 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.855 Y144.497 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8447
M204 S6000
G1 X141.339 Y141.013 E.1668
G1 X145.177 Y141.013 E.12991
G1 X138.038 Y148.152 E.34176
G1 X138.038 Y148.912 E.02573
G1 X141.116 Y148.912 E.10418
G1 X145.937 Y144.091 E.23081
G1 X145.937 Y147.929 E.12991
G1 X144.77 Y149.095 E.05586
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X145.937 Y147.929 E-.62712
G1 X145.937 Y147.579 E-.13288
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/10
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 132
G1 X136.21 Y134.135
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X136.21 Y139.135 E.16924
G1 X127.815 Y139.135 E.28419
G1 X127.815 Y134.135 E.16924
G1 X122.815 Y134.135 E.16924
G1 X122.815 Y120.74 E.45343
G1 X126.21 Y120.74 E.11495
G1 X126.21 Y125.74 E.16924
G1 X137.815 Y125.74 E.39279
G1 X137.815 Y120.74 E.16924
G1 X141.21 Y120.74 E.11495
G1 X141.21 Y134.135 E.45343
G1 X136.27 Y134.135 E.16721
M204 S250
G1 X136.602 Y134.527 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X136.602 Y139.528 E.15677
G1 X127.422 Y139.528 E.28783
G1 X127.422 Y134.527 E.15677
G1 X122.422 Y134.527 E.15677
G1 X122.422 Y120.347 E.4446
G1 X126.602 Y120.347 E.13106
G1 X126.602 Y125.347 E.15677
G1 X137.422 Y125.347 E.33925
G1 X137.422 Y120.347 E.15677
G1 X141.602 Y120.347 E.13106
G1 X141.602 Y134.527 E.4446
G1 X136.662 Y134.527 E.15489
; WIPE_START
M204 S6000
G1 X136.638 Y136.527 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.059 Y129.289 Z1.4 F30000
G1 X140.668 Y124.478 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X138.54 Y122.35 E.10188
G1 X138.54 Y126.188 E.12991
G1 X140.485 Y128.133 E.09311
G1 X140.485 Y131.971 E.12991
G1 X134.979 Y126.465 E.26357
G1 X131.141 Y126.465 E.12991
G1 X138.086 Y133.41 E.33245
G1 X135.485 Y133.41 E.08804
G1 X135.485 Y134.647 E.04187
G1 X127.303 Y126.465 E.39167
G1 X125.485 Y126.465 E.06154
G1 X125.485 Y124.647 E.06154
G1 X123.54 Y122.702 E.09311
G1 X123.54 Y126.54 E.12991
G1 X135.41 Y138.41 E.56821
G1 X131.572 Y138.41 E.12991
G1 X128.54 Y135.378 E.14514
G1 X128.54 Y133.41 E.06661
G1 X126.572 Y133.41 E.06661
G1 X123.357 Y130.195 E.15391
; WIPE_START
G1 X124.771 Y131.609 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.189 Y127.478 Z1.4 F30000
G1 X140.848 Y121.262 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383589
G1 F10567.456
M204 S6000
G1 X140.82 Y121.13 E.00382
G1 X140.688 Y121.102 E.00382
G1 X138.337 Y121.102 E.06662
G1 X138.205 Y121.13 E.00382
G1 X138.177 Y121.262 E.00382
G1 X138.177 Y125.943 E.13261
G1 X138.15 Y126.075 E.00382
G1 X138.018 Y126.102 E.00382
G1 X126.007 Y126.102 E.34024
G1 X125.875 Y126.075 E.00382
G1 X125.848 Y125.943 E.00382
G1 X125.848 Y121.262 E.13261
G1 X125.82 Y121.13 E.00382
G1 X125.688 Y121.102 E.00382
G1 X123.337 Y121.102 E.06662
G1 X123.205 Y121.13 E.00382
G1 X123.177 Y121.262 E.00382
G1 X123.177 Y133.613 E.34989
G1 X123.205 Y133.745 E.00382
G1 X123.337 Y133.773 E.00382
G1 X128.018 Y133.773 E.13261
G1 X128.15 Y133.8 E.00382
G1 X128.177 Y133.932 E.00382
G1 X128.177 Y138.613 E.13261
G1 X128.205 Y138.745 E.00382
G1 X128.337 Y138.773 E.00382
M73 P80 R1
G1 X135.688 Y138.773 E.20825
G1 X135.82 Y138.745 E.00382
G1 X135.848 Y138.613 E.00382
G1 X135.848 Y133.932 E.13261
G1 X135.875 Y133.8 E.00382
G1 X136.007 Y133.773 E.00382
G1 X140.688 Y133.773 E.13261
G1 X140.82 Y133.745 E.00382
G1 X140.848 Y133.613 E.00382
G1 X140.848 Y121.322 E.34819
; WIPE_START
G1 X140.848 Y123.322 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.94 Y129.167 Z1.4 F30000
G1 X126.31 Y140.64 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X126.31 Y149.235 E.29096
G1 X117.715 Y149.235 E.29096
G1 X117.715 Y140.64 E.29096
G1 X126.25 Y140.64 E.28893
M204 S250
G1 X126.702 Y140.247 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X126.702 Y149.628 E.2941
G1 X117.322 Y149.628 E.2941
G1 X117.322 Y140.247 E.2941
G1 X126.642 Y140.247 E.29222
; WIPE_START
M204 S6000
G1 X126.655 Y142.247 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.92 Y141.03 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38346
G1 F10571.465
M204 S6000
G1 X125.788 Y141.002 E.00381
G1 X118.237 Y141.002 E.21384
G1 X118.105 Y141.03 E.00381
G1 X118.077 Y141.162 E.00381
G1 X118.077 Y148.713 E.21384
G1 X118.105 Y148.845 E.00381
G1 X118.237 Y148.873 E.00381
G1 X125.788 Y148.873 E.21384
G1 X125.92 Y148.845 E.00381
G1 X125.948 Y148.713 E.00381
G1 X125.948 Y141.162 E.21384
G1 X125.932 Y141.088 E.00212
M204 S10000
G1 X125.768 Y144.12 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X123.013 Y141.365 E.13188
G1 X119.175 Y141.365 E.12991
G1 X125.585 Y147.775 E.30684
G1 X125.585 Y148.51 E.02488
G1 X122.482 Y148.51 E.10503
G1 X118.44 Y144.468 E.1935
G1 X118.44 Y148.306 E.12991
G1 X118.827 Y148.693 E.01854
; WIPE_START
G1 X118.44 Y148.306 E-.20819
G1 X118.44 Y146.854 E-.55182
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.706 Y144.517 Z1.4 F30000
G1 X137.69 Y140.665 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M204 S6000
G1 X146.285 Y140.665 E.29096
G1 X146.285 Y149.26 E.29096
G1 X137.69 Y149.26 E.29096
G1 X137.69 Y140.725 E.28893
M204 S250
G1 X137.298 Y140.272 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X146.678 Y140.272 E.2941
G1 X146.678 Y149.653 E.2941
G1 X137.298 Y149.653 E.2941
G1 X137.298 Y140.332 E.29222
; WIPE_START
M204 S6000
G1 X139.297 Y140.32 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.232 Y145.07 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X141.697 Y148.535 E.16588
G1 X145.535 Y148.535 E.12991
G1 X138.415 Y141.39 E.34143
G1 X142.228 Y141.39 E.12906
G1 X145.743 Y144.905 E.16827
M204 S10000
G1 X138.052 Y148.738 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383492
G1 F10570.476
M204 S6000
G1 X138.08 Y148.87 E.00381
G1 X138.212 Y148.898 E.00381
G1 X145.763 Y148.898 E.21386
G1 X145.895 Y148.87 E.00381
G1 X145.923 Y148.738 E.00381
G1 X145.923 Y141.187 E.21386
G1 X145.895 Y141.055 E.00381
G1 X145.763 Y141.027 E.00381
G1 X138.212 Y141.027 E.21386
G1 X138.08 Y141.055 E.00381
G1 X138.052 Y141.187 E.00381
G1 X138.052 Y148.678 E.21216
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10570.476
G1 X138.052 Y146.678 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/10
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 132
G1 X136.21 Y134.135
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X136.21 Y139.135 E.16924
G1 X127.815 Y139.135 E.28419
G1 X127.815 Y134.135 E.16924
G1 X122.815 Y134.135 E.16924
G1 X122.815 Y120.74 E.45343
G1 X126.21 Y120.74 E.11495
G1 X126.21 Y125.74 E.16924
G1 X137.815 Y125.74 E.39279
G1 X137.815 Y120.74 E.16924
G1 X141.21 Y120.74 E.11495
G1 X141.21 Y134.135 E.45343
G1 X136.27 Y134.135 E.16721
M204 S250
G1 X136.602 Y134.527 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X136.602 Y139.528 E.15677
G1 X127.422 Y139.528 E.28783
G1 X127.422 Y134.527 E.15677
G1 X122.422 Y134.527 E.15677
G1 X122.422 Y120.347 E.4446
G1 X126.602 Y120.347 E.13106
G1 X126.602 Y125.347 E.15677
G1 X137.422 Y125.347 E.33925
G1 X137.422 Y120.347 E.15677
G1 X141.602 Y120.347 E.13106
G1 X141.602 Y134.527 E.4446
G1 X136.662 Y134.527 E.15489
M204 S10000
G1 X136.043 Y134.236 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40042
; LAYER_HEIGHT: 0.4
G1 F3000
M204 S6000
G1 X131.513 Y138.766 E.3354
G1 X132.15 Y138.766 E.03335
G1 X135.841 Y135.075 E.27325
G1 X135.841 Y135.712 E.03335
G1 X132.787 Y138.766 E.22608
G1 X133.424 Y138.766 E.03335
G1 X135.841 Y136.349 E.17892
G1 X135.841 Y136.986 E.03335
G1 X134.061 Y138.766 E.13176
G1 X134.698 Y138.766 E.03335
G1 X135.841 Y137.623 E.08459
G1 X135.841 Y138.26 E.03335
G1 X135.133 Y138.968 E.05242
; WIPE_START
G1 X135.841 Y138.26 E-.38051
G1 X135.841 Y137.623 E-.24206
G1 X135.585 Y137.879 E-.13743
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.133 Y133.968 Z1.6 F30000
G1 Z1.2
G1 E.8 F1800
G1 F3000
M204 S6000
M73 P81 R1
G1 X140.841 Y133.26 E.05242
G1 X140.841 Y132.623 E.03335
G1 X139.698 Y133.766 E.08459
G1 X139.061 Y133.766 E.03335
G1 X140.841 Y131.986 E.13176
G1 X140.841 Y131.349 E.03335
G1 X138.424 Y133.766 E.17892
G1 X137.787 Y133.766 E.03335
G1 X140.841 Y130.712 E.22608
G1 X140.841 Y130.075 E.03335
G1 X137.15 Y133.766 E.27325
G1 X136.513 Y133.766 E.03335
G1 X140.841 Y129.438 E.32041
G1 X140.841 Y128.801 E.03335
G1 X130.876 Y138.766 E.73778
G1 X130.239 Y138.766 E.03335
G1 X140.841 Y128.164 E.78494
G1 X140.841 Y127.527 E.03335
G1 X129.602 Y138.766 E.8321
G1 X128.965 Y138.766 E.03335
G1 X140.841 Y126.89 E.87927
G1 X140.841 Y126.253 E.03335
G1 X128.328 Y138.766 E.92643
G1 X128.184 Y138.766 E.00754
G1 X128.184 Y138.273 E.02581
G1 X140.841 Y125.616 E.93709
G1 X140.841 Y124.979 E.03335
G1 X128.184 Y137.636 E.93709
G1 X128.184 Y136.999 E.03335
G1 X140.841 Y124.342 E.93709
G1 X140.841 Y123.705 E.03335
G1 X128.184 Y136.362 E.93709
G1 X128.184 Y135.725 E.03335
G1 X140.841 Y123.068 E.93709
G1 X140.841 Y122.431 E.03335
G1 X138.184 Y125.088 E.19668
G1 X138.184 Y124.451 E.03335
G1 X140.841 Y121.794 E.19668
G1 X140.841 Y121.157 E.03335
G1 X138.184 Y123.814 E.19668
G1 X138.184 Y123.177 E.03335
G1 X140.252 Y121.109 E.15308
G1 X139.615 Y121.109 E.03335
G1 X138.184 Y122.54 E.10591
G1 X138.184 Y121.903 E.03335
G1 X138.978 Y121.109 E.05875
G1 X138.341 Y121.109 E.03335
G1 X137.982 Y121.468 E.02658
; WIPE_START
G1 X138.341 Y121.109 E-.19293
G1 X138.978 Y121.109 E-.24206
G1 X138.373 Y121.714 E-.32502
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.741 Y121.765 Z1.6 F30000
G1 X122.982 Y121.818 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F3000
M204 S6000
G1 X123.69 Y121.109 E.05244
G1 X124.327 Y121.109 E.03335
G1 X123.184 Y122.252 E.08461
G1 X123.184 Y122.889 E.03335
G1 X124.964 Y121.109 E.13177
G1 X125.601 Y121.109 E.03335
G1 X123.184 Y123.526 E.17894
G1 X123.184 Y124.163 E.03335
G1 X125.841 Y121.507 E.19668
G1 X125.841 Y122.144 E.03335
G1 X123.184 Y124.8 E.19668
G1 X123.184 Y125.437 E.03335
G1 X125.841 Y122.781 E.19668
G1 X125.841 Y123.418 E.03335
G1 X123.184 Y126.074 E.19668
G1 X123.184 Y126.711 E.03335
G1 X125.841 Y124.055 E.19668
G1 X125.841 Y124.692 E.03335
G1 X123.184 Y127.348 E.19668
G1 X123.184 Y127.985 E.03335
G1 X125.841 Y125.329 E.19668
M73 P82 R1
G1 X125.841 Y125.966 E.03335
G1 X123.184 Y128.622 E.19668
G1 X123.184 Y129.259 E.03335
G1 X126.334 Y126.109 E.2332
G1 X126.971 Y126.109 E.03335
G1 X123.184 Y129.896 E.28036
G1 X123.184 Y130.533 E.03335
G1 X127.608 Y126.109 E.32753
G1 X128.245 Y126.109 E.03335
G1 X123.184 Y131.17 E.37469
G1 X123.184 Y131.807 E.03335
G1 X128.882 Y126.109 E.42185
G1 X129.519 Y126.109 E.03335
G1 X123.184 Y132.444 E.46902
G1 X123.184 Y133.081 E.03335
G1 X130.156 Y126.109 E.51618
G1 X130.793 Y126.109 E.03335
G1 X123.184 Y133.718 E.56334
G1 X123.184 Y133.766 E.00251
G1 X123.773 Y133.766 E.03084
G1 X131.43 Y126.109 E.56689
G1 X132.067 Y126.109 E.03335
G1 X124.41 Y133.766 E.56689
G1 X125.047 Y133.766 E.03335
G1 X132.704 Y126.109 E.56689
G1 X133.341 Y126.109 E.03335
G1 X125.684 Y133.766 E.56689
G1 X126.321 Y133.766 E.03335
G1 X133.978 Y126.109 E.56689
G1 X134.615 Y126.109 E.03335
G1 X126.958 Y133.766 E.56689
G1 X127.595 Y133.766 E.03335
G1 X135.252 Y126.109 E.56689
G1 X135.889 Y126.109 E.03335
G1 X128.184 Y133.814 E.57044
G1 X128.184 Y134.451 E.03335
G1 X136.526 Y126.109 E.61761
G1 X137.163 Y126.109 E.03335
G1 X127.982 Y135.29 E.67976
; WIPE_START
G1 X129.396 Y133.876 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.31 Y140.64 Z1.6 F30000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X126.31 Y149.235 E.29096
G1 X117.715 Y149.235 E.29096
G1 X117.715 Y140.64 E.29096
G1 X126.25 Y140.64 E.28893
M204 S250
G1 X126.702 Y140.247 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X126.702 Y149.628 E.2941
G1 X117.322 Y149.628 E.2941
G1 X117.322 Y140.247 E.2941
G1 X126.642 Y140.247 E.29222
; WIPE_START
M204 S6000
G1 X126.655 Y142.247 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.037 Y141.79 Z1.6 F30000
G1 X117.882 Y141.72 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.4018
; LAYER_HEIGHT: 0.4
G1 F3000
M204 S6000
G1 X118.593 Y141.009 E.05302
G1 X119.232 Y141.009 E.03368
G1 X118.084 Y142.157 E.08556
G1 X118.084 Y142.796 E.03368
G1 X119.871 Y141.009 E.13319
G1 X120.51 Y141.009 E.03368
G1 X118.084 Y143.435 E.18083
G1 X118.084 Y144.074 E.03368
G1 X121.149 Y141.009 E.22846
G1 X121.788 Y141.009 E.03368
G1 X118.084 Y144.713 E.27609
G1 X118.084 Y145.352 E.03368
G1 X122.427 Y141.009 E.32373
G1 X123.066 Y141.009 E.03368
G1 X118.084 Y145.991 E.37136
G1 X118.084 Y146.63 E.03368
G1 X123.704 Y141.009 E.419
M73 P83 R1
G1 X124.343 Y141.009 E.03368
G1 X118.084 Y147.268 E.46663
G1 X118.084 Y147.907 E.03368
G1 X124.982 Y141.009 E.51427
G1 X125.621 Y141.009 E.03368
G1 X118.084 Y148.546 E.5619
G1 X118.084 Y148.866 E.01684
G1 X118.404 Y148.866 E.01685
G1 X125.941 Y141.329 E.56189
G1 X125.941 Y141.968 E.03368
G1 X119.043 Y148.866 E.51425
G1 X119.682 Y148.866 E.03368
G1 X125.941 Y142.607 E.46662
G1 X125.941 Y143.246 E.03368
G1 X120.321 Y148.866 E.41898
G1 X120.96 Y148.866 E.03368
G1 X125.941 Y143.885 E.37135
G1 X125.941 Y144.524 E.03368
G1 X121.599 Y148.866 E.32371
G1 X122.237 Y148.866 E.03368
G1 X125.941 Y145.163 E.27608
G1 X125.941 Y145.801 E.03368
G1 X122.876 Y148.866 E.22845
G1 X123.515 Y148.866 E.03368
G1 X125.941 Y146.44 E.18081
G1 X125.941 Y147.079 E.03368
G1 X124.154 Y148.866 E.13318
G1 X124.793 Y148.866 E.03368
G1 X125.941 Y147.718 E.08554
G1 X125.941 Y148.357 E.03368
G1 X125.23 Y149.068 E.05301
; WIPE_START
G1 X125.941 Y148.357 E-.38209
G1 X125.941 Y147.718 E-.2428
G1 X125.689 Y147.97 E-.13512
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.209 Y144.001 Z1.6 F30000
G1 X137.69 Y140.665 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
M204 S6000
G1 X146.285 Y140.665 E.29096
G1 X146.285 Y149.26 E.29096
G1 X137.69 Y149.26 E.29096
G1 X137.69 Y140.725 E.28893
M204 S250
G1 X137.298 Y140.272 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X146.678 Y140.272 E.2941
G1 X146.678 Y149.653 E.2941
G1 X137.298 Y149.653 E.2941
G1 X137.298 Y140.332 E.29222
; WIPE_START
M204 S6000
G1 X139.297 Y140.32 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.857 Y141.745 Z1.6 F30000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.4018
; LAYER_HEIGHT: 0.4
G1 F3000
M204 S6000
G1 X138.568 Y141.034 E.05302
G1 X139.207 Y141.034 E.03368
G1 X138.059 Y142.182 E.08556
G1 X138.059 Y142.821 E.03368
G1 X139.846 Y141.034 E.13319
G1 X140.485 Y141.034 E.03368
G1 X138.059 Y143.46 E.18083
G1 X138.059 Y144.099 E.03368
G1 X141.124 Y141.034 E.22846
G1 X141.763 Y141.034 E.03368
G1 X138.059 Y144.738 E.2761
G1 X138.059 Y145.377 E.03368
G1 X142.402 Y141.034 E.32373
G1 X143.041 Y141.034 E.03368
G1 X138.059 Y146.016 E.37136
G1 X138.059 Y146.655 E.03368
G1 X143.68 Y141.034 E.419
G1 X144.318 Y141.034 E.03368
G1 X138.059 Y147.293 E.46663
G1 X138.059 Y147.932 E.03368
G1 X144.957 Y141.034 E.51427
G1 X145.596 Y141.034 E.03368
G1 X138.059 Y148.571 E.5619
G1 X138.059 Y148.891 E.01684
G1 X138.379 Y148.891 E.01685
M73 P84 R1
G1 X145.916 Y141.354 E.56189
G1 X145.916 Y141.993 E.03368
G1 X139.018 Y148.891 E.51425
G1 X139.657 Y148.891 E.03368
G1 X145.916 Y142.632 E.46662
G1 X145.916 Y143.271 E.03368
G1 X140.296 Y148.891 E.41898
G1 X140.935 Y148.891 E.03368
G1 X145.916 Y143.91 E.37135
G1 X145.916 Y144.549 E.03368
G1 X141.574 Y148.891 E.32371
G1 X142.213 Y148.891 E.03368
G1 X145.916 Y145.188 E.27608
G1 X145.916 Y145.826 E.03368
G1 X142.852 Y148.891 E.22845
G1 X143.49 Y148.891 E.03368
G1 X145.916 Y146.465 E.18081
G1 X145.916 Y147.104 E.03368
G1 X144.129 Y148.891 E.13318
G1 X144.768 Y148.891 E.03368
G1 X145.916 Y147.743 E.08554
G1 X145.916 Y148.382 E.03368
G1 X145.205 Y149.093 E.053
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X145.916 Y148.382 E-.38208
G1 X145.916 Y147.743 E-.2428
G1 X145.664 Y147.995 E-.13512
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/10
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 132
G1 X136.21 Y134.135
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X136.21 Y139.135 E.16924
G1 X127.815 Y139.135 E.28419
G1 X127.815 Y134.135 E.16924
G1 X122.815 Y134.135 E.16924
G1 X122.815 Y120.74 E.45343
G1 X126.21 Y120.74 E.11495
G1 X126.21 Y125.74 E.16924
G1 X137.815 Y125.74 E.39279
G1 X137.815 Y120.74 E.16924
G1 X141.21 Y120.74 E.11495
G1 X141.21 Y134.135 E.45343
G1 X136.27 Y134.135 E.16721
M204 S250
G1 X136.602 Y134.527 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X136.602 Y139.528 E.15677
G1 X127.422 Y139.528 E.28783
G1 X127.422 Y134.527 E.15677
G1 X122.422 Y134.527 E.15677
G1 X122.422 Y120.347 E.4446
G1 X126.602 Y120.347 E.13106
G1 X126.602 Y125.347 E.15677
G1 X137.422 Y125.347 E.33925
G1 X137.422 Y120.347 E.15677
G1 X141.602 Y120.347 E.13106
G1 X141.602 Y134.527 E.4446
G1 X136.662 Y134.527 E.15489
; WIPE_START
M204 S6000
G1 X136.638 Y136.527 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.047 Y136.584 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42345
G1 F9460.489
M204 S6000
G1 X123.148 Y123.685 E.57721
G1 X123.148 Y124.223 E.01703
G1 X135.877 Y136.953 E.56962
G1 X135.877 Y137.491 E.01703
G1 X123.148 Y124.761 E.56962
G1 X123.148 Y125.299 E.01703
G1 X135.877 Y138.029 E.56962
G1 X135.877 Y138.567 E.01703
G1 X123.148 Y125.838 E.56962
G1 X123.148 Y126.376 E.01703
G1 X135.574 Y138.802 E.55606
G1 X135.036 Y138.802 E.01703
G1 X123.148 Y126.914 E.53198
G1 X123.148 Y127.452 E.01703
G1 X134.498 Y138.802 E.5079
G1 X133.96 Y138.802 E.01703
G1 X123.148 Y127.99 E.48381
G1 X123.148 Y128.528 E.01703
G1 X133.422 Y138.802 E.45973
G1 X132.883 Y138.802 E.01703
G1 X123.148 Y129.066 E.43565
G1 X123.148 Y129.605 E.01703
G1 X127.345 Y133.802 E.18783
G1 X126.807 Y133.802 E.01703
G1 X123.148 Y130.143 E.16375
G1 X123.148 Y130.681 E.01703
G1 X126.269 Y133.802 E.13967
G1 X125.731 Y133.802 E.01703
G1 X123.148 Y131.219 E.11559
G1 X123.148 Y131.757 E.01703
G1 X125.193 Y133.802 E.09151
G1 X124.655 Y133.802 E.01703
G1 X123.148 Y132.295 E.06743
G1 X123.148 Y132.834 E.01703
M73 P85 R1
G1 X124.116 Y133.802 E.04335
G1 X123.578 Y133.802 E.01703
G1 X122.978 Y133.202 E.02686
; WIPE_START
G1 X123.578 Y133.802 E-.32259
G1 X124.116 Y133.802 E-.2045
G1 X123.683 Y133.369 E-.23291
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.748 Y138.972 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
G1 F9460.489
M204 S6000
G1 X128.148 Y138.372 E.02686
G1 X128.148 Y137.834 E.01703
G1 X129.116 Y138.802 E.04335
G1 X129.655 Y138.802 E.01703
G1 X128.148 Y137.295 E.06743
G1 X128.148 Y136.757 E.01703
G1 X130.193 Y138.802 E.09151
G1 X130.731 Y138.802 E.01703
G1 X128.148 Y136.219 E.11559
G1 X128.148 Y135.681 E.01703
G1 X131.269 Y138.802 E.13967
G1 X131.807 Y138.802 E.01703
G1 X128.148 Y135.143 E.16375
G1 X128.148 Y134.605 E.01703
G1 X132.515 Y138.972 E.19543
M204 S10000
G1 X141.047 Y121.673 F30000
G1 F9460.489
M204 S6000
G1 X140.447 Y121.073 E.02684
G1 X139.909 Y121.073 E.01703
G1 X140.877 Y122.041 E.04333
G1 X140.877 Y122.579 E.01703
G1 X139.371 Y121.073 E.06741
G1 X138.833 Y121.073 E.01703
G1 X140.877 Y123.117 E.09149
G1 X140.877 Y123.656 E.01703
G1 X138.294 Y121.073 E.11558
G1 X138.148 Y121.073 E.00464
G1 X138.148 Y121.464 E.01239
G1 X140.877 Y124.194 E.12214
G1 X140.877 Y124.732 E.01703
G1 X138.148 Y122.002 E.12214
G1 X138.148 Y122.54 E.01703
G1 X140.877 Y125.27 E.12214
G1 X140.877 Y125.808 E.01703
G1 X138.148 Y123.079 E.12214
G1 X138.148 Y123.617 E.01703
G1 X140.877 Y126.346 E.12214
G1 X140.877 Y126.884 E.01703
G1 X138.148 Y124.155 E.12214
G1 X138.148 Y124.693 E.01703
G1 X140.877 Y127.423 E.12214
G1 X140.877 Y127.961 E.01703
G1 X138.148 Y125.231 E.12214
G1 X138.148 Y125.769 E.01703
G1 X140.877 Y128.499 E.12214
G1 X140.877 Y129.037 E.01703
G1 X137.913 Y126.073 E.13265
G1 X137.375 Y126.073 E.01703
G1 X140.877 Y129.575 E.15673
G1 X140.877 Y130.113 E.01703
G1 X136.837 Y126.073 E.18081
G1 X136.298 Y126.073 E.01703
G1 X140.877 Y130.652 E.20489
G1 X140.877 Y131.19 E.01703
G1 X135.76 Y126.073 E.22897
G1 X135.222 Y126.073 E.01703
G1 X140.877 Y131.728 E.25305
G1 X140.877 Y132.266 E.01703
G1 X134.684 Y126.073 E.27713
G1 X134.146 Y126.073 E.01703
G1 X140.877 Y132.804 E.30121
G1 X140.877 Y133.342 E.01703
G1 X133.608 Y126.073 E.32529
G1 X133.07 Y126.073 E.01703
G1 X140.799 Y133.802 E.34588
G1 X140.261 Y133.802 E.01703
G1 X132.531 Y126.073 E.34588
G1 X131.993 Y126.073 E.01703
G1 X139.723 Y133.802 E.34588
G1 X139.185 Y133.802 E.01703
G1 X131.455 Y126.073 E.34588
G1 X130.917 Y126.073 E.01703
G1 X138.646 Y133.802 E.34588
G1 X138.108 Y133.802 E.01703
G1 X130.379 Y126.073 E.34588
G1 X129.841 Y126.073 E.01703
G1 X137.57 Y133.802 E.34588
G1 X137.032 Y133.802 E.01703
G1 X129.302 Y126.073 E.34588
G1 X128.764 Y126.073 E.01703
G1 X136.494 Y133.802 E.34588
G1 X135.956 Y133.802 E.01703
G1 X128.226 Y126.073 E.34588
G1 X127.688 Y126.073 E.01703
G1 X135.877 Y134.262 E.36645
G1 X135.877 Y134.8 E.01703
G1 X127.15 Y126.073 E.39053
G1 X126.612 Y126.073 E.01703
G1 X135.877 Y135.338 E.41461
G1 X135.877 Y135.876 E.01703
G1 X123.148 Y123.147 E.56962
G1 X123.148 Y122.609 E.01703
G1 X125.877 Y125.338 E.12214
G1 X125.877 Y124.8 E.01703
G1 X123.148 Y122.07 E.12214
G1 X123.148 Y121.532 E.01703
G1 X125.877 Y124.262 E.12214
G1 X125.877 Y123.724 E.01703
G1 X123.226 Y121.073 E.11863
G1 X123.764 Y121.073 E.01703
G1 X125.877 Y123.186 E.09455
G1 X125.877 Y122.647 E.01703
G1 X124.302 Y121.073 E.07047
G1 X124.841 Y121.073 E.01703
G1 X125.877 Y122.109 E.04638
G1 X125.877 Y121.571 E.01703
G1 X125.209 Y120.903 E.0299
; WIPE_START
G1 X125.877 Y121.571 E-.35905
G1 X125.877 Y122.109 E-.2045
G1 X125.512 Y121.744 E-.19645
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.834 Y129.369 Z1.8 F30000
G1 X126.31 Y140.64 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X126.31 Y149.235 E.29096
G1 X117.715 Y149.235 E.29096
G1 X117.715 Y140.64 E.29096
G1 X126.25 Y140.64 E.28893
M204 S250
G1 X126.702 Y140.247 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P86 R1
G1 F9547.055
M204 S5000
G1 X126.702 Y149.628 E.2941
G1 X117.322 Y149.628 E.2941
G1 X117.322 Y140.247 E.2941
G1 X126.642 Y140.247 E.29222
; WIPE_START
M204 S6000
G1 X126.655 Y142.247 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.147 Y141.569 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42186
G1 F9500.185
M204 S6000
G1 X125.55 Y140.973 E.02658
G1 X125.014 Y140.973 E.01689
G1 X125.977 Y141.935 E.0429
G1 X125.977 Y142.471 E.01689
G1 X124.479 Y140.973 E.06678
G1 X123.943 Y140.973 E.01689
G1 X125.977 Y143.007 E.09066
G1 X125.977 Y143.543 E.01689
G1 X123.407 Y140.973 E.11454
G1 X122.871 Y140.973 E.01689
G1 X125.977 Y144.079 E.13842
G1 X125.977 Y144.615 E.01689
G1 X122.335 Y140.973 E.1623
G1 X121.799 Y140.973 E.01689
G1 X125.977 Y145.151 E.18618
G1 X125.977 Y145.687 E.01689
G1 X121.263 Y140.973 E.21006
G1 X120.727 Y140.973 E.01689
G1 X125.977 Y146.223 E.23394
G1 X125.977 Y146.759 E.01689
G1 X120.191 Y140.973 E.25782
G1 X119.655 Y140.973 E.01689
G1 X125.977 Y147.295 E.2817
G1 X125.977 Y147.83 E.01689
G1 X119.12 Y140.973 E.30558
G1 X118.584 Y140.973 E.01689
G1 X125.977 Y148.366 E.32946
G1 X125.977 Y148.902 E.01689
G1 X118.048 Y140.973 E.35334
G1 X118.048 Y141.509 E.01688
G1 X125.441 Y148.902 E.32947
G1 X124.905 Y148.902 E.01689
G1 X118.048 Y142.044 E.30559
G1 X118.048 Y142.58 E.01689
G1 X124.37 Y148.902 E.28171
G1 X123.834 Y148.902 E.01689
G1 X118.048 Y143.116 E.25783
G1 X118.048 Y143.652 E.01689
G1 X123.298 Y148.902 E.23395
G1 X122.762 Y148.902 E.01689
G1 X118.048 Y144.188 E.21007
G1 X118.048 Y144.724 E.01689
G1 X122.226 Y148.902 E.18619
G1 X121.69 Y148.902 E.01689
G1 X118.048 Y145.26 E.16231
G1 X118.048 Y145.796 E.01689
G1 X121.154 Y148.902 E.13843
G1 X120.618 Y148.902 E.01689
G1 X118.048 Y146.332 E.11455
G1 X118.048 Y146.868 E.01689
G1 X120.082 Y148.902 E.09067
G1 X119.546 Y148.902 E.01689
G1 X118.048 Y147.403 E.06679
G1 X118.048 Y147.939 E.01689
G1 X119.011 Y148.902 E.04291
G1 X118.475 Y148.902 E.01689
G1 X117.878 Y148.306 E.02659
; WIPE_START
G1 X118.475 Y148.902 E-.32065
G1 X119.011 Y148.902 E-.20364
G1 X118.572 Y148.464 E-.23571
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.639 Y145.581 Z1.8 F30000
G1 X137.69 Y140.665 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X146.285 Y140.665 E.29096
G1 X146.285 Y149.26 E.29096
G1 X137.69 Y149.26 E.29096
G1 X137.69 Y140.725 E.28893
M204 S250
G1 X137.298 Y140.272 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X146.678 Y140.272 E.2941
G1 X146.678 Y149.653 E.2941
G1 X137.298 Y149.653 E.2941
G1 X137.298 Y140.332 E.29222
; WIPE_START
M204 S6000
G1 X139.297 Y140.32 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.943 Y147.831 Z1.8 F30000
G1 X137.853 Y148.331 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42186
G1 F9500.185
M204 S6000
G1 X138.45 Y148.927 E.02659
G1 X138.986 Y148.927 E.01689
G1 X138.023 Y147.964 E.04291
G1 X138.023 Y147.428 E.01689
G1 X139.522 Y148.927 E.06679
G1 X140.057 Y148.927 E.01689
G1 X138.023 Y146.893 E.09067
G1 X138.023 Y146.357 E.01689
G1 X140.593 Y148.927 E.11455
G1 X141.129 Y148.927 E.01689
G1 X138.023 Y145.821 E.13843
G1 X138.023 Y145.285 E.01689
G1 X141.665 Y148.927 E.16231
G1 X142.201 Y148.927 E.01689
G1 X138.023 Y144.749 E.18619
G1 X138.023 Y144.213 E.01689
G1 X142.737 Y148.927 E.21007
G1 X143.273 Y148.927 E.01689
G1 X138.023 Y143.677 E.23395
G1 X138.023 Y143.141 E.01689
G1 X143.809 Y148.927 E.25783
G1 X144.345 Y148.927 E.01689
G1 X138.023 Y142.605 E.28171
G1 X138.023 Y142.069 E.01689
G1 X144.881 Y148.927 E.30559
G1 X145.416 Y148.927 E.01689
G1 X138.023 Y141.534 E.32947
G1 X138.023 Y140.998 E.01688
G1 X145.952 Y148.927 E.35334
G1 X145.952 Y148.391 E.01689
G1 X138.559 Y140.998 E.32946
G1 X139.095 Y140.998 E.01689
G1 X145.952 Y147.855 E.30558
G1 X145.952 Y147.32 E.01689
G1 X139.631 Y140.998 E.2817
G1 X140.166 Y140.998 E.01689
G1 X145.952 Y146.784 E.25782
G1 X145.952 Y146.248 E.01689
G1 X140.702 Y140.998 E.23394
G1 X141.238 Y140.998 E.01689
G1 X145.952 Y145.712 E.21006
M73 P87 R1
G1 X145.952 Y145.176 E.01689
G1 X141.774 Y140.998 E.18618
G1 X142.31 Y140.998 E.01689
G1 X145.952 Y144.64 E.1623
G1 X145.952 Y144.104 E.01689
G1 X142.846 Y140.998 E.13842
G1 X143.382 Y140.998 E.01689
G1 X145.952 Y143.568 E.11454
G1 X145.952 Y143.032 E.01689
G1 X143.918 Y140.998 E.09066
G1 X144.454 Y140.998 E.01689
G1 X145.952 Y142.496 E.06678
G1 X145.952 Y141.96 E.01689
G1 X144.99 Y140.998 E.0429
G1 X145.525 Y140.998 E.01689
G1 X146.122 Y141.594 E.02658
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9500.185
G1 X145.525 Y140.998 E-.32058
G1 X144.99 Y140.998 E-.20364
G1 X145.428 Y141.436 E-.23577
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/10
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 132
G1 X136.21 Y134.135
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X136.21 Y139.135 E.16924
G1 X127.815 Y139.135 E.28419
G1 X127.815 Y134.135 E.16924
G1 X122.815 Y134.135 E.16924
G1 X122.815 Y120.74 E.45343
G1 X126.21 Y120.74 E.11495
G1 X126.21 Y125.74 E.16924
G1 X137.815 Y125.74 E.39279
G1 X137.815 Y120.74 E.16924
G1 X141.21 Y120.74 E.11495
G1 X141.21 Y134.135 E.45343
G1 X136.27 Y134.135 E.16721
M204 S250
G1 X136.602 Y134.527 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X136.602 Y139.528 E.15677
G1 X127.422 Y139.528 E.28783
G1 X127.422 Y134.527 E.15677
G1 X122.422 Y134.527 E.15677
G1 X122.422 Y120.347 E.4446
G1 X126.602 Y120.347 E.13106
G1 X126.602 Y125.347 E.15677
G1 X137.422 Y125.347 E.33925
G1 X137.422 Y120.347 E.15677
G1 X141.602 Y120.347 E.13106
G1 X141.602 Y134.527 E.4446
G1 X136.662 Y134.527 E.15489
; WIPE_START
M204 S6000
G1 X136.638 Y136.527 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.047 Y133.202 Z2 F30000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42345
G1 F9460.489
M204 S6000
G1 X140.447 Y133.802 E.02684
G1 X139.909 Y133.802 E.01703
G1 X140.877 Y132.834 E.04333
G1 X140.877 Y132.296 E.01703
G1 X139.371 Y133.802 E.06741
G1 X138.833 Y133.802 E.01703
G1 X140.877 Y131.758 E.09149
G1 X140.877 Y131.219 E.01703
G1 X138.294 Y133.802 E.11557
G1 X137.756 Y133.802 E.01703
G1 X140.877 Y130.681 E.13966
G1 X140.877 Y130.143 E.01703
G1 X137.218 Y133.802 E.16374
G1 X136.68 Y133.802 E.01703
G1 X140.877 Y129.605 E.18782
G1 X140.877 Y129.067 E.01703
G1 X131.142 Y138.802 E.43564
G1 X131.68 Y138.802 E.01703
G1 X135.877 Y134.605 E.18782
G1 X135.877 Y135.143 E.01703
G1 X132.218 Y138.802 E.16374
G1 X132.756 Y138.802 E.01703
G1 X135.877 Y135.681 E.13966
G1 X135.877 Y136.219 E.01703
G1 X133.294 Y138.802 E.11557
G1 X133.833 Y138.802 E.01703
G1 X135.877 Y136.758 E.09149
G1 X135.877 Y137.296 E.01703
G1 X134.371 Y138.802 E.06741
G1 X134.909 Y138.802 E.01703
G1 X135.877 Y137.834 E.04333
G1 X135.877 Y138.372 E.01703
G1 X135.277 Y138.972 E.02684
; WIPE_START
G1 X135.877 Y138.372 E-.32239
G1 X135.877 Y137.834 E-.2045
G1 X135.443 Y138.268 E-.23311
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.899 Y130.775 Z2 F30000
G1 X138.816 Y120.903 Z2
G1 Z1.6
G1 E.8 F1800
G1 F9460.489
M204 S6000
G1 X138.148 Y121.572 E.02991
G1 X138.148 Y122.11 E.01703
G1 X139.185 Y121.073 E.0464
G1 X139.723 Y121.073 E.01703
G1 X138.148 Y122.648 E.07048
G1 X138.148 Y123.186 E.01703
G1 X140.261 Y121.073 E.09456
G1 X140.799 Y121.073 E.01703
G1 X138.148 Y123.724 E.11864
G1 X138.148 Y124.262 E.01703
G1 X140.877 Y121.533 E.12214
G1 X140.877 Y122.071 E.01703
G1 X138.148 Y124.8 E.12214
G1 X138.148 Y125.339 E.01703
G1 X140.877 Y122.609 E.12214
G1 X140.877 Y123.147 E.01703
G1 X128.148 Y135.877 E.56962
G1 X128.148 Y136.415 E.01703
G1 X140.877 Y123.685 E.56961
G1 X140.877 Y124.223 E.01703
G1 X128.148 Y136.953 E.56961
G1 X128.148 Y137.491 E.01703
G1 X140.877 Y124.762 E.56961
G1 X140.877 Y125.3 E.01703
G1 X128.148 Y138.029 E.56961
G1 X128.148 Y138.568 E.01703
G1 X140.877 Y125.838 E.56961
G1 X140.877 Y126.376 E.01703
G1 X128.451 Y138.802 E.55604
G1 X128.989 Y138.802 E.01703
G1 X140.877 Y126.914 E.53196
G1 X140.877 Y127.452 E.01703
G1 X129.527 Y138.802 E.50788
G1 X130.065 Y138.802 E.01703
G1 X140.877 Y127.991 E.4838
G1 X140.877 Y128.529 E.01703
G1 X130.434 Y138.972 E.46731
M204 S10000
M73 P88 R1
G1 X127.978 Y135.508 F30000
G1 F9460.489
M204 S6000
G1 X137.414 Y126.073 E.42222
G1 X136.875 Y126.073 E.01703
G1 X128.148 Y134.8 E.39054
G1 X128.148 Y134.262 E.01703
G1 X136.337 Y126.073 E.36646
G1 X135.799 Y126.073 E.01703
G1 X128.07 Y133.802 E.34588
G1 X127.531 Y133.802 E.01703
G1 X135.261 Y126.073 E.34588
G1 X134.723 Y126.073 E.01703
G1 X126.993 Y133.802 E.34588
G1 X126.455 Y133.802 E.01703
G1 X134.185 Y126.073 E.34588
G1 X133.647 Y126.073 E.01703
G1 X125.917 Y133.802 E.34588
G1 X125.379 Y133.802 E.01703
G1 X133.108 Y126.073 E.34588
G1 X132.57 Y126.073 E.01703
G1 X124.841 Y133.802 E.34588
G1 X124.302 Y133.802 E.01703
G1 X132.032 Y126.073 E.34588
G1 X131.494 Y126.073 E.01703
G1 X123.764 Y133.802 E.34588
G1 X123.226 Y133.802 E.01703
G1 X130.956 Y126.073 E.34588
G1 X130.418 Y126.073 E.01703
G1 X123.148 Y133.343 E.32531
G1 X123.148 Y132.804 E.01703
G1 X129.879 Y126.073 E.30123
G1 X129.341 Y126.073 E.01703
G1 X123.148 Y132.266 E.27715
G1 X123.148 Y131.728 E.01703
G1 X128.803 Y126.073 E.25307
G1 X128.265 Y126.073 E.01703
G1 X123.148 Y131.19 E.22899
G1 X123.148 Y130.652 E.01703
G1 X127.727 Y126.073 E.20491
G1 X127.189 Y126.073 E.01703
G1 X123.148 Y130.114 E.18083
G1 X123.148 Y129.576 E.01703
G1 X126.651 Y126.073 E.15674
G1 X126.112 Y126.073 E.01703
G1 X123.148 Y129.037 E.13266
G1 X123.148 Y128.499 E.01703
G1 X125.877 Y125.77 E.12214
G1 X125.877 Y125.232 E.01703
G1 X123.148 Y127.961 E.12214
G1 X123.148 Y127.423 E.01703
G1 X125.877 Y124.693 E.12214
G1 X125.877 Y124.155 E.01703
G1 X123.148 Y126.885 E.12214
G1 X123.148 Y126.347 E.01703
G1 X125.877 Y123.617 E.12214
G1 X125.877 Y123.079 E.01703
G1 X123.148 Y125.809 E.12214
G1 X123.148 Y125.27 E.01703
G1 X125.877 Y122.541 E.12214
G1 X125.877 Y122.003 E.01703
G1 X123.148 Y124.732 E.12214
G1 X123.148 Y124.194 E.01703
G1 X125.877 Y121.465 E.12214
G1 X125.877 Y121.073 E.0124
G1 X125.731 Y121.073 E.00463
G1 X123.148 Y123.656 E.11559
G1 X123.148 Y123.118 E.01703
G1 X125.193 Y121.073 E.09151
G1 X124.655 Y121.073 E.01703
G1 X123.148 Y122.58 E.06743
G1 X123.148 Y122.041 E.01703
G1 X124.116 Y121.073 E.04335
G1 X123.578 Y121.073 E.01703
G1 X122.978 Y121.673 E.02686
; WIPE_START
G1 X123.578 Y121.073 E-.32261
G1 X124.116 Y121.073 E-.2045
G1 X123.683 Y121.506 E-.2329
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.721 Y129.068 Z2 F30000
G1 X126.31 Y140.64 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X126.31 Y149.235 E.29096
G1 X117.715 Y149.235 E.29096
G1 X117.715 Y140.64 E.29096
G1 X126.25 Y140.64 E.28893
M204 S250
G1 X126.702 Y140.247 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X126.702 Y149.628 E.2941
G1 X117.322 Y149.628 E.2941
G1 X117.322 Y140.247 E.2941
G1 X126.642 Y140.247 E.29222
; WIPE_START
M204 S6000
G1 X126.655 Y142.247 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.144 Y140.893 Z2 F30000
G1 X118.644 Y140.803 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42186
G1 F9500.185
M204 S6000
G1 X118.048 Y141.4 E.02659
G1 X118.048 Y141.936 E.01689
G1 X119.011 Y140.973 E.04291
G1 X119.546 Y140.973 E.01689
G1 X118.048 Y142.472 E.06679
G1 X118.048 Y143.007 E.01689
G1 X120.082 Y140.973 E.09067
G1 X120.618 Y140.973 E.01689
G1 X118.048 Y143.543 E.11455
G1 X118.048 Y144.079 E.01689
G1 X121.154 Y140.973 E.13843
G1 X121.69 Y140.973 E.01689
G1 X118.048 Y144.615 E.16231
G1 X118.048 Y145.151 E.01689
G1 X122.226 Y140.973 E.18619
G1 X122.762 Y140.973 E.01689
G1 X118.048 Y145.687 E.21007
G1 X118.048 Y146.223 E.01689
G1 X123.298 Y140.973 E.23395
G1 X123.834 Y140.973 E.01689
G1 X118.048 Y146.759 E.25783
G1 X118.048 Y147.295 E.01689
G1 X124.37 Y140.973 E.28171
G1 X124.905 Y140.973 E.01689
G1 X118.048 Y147.831 E.30559
G1 X118.048 Y148.366 E.01689
G1 X125.441 Y140.973 E.32947
G1 X125.977 Y140.973 E.01688
G1 X118.048 Y148.902 E.35334
G1 X118.584 Y148.902 E.01689
G1 X125.977 Y141.509 E.32946
M73 P89 R1
G1 X125.977 Y142.045 E.01689
G1 X119.12 Y148.902 E.30558
G1 X119.655 Y148.902 E.01689
G1 X125.977 Y142.58 E.2817
G1 X125.977 Y143.116 E.01689
G1 X120.191 Y148.902 E.25782
G1 X120.727 Y148.902 E.01689
G1 X125.977 Y143.652 E.23394
G1 X125.977 Y144.188 E.01689
G1 X121.263 Y148.902 E.21006
G1 X121.799 Y148.902 E.01689
G1 X125.977 Y144.724 E.18618
G1 X125.977 Y145.26 E.01689
G1 X122.335 Y148.902 E.1623
G1 X122.871 Y148.902 E.01689
G1 X125.977 Y145.796 E.13842
G1 X125.977 Y146.332 E.01689
G1 X123.407 Y148.902 E.11454
G1 X123.943 Y148.902 E.01689
G1 X125.977 Y146.868 E.09066
G1 X125.977 Y147.404 E.01689
G1 X124.479 Y148.902 E.06678
G1 X125.014 Y148.902 E.01689
G1 X125.977 Y147.94 E.0429
G1 X125.977 Y148.475 E.01689
G1 X125.381 Y149.072 E.02658
; WIPE_START
G1 X125.977 Y148.475 E-.32058
G1 X125.977 Y147.94 E-.20364
G1 X125.538 Y148.378 E-.23577
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.982 Y144.288 Z2 F30000
G1 X137.69 Y140.665 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X146.285 Y140.665 E.29096
G1 X146.285 Y149.26 E.29096
G1 X137.69 Y149.26 E.29096
G1 X137.69 Y140.725 E.28893
M204 S250
G1 X137.298 Y140.272 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X146.678 Y140.272 E.2941
G1 X146.678 Y149.653 E.2941
G1 X137.298 Y149.653 E.2941
G1 X137.298 Y140.332 E.29222
; WIPE_START
M204 S6000
G1 X139.297 Y140.32 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.619 Y140.828 Z2 F30000
M73 P89 R0
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42186
G1 F9500.185
M204 S6000
G1 X138.023 Y141.425 E.02659
G1 X138.023 Y141.961 E.01689
G1 X138.986 Y140.998 E.04291
G1 X139.522 Y140.998 E.01689
G1 X138.023 Y142.497 E.06679
G1 X138.023 Y143.032 E.01689
G1 X140.057 Y140.998 E.09067
G1 X140.593 Y140.998 E.01689
G1 X138.023 Y143.568 E.11455
G1 X138.023 Y144.104 E.01689
G1 X141.129 Y140.998 E.13843
G1 X141.665 Y140.998 E.01689
G1 X138.023 Y144.64 E.16231
G1 X138.023 Y145.176 E.01689
G1 X142.201 Y140.998 E.18619
G1 X142.737 Y140.998 E.01689
G1 X138.023 Y145.712 E.21007
G1 X138.023 Y146.248 E.01689
G1 X143.273 Y140.998 E.23395
G1 X143.809 Y140.998 E.01689
G1 X138.023 Y146.784 E.25783
G1 X138.023 Y147.32 E.01689
G1 X144.345 Y140.998 E.28171
G1 X144.881 Y140.998 E.01689
G1 X138.023 Y147.856 E.30559
G1 X138.023 Y148.391 E.01689
G1 X145.416 Y140.998 E.32947
G1 X145.952 Y140.998 E.01688
G1 X138.023 Y148.927 E.35334
G1 X138.559 Y148.927 E.01689
G1 X145.952 Y141.534 E.32946
G1 X145.952 Y142.07 E.01689
G1 X139.095 Y148.927 E.30558
G1 X139.631 Y148.927 E.01689
G1 X145.952 Y142.605 E.2817
G1 X145.952 Y143.141 E.01689
G1 X140.166 Y148.927 E.25782
G1 X140.702 Y148.927 E.01689
G1 X145.952 Y143.677 E.23394
G1 X145.952 Y144.213 E.01689
G1 X141.238 Y148.927 E.21006
G1 X141.774 Y148.927 E.01689
G1 X145.952 Y144.749 E.18618
G1 X145.952 Y145.285 E.01689
G1 X142.31 Y148.927 E.1623
G1 X142.846 Y148.927 E.01689
G1 X145.952 Y145.821 E.13842
G1 X145.952 Y146.357 E.01689
G1 X143.382 Y148.927 E.11454
G1 X143.918 Y148.927 E.01689
G1 X145.952 Y146.893 E.09066
G1 X145.952 Y147.429 E.01689
G1 X144.454 Y148.927 E.06678
G1 X144.99 Y148.927 E.01689
G1 X145.952 Y147.965 E.0429
G1 X145.952 Y148.5 E.01689
G1 X145.356 Y149.097 E.02658
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9500.185
G1 X145.952 Y148.5 E-.32058
G1 X145.952 Y147.965 E-.20364
G1 X145.514 Y148.403 E-.23578
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/10
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 132
G1 X136.21 Y134.135
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X136.21 Y139.135 E.16924
G1 X127.815 Y139.135 E.28419
G1 X127.815 Y134.135 E.16924
G1 X122.815 Y134.135 E.16924
G1 X122.815 Y120.74 E.45343
G1 X126.21 Y120.74 E.11495
G1 X126.21 Y125.74 E.16924
G1 X137.815 Y125.74 E.39279
G1 X137.815 Y120.74 E.16924
G1 X141.21 Y120.74 E.11495
G1 X141.21 Y134.135 E.45343
G1 X136.27 Y134.135 E.16721
M204 S250
G1 X136.602 Y134.527 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X136.602 Y139.528 E.15677
G1 X127.422 Y139.528 E.28783
G1 X127.422 Y134.527 E.15677
G1 X122.422 Y134.527 E.15677
G1 X122.422 Y120.347 E.4446
G1 X126.602 Y120.347 E.13106
M73 P90 R0
G1 X126.602 Y125.347 E.15677
G1 X137.422 Y125.347 E.33925
G1 X137.422 Y120.347 E.15677
G1 X141.602 Y120.347 E.13106
G1 X141.602 Y134.527 E.4446
G1 X136.662 Y134.527 E.15489
; WIPE_START
M204 S6000
G1 X136.638 Y136.527 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.047 Y136.584 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42345
G1 F9460.489
M204 S6000
G1 X123.148 Y123.685 E.57721
G1 X123.148 Y124.223 E.01703
G1 X135.877 Y136.953 E.56962
G1 X135.877 Y137.491 E.01703
G1 X123.148 Y124.761 E.56962
G1 X123.148 Y125.299 E.01703
G1 X135.877 Y138.029 E.56962
G1 X135.877 Y138.567 E.01703
G1 X123.148 Y125.838 E.56962
G1 X123.148 Y126.376 E.01703
G1 X135.574 Y138.802 E.55606
G1 X135.036 Y138.802 E.01703
G1 X123.148 Y126.914 E.53198
G1 X123.148 Y127.452 E.01703
G1 X134.498 Y138.802 E.5079
G1 X133.96 Y138.802 E.01703
G1 X123.148 Y127.99 E.48381
G1 X123.148 Y128.528 E.01703
G1 X133.422 Y138.802 E.45973
G1 X132.883 Y138.802 E.01703
G1 X123.148 Y129.066 E.43565
G1 X123.148 Y129.605 E.01703
G1 X127.345 Y133.802 E.18783
G1 X126.807 Y133.802 E.01703
G1 X123.148 Y130.143 E.16375
G1 X123.148 Y130.681 E.01703
G1 X126.269 Y133.802 E.13967
G1 X125.731 Y133.802 E.01703
G1 X123.148 Y131.219 E.11559
G1 X123.148 Y131.757 E.01703
G1 X125.193 Y133.802 E.09151
G1 X124.655 Y133.802 E.01703
G1 X123.148 Y132.295 E.06743
G1 X123.148 Y132.834 E.01703
G1 X124.116 Y133.802 E.04335
G1 X123.578 Y133.802 E.01703
G1 X122.978 Y133.202 E.02686
; WIPE_START
G1 X123.578 Y133.802 E-.32259
G1 X124.116 Y133.802 E-.2045
G1 X123.683 Y133.369 E-.23291
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.748 Y138.972 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
G1 F9460.489
M204 S6000
G1 X128.148 Y138.372 E.02686
G1 X128.148 Y137.834 E.01703
G1 X129.116 Y138.802 E.04335
G1 X129.655 Y138.802 E.01703
G1 X128.148 Y137.295 E.06743
G1 X128.148 Y136.757 E.01703
G1 X130.193 Y138.802 E.09151
G1 X130.731 Y138.802 E.01703
G1 X128.148 Y136.219 E.11559
G1 X128.148 Y135.681 E.01703
G1 X131.269 Y138.802 E.13967
G1 X131.807 Y138.802 E.01703
G1 X128.148 Y135.143 E.16375
G1 X128.148 Y134.605 E.01703
G1 X132.515 Y138.972 E.19543
M204 S10000
G1 X141.047 Y121.673 F30000
G1 F9460.489
M204 S6000
G1 X140.447 Y121.073 E.02684
G1 X139.909 Y121.073 E.01703
G1 X140.877 Y122.041 E.04333
G1 X140.877 Y122.579 E.01703
G1 X139.371 Y121.073 E.06741
G1 X138.833 Y121.073 E.01703
G1 X140.877 Y123.117 E.09149
G1 X140.877 Y123.656 E.01703
G1 X138.294 Y121.073 E.11558
G1 X138.148 Y121.073 E.00464
G1 X138.148 Y121.464 E.01239
G1 X140.877 Y124.194 E.12214
G1 X140.877 Y124.732 E.01703
G1 X138.148 Y122.002 E.12214
G1 X138.148 Y122.54 E.01703
G1 X140.877 Y125.27 E.12214
G1 X140.877 Y125.808 E.01703
G1 X138.148 Y123.079 E.12214
G1 X138.148 Y123.617 E.01703
G1 X140.877 Y126.346 E.12214
G1 X140.877 Y126.884 E.01703
G1 X138.148 Y124.155 E.12214
G1 X138.148 Y124.693 E.01703
G1 X140.877 Y127.423 E.12214
G1 X140.877 Y127.961 E.01703
G1 X138.148 Y125.231 E.12214
G1 X138.148 Y125.769 E.01703
G1 X140.877 Y128.499 E.12214
G1 X140.877 Y129.037 E.01703
G1 X137.913 Y126.073 E.13265
G1 X137.375 Y126.073 E.01703
G1 X140.877 Y129.575 E.15673
G1 X140.877 Y130.113 E.01703
G1 X136.837 Y126.073 E.18081
G1 X136.298 Y126.073 E.01703
G1 X140.877 Y130.652 E.20489
G1 X140.877 Y131.19 E.01703
G1 X135.76 Y126.073 E.22897
G1 X135.222 Y126.073 E.01703
G1 X140.877 Y131.728 E.25305
G1 X140.877 Y132.266 E.01703
G1 X134.684 Y126.073 E.27713
G1 X134.146 Y126.073 E.01703
G1 X140.877 Y132.804 E.30121
G1 X140.877 Y133.342 E.01703
G1 X133.608 Y126.073 E.32529
G1 X133.07 Y126.073 E.01703
G1 X140.799 Y133.802 E.34588
G1 X140.261 Y133.802 E.01703
G1 X132.531 Y126.073 E.34588
G1 X131.993 Y126.073 E.01703
G1 X139.723 Y133.802 E.34588
G1 X139.185 Y133.802 E.01703
G1 X131.455 Y126.073 E.34588
M73 P91 R0
G1 X130.917 Y126.073 E.01703
G1 X138.646 Y133.802 E.34588
G1 X138.108 Y133.802 E.01703
G1 X130.379 Y126.073 E.34588
G1 X129.841 Y126.073 E.01703
G1 X137.57 Y133.802 E.34588
G1 X137.032 Y133.802 E.01703
G1 X129.302 Y126.073 E.34588
G1 X128.764 Y126.073 E.01703
G1 X136.494 Y133.802 E.34588
G1 X135.956 Y133.802 E.01703
G1 X128.226 Y126.073 E.34588
G1 X127.688 Y126.073 E.01703
G1 X135.877 Y134.262 E.36645
G1 X135.877 Y134.8 E.01703
G1 X127.15 Y126.073 E.39053
G1 X126.612 Y126.073 E.01703
G1 X135.877 Y135.338 E.41461
G1 X135.877 Y135.876 E.01703
G1 X123.148 Y123.147 E.56962
G1 X123.148 Y122.609 E.01703
G1 X125.877 Y125.338 E.12214
G1 X125.877 Y124.8 E.01703
G1 X123.148 Y122.07 E.12214
G1 X123.148 Y121.532 E.01703
G1 X125.877 Y124.262 E.12214
G1 X125.877 Y123.724 E.01703
G1 X123.226 Y121.073 E.11863
G1 X123.764 Y121.073 E.01703
G1 X125.877 Y123.186 E.09455
G1 X125.877 Y122.647 E.01703
G1 X124.302 Y121.073 E.07047
G1 X124.841 Y121.073 E.01703
G1 X125.877 Y122.109 E.04638
G1 X125.877 Y121.571 E.01703
G1 X125.209 Y120.903 E.0299
; WIPE_START
G1 X125.877 Y121.571 E-.35905
G1 X125.877 Y122.109 E-.2045
G1 X125.512 Y121.744 E-.19645
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.834 Y129.369 Z2.2 F30000
G1 X126.31 Y140.64 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X126.31 Y149.235 E.29096
G1 X117.715 Y149.235 E.29096
G1 X117.715 Y140.64 E.29096
G1 X126.25 Y140.64 E.28893
M204 S250
G1 X126.702 Y140.247 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X126.702 Y149.628 E.2941
G1 X117.322 Y149.628 E.2941
G1 X117.322 Y140.247 E.2941
G1 X126.642 Y140.247 E.29222
; WIPE_START
M204 S6000
G1 X126.655 Y142.247 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.147 Y141.569 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42186
G1 F9500.185
M204 S6000
G1 X125.55 Y140.973 E.02658
G1 X125.014 Y140.973 E.01689
G1 X125.977 Y141.935 E.0429
G1 X125.977 Y142.471 E.01689
G1 X124.479 Y140.973 E.06678
G1 X123.943 Y140.973 E.01689
G1 X125.977 Y143.007 E.09066
G1 X125.977 Y143.543 E.01689
G1 X123.407 Y140.973 E.11454
G1 X122.871 Y140.973 E.01689
G1 X125.977 Y144.079 E.13842
G1 X125.977 Y144.615 E.01689
G1 X122.335 Y140.973 E.1623
G1 X121.799 Y140.973 E.01689
G1 X125.977 Y145.151 E.18618
G1 X125.977 Y145.687 E.01689
G1 X121.263 Y140.973 E.21006
G1 X120.727 Y140.973 E.01689
G1 X125.977 Y146.223 E.23394
G1 X125.977 Y146.759 E.01689
G1 X120.191 Y140.973 E.25782
G1 X119.655 Y140.973 E.01689
G1 X125.977 Y147.295 E.2817
G1 X125.977 Y147.83 E.01689
G1 X119.12 Y140.973 E.30558
G1 X118.584 Y140.973 E.01689
G1 X125.977 Y148.366 E.32946
G1 X125.977 Y148.902 E.01689
G1 X118.048 Y140.973 E.35334
G1 X118.048 Y141.509 E.01688
G1 X125.441 Y148.902 E.32947
G1 X124.905 Y148.902 E.01689
G1 X118.048 Y142.044 E.30559
G1 X118.048 Y142.58 E.01689
G1 X124.37 Y148.902 E.28171
G1 X123.834 Y148.902 E.01689
G1 X118.048 Y143.116 E.25783
G1 X118.048 Y143.652 E.01689
G1 X123.298 Y148.902 E.23395
G1 X122.762 Y148.902 E.01689
G1 X118.048 Y144.188 E.21007
G1 X118.048 Y144.724 E.01689
G1 X122.226 Y148.902 E.18619
G1 X121.69 Y148.902 E.01689
G1 X118.048 Y145.26 E.16231
G1 X118.048 Y145.796 E.01689
G1 X121.154 Y148.902 E.13843
G1 X120.618 Y148.902 E.01689
G1 X118.048 Y146.332 E.11455
G1 X118.048 Y146.868 E.01689
G1 X120.082 Y148.902 E.09067
G1 X119.546 Y148.902 E.01689
G1 X118.048 Y147.403 E.06679
G1 X118.048 Y147.939 E.01689
G1 X119.011 Y148.902 E.04291
G1 X118.475 Y148.902 E.01689
G1 X117.878 Y148.306 E.02659
; WIPE_START
G1 X118.475 Y148.902 E-.32065
G1 X119.011 Y148.902 E-.20364
G1 X118.572 Y148.464 E-.23571
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.639 Y145.581 Z2.2 F30000
G1 X137.69 Y140.665 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X146.285 Y140.665 E.29096
G1 X146.285 Y149.26 E.29096
G1 X137.69 Y149.26 E.29096
G1 X137.69 Y140.725 E.28893
M204 S250
G1 X137.298 Y140.272 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X146.678 Y140.272 E.2941
G1 X146.678 Y149.653 E.2941
G1 X137.298 Y149.653 E.2941
G1 X137.298 Y140.332 E.29222
; WIPE_START
M204 S6000
G1 X139.297 Y140.32 E-.76
; WIPE_END
M73 P92 R0
G1 E-.04 F1800
M204 S10000
G1 X137.943 Y147.831 Z2.2 F30000
G1 X137.853 Y148.331 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42186
G1 F9500.185
M204 S6000
G1 X138.45 Y148.927 E.02659
G1 X138.986 Y148.927 E.01689
G1 X138.023 Y147.964 E.04291
G1 X138.023 Y147.428 E.01689
G1 X139.522 Y148.927 E.06679
G1 X140.057 Y148.927 E.01689
G1 X138.023 Y146.893 E.09067
G1 X138.023 Y146.357 E.01689
G1 X140.593 Y148.927 E.11455
G1 X141.129 Y148.927 E.01689
G1 X138.023 Y145.821 E.13843
G1 X138.023 Y145.285 E.01689
G1 X141.665 Y148.927 E.16231
G1 X142.201 Y148.927 E.01689
G1 X138.023 Y144.749 E.18619
G1 X138.023 Y144.213 E.01689
G1 X142.737 Y148.927 E.21007
G1 X143.273 Y148.927 E.01689
G1 X138.023 Y143.677 E.23395
G1 X138.023 Y143.141 E.01689
G1 X143.809 Y148.927 E.25783
G1 X144.345 Y148.927 E.01689
G1 X138.023 Y142.605 E.28171
G1 X138.023 Y142.069 E.01689
G1 X144.881 Y148.927 E.30559
G1 X145.416 Y148.927 E.01689
G1 X138.023 Y141.534 E.32947
G1 X138.023 Y140.998 E.01688
G1 X145.952 Y148.927 E.35334
G1 X145.952 Y148.391 E.01689
G1 X138.559 Y140.998 E.32946
G1 X139.095 Y140.998 E.01689
G1 X145.952 Y147.855 E.30558
G1 X145.952 Y147.32 E.01689
G1 X139.631 Y140.998 E.2817
G1 X140.166 Y140.998 E.01689
G1 X145.952 Y146.784 E.25782
G1 X145.952 Y146.248 E.01689
G1 X140.702 Y140.998 E.23394
G1 X141.238 Y140.998 E.01689
G1 X145.952 Y145.712 E.21006
G1 X145.952 Y145.176 E.01689
G1 X141.774 Y140.998 E.18618
G1 X142.31 Y140.998 E.01689
G1 X145.952 Y144.64 E.1623
G1 X145.952 Y144.104 E.01689
G1 X142.846 Y140.998 E.13842
G1 X143.382 Y140.998 E.01689
G1 X145.952 Y143.568 E.11454
G1 X145.952 Y143.032 E.01689
G1 X143.918 Y140.998 E.09066
G1 X144.454 Y140.998 E.01689
G1 X145.952 Y142.496 E.06678
G1 X145.952 Y141.96 E.01689
G1 X144.99 Y140.998 E.0429
G1 X145.525 Y140.998 E.01689
G1 X146.122 Y141.594 E.02658
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9500.185
G1 X145.525 Y140.998 E-.32058
G1 X144.99 Y140.998 E-.20364
G1 X145.428 Y141.436 E-.23577
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/10
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 132
G1 X136.602 Y134.527
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X136.602 Y139.528 E.15677
G1 X127.422 Y139.528 E.28783
G1 X127.422 Y134.527 E.15677
G1 X122.422 Y134.527 E.15677
G1 X122.422 Y120.347 E.4446
G1 X126.602 Y120.347 E.13106
G1 X126.602 Y125.347 E.15677
G1 X137.422 Y125.347 E.33925
G1 X137.422 Y120.347 E.15677
G1 X141.602 Y120.347 E.13106
G1 X141.602 Y134.527 E.4446
G1 X136.662 Y134.527 E.15489
; WIPE_START
M204 S6000
G1 X136.638 Y136.527 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.945 Y139.32 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X136.395 Y138.87 E.01994
G1 X136.395 Y138.337
G1 X135.412 Y139.32 E.04359
G1 X134.879 Y139.32
G1 X136.395 Y137.804 E.06724
G1 X136.395 Y137.271
G1 X134.346 Y139.32 E.09088
G1 X133.812 Y139.32
G1 X136.395 Y136.737 E.11453
G1 X136.395 Y136.204
G1 X133.279 Y139.32 E.13817
G1 X132.746 Y139.32
G1 X136.395 Y135.671 E.16182
G1 X136.395 Y135.138
G1 X132.212 Y139.32 E.18546
G1 X131.679 Y139.32
G1 X136.395 Y134.604 E.20911
; WIPE_START
M204 S6000
G1 X134.981 Y136.018 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.945 Y134.32 Z2.4 F30000
G1 Z2
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X141.395 Y133.87 E.01994
G1 X141.395 Y133.337
G1 X140.412 Y134.32 E.04359
G1 X139.879 Y134.32
G1 X141.395 Y132.804 E.06723
G1 X141.395 Y132.271
G1 X139.346 Y134.32 E.09088
G1 X138.812 Y134.32
G1 X141.395 Y131.737 E.11453
G1 X141.395 Y131.204
G1 X138.279 Y134.32 E.13817
G1 X137.746 Y134.32
G1 X141.395 Y130.671 E.16182
G1 X141.395 Y130.138
G1 X137.213 Y134.32 E.18546
G1 X136.679 Y134.32
G1 X141.395 Y129.604 E.20911
G1 X141.395 Y129.071
G1 X131.146 Y139.32 E.45446
G1 X130.613 Y139.32
G1 X141.395 Y128.538 E.47811
G1 X141.395 Y128.005
G1 X130.079 Y139.32 E.50175
G1 X129.546 Y139.32
G1 X141.395 Y127.471 E.5254
M73 P93 R0
G1 X141.395 Y126.938
G1 X129.013 Y139.32 E.54904
G1 X128.48 Y139.32
G1 X141.395 Y126.405 E.57269
G1 X141.395 Y125.871
G1 X127.946 Y139.32 E.59634
G1 X127.63 Y139.103
G1 X141.395 Y125.338 E.61037
G1 X141.395 Y124.805
G1 X127.63 Y138.57 E.61037
G1 X127.63 Y138.037
G1 X141.395 Y124.272 E.61037
G1 X141.395 Y123.738
G1 X127.63 Y137.504 E.61037
G1 X127.63 Y136.97
G1 X141.395 Y123.205 E.61037
G1 X141.395 Y122.672
G1 X127.63 Y136.437 E.61037
G1 X127.63 Y135.904
G1 X141.395 Y122.139 E.61037
G1 X141.395 Y121.605
G1 X137.63 Y125.371 E.16696
G1 X137.63 Y124.837
G1 X141.395 Y121.072 E.16696
G1 X141.379 Y120.555
G1 X137.63 Y124.304 E.16625
G1 X137.63 Y123.771
G1 X140.846 Y120.555 E.1426
G1 X140.313 Y120.555
G1 X137.63 Y123.238 E.11896
G1 X137.63 Y122.704
G1 X139.779 Y120.555 E.09531
G1 X139.246 Y120.555
G1 X137.63 Y122.171 E.07167
G1 X137.63 Y121.638
G1 X138.713 Y120.555 E.04802
G1 X138.18 Y120.555
G1 X137.63 Y121.105 E.02438
; WIPE_START
M204 S6000
G1 X138.18 Y120.555 E-.29544
G1 X138.713 Y120.555 E-.20264
G1 X138.225 Y121.042 E-.26192
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.446 Y125.555 Z2.4 F30000
G1 Z2
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X127.63 Y135.371 E.43525
G1 X127.63 Y134.837
G1 X136.912 Y125.555 E.4116
G1 X136.379 Y125.555
G1 X127.614 Y134.32 E.38867
G1 X127.081 Y134.32
G1 X135.846 Y125.555 E.38867
G1 X135.313 Y125.555
G1 X126.547 Y134.32 E.38867
G1 X126.014 Y134.32
G1 X134.779 Y125.555 E.38867
G1 X134.246 Y125.555
G1 X125.481 Y134.32 E.38867
G1 X124.948 Y134.32
G1 X133.713 Y125.555 E.38867
G1 X133.18 Y125.555
G1 X124.414 Y134.32 E.38867
G1 X123.881 Y134.32
G1 X132.646 Y125.555 E.38867
G1 X132.113 Y125.555
G1 X123.348 Y134.32 E.38867
G1 X122.815 Y134.32
G1 X131.58 Y125.555 E.38867
G1 X131.047 Y125.555
G1 X122.63 Y133.972 E.37321
G1 X122.63 Y133.438
G1 X130.513 Y125.555 E.34957
G1 X129.98 Y125.555
G1 X122.63 Y132.905 E.32592
G1 X122.63 Y132.372
G1 X129.447 Y125.555 E.30227
G1 X128.914 Y125.555
G1 X122.63 Y131.839 E.27863
G1 X122.63 Y131.305
G1 X128.38 Y125.555 E.25498
G1 X127.847 Y125.555
G1 X122.63 Y130.772 E.23134
G1 X122.63 Y130.239
G1 X127.314 Y125.555 E.20769
G1 X126.78 Y125.555
G1 X122.63 Y129.706 E.18405
G1 X122.63 Y129.172
M73 P94 R0
G1 X126.395 Y125.407 E.16696
G1 X126.395 Y124.874
G1 X122.63 Y128.639 E.16696
G1 X122.63 Y128.106
G1 X126.395 Y124.341 E.16696
G1 X126.395 Y123.807
G1 X122.63 Y127.572 E.16696
G1 X122.63 Y127.039
G1 X126.395 Y123.274 E.16696
G1 X126.395 Y122.741
G1 X122.63 Y126.506 E.16696
G1 X122.63 Y125.973
G1 X126.395 Y122.207 E.16696
G1 X126.395 Y121.674
G1 X122.63 Y125.439 E.16696
G1 X122.63 Y124.906
G1 X126.395 Y121.141 E.16696
G1 X126.395 Y120.608
G1 X122.63 Y124.373 E.16696
G1 X122.63 Y123.84
G1 X125.915 Y120.555 E.14566
G1 X125.381 Y120.555
G1 X122.63 Y123.306 E.12201
G1 X122.63 Y122.773
G1 X124.848 Y120.555 E.09836
G1 X124.315 Y120.555
G1 X122.63 Y122.24 E.07472
G1 X122.63 Y121.707
G1 X123.782 Y120.555 E.05107
G1 X123.248 Y120.555
G1 X122.63 Y121.173 E.02743
; WIPE_START
M204 S6000
G1 X123.248 Y120.555 E-.33241
G1 X123.782 Y120.555 E-.20264
G1 X123.363 Y120.973 E-.22496
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.65 Y123.244 Z2.4 F30000
G1 X137.7 Y125.441 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.152238
G1 F15000
M204 S6000
G3 X137.516 Y125.625 I-.23 J-.046 E.00251
; WIPE_START
G1 X137.611 Y125.586 E-.28328
G1 X137.661 Y125.536 E-.19342
G1 X137.7 Y125.441 E-.2833
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.018 Y130.537 Z2.4 F30000
G1 X127.702 Y134.408 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.103442
G1 F15000
M204 S6000
G1 X127.639 Y134.521 E.00065
; LINE_WIDTH: 0.0867904
G1 X127.625 Y134.516 E.00006
; LINE_WIDTH: 0.0614104
G1 X127.611 Y134.511 E.00002
; WIPE_START
G1 X127.625 Y134.516 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.652 Y133.994 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.125152
G1 F15000
M204 S6000
G1 X122.652 Y134.339 E.00236
; WIPE_START
G1 X122.652 Y133.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.702 Y140.247 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X126.702 Y149.628 E.2941
G1 X117.322 Y149.628 E.2941
G1 X117.322 Y140.247 E.2941
G1 X126.642 Y140.247 E.29222
; WIPE_START
M204 S6000
G1 X126.655 Y142.247 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.845 Y149.42 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X126.495 Y148.77 E.02881
G1 X126.495 Y148.237
G1 X125.312 Y149.42 E.05246
G1 X124.779 Y149.42
G1 X126.495 Y147.704 E.0761
G1 X126.495 Y147.171
G1 X124.246 Y149.42 E.09975
G1 X123.712 Y149.42
G1 X126.495 Y146.637 E.12339
G1 X126.495 Y146.104
G1 X123.179 Y149.42 E.14704
G1 X122.646 Y149.42
G1 X126.495 Y145.571 E.17069
G1 X126.495 Y145.038
G1 X122.112 Y149.42 E.19433
G1 X121.579 Y149.42
G1 X126.495 Y144.504 E.21798
G1 X126.495 Y143.971
G1 X121.046 Y149.42 E.24162
G1 X120.513 Y149.42
G1 X126.495 Y143.438 E.26527
G1 X126.495 Y142.905
M73 P95 R0
G1 X119.979 Y149.42 E.28891
G1 X119.446 Y149.42
G1 X126.495 Y142.371 E.31256
G1 X126.495 Y141.838
G1 X118.913 Y149.42 E.3362
G1 X118.38 Y149.42
G1 X126.495 Y141.305 E.35985
G1 X126.495 Y140.771
G1 X117.846 Y149.42 E.38349
G1 X117.53 Y149.203
G1 X126.278 Y140.455 E.38793
G1 X125.745 Y140.455
G1 X117.53 Y148.67 E.36428
G1 X117.53 Y148.137
G1 X125.212 Y140.455 E.34064
G1 X124.679 Y140.455
G1 X117.53 Y147.604 E.31699
G1 X117.53 Y147.07
G1 X124.145 Y140.455 E.29335
G1 X123.612 Y140.455
G1 X117.53 Y146.537 E.2697
G1 X117.53 Y146.004
G1 X123.079 Y140.455 E.24606
G1 X122.546 Y140.455
G1 X117.53 Y145.471 E.22241
G1 X117.53 Y144.937
G1 X122.012 Y140.455 E.19876
G1 X121.479 Y140.455
G1 X117.53 Y144.404 E.17512
G1 X117.53 Y143.871
G1 X120.946 Y140.455 E.15147
G1 X120.413 Y140.455
G1 X117.53 Y143.338 E.12783
G1 X117.53 Y142.804
G1 X119.879 Y140.455 E.10418
G1 X119.346 Y140.455
G1 X117.53 Y142.271 E.08054
G1 X117.53 Y141.738
G1 X118.813 Y140.455 E.05689
G1 X118.28 Y140.455
G1 X117.53 Y141.205 E.03325
; WIPE_START
M204 S6000
G1 X118.28 Y140.455 E-.40292
G1 X118.813 Y140.455 E-.20264
G1 X118.525 Y140.742 E-.15444
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.155 Y140.551 Z2.4 F30000
G1 X137.298 Y140.272 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F9547.055
M204 S5000
G1 X146.678 Y140.272 E.2941
G1 X146.678 Y149.653 E.2941
G1 X137.298 Y149.653 E.2941
G1 X137.298 Y140.332 E.29222
; WIPE_START
M204 S6000
G1 X139.297 Y140.32 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.14 Y146.219 Z2.4 F30000
G1 X146.47 Y149.059 Z2.4
M73 P96 R0
G1 Z2
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X146.084 Y149.445 E.01712
G1 X145.551 Y149.445
G1 X146.47 Y148.526 E.04077
G1 X146.47 Y147.993
G1 X145.018 Y149.445 E.06441
G1 X144.484 Y149.445
G1 X146.47 Y147.459 E.08806
G1 X146.47 Y146.926
G1 X143.951 Y149.445 E.1117
G1 X143.418 Y149.445
G1 X146.47 Y146.393 E.13535
G1 X146.47 Y145.859
G1 X142.885 Y149.445 E.15899
G1 X142.351 Y149.445
G1 X146.47 Y145.326 E.18264
G1 X146.47 Y144.793
G1 X141.818 Y149.445 E.20628
G1 X141.285 Y149.445
G1 X146.47 Y144.26 E.22993
G1 X146.47 Y143.726
G1 X140.751 Y149.445 E.25358
G1 X140.218 Y149.445
G1 X146.47 Y143.193 E.27722
G1 X146.47 Y142.66
G1 X139.685 Y149.445 E.30087
G1 X139.152 Y149.445
G1 X146.47 Y142.127 E.32451
G1 X146.47 Y141.593
G1 X138.618 Y149.445 E.34816
G1 X138.085 Y149.445
G1 X146.47 Y141.06 E.3718
G1 X146.47 Y140.527
G1 X137.552 Y149.445 E.39545
G1 X137.505 Y148.959
G1 X145.984 Y140.48 E.37597
G1 X145.451 Y140.48
G1 X137.505 Y148.426 E.35233
G1 X137.505 Y147.892
G1 X144.917 Y140.48 E.32868
G1 X144.384 Y140.48
G1 X137.505 Y147.359 E.30504
G1 X137.505 Y146.826
G1 X143.851 Y140.48 E.28139
G1 X143.318 Y140.48
G1 X137.505 Y146.293 E.25775
G1 X137.505 Y145.759
G1 X142.784 Y140.48 E.2341
G1 X142.251 Y140.48
G1 X137.505 Y145.226 E.21046
G1 X137.505 Y144.693
G1 X141.718 Y140.48 E.18681
G1 X141.185 Y140.48
G1 X137.505 Y144.16 E.16316
G1 X137.505 Y143.626
G1 X140.651 Y140.48 E.13952
G1 X140.118 Y140.48
G1 X137.505 Y143.093 E.11587
G1 X137.505 Y142.56
G1 X139.585 Y140.48 E.09223
G1 X139.052 Y140.48
G1 X137.505 Y142.027 E.06858
G1 X137.505 Y141.493
G1 X138.518 Y140.48 E.04494
G1 X137.985 Y140.48
G1 X137.505 Y140.96 E.02129
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F9547.055
M204 S6000
G1 X137.985 Y140.48 E-.25804
G1 X138.518 Y140.48 E-.20264
G1 X137.961 Y141.037 E-.29933
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F30000
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z2.5 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
G1 Y265
G1 X100 F12000 ; wipe
M621 S255
M104 S0 ; turn off hotend

M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
    M400 ; wait all motion done
    M991 S0 P-1 ;end smooth timelapse at safe pos
    M400 S3 ;wait for last picture to be taken
M623; end of "timelapse_record_flag"

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z102 F600
    G1 Z100

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

