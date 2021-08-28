# texture_gradient_ndcwt
Texture Gradient Using Non-Decimated Complex Wavelet Transform

In order to produce a texture gradient we first need to characterize the texture 
content of the image at each pixel. A number of methods have been proposed to do 
this. One of the most popular techniques is the use of a set of scaled and orientated 
complex Gabor filters. By suitable spanning of the frequency space, each pixel can 
be characterized in texture content. However, when considering the differences in 
texture within an image (e.g., the texture gradient) this often produces suboptimal 
characterization for segmentation. To produce an optimal system, the Gabor filters 
need to be tuned to the texture content of the image. Different schemes for adaptive 
Gabor filtering have been implemented. These and other schemes use arbitrary 
techniques that are entirely separate from the texture feature extraction process 
whilst also being excessively computationally complex. In order to integrate an 
adaptive scheme with the texture feature extraction process we have used the 
Non-Decimated Complex Wavelet Transform (NDCWT). The magnitude 
of the coefficients of each complex sub band can be used to characterize the texture 
content. This is because the basis functions from each sub band (very closely) 
resemble Gabor filters, i.e., they are scale and directionally selective whilst being 
frequency and spatially localized. Each pixel can therefore be assigned a feature 
vector according to the magnitudes of the NDCWT coefficients.

The gradient of each sub band should aim at step detection rather than edge 
detection.
