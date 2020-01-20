#################################################################################
###### 28-09-16                                                            ######
###### Calculate connectivity                                              ######
###### Calculates connectivity from get_short_paths_vX.pl considering TF effect #
###### Arguments:                                                          ######
###### [0]> get_short_paths_vX.pl output                                   ######
###### [1]> GU_assembly output dir                                         ######
###### [2]> enzyme_count_effect.pl                                         ######
###### [3]> Output file                                                    ######
###### [4]> Effect (+/-, for all use get_connectivity_v1.pl)               ######
###### Output:                                                             ######
###### [1]> GU name                                                        ######
###### [2]> Total enzymes with connectivity                                ######
###### [3]> Enzymes with connectivity                                      ######
###### History:                                                            ######
#################################################################################

$time=localtime();

#Get args
$infile=$ARGV[0];
$gu_dir=$ARGV[1];
$f_effect=$ARGV[2];
$outfile=$ARGV[3];
$effect=$ARGV[4];
chomp($effect);

undef %connectivity;

#Open files
open(IN,$infile) || die "Cannot open IN file at $infile.\n";
open(OUT,">$outfile") || die "Cannot open OUT file at $outfile\n";
print OUT"# From get_connectivity.pl on $time\n# Input = $infile / $gu_dir \n";

while(<IN>){
  if($_=~/^([^\t]+)\t([^\t]+)\t/){   #read short_paths
    $TF=$1;                          
    $path=$2;
    
    #Open GU_assembly files
    $mods=$gu_dir . $TF . "/modification.txt";

    @rxns=split(/\/\//,$path);           #split TF reactions

    foreach $rx (@rxns){

      #Find modifiers
      open(MOD,$mods) || die "Cannot open MOD at $mods.\n";    #look for catalysts
      while(<MOD>){
	if($_=~/^$rx\tCATALYSIS\t([^\t]+)$/i){
	  $mod=$1;
	  chomp($mod);

	  #Exclude modifiers under different regulatory effect.
	  open(EFF,$f_effect) || die "Cannot open EFF at $f_effect.\n";
	  while(<EFF>){
	    if($_=~/^$TF\t\d+\t\d+\t([^\t]+)\t\d+\t\d+\t([^\t]+)/){
	      $activation=$1;
	      $repression=$2;
	      chomp($repression);
	      last;
	    }
	  }
	  close(EFF);
	  if($effect eq "+"){
	    @f_enzymes=split(/,/,$activation);
	  }elsif($effect eq "-"){
	    @f_enzymes=split(/,/,$repression);
	  }else{
	    die "Effect was nos specified correctly. Please enter + for activationor - for repression.\n For all regulation use get_connectivity_v1.pl\n.";
	  }

	  $flag_eff=0;
	  foreach $fez (@f_enzymes){
	    if($mod eq $fez){
	      $flag_eff=1;
	      last;
	    }
	  }

	  if(!($flag_eff)){
	    next;
	  }

	  #Monomers
	  #Evaluate if modifier is already in vector
	  $rp=&repeats($mod,\@{$connectivity{$TF}});
	  if(!($rp)){
	    push(@{$connectivity{$TF}},$mod);
	  }
	}
      }
      close(MOD);

    }
    ##Print TFs with no connectivity for easier data handling of all GUs
  }elsif($_=~/^([^\t]+)\t\t\t/){
    print OUT"$1\t0\t\n";
  }
}
close(IN);


#Print total modifiers.

foreach $ft (keys %connectivity){
  $size=(@{$connectivity{$ft}});
  print OUT"$ft\t$size\t";
  foreach $m (@{$connectivity{$ft}}){
    print OUT"$m,";
  }
  print OUT"\n";
}




###########################
### repeats Function
###
### Finds if a value is already present in a vector
### -Input arguments:
###  [0] - value
###  [1] - vector
### -Returned values: 0 if absent; 1 if present
###########################


sub repeats{

  local($val,@vector,$elem)=($_[0],@{$_[1]},"");
  
  foreach $elem (@vector){
    if($elem eq $val){
      return(1);
    }
  }

  return(0);
}





