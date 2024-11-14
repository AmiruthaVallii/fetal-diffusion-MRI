#!/bin/bash

# Set the file and folder paths
t2_image_folder=/mnt/c/Users/amu_k/subjects-mri-dwi/pre-processing-files/t2-resampled/*
brain_mask_folder=/mnt/c/Users/amu_k/subjects-mri-dwi/pre-processing-files/brain-masks-resampled
output_folder=/mnt/c/Users/amu_k/subjects-mri-dwi/pre-processing-files/t2-brain-masked

# Check if the input folders exist
if [ ! -d $brain_mask_folder ] || [ ! -d $t2_image_folder ]; then
  echo "Error: One or both of the input folders do not exist."
  exit 1
fi

# Create the output folder
mkdir -p "$output_folder"

# Iterate through each t2 image
for t2_image_file in $t2_image_folder ; do
    echo $t2_image_file

  # Extract filename components
  filename=$(basename -- "$t2_image_file")
  filename_no_extension="${filename%.*}"

  echo $filename_no_extension

  filename_subject=${filename_no_extension%.nii}
  echo $filename_subject

  # Find corresponding brain mask file
  brain_mask_file=${brain_mask_folder}/${filename_subject}_mask.nii

  # Form output filename
  output_file="$output_folder/${filename_subject}_masked.nii"

  # Apply the brain mask using FSL command
  fslmaths "$t2_image_file" -mul "$brain_mask_file" "$output_file"

  echo "Applied brain mask to $filename_no_extension."
done

echo "Batch processing complete."