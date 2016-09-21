# GDMQI
Generalized Dynamic Morphological Quotient Image

By Sanghun Lee ([Google Scholar](https://scholar.google.co.kr/citations?user=T9U4lCUAAAAJ), [Website](http://web.yonsei.ac.kr/nica))

Yonsei Univ.


### Introduction

This repository contains a Matlab implementation of "Multiscale morphology based illumination normalization with enhanced local textures for face recognition" (http://dx.doi.org/10.1016/j.eswa.2016.06.039) ([pdf](https://www.researchgate.net/profile/Sanghun_Lee14/publication/304144886_Multiscale_morphology_based_illumination_normalization_with_enhanced_local_textures_for_face_recognition/links/577b8da708aec3b7433656a3.pdf))


### Note

* We converted the original version of GDMQI written in C++ (using OpenCV) into this Matlab version.
* It is not optimized version. 
* Only 'Cropped version of Extended Yale-B database' was tested.



### How to Use

1. Download and unzip 'Cropped version of Extended Yale-B database' ([Link](http://vision.ucsd.edu/~iskwak/ExtYaleDatabase/ExtYaleB.html))
2. Open 'main.m' file
3. Modify DB_LOCATION to specify the database location, (ex. DB_LOCATION = 'D:\Database\YaleB\';) 
4. run


### Citation
If you use GDMQI in your research, please cite:

	@article{lee2016multiscale,
		title={Multiscale morphology based illumination normalization with enhanced local textures for face recognition},
		author={Lee, Sanghun and Lee, Chulhee},
		journal={Expert Systems with Applications},
		volume={62},
		pages={347--357},
		year={2016},
		publisher={Elsevier}
	}


