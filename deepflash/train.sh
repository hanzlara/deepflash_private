#!/bin/bash
#Network type: "deepflash" or "deepflash3D";
#Path example: "./data/Rnet/tar_fourier_real/*.mhd"

python3 ./src/DeepFLASH_training.py --network_type "deepflash" \
--im_src_realpart  "preprocess/Rnet/src_fourier_real/*.mhd" \
--im_tar_realpart "preprocess/Rnet/tar_fourier_real/*.mhd" \
--im_vel_realX "preprocess/Rnet/velo_fourier_real_x/*.mhd" \
--im_vel_realY "preprocess/Rnet/velo_fourier_real_y/*.mhd" \
--im_vel_realZ "preprocess/Rnet/velo_fourier_real_z/*.mhd" \
--im_src_imaginarypart "preprocess/Inet/src_fourier_imag/*.mhd" \
--im_tar_imaginarypart "preprocess/Inet/tar_fourier_imag/*.mhd" \
--im_vel_imagX "preprocess/Inet/velo_fourier_imag_x/*.mhd" \
--im_vel_imagY "preprocess/Inet/velo_fourier_imag_y/*.mhd" \
--im_vel_imagZ "preprocess/Inet/velo_fourier_imag_z/*.mhd" 