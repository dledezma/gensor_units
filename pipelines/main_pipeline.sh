#GU_assembly on TFs
perl ~/perl_scripts/gu_assembly_v4.pl d ~/datasets/input_files/Transcription_Factors.txt ~/datasets/GUs_raw_files/ ~/datasets/input_files/

#Compare super-reactions to choose appropriate allowed steps 
perl ~/perl_scripts/secondary_reaction_comparison.pl ~/datasets/GUs_raw_files/ [temporal directory] [temporal directory] [temporal file] ~/datasets/results/SRs_comparison.txt 

#Add super_reactions (9 allowed steps)
perl ~/perl_scripts/add_secondary_reactions_v4.pl ~/datasets/GUs_raw_files/ ~/datasets/GUs_secondary_reactions/ ~/datasets/results/counts_secondary_reactions.txt 9

#Enzyme counts
perl ~/perl_scripts/enzyme_count_v2.pl ~/datasets/GUs_secondary_reactions/ ~/datasets/results/enzyme_counts.txt

#Catalysis reactions counts (for metadata)
perl ~/perl_scripts/get_catalysis_reactions.pl ~/datasets/GUs_secondary_reactions/ ~/datasets/results/catalysis_reactions.txt

#Get all short paths (for components)
perl ~/perl_scripts/get_short_paths_v3.pl ~/datasets/GUs_secondary_reactions/ ~/datasets/results/all_short_paths.txt 0

#Get components
perl ~/perl_scripts/find_components.pl ~/datasets/results/all_short_paths.txt ~/datasets/results/components.txt

#Get short paths (for connectivity)
perl ~/perl_scripts/get_short_paths_v3.pl ~/datasets/GUs_secondary_reactions/ ~/datasets/results/short_paths_conn.txt 1

#Get connectivity 
perl ~/perl_scripts/get_connectivity_v1.pl ~/datasets/results/short_paths_conn.txt ~/datasets/GUs_secondary_reactions/ ~/datasets/results/connectivity.txt

#Get feedback
perl ~/perl_scripts/find_feedback.pl ~/datasets/results/all_short_paths.txt ~/datasets/GUs_secondary_reactions/ ~/datasets/results/feedback.txt

#Get summary
perl ~/perl_scripts/get_summary.pl ~/datasets/results/ ~/datasets/input_files/Transcription_Factors.txt ~/datasets/results/summary.txt

