#ifndef GAUSSIAN_FILTERS
#define GAUSSIAN_FILTERS

float SampleGaussianKernel3x3(float2 coords)
{
    return 1;
}

void GaussianFilter3x3_float(float2 UV, float2 ScreeSize, float FilterDistance, out float4 FilteredImage)
{
   
    [unroll(9)]
        
    for( int y = 1; y >= -2; y--)
        {
        for (int x = -1; x <= 1; x++)
        {
            // Load Texture utiliza coordenadas de pixel
            
            float2 pixelCoords = UV * ScreenSize + float2(x, y);
            FilterImage += LOAD_TEXTURE2D_X_LOD(_BlitTexture, pixelCoords, 0) * SampleGaussianKernel3x3(float2(x,y));

        }

    }
}

#endif 