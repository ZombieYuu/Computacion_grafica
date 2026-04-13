
//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"


void MainLight_float(float3 PositionWS, out float3 Direction, out float3 Color, out float ShadowAttenuation)  //float -> 32 Bits, half -> 16 
{
#ifdef SHADERGRAPH_PREVIEW
    Direction = normalize(float3(1, 1, -1));
    Color = 1.0f;
    ShadowAttenuation = 1.0f;
#else
    float4 shadowCoord = TransformWorldToShadowCoord(PositionWS);
    
    Light mainLight = GetMainLight(shadowCoord);
    Direction = mainLight.direction;
    Color = mainLight.color;
    ShadowAttenuation = mainLight.shadowAttenuation;
#endif
}


void AdditionalLightsSimple_float(float3 ViewDirectionWS, float NormalWS, float3 PositionWS, out float3 Lit)
{
    #ifdef SHADERGRAPH_PREVIEW
    Lit = 0;
    #else
    uint additionalLightCount = getAdditionalLightCount();

    //TODO: Forward+

    LIGHT_LOOP_BEGIN(additionalLightCount)
    Light currentLight = getAdditionalLight(lightIndex, PositionWS);
    float lambert = dot(currentLight.direction, NormalWS);
    lambert = max(0, lambert * 0.5 +0.5f); //Half lambert

    //Deffuse

    float deffuse = lambert 
    * currentLight.color 
    * currentLight.shadowAttenuation 
    * currentLight.distanceAttenuation;

    //Specular

    float3 h = normalize(ViewDirectionWS + currentLight.direction);
    float blinnPhong = dot(h, NormalWS);
    blinnPhong = max(0, blinnPhong)
    blinnPhong = Power(blinnPhong, 60.0f);
    float3 Specular = blinnPhong
    * currentLight.color
    * currentLight.shadowAttenuation
    * currentLight.distanceAttenuation;

    Lit += deffuse + Specular;
    LIGHT_LOOP_END

    #endif
}