
# 3D-printed propeller described in Ning, Z., *Experimental
# investigations on the aerodynamic and aeroacoustic characteristics of
# small UAS propellers*, Sec. 5.2.

Rtip = 0.75              # (m) Radius of blade tip
Rhub = Rtip/20           # (m) Radius of hub
B = 3                                   # Number of blades

# r/R c/R
chorddist = [0.0411523 0.121011;
				0.0685871 0.138171;
				0.0953361 0.151606;
				0.11797 0.165882;
				0.13786 0.177835;
				0.155693 0.190637;
				0.176269 0.207756;
				0.200274 0.230173;
				0.223594 0.252897;
				0.250343 0.267229;
				0.27572 0.280099;
				0.300412 0.282223;
				0.324417 0.275304;
				0.349794 0.263336;
				0.378601 0.252652;
				0.415638 0.238941;
				0.455418 0.223489;
				0.497257 0.210163;
				0.532922 0.201348;
				0.576818 0.192606;
				0.611111 0.185022;
				0.652263 0.175149;
				0.688615 0.168555;
				0.766804 0.150161;
				0.844307 0.133579;
				0.921811 0.115642;
				1.0 0.0978361]

# r/R twist (deg)
pitchdist = [0.0411523 16.4567;
				0.0685871 17.5;
				0.0953361 18.5172;
				0.11797 19.3779;
				0.13786 20.1343;
				0.155693 20.8124;
				0.176269 21.5948;
				0.200274 22.5077;
				0.223594 23.3945;
				0.250343 24.4117;
				0.27572 25.3767;
				0.300412 26.2712;
				0.324417 24.7195;
				0.349794 23.3106;
				0.378601 21.9402;
				0.415638 20.4574;
				0.455418 19.1334;
				0.497257 17.9695;
				0.532922 17.1216;
				0.576818 16.222;
				0.611111 15.6091;
				0.652263 14.9587;
				0.688615 14.4488;
				0.766804 13.5159;
				0.844307 12.7617;
				0.921811 12.1344;
				1.0 11.6]

# r/R y/R (y-distance of LE from the middle point of hub)
sweepdist = [0.0411523 0.0576211;
				0.0685871 0.0605955;
				0.0953361 0.0613242;
				0.11797 0.0643022;
				0.13786 0.0657848;
				0.155693 0.0680176;
				0.176269 0.0724946;
				0.200274 0.0792152;
				0.223594 0.0866851;
				0.250343 0.0904087;
				0.27572 0.0933846;
				0.300412 0.0933662;
				0.324417 0.0925995;
				0.349794 0.0888368;
				0.378601 0.086569;
				0.415638 0.0827976;
				0.455418 0.0775267;
				0.497257 0.073003;
				0.532922 0.0707301;
				0.576818 0.0677023;
				0.611111 0.0654304;
				0.652263 0.0624047;
				0.688615 0.0601313;
				0.766804 0.0533341;
				0.844307 0.0472862;
				0.921811 0.0419871;
				1.0 0.0344412]

# r/R z/R  (height of leading edge from top face of hub)
heightdist = [0.0686391 -0.00242965;
				0.2 0.00728895;
				0.249704 0.0121483;
				0.299408 0.0097186;
				0.350296 0.00364448;
				0.455621 -0.00607413;
				0.533728 -0.0097186;
				0.611834 -0.0121483;
				0.688757 -0.0157927;
				0.766864 -0.0182224;
				0.84497 -0.020652;
				0.921893 -0.0230817;
				1.0 -0.0242965]

airfoil_file = "e63.csv"
airfoil_file_r = "e856-il.csv"
polar_file = "xf-e63-il-50000-n5.csv"
polar_file_r = "xf-e856-il-50000-n5.csv"

x,y = vlm.vtk.readcontour(airfoil_file;
                            delim=",", path=joinpath(data_path, "airfoils"))
airfoil = hcat(x,y)

x,y = vlm.vtk.readcontour(airfoil_file_r;
				            delim=",", path=joinpath(data_path, "airfoils"))
airfoil_root = hcat(x,y)

# Airfoils along the blade as
# airfoil_contours=[ (pos1, contour1, polar1), (pos2, contour2, pol2), ...]
# with contour=(x,y) and pos the position from root to tip between 0 and 1.
# pos1 must equal 0 (root airfoil) and the last must be 1 (tip airfoil)
airfoil_contours = [
                     (0, airfoil_root, polar_file_r),
                     (0.3, airfoil, polar_file),
                     (1, airfoil, polar_file)
                   ]
