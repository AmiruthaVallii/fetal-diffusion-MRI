# fetal-diffusion-MRI
A collection of python and BASH scripts used to process and analyse T2w and DWI fetal data.

# Pre-processing step 1
File: batch_transform_all.
  Purpose: Transformation to align DWI to the T2 Space.

# Pre-processing step 2
File: batch_mask.
  Purpose: Remove non-brain areas in T2 images using mask (stripping).

# Feature extraction
File: Extract_regions.
  Purpose: Extracting regions of interest - Subplate (SP), Ventricular Zone (VZ), Ganglionic Eminence (GE), Periventricular White Matter (PVWM), Cortex, and White Matter (WM)
