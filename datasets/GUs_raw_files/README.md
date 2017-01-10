
# GENSOR Units data

Each folder is named after a Transcription Factor (TF), it contains five tab delimited files that include all the information of the GENSOR Unit of the indicated TF. The five files point to each other through IDs.

## A) objects.txt
Lists all the objects included in the GENSOR Unit and their type of object (Gene, RNA, Protein, Simple Molecule, Complex). Names of objects are unique and are used as object ID. Columns are:
  [1] Object name, also used as ID within files.
  [2] Object type. Can be Gene, RNA, Protein, Complex or Simple Molecule.
  [3] Ecocyc ID for molecules.

## B) reactions.txt
Lists all the reactions included in the GENSOR Unit, their type of reaction and their ID used among files. Columns are:
  [1] Reaction ID. Always of the type "re" + successive numbers.
  [2] Type of reaction. Can be:
      + Transcription
      + Translation
      + Transport. Through the membrane.
      + State Transition. Either enzymatic reaction or formation of a complex.
      + Super Reaction. Only in GUs_secondary_reactions. Another name for secondary reaction, reactions whose catalysers are not directly regulated by the TF of the GENSOR Unit but are in a metabolic pathway that connects two reactions whose genes are directly regulated. 
  [3] Reversibility of enzymatic reactions. Can be:
    + L2R. Reaction only happens from left to right.
    + RVB. Reaction is reversible.
     In secondary reactions this column will show the intermediate steps in Ecocyc IDs.
  [4] Ecocyc ID of enzymatic reactions.

## C) complexes.txt
Lists all the protein and protein-metabolite complexes present in the GENSOR Unit. Ids appear repeated because different components of the complex are listed in different rows. Columns are:
  [1] Complex ID. Always of the type "csa" + successive numbers.
  [2] Complex Name. Name of all the complex components separated by hyphens.
  [3] Complex component name (links to objects.txt).

## D) reactants_products.txt
Lists all the reactants and products of each reaction in reactions.txt Columns are:
  [1] Reaction ID. From reactions.txt
  [2] Object ID. From objects.txt
  [3] Role of object in reaction, either reactant or product. In reversible reactions the roles as interchangeable but is not specified in the file.

## E) modification.txt
Lists catalysers of reactions and regulatory interactions, i.e. proteins that modify the state of a reaction. Columns are:
  [1] Reaction ID. From reactions.txt.
  [2] Type of modification. Can be "Catalysis" for enzymatic reactions, "Physical_stimulation" for activation of transcription, "Inhibition" for repression of transcription or "Unknown" for reported regulatory interactions were the particular effect is unclear. Dual regulatory interactions are listed twice. 
  [3] Protein or protein complex (usually TF-effector or heteromultimeric protein complexes) that produces the modification. IDs of modifiers are object IDs.


###### Questions and comments please contact Daniela Ledezma @ dledezma@lcg.unam.mx 
