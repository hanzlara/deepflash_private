python src\DeepFLASH_testing.py^
    --network_type=deepflash^
    --saved_model=save_trained_model\saved_model.pth^
    --im_src_realpart=.\preprocess\Rnet\src_fourier_real\*.mhd^
    --im_tar_realpart=.\preprocess\Rnet\tar_fourier_real\*.mhd^
    --im_src_imaginarypart=.\preprocess\Inet\src_fourier_imag\*.mhd^
    --im_tar_imaginarypart=.\preprocess\Inet\tar_fourier_imag\*.mhd
