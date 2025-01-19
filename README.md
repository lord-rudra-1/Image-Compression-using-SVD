# Image Compression using Singular Value Decomposition (SVD)

## Introduction
This project demonstrates how Singular Value Decomposition (SVD) can be applied to image compression. SVD is a matrix factorization technique widely used in data science and image processing. By truncating the number of singular values, we can reduce the size of an image while maintaining its essential features, leading to compression.

In this implementation, we apply SVD on each of the RGB color channels of an image and then reconstruct the image using a reduced number of singular values to achieve compression.

## Theory

### Singular Value Decomposition (SVD)
SVD is a factorization of a matrix into three components:
\[ A = U \cdot S \cdot V^T \]
Where:
- \( A \) is the original matrix (in this case, the image).
- \( U \) is an orthogonal matrix containing the left singular vectors.
- \( S \) is a diagonal matrix containing the singular values.
- \( V^T \) is the transpose of the matrix containing the right singular vectors.

### Image Representation
An image can be represented as a matrix where:
- Each pixel is represented by a color, which is typically a combination of three channels: Red (R), Green (G), and Blue (B).
- Each of these color channels is a 2D matrix containing intensity values for the corresponding color.

### Image Compression
To compress an image, we:
1. Perform SVD on each of the three color channel matrices (R, G, and B).
2. Retain only the top \( k \) singular values and corresponding vectors from each matrix, reducing the dimensions.
3. Reconstruct the image from the truncated components.
4. The reconstructed image is smaller in size but still retains much of the original information, with fewer data points.

### The Compression Process
1. **SVD of each channel**: Decompose each of the R, G, and B channels into their singular values and vectors.
2. **Truncation**: Keep only the top \( k \) singular values for each channel.
3. **Reconstruction**: Rebuild the image using the truncated singular values and vectors.
4. **Display**: Compare the original image and the compressed image.

## Code Explanation

### 1. Load and Preprocess the Image
We load the image using `imread()` and convert it to double precision using `im2double()` to ensure better precision in calculations during the SVD process.

### 2. Separate the Color Channels
The RGB image is split into its three color channels: Red (R), Green (G), and Blue (B). Each channel is represented as a separate 2D matrix.

### 3. Apply Singular Value Decomposition (SVD) on Each Channel
SVD is applied to each of the three color channels (R, G, and B). This results in three matrices for each channel: \( U \), \( S \), and \( V \), which represent the decomposed components of each channel.

### 4. Truncate the Singular Values
We choose a value \( k \), which represents the number of singular values to keep. The matrices \( U \), \( S \), and \( V \) are truncated to retain only the top \( k \) singular values for each channel, achieving the compression.

### 5. Reconstruct the Image
After truncation, the compressed image is reconstructed by multiplying the truncated components of \( U \), \( S \), and \( V \) for each channel (R, G, and B).

### 6. Display the Images
The original and reconstructed images are displayed side-by-side for comparison. This allows us to visually evaluate the effect of compression and assess the quality of the reconstructed image.

## Usage
1. Ensure you have an image (e.g., `image.jpg`) in the same directory as the script.
2. Open the script in MATLAB.
3. Run the script.
4. The original and reconstructed images will be displayed.

## Output
The code displays two images:
- **Original Image**: The original uncompressed image.
- **Reconstructed Image**: The image after applying SVD compression with \( k \) singular values.

## Example
For example, if the image is a picture of a landscape, the reconstructed image will retain the general features like shapes, colors, and structure, but will have some loss of finer details due to compression.

## Conclusion
This project demonstrates how SVD can be used to compress color images by retaining only a portion of the singular values. This technique is widely used in data compression and dimensionality reduction, especially in areas like image processing, machine learning, and data analysis.
