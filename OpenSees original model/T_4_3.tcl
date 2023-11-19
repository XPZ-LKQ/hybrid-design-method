wipe
model BasicBuilder -ndm 3 -ndf 6


source RCF_4_3.tcl
puts "GEO ok"

source M_4_3.tcl
puts "Mass ok"

source L_4_3.tcl
puts "Load ok"

recorder Node -file Disp_RCF_4_3.txt -time -node  408 -dof 3  disp

constraints Transformation;  
numberer RCM;	
system SparseSYM;
test NormDispIncr 1.0e-2 200 2; 	
algorithm NewtonLineSearch 0.75
integrator LoadControl 0.05;
analysis Static
analyze 20
puts "ANALYSIS OK"
loadConst -time 0.0;  


pattern Plain 2 Constant {
}



set xDamp 0.05;					# damping ratio ,按照规范取值
set MpropSwitch 1.0;
set KcurrSwitch 0.0;
set KcommSwitch 1.0;
set KinitSwitch 0.0;
set nEigenI 1;		# mode 1
set nEigenJ 3;		# mode 3
set lambdaI   32.8  
set lambdaJ   46
set omegaI [expr pow($lambdaI,0.5)];
set omegaJ [expr pow($lambdaJ,0.5)];
set alphaM [expr $MpropSwitch*$xDamp*(2*$omegaI*$omegaJ)/($omegaI+$omegaJ)];	# M-prop. damping; D = alphaM*M
set betaKcurr [expr $KcurrSwitch*2.*$xDamp/($omegaI+$omegaJ)];         		# current-K;      +beatKcurr*KCurrent
set betaKcomm [expr $KcommSwitch*2.*$xDamp/($omegaI+$omegaJ)];   		# last-committed K;   +betaKcomm*KlastCommitt
set betaKinit [expr $KinitSwitch*2.*$xDamp/($omegaI+$omegaJ)];         			# initial-K;     +beatKinit*Kini
# define damping
rayleigh $alphaM $betaKcurr $betaKinit $betaKcomm; 				# RAYLEIGH damping




constraints Transformation;     				
numberer RCM;					
system SparseSYM;				
test NormDispIncr 1.0e-3 200 2;
algorithm KrylovNewton
integrator Newmark 0.5 0.25
analysis Transient

remove element 308


set dt 0.005;
set Total_T 0.0;

while {$Total_T<=5.0} {

#Quit when dt is too small
if {$dt < 1e-4} {
return -1
}; # end if

set ok [analyze 1 $dt]		
# ----------------------------------------------if convergence failure-------------------------
if {$ok != 0} {
# if analysis fails, we try some other stuff

# try algorithm
if {$ok != 0} {
puts "Trying NewtonLineSearch .."
algorithm NewtonLineSearch 0.75
set ok [analyze 1 $dt]
}

# try test
if {$ok != 0} {
puts "Trying Incr .."
test NormDispIncr 1.0e-3 200 2			
set ok [analyze 1 $dt]
}

# try algorithm and test
if {$ok != 0} {
puts "Trying NewtonLineSearch and Incr"
test NormDispIncr 1.0e-3 200 2
algorithm NewtonLineSearch 0.75					
set ok [analyze 1 $dt]
} 

# try last test
if {$ok != 0} {
puts "Trying Incr .."
test NormDispIncr 1.0e-2 200 2			
set ok [analyze 1 $dt]
test NormDispIncr 1.0e-3 200 2
}

#try integrator 
if {$ok != 0} {
puts "Trying integrator .."
integrator HHT 0.9		
set ok [analyze 1 $dt]
}

# try dt
if {$ok != 0} {
puts "Change dt"
set dt [expr	$dt/10.0]
set ok [analyze 1 $dt]
}

# Quit	
if {$ok != 0} {
return -1
}; # end if		
}; # end if

set Total_T [expr $Total_T+$dt]
#puts "Analysis_time is $Total_T"
# -----------------------------------------------------------------------------------------------------
};


