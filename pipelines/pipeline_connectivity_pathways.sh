#Obtain GUs
#perl /Users/Daniela/Documents/PhD/Codigos/2017_2/gu_assembly_groups.pl d /Users/Daniela/Documents/PhD/Colaboraciones/Misha/pathways/pathway_groups/ /Users/Daniela/Documents/PhD/Colaboraciones/Misha/pathways/raw_GUs/ /Users/Daniela/Documents/PhD/Codigos/2016_2/GU_assembly/mesh/

#Compare super-reactions
#perl /Users/Daniela/Documents/PhD_2/Codigos/2016-1/super_reaction_comparison.pl /Users/Daniela/Documents/PhD/Colaboraciones/Misha/pathways/raw_GUs/ /Users/Daniela/Desktop/Temporal/tempi/tempi1/ /Users/Daniela/Desktop/Temporal/tempi/tempi2/ /Users/Daniela/Desktop/Temporal/tempi1.txt /Users/Daniela/Documents/PhD/Colaboraciones/Misha/pathways/results/SRs_comparison.txt

#Add super reactions
#perl /Users/Daniela/Documents/PhD/Codigos/2016_2/add_super_reactions_v4.pl /Users/Daniela/Documents/PhD/Colaboraciones/Misha/pathways/raw_GUs/ /Users/Daniela/Documents/PhD/Colaboraciones/Misha/pathways/GUs_SRs/ /Users/Daniela/Documents/PhD/Colaboraciones/Misha/pathways/results/SRs_counts.txt 7

#Get catalysis reactions
#perl /Users/Daniela/Documents/PhD/Codigos/2016_2/get_catalysis_reactions.pl /Users/Daniela/Documents/PhD/Colaboraciones/Misha/pathways/GUs_SRs/ /Users/Daniela/Documents/PhD/Colaboraciones/Misha/pathways/results/catalysis_rxns.txt

#Enzyme counts
#perl /Users/Daniela/Documents/PhD/Codigos/2016_2/enzyme_count_v2.pl /Users/Daniela/Documents/PhD/Colaboraciones/Misha/pathways/GUs_SRs/ /Users/Daniela/Documents/PhD/Colaboraciones/Misha/pathways/results/enzyme_counts.txt

#Get all short paths
perl /Users/Daniela/Documents/PhD/Codigos/2017_2/get_short_paths_v6_laury.pl /Users/Daniela/Documents/PhD/Colaboraciones/Misha/pathways/GUs_SRs/ /Users/Daniela/Documents/PhD/Colaboraciones/Misha/pathways/results/all_short_paths.txt 0

#Get short paths (for connectivity)
perl /Users/Daniela/Documents/PhD/Codigos/2017_2/get_short_paths_v6_laury.pl /Users/Daniela/Documents/PhD/Colaboraciones/Misha/pathways/GUs_SRs/ /Users/Daniela/Documents/PhD/Colaboraciones/Misha/pathways/results/short_paths_conn.txt 1

#Get components
perl /Users/Daniela/Documents/PhD/Codigos/2017_2/find_components_v2.pl /Users/Daniela/Documents/PhD/Colaboraciones/Misha/pathways/results/all_short_paths.txt /Users/Daniela/Documents/PhD/Colaboraciones/Misha/pathways/results/components.txt

#Get connectivity
perl /Users/Daniela/Documents/PhD/Codigos/2017_2/get_connectivity_v2.pl /Users/Daniela/Documents/PhD/Colaboraciones/Misha/pathways/results/short_paths_conn.txt /Users/Daniela/Documents/PhD/Colaboraciones/Misha/pathways/GUs_SRs/ /Users/Daniela/Documents/PhD/Colaboraciones/Misha/pathways/results/connectivity.txt

#Get Summary
perl /Users/Daniela/Documents/PhD/Codigos/2017_2/get_summary_v1.pl /Users/Daniela/Documents/PhD/Colaboraciones/Misha/pathways/results/ /Users/Daniela/Documents/PhD/Colaboraciones/Misha/pathways/base_pathways.txt /Users/Daniela/Documents/PhD/Colaboraciones/Misha/pathways/summary.txt
