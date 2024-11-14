#!/bin/bash

# Set the paths
input_folder1=/mnt/c/Users/amu_k/subjects-mri-dwi/fa/*
input_folder2=/mnt/c/Users/amu_k/subjects-mri-dwi/md/*
input_folder3=/mnt/c/Users/amu_k/subjects-mri-dwi/fluid_fraction/*
input_folder4=/mnt/c/Users/amu_k/subjects-mri-dwi/tissue_fraction/*

output_folder1=/mnt/c/Users/amu_k/subjects-mri-dwi/fa_transformed
output_folder2=/mnt/c/Users/amu_k/subjects-mri-dwi/md_transformed
output_folder3=/mnt/c/Users/amu_k/subjects-mri-dwi/fluid_fraction_transformed
output_folder4=/mnt/c/Users/amu_k/subjects-mri-dwi/tissue_fraction_transformed

reference_image=/mnt/c/Users/amu_k/subjects-mri-dwi/t2

transformation_matrix=/mnt/c/Users/amu_k/subjects-mri-dwi/transform

# Create the output folders if they don't exist
mkdir -p "$output_folder1"
mkdir -p "$output_folder2"
mkdir -p "$output_folder3"
mkdir -p "$output_folder4"

# Iterate over input images

# FA

for input_image1 in $input_folder1 ; do 
    echo $input_image1
    # Get the filename without extension
    filename1=$(basename -- "$input_image1")
    filename_no_extension1="${filename1%.*}"

    echo $filename_no_extension1
    filename_subject1=${filename_no_extension1%_fa.nii}
    echo $filename_subject1

    # Set the output path for the transformed FA image
    output_image1="$output_folder1/${filename_subject1}_fa_transformed.nii"

    # Reference image
    reference_image1=${reference_image}/${filename_subject1}_T2w.nii

    # Transformation matrix
    transformation_matrix1=${transformation_matrix}/${filename_subject1}_from-dwi_to-T2w_mode-image.mat

    # Run the flirt command
    flirt -ref "$reference_image1" -in "$input_image1" -applyxfm -init "$transformation_matrix1" -out "$output_image1"

    echo "Transformation applied to $filename1"
done

# MD

for input_image2 in $input_folder2 ; do 
    echo $input_image2
    # Get the filename without extension
    filename2=$(basename -- "$input_image2")
    filename_no_extension2="${filename2%.*}"

    echo $filename_no_extension2
    filename_subject2=${filename_no_extension2%_md.nii}
    echo $filename_subject2

    # Set the output path for the transformed MD image
    output_image2="$output_folder2/${filename_subject2}_md__transformed.nii"

    # Reference image
    reference_image2=${reference_image}/${filename_subject2}_T2w.nii

    # Transformation matrix
    transformation_matrix2=${transformation_matrix}/${filename_subject2}_from-dwi_to-T2w_mode-image.mat

    # Run the flirt command
    flirt -ref "$reference_image2" -in "$input_image2" -applyxfm -init "$transformation_matrix2" -out "$output_image2"

    echo "Transformation applied to $filename2"
done

# Fluid fraction

for input_image3 in $input_folder3 ; do 
    echo $input_image3
    # Get the filename without extension
    filename3=$(basename -- "$input_image3")
    filename_no_extension3="${filename3%.*}"

    echo $filename_no_extension3
    filename_subject3=${filename_no_extension3%_fluid_fraction.nii}
    echo $filename_subject3

    # Set the output path for the transformed fluid fraction image
    output_image3="$output_folder3/${filename_subject3}_fluid_fraction_transformed.nii"

    # Reference image
    reference_image3=${reference_image}/${filename_subject3}_T2w.nii

    # Transformation matrix
    transformation_matrix3=${transformation_matrix}/${filename_subject3}_from-dwi_to-T2w_mode-image.mat

    # Run the flirt command
    flirt -ref "$reference_image3" -in "$input_image3" -applyxfm -init "$transformation_matrix3" -out "$output_image3"

    echo "Transformation applied to $filename3"
done

# Tissue fraction

for input_image4 in $input_folder4 ; do 
    echo $input_image4
    # Get the filename without extension
    filename4=$(basename -- "$input_image4")
    filename_no_extension4="${filename4%.*}"

    echo $filename_no_extension4
    filename_subject4=${filename_no_extension4%_tissue_fraction.nii}
    echo $filename_subject4

    # Set the output path for the transformed tissue fraction image
    output_image4="$output_folder4/${filename_subject4}_tissue_fraction_transformed.nii"

    # Reference image
    reference_image4=${reference_image}/${filename_subject4}_T2w.nii

    # Transformation matrix
    transformation_matrix4=${transformation_matrix}/${filename_subject4}_from-dwi_to-T2w_mode-image.mat

    # Run the flirt command
    flirt -ref "$reference_image4" -in "$input_image4" -applyxfm -init "$transformation_matrix4" -out "$output_image4"

    echo "Transformation applied to $filename4"
done