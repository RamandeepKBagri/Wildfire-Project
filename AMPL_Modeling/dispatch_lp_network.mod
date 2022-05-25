
###############################################################################
# Sets used to define the problem                                             #
###############################################################################
set I;			 # nodes;
set Ig;				# set with generation
set K;			# lines or flowgates;
set G;			# generation


##############################################################################
#set Scenarios := {1,...27};                                                  #
##############################################################################

###############################################################################
# Parameters                                                                  #
###############################################################################
param cost{G,I}; 			# marginal production cost
param load{I};			# demand by periods;
param Tcap{K};				# transmission capacity
param PTDF{K,I};			# power transfer distribution factor
param pcap{G,I};				# transmission
param Kc;					# Kc value

###############################################################################
# Variables in the problem                                                    #
###############################################################################
var y{G,I} >=0; 				# output decisions
var z{I};					# injection or withdraw at node i
var flow{K};				# line power flows


###############################################################################
# Model                                                                       #
###############################################################################


minimize tcost: 
	sum{i in I,g in G} cost[g,i]*y[g,i];
	
subject to ptdf_equality{k in K}:
	flow[k] = sum{i in I} PTDF[k,i]*z[i];
		
subject to net_injection{i in I}:
	sum{g in G} y[g,i] - load[i] = z[i];
	
subject to cap{i in I,g in G}:
    y[g,i] - pcap[g,i] <=0;

subject to hub_balance:
	sum{i in I} z[i] = 0;	

subject to flowcap1{k in K}:
	- Kc*Tcap[k] <= flow[k] <= Kc*Tcap[k];

	
	
	
	
		 	