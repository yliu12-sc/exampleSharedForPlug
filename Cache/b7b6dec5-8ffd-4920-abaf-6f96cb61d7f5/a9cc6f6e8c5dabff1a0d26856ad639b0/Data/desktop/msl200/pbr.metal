#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_FLAG_IS_NORMAL_MAP normalTex
NGS_BACKEND_SHADER_FLAGS_END__
#endif
namespace SNAP_VS {
int sc_GetStereoViewIndex()
{
    return 0;
}
}
    #ifndef sc_TextureRenderingLayout_Regular
        #define sc_TextureRenderingLayout_Regular 0
        #define sc_TextureRenderingLayout_StereoInstancedClipped 1
        #define sc_TextureRenderingLayout_StereoMultiview 2
    #endif
    #define depthToGlobal   depthScreenToViewSpace
    #define depthToLocal    depthViewToScreenSpace
    #ifndef quantizeUV
        #define quantizeUV sc_QuantizeUV
        #define sc_platformUVFlip sc_PlatformFlipV
        #define sc_PlatformFlipUV sc_PlatformFlipV
    #endif
    #ifndef sc_SampleTexture
        #define sc_SampleTexture sc_SampleTextureBiasOrLevel
    #endif
    #ifndef sc_texture2DLod
        #define sc_texture2DLod sc_InternalTextureLevel
        #define sc_textureLod sc_InternalTextureLevel
        #define sc_textureBias sc_InternalTextureBiasOrLevel
        #define sc_texture sc_InternalTexture
    #endif
//SG_REFLECTION_BEGIN(200)
//attribute vec4 boneData 5
//attribute vec3 blendShape0Pos 6
//attribute vec3 blendShape0Normal 12
//attribute vec3 blendShape1Pos 7
//attribute vec3 blendShape1Normal 13
//attribute vec3 blendShape2Pos 8
//attribute vec3 blendShape2Normal 14
//attribute vec3 blendShape3Pos 9
//attribute vec3 blendShape4Pos 10
//attribute vec3 blendShape5Pos 11
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec4 color 18
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//output vec4 FragColor0 0
//output vec4 FragColor1 1
//output vec4 FragColor2 2
//output vec4 FragColor3 3
//sampler sampler baseTexSmpSC 2:19
//sampler sampler intensityTextureSmpSC 2:20
//sampler sampler materialParamsTexSmpSC 2:21
//sampler sampler normalTexSmpSC 2:22
//sampler sampler sc_EnvmapDiffuseSmpSC 2:23
//sampler sampler sc_EnvmapSpecularSmpSC 2:24
//sampler sampler sc_SSAOTextureSmpSC 2:26
//sampler sampler sc_ScreenTextureSmpSC 2:27
//sampler sampler sc_ShadowTextureSmpSC 2:28
//texture texture2D baseTex 2:1:2:19
//texture texture2D intensityTexture 2:2:2:20
//texture texture2D materialParamsTex 2:3:2:21
//texture texture2D normalTex 2:4:2:22
//texture texture2D sc_EnvmapDiffuse 2:5:2:23
//texture texture2D sc_EnvmapSpecular 2:6:2:24
//texture texture2D sc_SSAOTexture 2:15:2:26
//texture texture2D sc_ScreenTexture 2:16:2:27
//texture texture2D sc_ShadowTexture 2:17:2:28
//ubo int UserUniforms 2:30:4128 {
//sc_PointLight_t sc_PointLights 0:[3]:80
//bool sc_PointLights.falloffEnabled 0
//float sc_PointLights.falloffEndDistance 4
//float sc_PointLights.negRcpFalloffEndDistance4 8
//float sc_PointLights.angleScale 12
//float sc_PointLights.angleOffset 16
//float3 sc_PointLights.direction 32
//float3 sc_PointLights.position 48
//float4 sc_PointLights.color 64
//sc_DirectionalLight_t sc_DirectionalLights 240:[3]:32
//float3 sc_DirectionalLights.direction 0
//float4 sc_DirectionalLights.color 16
//sc_AmbientLight_t sc_AmbientLights 336:[3]:32
//float3 sc_AmbientLights.color 0
//float sc_AmbientLights.intensity 16
//sc_LightEstimationData_t sc_LightEstimationData 432
//sc_SphericalGaussianLight_t sc_LightEstimationData.sg 0:[12]:48
//float3 sc_LightEstimationData.sg.color 0
//float sc_LightEstimationData.sg.sharpness 16
//float3 sc_LightEstimationData.sg.axis 32
//float3 sc_LightEstimationData.ambientLight 576
//float4 sc_EnvmapDiffuseSize 1024
//float4 sc_EnvmapDiffuseDims 1040
//float4 sc_EnvmapDiffuseView 1056
//float4 sc_EnvmapSpecularSize 1072
//float4 sc_EnvmapSpecularDims 1088
//float4 sc_EnvmapSpecularView 1104
//float3 sc_EnvmapRotation 1120
//float sc_EnvmapExposure 1136
//float3 sc_Sh 1152:[9]:16
//float sc_ShIntensity 1296
//float4 sc_Time 1312
//float4 sc_UniformConstants 1328
//float4 sc_GeometryInfo 1344
//float4x4 sc_ModelViewProjectionMatrixArray 1360:[2]:64
//float4x4 sc_ModelViewProjectionMatrixInverseArray 1488:[2]:64
//float4x4 sc_ViewProjectionMatrixArray 1616:[2]:64
//float4x4 sc_ViewProjectionMatrixInverseArray 1744:[2]:64
//float4x4 sc_ModelViewMatrixArray 1872:[2]:64
//float4x4 sc_ModelViewMatrixInverseArray 2000:[2]:64
//float3x3 sc_ViewNormalMatrixArray 2128:[2]:48
//float3x3 sc_ViewNormalMatrixInverseArray 2224:[2]:48
//float4x4 sc_ProjectionMatrixArray 2320:[2]:64
//float4x4 sc_ProjectionMatrixInverseArray 2448:[2]:64
//float4x4 sc_ViewMatrixArray 2576:[2]:64
//float4x4 sc_ViewMatrixInverseArray 2704:[2]:64
//float4x4 sc_ModelMatrix 2832
//float4x4 sc_ModelMatrixInverse 2896
//float3x3 sc_NormalMatrix 2960
//float3x3 sc_NormalMatrixInverse 3008
//float3 sc_LocalAabbMin 3056
//float3 sc_LocalAabbMax 3072
//float3 sc_WorldAabbMin 3088
//float3 sc_WorldAabbMax 3104
//float4 sc_WindowToViewportTransform 3120
//sc_Camera_t sc_Camera 3136
//float3 sc_Camera.position 0
//float sc_Camera.aspect 16
//float2 sc_Camera.clipPlanes 24
//float sc_ShadowDensity 3168
//float4 sc_ShadowColor 3184
//float4x4 sc_ProjectorMatrix 3200
//float _sc_GetFramebufferColorInvalidUsageMarker 3264
//float shaderComplexityValue 3268
//float sc_DisableFrustumCullingMarker 3272
//float4 weights0 3280
//float4 weights1 3296
//float4 weights2 3312
//float4 sc_StereoClipPlanes 3328:[2]:16
//int sc_FallbackInstanceID 3360
//float _sc_framebufferFetchMarker 3364
//float2 sc_TAAJitterOffset 3368
//float strandWidth 3376
//float strandTaper 3380
//float4 sc_StrandDataMapTextureSize 3392
//float clumpInstanceCount 3408
//float clumpRadius 3412
//float clumpTipScale 3416
//float hairstyleInstanceCount 3420
//float hairstyleNoise 3424
//float4 sc_ScreenTextureSize 3440
//float4 sc_ScreenTextureDims 3456
//float4 sc_ScreenTextureView 3472
//float correctedIntensity 3488
//float4 intensityTextureSize 3504
//float4 intensityTextureDims 3520
//float4 intensityTextureView 3536
//float3x3 intensityTextureTransform 3552
//float4 intensityTextureUvMinMax 3600
//float4 intensityTextureBorderColor 3616
//float reflBlurWidth 3632
//float reflBlurMinRough 3636
//float reflBlurMaxRough 3640
//int overrideTimeEnabled 3644
//float overrideTimeElapsed 3648
//float overrideTimeDelta 3652
//int PreviewEnabled 3656
//int PreviewNodeID 3660
//float alphaTestThreshold 3664
//float4 baseTexSize 3680
//float4 baseTexDims 3696
//float4 baseTexView 3712
//float3x3 baseTexTransform 3728
//float4 baseTexUvMinMax 3776
//float4 baseTexBorderColor 3792
//float uvScale 3808
//float4 normalTexSize 3824
//float4 normalTexDims 3840
//float4 normalTexView 3856
//float3x3 normalTexTransform 3872
//float4 normalTexUvMinMax 3920
//float4 normalTexBorderColor 3936
//float4 materialParamsTexSize 3952
//float4 materialParamsTexDims 3968
//float4 materialParamsTexView 3984
//float3x3 materialParamsTexTransform 4000
//float4 materialParamsTexUvMinMax 4048
//float4 materialParamsTexBorderColor 4064
//float2 Port_Center_N016 4080
//float3 Port_Emissive_N006 4096
//float3 Port_SpecularAO_N006 4112
//}
//ubo float sc_BonesUBO 2:0:96 {
//sc_Bone_t sc_Bones 0:[]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//spec_const bool BLEND_MODE_AVERAGE 1000
//spec_const bool BLEND_MODE_BRIGHT 1001
//spec_const bool BLEND_MODE_COLOR_BURN 1002
//spec_const bool BLEND_MODE_COLOR_DODGE 1003
//spec_const bool BLEND_MODE_COLOR 1004
//spec_const bool BLEND_MODE_DARKEN 1005
//spec_const bool BLEND_MODE_DIFFERENCE 1006
//spec_const bool BLEND_MODE_DIVIDE 1007
//spec_const bool BLEND_MODE_DIVISION 1008
//spec_const bool BLEND_MODE_EXCLUSION 1009
//spec_const bool BLEND_MODE_FORGRAY 1010
//spec_const bool BLEND_MODE_HARD_GLOW 1011
//spec_const bool BLEND_MODE_HARD_LIGHT 1012
//spec_const bool BLEND_MODE_HARD_MIX 1013
//spec_const bool BLEND_MODE_HARD_PHOENIX 1014
//spec_const bool BLEND_MODE_HARD_REFLECT 1015
//spec_const bool BLEND_MODE_HUE 1016
//spec_const bool BLEND_MODE_INTENSE 1017
//spec_const bool BLEND_MODE_LIGHTEN 1018
//spec_const bool BLEND_MODE_LINEAR_LIGHT 1019
//spec_const bool BLEND_MODE_LUMINOSITY 1020
//spec_const bool BLEND_MODE_NEGATION 1021
//spec_const bool BLEND_MODE_NOTBRIGHT 1022
//spec_const bool BLEND_MODE_OVERLAY 1023
//spec_const bool BLEND_MODE_PIN_LIGHT 1024
//spec_const bool BLEND_MODE_REALISTIC 1025
//spec_const bool BLEND_MODE_SATURATION 1026
//spec_const bool BLEND_MODE_SOFT_LIGHT 1027
//spec_const bool BLEND_MODE_SUBTRACT 1028
//spec_const bool BLEND_MODE_VIVID_LIGHT 1029
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 1030
//spec_const bool SC_GL_FRAGMENT_PRECISION_HIGH 1031
//spec_const bool SC_USE_CLAMP_TO_BORDER_baseTex 1032
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 1033
//spec_const bool SC_USE_CLAMP_TO_BORDER_materialParamsTex 1034
//spec_const bool SC_USE_CLAMP_TO_BORDER_normalTex 1035
//spec_const bool SC_USE_UV_MIN_MAX_baseTex 1036
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 1037
//spec_const bool SC_USE_UV_MIN_MAX_materialParamsTex 1038
//spec_const bool SC_USE_UV_MIN_MAX_normalTex 1039
//spec_const bool SC_USE_UV_TRANSFORM_baseTex 1040
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 1041
//spec_const bool SC_USE_UV_TRANSFORM_materialParamsTex 1042
//spec_const bool SC_USE_UV_TRANSFORM_normalTex 1043
//spec_const bool UseViewSpaceDepthVariant 1044
//spec_const bool baseTexHasSwappedViews 1045
//spec_const bool intensityTextureHasSwappedViews 1046
//spec_const bool materialParamsTexHasSwappedViews 1047
//spec_const bool normalTexHasSwappedViews 1048
//spec_const bool sc_BlendMode_AddWithAlphaFactor 1049
//spec_const bool sc_BlendMode_Add 1050
//spec_const bool sc_BlendMode_AlphaTest 1051
//spec_const bool sc_BlendMode_AlphaToCoverage 1052
//spec_const bool sc_BlendMode_ColoredGlass 1053
//spec_const bool sc_BlendMode_Custom 1054
//spec_const bool sc_BlendMode_Disabled 1055
//spec_const bool sc_BlendMode_Hardware 1056
//spec_const bool sc_BlendMode_Max 1057
//spec_const bool sc_BlendMode_Min 1058
//spec_const bool sc_BlendMode_MultiplyOriginal 1059
//spec_const bool sc_BlendMode_Multiply 1060
//spec_const bool sc_BlendMode_Normal 1061
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 1062
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 1063
//spec_const bool sc_BlendMode_PremultipliedAlpha 1064
//spec_const bool sc_BlendMode_Screen 1065
//spec_const bool sc_BlendMode_Software 1066
//spec_const bool sc_CanUseSampler2DArray 1067
//spec_const bool sc_DepthOnly 1068
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 1069
//spec_const bool sc_EnvmapSpecularHasSwappedViews 1070
//spec_const bool sc_FramebufferFetch 1071
//spec_const bool sc_GetFramebufferColorInvalidUsageMarker 1072
//spec_const bool sc_HairDebugMode 1073
//spec_const bool sc_HairFallbackMode 1074
//spec_const bool sc_HasDiffuseEnvmap 1075
//spec_const bool sc_LightEstimation 1076
//spec_const bool sc_MotionVectorsPass 1077
//spec_const bool sc_OITCompositingPass 1078
//spec_const bool sc_OITDepthBoundsPass 1079
//spec_const bool sc_OITDepthGatherPass 1080
//spec_const bool sc_OITDepthPrepass 1081
//spec_const bool sc_OITFrontLayerPass 1082
//spec_const bool sc_OITMaxLayers4Plus1 1083
//spec_const bool sc_OITMaxLayers4 1084
//spec_const bool sc_OITMaxLayers8 1085
//spec_const bool sc_OITMaxLayersVisualizeLayerCount 1086
//spec_const bool sc_ProjectiveShadowsCaster 1087
//spec_const bool sc_ProjectiveShadowsReceiver 1088
//spec_const bool sc_RenderAlphaToColor 1089
//spec_const bool sc_SSAOEnabled 1090
//spec_const bool sc_ScreenTextureHasSwappedViews 1091
//spec_const bool sc_ShaderComplexityAnalyzer 1092
//spec_const bool sc_TAAEnabled 1093
//spec_const bool sc_UseFragDepth 999
//spec_const bool sc_UseFramebufferFetchMarker 1095
//spec_const bool sc_VertexBlendingUseNormals 1096
//spec_const bool sc_VertexBlending 1097
//spec_const int SC_DEVICE_CLASS 1098
//spec_const int SC_SOFTWARE_WRAP_MODE_U_baseTex 1099
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 1100
//spec_const int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex 1101
//spec_const int SC_SOFTWARE_WRAP_MODE_U_normalTex 1102
//spec_const int SC_SOFTWARE_WRAP_MODE_V_baseTex 1103
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 1104
//spec_const int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex 1105
//spec_const int SC_SOFTWARE_WRAP_MODE_V_normalTex 1106
//spec_const int baseTexLayout 1107
//spec_const int baseTexUV 1108
//spec_const int intensityTextureLayout 1109
//spec_const int intensityTextureUV 1110
//spec_const int materialParamsTexLayout 1111
//spec_const int materialParamsTexUV 1112
//spec_const int normalTexLayout 1113
//spec_const int normalTexUV 1114
//spec_const int sc_AmbientLightMode0 1115
//spec_const int sc_AmbientLightMode1 1116
//spec_const int sc_AmbientLightMode2 1117
//spec_const int sc_AmbientLightMode_Constant 1118
//spec_const int sc_AmbientLightMode_EnvironmentMap 1119
//spec_const int sc_AmbientLightMode_FromCamera 1120
//spec_const int sc_AmbientLightMode_SphericalHarmonics 1121
//spec_const int sc_AmbientLightsCount 1122
//spec_const int sc_DepthBufferMode 1123
//spec_const int sc_DirectionalLightsCount 1124
//spec_const int sc_EnvLightMode 1125
//spec_const int sc_EnvmapDiffuseLayout 1126
//spec_const int sc_EnvmapSpecularLayout 1127
//spec_const int sc_FragDataCount 1128
//spec_const int sc_LightEstimationSGCount 1129
//spec_const int sc_MaxTextureImageUnits 1130
//spec_const int sc_NumStereoViews 1131
//spec_const int sc_PointLightsCount 1132
//spec_const int sc_RenderingSpace 1133
//spec_const int sc_ScreenTextureLayout 1134
//spec_const int sc_SkinBonesCount 1135
//spec_const int sc_StereoRenderingMode 1136
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 1137
//SG_REFLECTION_END
constant bool BLEND_MODE_AVERAGE [[function_constant(1000)]];
constant bool BLEND_MODE_AVERAGE_tmp = is_function_constant_defined(BLEND_MODE_AVERAGE) ? BLEND_MODE_AVERAGE : false;
constant bool BLEND_MODE_BRIGHT [[function_constant(1001)]];
constant bool BLEND_MODE_BRIGHT_tmp = is_function_constant_defined(BLEND_MODE_BRIGHT) ? BLEND_MODE_BRIGHT : false;
constant bool BLEND_MODE_COLOR_BURN [[function_constant(1002)]];
constant bool BLEND_MODE_COLOR_BURN_tmp = is_function_constant_defined(BLEND_MODE_COLOR_BURN) ? BLEND_MODE_COLOR_BURN : false;
constant bool BLEND_MODE_COLOR_DODGE [[function_constant(1003)]];
constant bool BLEND_MODE_COLOR_DODGE_tmp = is_function_constant_defined(BLEND_MODE_COLOR_DODGE) ? BLEND_MODE_COLOR_DODGE : false;
constant bool BLEND_MODE_COLOR [[function_constant(1004)]];
constant bool BLEND_MODE_COLOR_tmp = is_function_constant_defined(BLEND_MODE_COLOR) ? BLEND_MODE_COLOR : false;
constant bool BLEND_MODE_DARKEN [[function_constant(1005)]];
constant bool BLEND_MODE_DARKEN_tmp = is_function_constant_defined(BLEND_MODE_DARKEN) ? BLEND_MODE_DARKEN : false;
constant bool BLEND_MODE_DIFFERENCE [[function_constant(1006)]];
constant bool BLEND_MODE_DIFFERENCE_tmp = is_function_constant_defined(BLEND_MODE_DIFFERENCE) ? BLEND_MODE_DIFFERENCE : false;
constant bool BLEND_MODE_DIVIDE [[function_constant(1007)]];
constant bool BLEND_MODE_DIVIDE_tmp = is_function_constant_defined(BLEND_MODE_DIVIDE) ? BLEND_MODE_DIVIDE : false;
constant bool BLEND_MODE_DIVISION [[function_constant(1008)]];
constant bool BLEND_MODE_DIVISION_tmp = is_function_constant_defined(BLEND_MODE_DIVISION) ? BLEND_MODE_DIVISION : false;
constant bool BLEND_MODE_EXCLUSION [[function_constant(1009)]];
constant bool BLEND_MODE_EXCLUSION_tmp = is_function_constant_defined(BLEND_MODE_EXCLUSION) ? BLEND_MODE_EXCLUSION : false;
constant bool BLEND_MODE_FORGRAY [[function_constant(1010)]];
constant bool BLEND_MODE_FORGRAY_tmp = is_function_constant_defined(BLEND_MODE_FORGRAY) ? BLEND_MODE_FORGRAY : false;
constant bool BLEND_MODE_HARD_GLOW [[function_constant(1011)]];
constant bool BLEND_MODE_HARD_GLOW_tmp = is_function_constant_defined(BLEND_MODE_HARD_GLOW) ? BLEND_MODE_HARD_GLOW : false;
constant bool BLEND_MODE_HARD_LIGHT [[function_constant(1012)]];
constant bool BLEND_MODE_HARD_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_HARD_LIGHT) ? BLEND_MODE_HARD_LIGHT : false;
constant bool BLEND_MODE_HARD_MIX [[function_constant(1013)]];
constant bool BLEND_MODE_HARD_MIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_MIX) ? BLEND_MODE_HARD_MIX : false;
constant bool BLEND_MODE_HARD_PHOENIX [[function_constant(1014)]];
constant bool BLEND_MODE_HARD_PHOENIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_PHOENIX) ? BLEND_MODE_HARD_PHOENIX : false;
constant bool BLEND_MODE_HARD_REFLECT [[function_constant(1015)]];
constant bool BLEND_MODE_HARD_REFLECT_tmp = is_function_constant_defined(BLEND_MODE_HARD_REFLECT) ? BLEND_MODE_HARD_REFLECT : false;
constant bool BLEND_MODE_HUE [[function_constant(1016)]];
constant bool BLEND_MODE_HUE_tmp = is_function_constant_defined(BLEND_MODE_HUE) ? BLEND_MODE_HUE : false;
constant bool BLEND_MODE_INTENSE [[function_constant(1017)]];
constant bool BLEND_MODE_INTENSE_tmp = is_function_constant_defined(BLEND_MODE_INTENSE) ? BLEND_MODE_INTENSE : false;
constant bool BLEND_MODE_LIGHTEN [[function_constant(1018)]];
constant bool BLEND_MODE_LIGHTEN_tmp = is_function_constant_defined(BLEND_MODE_LIGHTEN) ? BLEND_MODE_LIGHTEN : false;
constant bool BLEND_MODE_LINEAR_LIGHT [[function_constant(1019)]];
constant bool BLEND_MODE_LINEAR_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_LINEAR_LIGHT) ? BLEND_MODE_LINEAR_LIGHT : false;
constant bool BLEND_MODE_LUMINOSITY [[function_constant(1020)]];
constant bool BLEND_MODE_LUMINOSITY_tmp = is_function_constant_defined(BLEND_MODE_LUMINOSITY) ? BLEND_MODE_LUMINOSITY : false;
constant bool BLEND_MODE_NEGATION [[function_constant(1021)]];
constant bool BLEND_MODE_NEGATION_tmp = is_function_constant_defined(BLEND_MODE_NEGATION) ? BLEND_MODE_NEGATION : false;
constant bool BLEND_MODE_NOTBRIGHT [[function_constant(1022)]];
constant bool BLEND_MODE_NOTBRIGHT_tmp = is_function_constant_defined(BLEND_MODE_NOTBRIGHT) ? BLEND_MODE_NOTBRIGHT : false;
constant bool BLEND_MODE_OVERLAY [[function_constant(1023)]];
constant bool BLEND_MODE_OVERLAY_tmp = is_function_constant_defined(BLEND_MODE_OVERLAY) ? BLEND_MODE_OVERLAY : false;
constant bool BLEND_MODE_PIN_LIGHT [[function_constant(1024)]];
constant bool BLEND_MODE_PIN_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_PIN_LIGHT) ? BLEND_MODE_PIN_LIGHT : false;
constant bool BLEND_MODE_REALISTIC [[function_constant(1025)]];
constant bool BLEND_MODE_REALISTIC_tmp = is_function_constant_defined(BLEND_MODE_REALISTIC) ? BLEND_MODE_REALISTIC : false;
constant bool BLEND_MODE_SATURATION [[function_constant(1026)]];
constant bool BLEND_MODE_SATURATION_tmp = is_function_constant_defined(BLEND_MODE_SATURATION) ? BLEND_MODE_SATURATION : false;
constant bool BLEND_MODE_SOFT_LIGHT [[function_constant(1027)]];
constant bool BLEND_MODE_SOFT_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_SOFT_LIGHT) ? BLEND_MODE_SOFT_LIGHT : false;
constant bool BLEND_MODE_SUBTRACT [[function_constant(1028)]];
constant bool BLEND_MODE_SUBTRACT_tmp = is_function_constant_defined(BLEND_MODE_SUBTRACT) ? BLEND_MODE_SUBTRACT : false;
constant bool BLEND_MODE_VIVID_LIGHT [[function_constant(1029)]];
constant bool BLEND_MODE_VIVID_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_VIVID_LIGHT) ? BLEND_MODE_VIVID_LIGHT : false;
constant bool ENABLE_STIPPLE_PATTERN_TEST [[function_constant(1030)]];
constant bool ENABLE_STIPPLE_PATTERN_TEST_tmp = is_function_constant_defined(ENABLE_STIPPLE_PATTERN_TEST) ? ENABLE_STIPPLE_PATTERN_TEST : false;
constant bool SC_GL_FRAGMENT_PRECISION_HIGH [[function_constant(1031)]];
constant bool SC_GL_FRAGMENT_PRECISION_HIGH_tmp = is_function_constant_defined(SC_GL_FRAGMENT_PRECISION_HIGH) ? SC_GL_FRAGMENT_PRECISION_HIGH : false;
constant bool SC_USE_CLAMP_TO_BORDER_baseTex [[function_constant(1032)]];
constant bool SC_USE_CLAMP_TO_BORDER_baseTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_baseTex) ? SC_USE_CLAMP_TO_BORDER_baseTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(1033)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_materialParamsTex [[function_constant(1034)]];
constant bool SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_materialParamsTex) ? SC_USE_CLAMP_TO_BORDER_materialParamsTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_normalTex [[function_constant(1035)]];
constant bool SC_USE_CLAMP_TO_BORDER_normalTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_normalTex) ? SC_USE_CLAMP_TO_BORDER_normalTex : false;
constant bool SC_USE_UV_MIN_MAX_baseTex [[function_constant(1036)]];
constant bool SC_USE_UV_MIN_MAX_baseTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_baseTex) ? SC_USE_UV_MIN_MAX_baseTex : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(1037)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_materialParamsTex [[function_constant(1038)]];
constant bool SC_USE_UV_MIN_MAX_materialParamsTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_materialParamsTex) ? SC_USE_UV_MIN_MAX_materialParamsTex : false;
constant bool SC_USE_UV_MIN_MAX_normalTex [[function_constant(1039)]];
constant bool SC_USE_UV_MIN_MAX_normalTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_normalTex) ? SC_USE_UV_MIN_MAX_normalTex : false;
constant bool SC_USE_UV_TRANSFORM_baseTex [[function_constant(1040)]];
constant bool SC_USE_UV_TRANSFORM_baseTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_baseTex) ? SC_USE_UV_TRANSFORM_baseTex : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(1041)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_materialParamsTex [[function_constant(1042)]];
constant bool SC_USE_UV_TRANSFORM_materialParamsTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_materialParamsTex) ? SC_USE_UV_TRANSFORM_materialParamsTex : false;
constant bool SC_USE_UV_TRANSFORM_normalTex [[function_constant(1043)]];
constant bool SC_USE_UV_TRANSFORM_normalTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_normalTex) ? SC_USE_UV_TRANSFORM_normalTex : false;
constant bool UseViewSpaceDepthVariant [[function_constant(1044)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool baseTexHasSwappedViews [[function_constant(1045)]];
constant bool baseTexHasSwappedViews_tmp = is_function_constant_defined(baseTexHasSwappedViews) ? baseTexHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(1046)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool materialParamsTexHasSwappedViews [[function_constant(1047)]];
constant bool materialParamsTexHasSwappedViews_tmp = is_function_constant_defined(materialParamsTexHasSwappedViews) ? materialParamsTexHasSwappedViews : false;
constant bool normalTexHasSwappedViews [[function_constant(1048)]];
constant bool normalTexHasSwappedViews_tmp = is_function_constant_defined(normalTexHasSwappedViews) ? normalTexHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(1049)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(1050)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(1051)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(1052)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(1053)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(1054)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Disabled [[function_constant(1055)]];
constant bool sc_BlendMode_Disabled_tmp = is_function_constant_defined(sc_BlendMode_Disabled) ? sc_BlendMode_Disabled : false;
constant bool sc_BlendMode_Hardware [[function_constant(1056)]];
constant bool sc_BlendMode_Hardware_tmp = is_function_constant_defined(sc_BlendMode_Hardware) ? sc_BlendMode_Hardware : false;
constant bool sc_BlendMode_Max [[function_constant(1057)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(1058)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(1059)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(1060)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(1061)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(1062)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(1063)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(1064)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(1065)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_BlendMode_Software [[function_constant(1066)]];
constant bool sc_BlendMode_Software_tmp = is_function_constant_defined(sc_BlendMode_Software) ? sc_BlendMode_Software : false;
constant bool sc_CanUseSampler2DArray [[function_constant(1067)]];
constant bool sc_CanUseSampler2DArray_tmp = is_function_constant_defined(sc_CanUseSampler2DArray) ? sc_CanUseSampler2DArray : false;
constant bool sc_DepthOnly [[function_constant(1068)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_EnvmapDiffuseHasSwappedViews [[function_constant(1069)]];
constant bool sc_EnvmapDiffuseHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapDiffuseHasSwappedViews) ? sc_EnvmapDiffuseHasSwappedViews : false;
constant bool sc_EnvmapSpecularHasSwappedViews [[function_constant(1070)]];
constant bool sc_EnvmapSpecularHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapSpecularHasSwappedViews) ? sc_EnvmapSpecularHasSwappedViews : false;
constant bool sc_FramebufferFetch [[function_constant(1071)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_GetFramebufferColorInvalidUsageMarker [[function_constant(1072)]];
constant bool sc_GetFramebufferColorInvalidUsageMarker_tmp = is_function_constant_defined(sc_GetFramebufferColorInvalidUsageMarker) ? sc_GetFramebufferColorInvalidUsageMarker : false;
constant bool sc_HairDebugMode [[function_constant(1073)]];
constant bool sc_HairDebugMode_tmp = is_function_constant_defined(sc_HairDebugMode) ? sc_HairDebugMode : false;
constant bool sc_HairFallbackMode [[function_constant(1074)]];
constant bool sc_HairFallbackMode_tmp = is_function_constant_defined(sc_HairFallbackMode) ? sc_HairFallbackMode : false;
constant bool sc_HasDiffuseEnvmap [[function_constant(1075)]];
constant bool sc_HasDiffuseEnvmap_tmp = is_function_constant_defined(sc_HasDiffuseEnvmap) ? sc_HasDiffuseEnvmap : false;
constant bool sc_LightEstimation [[function_constant(1076)]];
constant bool sc_LightEstimation_tmp = is_function_constant_defined(sc_LightEstimation) ? sc_LightEstimation : false;
constant bool sc_MotionVectorsPass [[function_constant(1077)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(1078)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(1079)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(1080)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_OITDepthPrepass [[function_constant(1081)]];
constant bool sc_OITDepthPrepass_tmp = is_function_constant_defined(sc_OITDepthPrepass) ? sc_OITDepthPrepass : false;
constant bool sc_OITFrontLayerPass [[function_constant(1082)]];
constant bool sc_OITFrontLayerPass_tmp = is_function_constant_defined(sc_OITFrontLayerPass) ? sc_OITFrontLayerPass : false;
constant bool sc_OITMaxLayers4Plus1 [[function_constant(1083)]];
constant bool sc_OITMaxLayers4Plus1_tmp = is_function_constant_defined(sc_OITMaxLayers4Plus1) ? sc_OITMaxLayers4Plus1 : false;
constant bool sc_OITMaxLayers4 [[function_constant(1084)]];
constant bool sc_OITMaxLayers4_tmp = is_function_constant_defined(sc_OITMaxLayers4) ? sc_OITMaxLayers4 : false;
constant bool sc_OITMaxLayers8 [[function_constant(1085)]];
constant bool sc_OITMaxLayers8_tmp = is_function_constant_defined(sc_OITMaxLayers8) ? sc_OITMaxLayers8 : false;
constant bool sc_OITMaxLayersVisualizeLayerCount [[function_constant(1086)]];
constant bool sc_OITMaxLayersVisualizeLayerCount_tmp = is_function_constant_defined(sc_OITMaxLayersVisualizeLayerCount) ? sc_OITMaxLayersVisualizeLayerCount : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(1087)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(1088)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RenderAlphaToColor [[function_constant(1089)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_SSAOEnabled [[function_constant(1090)]];
constant bool sc_SSAOEnabled_tmp = is_function_constant_defined(sc_SSAOEnabled) ? sc_SSAOEnabled : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(1091)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(1092)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_TAAEnabled [[function_constant(1093)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_UseFragDepth [[function_constant(999)]];
constant bool sc_UseFragDepth_tmp = is_function_constant_defined(sc_UseFragDepth) ? sc_UseFragDepth : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(1095)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(1096)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(1097)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant int SC_DEVICE_CLASS [[function_constant(1098)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex [[function_constant(1099)]];
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_baseTex) ? SC_SOFTWARE_WRAP_MODE_U_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(1100)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex [[function_constant(1101)]];
constant int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex) ? SC_SOFTWARE_WRAP_MODE_U_materialParamsTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_normalTex [[function_constant(1102)]];
constant int SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_normalTex) ? SC_SOFTWARE_WRAP_MODE_U_normalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex [[function_constant(1103)]];
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_baseTex) ? SC_SOFTWARE_WRAP_MODE_V_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(1104)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex [[function_constant(1105)]];
constant int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_materialParamsTex) ? SC_SOFTWARE_WRAP_MODE_V_materialParamsTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_normalTex [[function_constant(1106)]];
constant int SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_normalTex) ? SC_SOFTWARE_WRAP_MODE_V_normalTex : -1;
constant int baseTexLayout [[function_constant(1107)]];
constant int baseTexLayout_tmp = is_function_constant_defined(baseTexLayout) ? baseTexLayout : 0;
constant int baseTexUV [[function_constant(1108)]];
constant int baseTexUV_tmp = is_function_constant_defined(baseTexUV) ? baseTexUV : 0;
constant int intensityTextureLayout [[function_constant(1109)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int intensityTextureUV [[function_constant(1110)]];
constant int intensityTextureUV_tmp = is_function_constant_defined(intensityTextureUV) ? intensityTextureUV : 0;
constant int materialParamsTexLayout [[function_constant(1111)]];
constant int materialParamsTexLayout_tmp = is_function_constant_defined(materialParamsTexLayout) ? materialParamsTexLayout : 0;
constant int materialParamsTexUV [[function_constant(1112)]];
constant int materialParamsTexUV_tmp = is_function_constant_defined(materialParamsTexUV) ? materialParamsTexUV : 0;
constant int normalTexLayout [[function_constant(1113)]];
constant int normalTexLayout_tmp = is_function_constant_defined(normalTexLayout) ? normalTexLayout : 0;
constant int normalTexUV [[function_constant(1114)]];
constant int normalTexUV_tmp = is_function_constant_defined(normalTexUV) ? normalTexUV : 0;
constant int sc_AmbientLightMode0 [[function_constant(1115)]];
constant int sc_AmbientLightMode0_tmp = is_function_constant_defined(sc_AmbientLightMode0) ? sc_AmbientLightMode0 : 0;
constant int sc_AmbientLightMode1 [[function_constant(1116)]];
constant int sc_AmbientLightMode1_tmp = is_function_constant_defined(sc_AmbientLightMode1) ? sc_AmbientLightMode1 : 0;
constant int sc_AmbientLightMode2 [[function_constant(1117)]];
constant int sc_AmbientLightMode2_tmp = is_function_constant_defined(sc_AmbientLightMode2) ? sc_AmbientLightMode2 : 0;
constant int sc_AmbientLightMode_Constant [[function_constant(1118)]];
constant int sc_AmbientLightMode_Constant_tmp = is_function_constant_defined(sc_AmbientLightMode_Constant) ? sc_AmbientLightMode_Constant : 0;
constant int sc_AmbientLightMode_EnvironmentMap [[function_constant(1119)]];
constant int sc_AmbientLightMode_EnvironmentMap_tmp = is_function_constant_defined(sc_AmbientLightMode_EnvironmentMap) ? sc_AmbientLightMode_EnvironmentMap : 0;
constant int sc_AmbientLightMode_FromCamera [[function_constant(1120)]];
constant int sc_AmbientLightMode_FromCamera_tmp = is_function_constant_defined(sc_AmbientLightMode_FromCamera) ? sc_AmbientLightMode_FromCamera : 0;
constant int sc_AmbientLightMode_SphericalHarmonics [[function_constant(1121)]];
constant int sc_AmbientLightMode_SphericalHarmonics_tmp = is_function_constant_defined(sc_AmbientLightMode_SphericalHarmonics) ? sc_AmbientLightMode_SphericalHarmonics : 0;
constant int sc_AmbientLightsCount [[function_constant(1122)]];
constant int sc_AmbientLightsCount_tmp = is_function_constant_defined(sc_AmbientLightsCount) ? sc_AmbientLightsCount : 0;
constant int sc_DepthBufferMode [[function_constant(1123)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_DirectionalLightsCount [[function_constant(1124)]];
constant int sc_DirectionalLightsCount_tmp = is_function_constant_defined(sc_DirectionalLightsCount) ? sc_DirectionalLightsCount : 0;
constant int sc_EnvLightMode [[function_constant(1125)]];
constant int sc_EnvLightMode_tmp = is_function_constant_defined(sc_EnvLightMode) ? sc_EnvLightMode : 0;
constant int sc_EnvmapDiffuseLayout [[function_constant(1126)]];
constant int sc_EnvmapDiffuseLayout_tmp = is_function_constant_defined(sc_EnvmapDiffuseLayout) ? sc_EnvmapDiffuseLayout : 0;
constant int sc_EnvmapSpecularLayout [[function_constant(1127)]];
constant int sc_EnvmapSpecularLayout_tmp = is_function_constant_defined(sc_EnvmapSpecularLayout) ? sc_EnvmapSpecularLayout : 0;
constant int sc_FragDataCount [[function_constant(1128)]];
constant int sc_FragDataCount_tmp = is_function_constant_defined(sc_FragDataCount) ? sc_FragDataCount : 0;
constant int sc_LightEstimationSGCount [[function_constant(1129)]];
constant int sc_LightEstimationSGCount_tmp = is_function_constant_defined(sc_LightEstimationSGCount) ? sc_LightEstimationSGCount : 0;
constant int sc_MaxTextureImageUnits [[function_constant(1130)]];
constant int sc_MaxTextureImageUnits_tmp = is_function_constant_defined(sc_MaxTextureImageUnits) ? sc_MaxTextureImageUnits : 0;
constant int sc_NumStereoViews [[function_constant(1131)]];
constant int sc_NumStereoViews_tmp = is_function_constant_defined(sc_NumStereoViews) ? sc_NumStereoViews : 1;
constant int sc_PointLightsCount [[function_constant(1132)]];
constant int sc_PointLightsCount_tmp = is_function_constant_defined(sc_PointLightsCount) ? sc_PointLightsCount : 0;
constant int sc_RenderingSpace [[function_constant(1133)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(1134)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_SkinBonesCount [[function_constant(1135)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(1136)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(1137)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;

namespace SNAP_VS {
struct sc_Vertex_t
{
float4 position;
float3 normal;
float3 tangent;
float2 texture0;
float2 texture1;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[3];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed;
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float uvScale;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float4 materialParamsTexSize;
float4 materialParamsTexDims;
float4 materialParamsTexView;
float3x3 materialParamsTexTransform;
float4 materialParamsTexUvMinMax;
float4 materialParamsTexBorderColor;
float2 Port_Center_N016;
float3 Port_Emissive_N006;
float3 Port_SpecularAO_N006;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
};
struct sc_AmbientLightCompatibility_t
{
float3 color;
};
struct sc_Set2
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> baseTex [[id(1)]];
texture2d<float> intensityTexture [[id(2)]];
texture2d<float> materialParamsTex [[id(3)]];
texture2d<float> normalTex [[id(4)]];
texture2d<float> sc_EnvmapDiffuse [[id(5)]];
texture2d<float> sc_EnvmapSpecular [[id(6)]];
texture2d<float> sc_SSAOTexture [[id(15)]];
texture2d<float> sc_ScreenTexture [[id(16)]];
texture2d<float> sc_ShadowTexture [[id(17)]];
sampler baseTexSmpSC [[id(19)]];
sampler intensityTextureSmpSC [[id(20)]];
sampler materialParamsTexSmpSC [[id(21)]];
sampler normalTexSmpSC [[id(22)]];
sampler sc_EnvmapDiffuseSmpSC [[id(23)]];
sampler sc_EnvmapSpecularSmpSC [[id(24)]];
sampler sc_SSAOTextureSmpSC [[id(26)]];
sampler sc_ScreenTextureSmpSC [[id(27)]];
sampler sc_ShadowTextureSmpSC [[id(28)]];
constant userUniformsObj* UserUniforms [[id(30)]];
};
struct main_vert_out
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
float4 gl_Position [[position]];
};
struct main_vert_in
{
float4 position [[attribute(0)]];
float3 normal [[attribute(1)]];
float4 tangent [[attribute(2)]];
float2 texture0 [[attribute(3)]];
float2 texture1 [[attribute(4)]];
float4 boneData [[attribute(5)]];
float3 blendShape0Pos [[attribute(6)]];
float3 blendShape1Pos [[attribute(7)]];
float3 blendShape2Pos [[attribute(8)]];
float3 blendShape3Pos [[attribute(9)]];
float3 blendShape4Pos [[attribute(10)]];
float3 blendShape5Pos [[attribute(11)]];
float3 blendShape0Normal [[attribute(12)]];
float3 blendShape1Normal [[attribute(13)]];
float3 blendShape2Normal [[attribute(14)]];
float3 positionNext [[attribute(15)]];
float3 positionPrevious [[attribute(16)]];
float4 strandProperties [[attribute(17)]];
float4 color [[attribute(18)]];
};
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set2& sc_set2 [[buffer(2)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
out.PreviewVertexColor=float4(0.5);
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=float4(0.5);
PreviewInfo.Saved=false;
out.PreviewVertexSaved=0.0;
sc_Vertex_t l9_0;
l9_0.position=in.position;
l9_0.normal=in.normal;
l9_0.tangent=in.tangent.xyz;
l9_0.texture0=in.texture0;
l9_0.texture1=in.texture1;
sc_Vertex_t l9_1=l9_0;
sc_Vertex_t param=l9_1;
sc_Vertex_t l9_2=param;
float Dummy1;
float2 Dummy2;
float3 Dummy3;
float4 Dummy4;
ssGlobals tempGlobals;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_3=l9_2;
float3 l9_4=in.blendShape0Pos;
float3 l9_5=in.blendShape0Normal;
float l9_6=(*sc_set2.UserUniforms).weights0.x;
sc_Vertex_t l9_7=l9_3;
float3 l9_8=l9_4;
float l9_9=l9_6;
float3 l9_10=l9_7.position.xyz+(l9_8*l9_9);
l9_7.position=float4(l9_10.x,l9_10.y,l9_10.z,l9_7.position.w);
l9_3=l9_7;
l9_3.normal+=(l9_5*l9_6);
l9_2=l9_3;
sc_Vertex_t l9_11=l9_2;
float3 l9_12=in.blendShape1Pos;
float3 l9_13=in.blendShape1Normal;
float l9_14=(*sc_set2.UserUniforms).weights0.y;
sc_Vertex_t l9_15=l9_11;
float3 l9_16=l9_12;
float l9_17=l9_14;
float3 l9_18=l9_15.position.xyz+(l9_16*l9_17);
l9_15.position=float4(l9_18.x,l9_18.y,l9_18.z,l9_15.position.w);
l9_11=l9_15;
l9_11.normal+=(l9_13*l9_14);
l9_2=l9_11;
sc_Vertex_t l9_19=l9_2;
float3 l9_20=in.blendShape2Pos;
float3 l9_21=in.blendShape2Normal;
float l9_22=(*sc_set2.UserUniforms).weights0.z;
sc_Vertex_t l9_23=l9_19;
float3 l9_24=l9_20;
float l9_25=l9_22;
float3 l9_26=l9_23.position.xyz+(l9_24*l9_25);
l9_23.position=float4(l9_26.x,l9_26.y,l9_26.z,l9_23.position.w);
l9_19=l9_23;
l9_19.normal+=(l9_21*l9_22);
l9_2=l9_19;
}
else
{
sc_Vertex_t l9_27=l9_2;
float3 l9_28=in.blendShape0Pos;
float l9_29=(*sc_set2.UserUniforms).weights0.x;
float3 l9_30=l9_27.position.xyz+(l9_28*l9_29);
l9_27.position=float4(l9_30.x,l9_30.y,l9_30.z,l9_27.position.w);
l9_2=l9_27;
sc_Vertex_t l9_31=l9_2;
float3 l9_32=in.blendShape1Pos;
float l9_33=(*sc_set2.UserUniforms).weights0.y;
float3 l9_34=l9_31.position.xyz+(l9_32*l9_33);
l9_31.position=float4(l9_34.x,l9_34.y,l9_34.z,l9_31.position.w);
l9_2=l9_31;
sc_Vertex_t l9_35=l9_2;
float3 l9_36=in.blendShape2Pos;
float l9_37=(*sc_set2.UserUniforms).weights0.z;
float3 l9_38=l9_35.position.xyz+(l9_36*l9_37);
l9_35.position=float4(l9_38.x,l9_38.y,l9_38.z,l9_35.position.w);
l9_2=l9_35;
sc_Vertex_t l9_39=l9_2;
float3 l9_40=in.blendShape3Pos;
float l9_41=(*sc_set2.UserUniforms).weights0.w;
float3 l9_42=l9_39.position.xyz+(l9_40*l9_41);
l9_39.position=float4(l9_42.x,l9_42.y,l9_42.z,l9_39.position.w);
l9_2=l9_39;
sc_Vertex_t l9_43=l9_2;
float3 l9_44=in.blendShape4Pos;
float l9_45=(*sc_set2.UserUniforms).weights1.x;
float3 l9_46=l9_43.position.xyz+(l9_44*l9_45);
l9_43.position=float4(l9_46.x,l9_46.y,l9_46.z,l9_43.position.w);
l9_2=l9_43;
sc_Vertex_t l9_47=l9_2;
float3 l9_48=in.blendShape5Pos;
float l9_49=(*sc_set2.UserUniforms).weights1.y;
float3 l9_50=l9_47.position.xyz+(l9_48*l9_49);
l9_47.position=float4(l9_50.x,l9_50.y,l9_50.z,l9_47.position.w);
l9_2=l9_47;
}
}
param=l9_2;
sc_Vertex_t l9_51=param;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_52=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_52=float4(1.0,fract(in.boneData.yzw));
l9_52.x-=dot(l9_52.yzw,float3(1.0));
}
float4 l9_53=l9_52;
float4 l9_54=l9_53;
int l9_55=0;
int l9_56=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_56=int(in.boneData[l9_55]);
}
int l9_57=l9_56;
int l9_58=l9_57;
int l9_59=1;
int l9_60=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_60=int(in.boneData[l9_59]);
}
int l9_61=l9_60;
int l9_62=l9_61;
int l9_63=2;
int l9_64=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_64=int(in.boneData[l9_63]);
}
int l9_65=l9_64;
int l9_66=l9_65;
int l9_67=3;
int l9_68=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_68=int(in.boneData[l9_67]);
}
int l9_69=l9_68;
int l9_70=l9_69;
int l9_71=l9_58;
float4 l9_72=l9_51.position;
float3 l9_73;
if (sc_SkinBonesCount_tmp>0)
{
int l9_74=l9_71;
float4 l9_75=(*sc_set2.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[0];
float4 l9_76=(*sc_set2.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[1];
float4 l9_77=(*sc_set2.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[2];
float4x3 l9_78=float4x3(float3(l9_75.x,l9_76.x,l9_77.x),float3(l9_75.y,l9_76.y,l9_77.y),float3(l9_75.z,l9_76.z,l9_77.z),float3(l9_75.w,l9_76.w,l9_77.w));
l9_73=l9_78*l9_72;
}
else
{
l9_73=l9_72.xyz;
}
float3 l9_79=l9_73;
float3 l9_80=l9_79;
float l9_81=l9_54.x;
int l9_82=l9_62;
float4 l9_83=l9_51.position;
float3 l9_84;
if (sc_SkinBonesCount_tmp>0)
{
int l9_85=l9_82;
float4 l9_86=(*sc_set2.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[0];
float4 l9_87=(*sc_set2.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[1];
float4 l9_88=(*sc_set2.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[2];
float4x3 l9_89=float4x3(float3(l9_86.x,l9_87.x,l9_88.x),float3(l9_86.y,l9_87.y,l9_88.y),float3(l9_86.z,l9_87.z,l9_88.z),float3(l9_86.w,l9_87.w,l9_88.w));
l9_84=l9_89*l9_83;
}
else
{
l9_84=l9_83.xyz;
}
float3 l9_90=l9_84;
float3 l9_91=l9_90;
float l9_92=l9_54.y;
int l9_93=l9_66;
float4 l9_94=l9_51.position;
float3 l9_95;
if (sc_SkinBonesCount_tmp>0)
{
int l9_96=l9_93;
float4 l9_97=(*sc_set2.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[0];
float4 l9_98=(*sc_set2.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[1];
float4 l9_99=(*sc_set2.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[2];
float4x3 l9_100=float4x3(float3(l9_97.x,l9_98.x,l9_99.x),float3(l9_97.y,l9_98.y,l9_99.y),float3(l9_97.z,l9_98.z,l9_99.z),float3(l9_97.w,l9_98.w,l9_99.w));
l9_95=l9_100*l9_94;
}
else
{
l9_95=l9_94.xyz;
}
float3 l9_101=l9_95;
float3 l9_102=l9_101;
float l9_103=l9_54.z;
int l9_104=l9_70;
float4 l9_105=l9_51.position;
float3 l9_106;
if (sc_SkinBonesCount_tmp>0)
{
int l9_107=l9_104;
float4 l9_108=(*sc_set2.sc_BonesUBO).sc_Bones[l9_107].boneMatrix[0];
float4 l9_109=(*sc_set2.sc_BonesUBO).sc_Bones[l9_107].boneMatrix[1];
float4 l9_110=(*sc_set2.sc_BonesUBO).sc_Bones[l9_107].boneMatrix[2];
float4x3 l9_111=float4x3(float3(l9_108.x,l9_109.x,l9_110.x),float3(l9_108.y,l9_109.y,l9_110.y),float3(l9_108.z,l9_109.z,l9_110.z),float3(l9_108.w,l9_109.w,l9_110.w));
l9_106=l9_111*l9_105;
}
else
{
l9_106=l9_105.xyz;
}
float3 l9_112=l9_106;
float3 l9_113=(((l9_80*l9_81)+(l9_91*l9_92))+(l9_102*l9_103))+(l9_112*l9_54.w);
l9_51.position=float4(l9_113.x,l9_113.y,l9_113.z,l9_51.position.w);
int l9_114=l9_58;
float3x3 l9_115=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_114].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_114].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_114].normalMatrix[2].xyz));
float3x3 l9_116=l9_115;
float3x3 l9_117=l9_116;
int l9_118=l9_62;
float3x3 l9_119=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_118].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_118].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_118].normalMatrix[2].xyz));
float3x3 l9_120=l9_119;
float3x3 l9_121=l9_120;
int l9_122=l9_66;
float3x3 l9_123=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_122].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_122].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_122].normalMatrix[2].xyz));
float3x3 l9_124=l9_123;
float3x3 l9_125=l9_124;
int l9_126=l9_70;
float3x3 l9_127=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_126].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_126].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_126].normalMatrix[2].xyz));
float3x3 l9_128=l9_127;
float3x3 l9_129=l9_128;
l9_51.normal=((((l9_117*l9_51.normal)*l9_54.x)+((l9_121*l9_51.normal)*l9_54.y))+((l9_125*l9_51.normal)*l9_54.z))+((l9_129*l9_51.normal)*l9_54.w);
l9_51.tangent=((((l9_117*l9_51.tangent)*l9_54.x)+((l9_121*l9_51.tangent)*l9_54.y))+((l9_125*l9_51.tangent)*l9_54.z))+((l9_129*l9_51.tangent)*l9_54.w);
}
param=l9_51;
if (sc_RenderingSpace_tmp==3)
{
out.varPos=float3(0.0);
out.varNormal=param.normal;
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==4)
{
out.varPos=float3(0.0);
out.varNormal=param.normal;
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
out.varPos=param.position.xyz;
out.varNormal=param.normal;
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
out.varPos=((*sc_set2.UserUniforms).sc_ModelMatrix*param.position).xyz;
out.varNormal=(*sc_set2.UserUniforms).sc_NormalMatrix*param.normal;
float3 l9_130=(*sc_set2.UserUniforms).sc_NormalMatrix*param.tangent;
out.varTangent=float4(l9_130.x,l9_130.y,l9_130.z,out.varTangent.w);
}
}
}
}
if ((*sc_set2.UserUniforms).PreviewEnabled==1)
{
param.texture0.x=1.0-param.texture0.x;
}
out.varColor=in.color;
sc_Vertex_t v=param;
float l9_131;
if ((*sc_set2.UserUniforms).overrideTimeEnabled==1)
{
l9_131=(*sc_set2.UserUniforms).overrideTimeElapsed;
}
else
{
l9_131=(*sc_set2.UserUniforms).sc_Time.x;
}
ssGlobals Globals;
Globals.gTimeElapsed=l9_131;
float l9_132;
if ((*sc_set2.UserUniforms).overrideTimeEnabled==1)
{
l9_132=(*sc_set2.UserUniforms).overrideTimeDelta;
}
else
{
l9_132=(*sc_set2.UserUniforms).sc_Time.y;
}
Globals.gTimeDelta=l9_132;
float4 ScreenPosition=float4(0.0);
float3 WorldPosition=out.varPos;
float3 WorldNormal=out.varNormal;
float3 WorldTangent=out.varTangent.xyz;
if ((*sc_set2.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPos;
WorldNormal=out.varNormal;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_1=v;
float3 param_2=WorldPosition;
float3 param_3=WorldNormal;
float3 param_4=WorldTangent;
float4 param_5=v.position;
out.varPos=param_2;
out.varNormal=normalize(param_3);
float3 l9_133=normalize(param_4);
out.varTangent=float4(l9_133.x,l9_133.y,l9_133.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_134=param_1.position;
float4 l9_135;
if (sc_RenderingSpace_tmp==3)
{
int l9_136;
if (sc_StereoRenderingMode_tmp==0)
{
l9_136=0;
}
else
{
l9_136=gl_InstanceIndex%2;
}
int l9_137=l9_136;
l9_135=(*sc_set2.UserUniforms).sc_ProjectionMatrixInverseArray[l9_137]*l9_134;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_138;
if (sc_StereoRenderingMode_tmp==0)
{
l9_138=0;
}
else
{
l9_138=gl_InstanceIndex%2;
}
int l9_139=l9_138;
l9_135=(*sc_set2.UserUniforms).sc_ViewMatrixArray[l9_139]*l9_134;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_140;
if (sc_StereoRenderingMode_tmp==0)
{
l9_140=0;
}
else
{
l9_140=gl_InstanceIndex%2;
}
int l9_141=l9_140;
l9_135=(*sc_set2.UserUniforms).sc_ModelViewMatrixArray[l9_141]*l9_134;
}
else
{
l9_135=l9_134;
}
}
}
float4 l9_142=l9_135;
out.varViewSpaceDepth=-l9_142.z;
}
float4 l9_143=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_143=param_5;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_144;
if (sc_StereoRenderingMode_tmp==0)
{
l9_144=0;
}
else
{
l9_144=gl_InstanceIndex%2;
}
int l9_145=l9_144;
l9_143=((*sc_set2.UserUniforms).sc_ModelViewMatrixArray[l9_145]*param_1.position)*float4(1.0/(*sc_set2.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_146;
if (sc_StereoRenderingMode_tmp==0)
{
l9_146=0;
}
else
{
l9_146=gl_InstanceIndex%2;
}
int l9_147=l9_146;
l9_143=(*sc_set2.UserUniforms).sc_ViewProjectionMatrixArray[l9_147]*float4(out.varPos,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_148;
if (sc_StereoRenderingMode_tmp==0)
{
l9_148=0;
}
else
{
l9_148=gl_InstanceIndex%2;
}
int l9_149=l9_148;
l9_143=(*sc_set2.UserUniforms).sc_ViewProjectionMatrixArray[l9_149]*float4(out.varPos,1.0);
}
}
}
}
out.varPackedTex=float4(param_1.texture0,param_1.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_150=param_1.position;
float4 l9_151=l9_150;
if (sc_RenderingSpace_tmp==1)
{
l9_151=(*sc_set2.UserUniforms).sc_ModelMatrix*l9_150;
}
float4 l9_152=(*sc_set2.UserUniforms).sc_ProjectorMatrix*l9_151;
float2 l9_153=((l9_152.xy/float2(l9_152.w))*0.5)+float2(0.5);
out.varShadowTex=l9_153;
}
float4 l9_154=l9_143;
if (sc_DepthBufferMode_tmp==1)
{
float l9_155=2.0/log2((*sc_set2.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_154.z=((log2(fast::max((*sc_set2.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_154.w))*l9_155)-1.0)*l9_154.w;
}
float4 l9_156=l9_154;
l9_143=l9_156;
float4 l9_157=l9_143;
float4 l9_158=l9_157;
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_159=l9_158;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_160=dot(l9_159,(*sc_set2.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_161=l9_160;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
float l9_162=l9_161;
}
else
{
out.varClipDistance=l9_161;
}
}
float4 l9_163=float4(l9_158.x,-l9_158.y,(l9_158.z*0.5)+(l9_158.w*0.5),l9_158.w);
out.gl_Position=l9_163;
v=param_1;
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct SurfaceProperties
{
float3 albedo;
float opacity;
float3 normal;
float3 positionWS;
float3 viewDirWS;
float metallic;
float roughness;
float3 emissive;
float3 ao;
float3 specularAo;
float3 bakedShadows;
float3 specColor;
};
struct LightingComponents
{
float3 directDiffuse;
float3 directSpecular;
float3 indirectDiffuse;
float3 indirectSpecular;
float3 emitted;
float3 transmitted;
};
struct LightProperties
{
float3 direction;
float3 color;
float attenuation;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float3 VertexTangent_WorldSpace;
float3 VertexNormal_WorldSpace;
float3 VertexBinormal_WorldSpace;
float2 Surface_UVCoord0;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[3];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed;
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float uvScale;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float4 materialParamsTexSize;
float4 materialParamsTexDims;
float4 materialParamsTexView;
float3x3 materialParamsTexTransform;
float4 materialParamsTexUvMinMax;
float4 materialParamsTexBorderColor;
float2 Port_Center_N016;
float3 Port_Emissive_N006;
float3 Port_SpecularAO_N006;
};
struct sc_PointLight_t_1
{
bool falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct sc_AmbientLightCompatibility_t
{
float3 color;
};
struct sc_Set2
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> baseTex [[id(1)]];
texture2d<float> intensityTexture [[id(2)]];
texture2d<float> materialParamsTex [[id(3)]];
texture2d<float> normalTex [[id(4)]];
texture2d<float> sc_EnvmapDiffuse [[id(5)]];
texture2d<float> sc_EnvmapSpecular [[id(6)]];
texture2d<float> sc_SSAOTexture [[id(15)]];
texture2d<float> sc_ScreenTexture [[id(16)]];
texture2d<float> sc_ShadowTexture [[id(17)]];
sampler baseTexSmpSC [[id(19)]];
sampler intensityTextureSmpSC [[id(20)]];
sampler materialParamsTexSmpSC [[id(21)]];
sampler normalTexSmpSC [[id(22)]];
sampler sc_EnvmapDiffuseSmpSC [[id(23)]];
sampler sc_EnvmapSpecularSmpSC [[id(24)]];
sampler sc_SSAOTextureSmpSC [[id(26)]];
sampler sc_ScreenTextureSmpSC [[id(27)]];
sampler sc_ShadowTextureSmpSC [[id(28)]];
constant userUniformsObj* UserUniforms [[id(30)]];
};
struct main_frag_out
{
float4 FragColor0 [[color(0)]];
float4 FragColor1 [[color(1)]];
float4 FragColor2 [[color(2)]];
float4 FragColor3 [[color(3)]];
};
struct main_frag_in
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
float3 evaluateSSAO(thread const float3& positionWS,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_SSAOTexture,thread sampler sc_SSAOTextureSmpSC)
{
if ((int(sc_SSAOEnabled_tmp)!=0))
{
int l9_0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_0=0;
}
else
{
l9_0=varStereoViewID;
}
int l9_1=l9_0;
float4 clipSpaceCoord=UserUniforms.sc_ViewProjectionMatrixArray[l9_1]*float4(positionWS,1.0);
float3 l9_2=clipSpaceCoord.xyz/float3(clipSpaceCoord.w);
clipSpaceCoord=float4(l9_2.x,l9_2.y,l9_2.z,clipSpaceCoord.w);
float4 shadowSample=sc_SSAOTexture.sample(sc_SSAOTextureSmpSC,((clipSpaceCoord.xy*0.5)+float2(0.5)));
return float3(shadowSample.x);
}
else
{
return float3(1.0);
}
}
float3 calculateDirectSpecular(thread const SurfaceProperties& surfaceProperties,thread const float3& L,thread const float3& V)
{
float r=fast::max(surfaceProperties.roughness,0.03);
float3 F0=surfaceProperties.specColor;
float3 N=surfaceProperties.normal;
float3 H=normalize(L+V);
float param=dot(N,L);
float l9_0=fast::clamp(param,0.0,1.0);
float NdotL=l9_0;
float param_1=dot(N,V);
float l9_1=fast::clamp(param_1,0.0,1.0);
float NdotV=l9_1;
float param_2=dot(N,H);
float l9_2=fast::clamp(param_2,0.0,1.0);
float NdotH=l9_2;
float param_3=dot(V,H);
float l9_3=fast::clamp(param_3,0.0,1.0);
float VdotH=l9_3;
if (SC_DEVICE_CLASS_tmp>=2)
{
float param_4=NdotH;
float param_5=r;
float l9_4=param_5*param_5;
float l9_5=l9_4*l9_4;
float l9_6=param_4*param_4;
float l9_7=(l9_6*(l9_5-1.0))+1.0;
float l9_8=l9_7*l9_7;
float l9_9=l9_5/(l9_8+1e-07);
float param_6=NdotL;
float param_7=NdotV;
float param_8=r;
float l9_10=param_6;
float l9_11=param_8;
float l9_12=l9_11+1.0;
l9_12=(l9_12*l9_12)*0.125;
float l9_13=(l9_10*(1.0-l9_12))+l9_12;
float l9_14=param_7;
float l9_15=param_8;
float l9_16=l9_15+1.0;
l9_16=(l9_16*l9_16)*0.125;
float l9_17=(l9_14*(1.0-l9_16))+l9_16;
float l9_18=1.0/(l9_13*l9_17);
float param_9=VdotH;
float3 param_10=F0;
float l9_19=param_9;
float3 l9_20=param_10;
float3 l9_21=float3(1.0);
float l9_22=1.0-l9_19;
float l9_23=l9_22*l9_22;
float l9_24=(l9_23*l9_23)*l9_22;
float3 l9_25=l9_20+((l9_21-l9_20)*l9_24);
float3 l9_26=l9_25;
return l9_26*(((l9_9*l9_18)*0.25)*NdotL);
}
else
{
float specPower=exp2(11.0-(10.0*r));
float param_11=VdotH;
float3 param_12=F0;
float l9_27=param_11;
float3 l9_28=param_12;
float3 l9_29=float3(1.0);
float l9_30=1.0-l9_27;
float l9_31=l9_30*l9_30;
float l9_32=(l9_31*l9_31)*l9_30;
float3 l9_33=l9_28+((l9_29-l9_28)*l9_32);
float3 l9_34=l9_33;
return ((l9_34*((specPower*0.125)+0.25))*pow(NdotH,specPower))*NdotL;
}
}
float computeDistanceAttenuation(thread const float& distanceToLight,thread const float& falloffEndDistance)
{
float distanceToLightSquared=distanceToLight*distanceToLight;
if (falloffEndDistance==0.0)
{
return 1.0/distanceToLightSquared;
}
float distanceToLightToTheFourth=distanceToLightSquared*distanceToLightSquared;
float falloffEndDistanceToTheFourth=pow(falloffEndDistance,4.0);
return fast::max(fast::min(1.0-(distanceToLightToTheFourth/falloffEndDistanceToTheFourth),1.0),0.0)/distanceToLightSquared;
}
float2 calcSeamlessPanoramicUvsForSampling(thread const float2& uv,thread const float2& topMipRes,thread const float& lod)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 thisMipRes=fast::max(float2(1.0),topMipRes/float2(exp2(lod)));
return ((uv*(thisMipRes-float2(1.0)))/thisMipRes)+(float2(0.5)/thisMipRes);
}
else
{
return uv;
}
}
float3 getSpecularDominantDir(thread const float3& N,thread const float3& R,thread const float& roughness)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float lerpFactor=(roughness*roughness)*roughness;
return normalize(mix(R,N,float3(lerpFactor)));
}
else
{
return R;
}
}
float3 envBRDFApprox(thread const SurfaceProperties& surfaceProperties,thread const float& NdotV)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float4 r=(float4(-1.0,-0.0275,-0.572,0.022)*surfaceProperties.roughness)+float4(1.0,0.0425,1.04,-0.04);
float a004=(fast::min(r.x*r.x,exp2((-9.28)*NdotV))*r.x)+r.y;
float2 AB=(float2(-1.04,1.04)*a004)+r.zw;
return fast::max((surfaceProperties.specColor*AB.x)+float3(AB.y),float3(0.0));
}
else
{
float3 fresnelMax=fast::max(float3(1.0-surfaceProperties.roughness),surfaceProperties.specColor);
float param=NdotV;
float3 param_1=surfaceProperties.specColor;
float3 param_2=fresnelMax;
float l9_0=1.0-param;
float l9_1=l9_0*l9_0;
float l9_2=(l9_1*l9_1)*l9_0;
float3 l9_3=param_1+((param_2-param_1)*l9_2);
return l9_3;
}
}
float srgbToLinear(thread const float& x)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
return pow(x,2.2);
}
else
{
return x*x;
}
}
float3 linearToneMapping(thread const float3& x)
{
float a=1.8;
float b=1.4;
float c=0.5;
float d=1.5;
if ((int(SC_GL_FRAGMENT_PRECISION_HIGH_tmp)!=0))
{
return (x*((x*a)+float3(b)))/((x*((x*a)+float3(c)))+float3(d));
}
else
{
return (x*((x*a)+float3(b)))/fast::min(float3(1000.0),(x*((x*a)+float3(c)))+float3(d));
}
}
float linearToSrgb(thread const float& x)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
return pow(x,0.454545);
}
else
{
return sqrt(x);
}
}
float transformSingleColor(thread const float& original,thread const float& intMap,thread const float& target)
{
if (((int(BLEND_MODE_REALISTIC_tmp)!=0)||(int(BLEND_MODE_FORGRAY_tmp)!=0))||(int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
return original/pow(1.0-target,intMap);
}
else
{
if ((int(BLEND_MODE_DIVISION_tmp)!=0))
{
return original/(1.0-target);
}
else
{
if ((int(BLEND_MODE_BRIGHT_tmp)!=0))
{
return original/pow(1.0-target,2.0-(2.0*original));
}
}
}
return 0.0;
}
float3 transformColor(thread const float& yValue,thread const float3& original,thread const float3& target,thread const float& weight,thread const float& intMap)
{
if ((int(BLEND_MODE_INTENSE_tmp)!=0))
{
float3 param=original;
float3 l9_0=param;
float4 l9_1;
if (l9_0.y<l9_0.z)
{
l9_1=float4(l9_0.zy,-1.0,0.666667);
}
else
{
l9_1=float4(l9_0.yz,0.0,-0.333333);
}
float4 l9_2=l9_1;
float4 l9_3;
if (l9_0.x<l9_2.x)
{
l9_3=float4(l9_2.xyw,l9_0.x);
}
else
{
l9_3=float4(l9_0.x,l9_2.yzx);
}
float4 l9_4=l9_3;
float l9_5=l9_4.x-fast::min(l9_4.w,l9_4.y);
float l9_6=abs(((l9_4.w-l9_4.y)/((6.0*l9_5)+1e-07))+l9_4.z);
float l9_7=l9_4.x;
float3 l9_8=float3(l9_6,l9_5,l9_7);
float3 l9_9=l9_8;
float l9_10=l9_9.z-(l9_9.y*0.5);
float l9_11=l9_9.y/((1.0-abs((2.0*l9_10)-1.0))+1e-07);
float3 l9_12=float3(l9_9.x,l9_11,l9_10);
float3 hslOrig=l9_12;
float3 res;
res.x=target.x;
res.y=target.y;
res.z=hslOrig.z;
float3 param_1=res;
float l9_13=param_1.x;
float l9_14=abs((6.0*l9_13)-3.0)-1.0;
float l9_15=2.0-abs((6.0*l9_13)-2.0);
float l9_16=2.0-abs((6.0*l9_13)-4.0);
float3 l9_17=fast::clamp(float3(l9_14,l9_15,l9_16),float3(0.0),float3(1.0));
float3 l9_18=l9_17;
float l9_19=(1.0-abs((2.0*param_1.z)-1.0))*param_1.y;
l9_18=((l9_18-float3(0.5))*l9_19)+float3(param_1.z);
float3 l9_20=l9_18;
res=l9_20;
float3 resColor=mix(original,res,float3(weight));
return resColor;
}
else
{
float param_2=yValue;
float param_3=intMap;
float param_4=target.x;
float3 tmpColor;
tmpColor.x=transformSingleColor(param_2,param_3,param_4);
float param_5=yValue;
float param_6=intMap;
float param_7=target.y;
tmpColor.y=transformSingleColor(param_5,param_6,param_7);
float param_8=yValue;
float param_9=intMap;
float param_10=target.z;
tmpColor.z=transformSingleColor(param_8,param_9,param_10);
tmpColor=fast::clamp(tmpColor,float3(0.0),float3(1.0));
float3 resColor_1=mix(original,tmpColor,float3(weight));
return resColor_1;
}
}
float3 definedBlend(thread const float3& a,thread const float3& b,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> intensityTexture,thread sampler intensityTextureSmpSC)
{
if ((int(BLEND_MODE_LIGHTEN_tmp)!=0))
{
return fast::max(a,b);
}
else
{
if ((int(BLEND_MODE_DARKEN_tmp)!=0))
{
return fast::min(a,b);
}
else
{
if ((int(BLEND_MODE_DIVIDE_tmp)!=0))
{
return b/a;
}
else
{
if ((int(BLEND_MODE_AVERAGE_tmp)!=0))
{
return (a+b)*0.5;
}
else
{
if ((int(BLEND_MODE_SUBTRACT_tmp)!=0))
{
return fast::max((a+b)-float3(1.0),float3(0.0));
}
else
{
if ((int(BLEND_MODE_DIFFERENCE_tmp)!=0))
{
return abs(a-b);
}
else
{
if ((int(BLEND_MODE_NEGATION_tmp)!=0))
{
return float3(1.0)-abs((float3(1.0)-a)-b);
}
else
{
if ((int(BLEND_MODE_EXCLUSION_tmp)!=0))
{
return (a+b)-((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_OVERLAY_tmp)!=0))
{
float l9_0;
if (a.x<0.5)
{
l9_0=(2.0*a.x)*b.x;
}
else
{
l9_0=1.0-((2.0*(1.0-a.x))*(1.0-b.x));
}
float l9_1=l9_0;
float l9_2;
if (a.y<0.5)
{
l9_2=(2.0*a.y)*b.y;
}
else
{
l9_2=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_3=l9_2;
float l9_4;
if (a.z<0.5)
{
l9_4=(2.0*a.z)*b.z;
}
else
{
l9_4=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
return float3(l9_1,l9_3,l9_4);
}
else
{
if ((int(BLEND_MODE_SOFT_LIGHT_tmp)!=0))
{
return (((float3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_HARD_LIGHT_tmp)!=0))
{
float l9_5;
if (b.x<0.5)
{
l9_5=(2.0*b.x)*a.x;
}
else
{
l9_5=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_6=l9_5;
float l9_7;
if (b.y<0.5)
{
l9_7=(2.0*b.y)*a.y;
}
else
{
l9_7=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_8=l9_7;
float l9_9;
if (b.z<0.5)
{
l9_9=(2.0*b.z)*a.z;
}
else
{
l9_9=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
return float3(l9_6,l9_8,l9_9);
}
else
{
if ((int(BLEND_MODE_COLOR_DODGE_tmp)!=0))
{
float l9_10;
if (b.x==1.0)
{
l9_10=b.x;
}
else
{
l9_10=fast::min(a.x/(1.0-b.x),1.0);
}
float l9_11=l9_10;
float l9_12;
if (b.y==1.0)
{
l9_12=b.y;
}
else
{
l9_12=fast::min(a.y/(1.0-b.y),1.0);
}
float l9_13=l9_12;
float l9_14;
if (b.z==1.0)
{
l9_14=b.z;
}
else
{
l9_14=fast::min(a.z/(1.0-b.z),1.0);
}
return float3(l9_11,l9_13,l9_14);
}
else
{
if ((int(BLEND_MODE_COLOR_BURN_tmp)!=0))
{
float l9_15;
if (b.x==0.0)
{
l9_15=b.x;
}
else
{
l9_15=fast::max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_16=l9_15;
float l9_17;
if (b.y==0.0)
{
l9_17=b.y;
}
else
{
l9_17=fast::max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_18=l9_17;
float l9_19;
if (b.z==0.0)
{
l9_19=b.z;
}
else
{
l9_19=fast::max(1.0-((1.0-a.z)/b.z),0.0);
}
return float3(l9_16,l9_18,l9_19);
}
else
{
if ((int(BLEND_MODE_LINEAR_LIGHT_tmp)!=0))
{
float l9_20;
if (b.x<0.5)
{
l9_20=fast::max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_20=fast::min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_21=l9_20;
float l9_22;
if (b.y<0.5)
{
l9_22=fast::max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_22=fast::min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_23=l9_22;
float l9_24;
if (b.z<0.5)
{
l9_24=fast::max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_24=fast::min(a.z+(2.0*(b.z-0.5)),1.0);
}
return float3(l9_21,l9_23,l9_24);
}
else
{
if ((int(BLEND_MODE_VIVID_LIGHT_tmp)!=0))
{
float l9_25;
if (b.x<0.5)
{
float l9_26;
if ((2.0*b.x)==0.0)
{
l9_26=2.0*b.x;
}
else
{
l9_26=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_25=l9_26;
}
else
{
float l9_27;
if ((2.0*(b.x-0.5))==1.0)
{
l9_27=2.0*(b.x-0.5);
}
else
{
l9_27=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_25=l9_27;
}
float l9_28=l9_25;
float l9_29;
if (b.y<0.5)
{
float l9_30;
if ((2.0*b.y)==0.0)
{
l9_30=2.0*b.y;
}
else
{
l9_30=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_29=l9_30;
}
else
{
float l9_31;
if ((2.0*(b.y-0.5))==1.0)
{
l9_31=2.0*(b.y-0.5);
}
else
{
l9_31=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_29=l9_31;
}
float l9_32=l9_29;
float l9_33;
if (b.z<0.5)
{
float l9_34;
if ((2.0*b.z)==0.0)
{
l9_34=2.0*b.z;
}
else
{
l9_34=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_33=l9_34;
}
else
{
float l9_35;
if ((2.0*(b.z-0.5))==1.0)
{
l9_35=2.0*(b.z-0.5);
}
else
{
l9_35=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_33=l9_35;
}
return float3(l9_28,l9_32,l9_33);
}
else
{
if ((int(BLEND_MODE_PIN_LIGHT_tmp)!=0))
{
float l9_36;
if (b.x<0.5)
{
l9_36=fast::min(a.x,2.0*b.x);
}
else
{
l9_36=fast::max(a.x,2.0*(b.x-0.5));
}
float l9_37=l9_36;
float l9_38;
if (b.y<0.5)
{
l9_38=fast::min(a.y,2.0*b.y);
}
else
{
l9_38=fast::max(a.y,2.0*(b.y-0.5));
}
float l9_39=l9_38;
float l9_40;
if (b.z<0.5)
{
l9_40=fast::min(a.z,2.0*b.z);
}
else
{
l9_40=fast::max(a.z,2.0*(b.z-0.5));
}
return float3(l9_37,l9_39,l9_40);
}
else
{
if ((int(BLEND_MODE_HARD_MIX_tmp)!=0))
{
float l9_41;
if (b.x<0.5)
{
float l9_42;
if ((2.0*b.x)==0.0)
{
l9_42=2.0*b.x;
}
else
{
l9_42=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_41=l9_42;
}
else
{
float l9_43;
if ((2.0*(b.x-0.5))==1.0)
{
l9_43=2.0*(b.x-0.5);
}
else
{
l9_43=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_41=l9_43;
}
float l9_44=l9_41;
float l9_45;
if (b.y<0.5)
{
float l9_46;
if ((2.0*b.y)==0.0)
{
l9_46=2.0*b.y;
}
else
{
l9_46=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_45=l9_46;
}
else
{
float l9_47;
if ((2.0*(b.y-0.5))==1.0)
{
l9_47=2.0*(b.y-0.5);
}
else
{
l9_47=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_45=l9_47;
}
float l9_48=l9_45;
float l9_49;
if (b.z<0.5)
{
float l9_50;
if ((2.0*b.z)==0.0)
{
l9_50=2.0*b.z;
}
else
{
l9_50=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_49=l9_50;
}
else
{
float l9_51;
if ((2.0*(b.z-0.5))==1.0)
{
l9_51=2.0*(b.z-0.5);
}
else
{
l9_51=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_49=l9_51;
}
return float3((l9_44<0.5) ? 0.0 : 1.0,(l9_48<0.5) ? 0.0 : 1.0,(l9_49<0.5) ? 0.0 : 1.0);
}
else
{
if ((int(BLEND_MODE_HARD_REFLECT_tmp)!=0))
{
float l9_52;
if (b.x==1.0)
{
l9_52=b.x;
}
else
{
l9_52=fast::min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_53=l9_52;
float l9_54;
if (b.y==1.0)
{
l9_54=b.y;
}
else
{
l9_54=fast::min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_55=l9_54;
float l9_56;
if (b.z==1.0)
{
l9_56=b.z;
}
else
{
l9_56=fast::min((a.z*a.z)/(1.0-b.z),1.0);
}
return float3(l9_53,l9_55,l9_56);
}
else
{
if ((int(BLEND_MODE_HARD_GLOW_tmp)!=0))
{
float l9_57;
if (a.x==1.0)
{
l9_57=a.x;
}
else
{
l9_57=fast::min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_58=l9_57;
float l9_59;
if (a.y==1.0)
{
l9_59=a.y;
}
else
{
l9_59=fast::min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_60=l9_59;
float l9_61;
if (a.z==1.0)
{
l9_61=a.z;
}
else
{
l9_61=fast::min((b.z*b.z)/(1.0-a.z),1.0);
}
return float3(l9_58,l9_60,l9_61);
}
else
{
if ((int(BLEND_MODE_HARD_PHOENIX_tmp)!=0))
{
return (fast::min(a,b)-fast::max(a,b))+float3(1.0);
}
else
{
if ((int(BLEND_MODE_HUE_tmp)!=0))
{
float3 param=a;
float3 param_1=b;
float3 l9_62=param;
float3 l9_63=l9_62;
float4 l9_64;
if (l9_63.y<l9_63.z)
{
l9_64=float4(l9_63.zy,-1.0,0.666667);
}
else
{
l9_64=float4(l9_63.yz,0.0,-0.333333);
}
float4 l9_65=l9_64;
float4 l9_66;
if (l9_63.x<l9_65.x)
{
l9_66=float4(l9_65.xyw,l9_63.x);
}
else
{
l9_66=float4(l9_63.x,l9_65.yzx);
}
float4 l9_67=l9_66;
float l9_68=l9_67.x-fast::min(l9_67.w,l9_67.y);
float l9_69=abs(((l9_67.w-l9_67.y)/((6.0*l9_68)+1e-07))+l9_67.z);
float l9_70=l9_67.x;
float3 l9_71=float3(l9_69,l9_68,l9_70);
float3 l9_72=l9_71;
float l9_73=l9_72.z-(l9_72.y*0.5);
float l9_74=l9_72.y/((1.0-abs((2.0*l9_73)-1.0))+1e-07);
float3 l9_75=float3(l9_72.x,l9_74,l9_73);
float3 l9_76=l9_75;
float3 l9_77=param_1;
float3 l9_78=l9_77;
float4 l9_79;
if (l9_78.y<l9_78.z)
{
l9_79=float4(l9_78.zy,-1.0,0.666667);
}
else
{
l9_79=float4(l9_78.yz,0.0,-0.333333);
}
float4 l9_80=l9_79;
float4 l9_81;
if (l9_78.x<l9_80.x)
{
l9_81=float4(l9_80.xyw,l9_78.x);
}
else
{
l9_81=float4(l9_78.x,l9_80.yzx);
}
float4 l9_82=l9_81;
float l9_83=l9_82.x-fast::min(l9_82.w,l9_82.y);
float l9_84=abs(((l9_82.w-l9_82.y)/((6.0*l9_83)+1e-07))+l9_82.z);
float l9_85=l9_82.x;
float3 l9_86=float3(l9_84,l9_83,l9_85);
float3 l9_87=l9_86;
float l9_88=l9_87.z-(l9_87.y*0.5);
float l9_89=l9_87.y/((1.0-abs((2.0*l9_88)-1.0))+1e-07);
float3 l9_90=float3(l9_87.x,l9_89,l9_88);
float3 l9_91=float3(l9_90.x,l9_76.y,l9_76.z);
float l9_92=l9_91.x;
float l9_93=abs((6.0*l9_92)-3.0)-1.0;
float l9_94=2.0-abs((6.0*l9_92)-2.0);
float l9_95=2.0-abs((6.0*l9_92)-4.0);
float3 l9_96=fast::clamp(float3(l9_93,l9_94,l9_95),float3(0.0),float3(1.0));
float3 l9_97=l9_96;
float l9_98=(1.0-abs((2.0*l9_91.z)-1.0))*l9_91.y;
l9_97=((l9_97-float3(0.5))*l9_98)+float3(l9_91.z);
float3 l9_99=l9_97;
float3 l9_100=l9_99;
return l9_100;
}
else
{
if ((int(BLEND_MODE_SATURATION_tmp)!=0))
{
float3 param_2=a;
float3 param_3=b;
float3 l9_101=param_2;
float3 l9_102=l9_101;
float4 l9_103;
if (l9_102.y<l9_102.z)
{
l9_103=float4(l9_102.zy,-1.0,0.666667);
}
else
{
l9_103=float4(l9_102.yz,0.0,-0.333333);
}
float4 l9_104=l9_103;
float4 l9_105;
if (l9_102.x<l9_104.x)
{
l9_105=float4(l9_104.xyw,l9_102.x);
}
else
{
l9_105=float4(l9_102.x,l9_104.yzx);
}
float4 l9_106=l9_105;
float l9_107=l9_106.x-fast::min(l9_106.w,l9_106.y);
float l9_108=abs(((l9_106.w-l9_106.y)/((6.0*l9_107)+1e-07))+l9_106.z);
float l9_109=l9_106.x;
float3 l9_110=float3(l9_108,l9_107,l9_109);
float3 l9_111=l9_110;
float l9_112=l9_111.z-(l9_111.y*0.5);
float l9_113=l9_111.y/((1.0-abs((2.0*l9_112)-1.0))+1e-07);
float3 l9_114=float3(l9_111.x,l9_113,l9_112);
float3 l9_115=l9_114;
float l9_116=l9_115.x;
float3 l9_117=param_3;
float3 l9_118=l9_117;
float4 l9_119;
if (l9_118.y<l9_118.z)
{
l9_119=float4(l9_118.zy,-1.0,0.666667);
}
else
{
l9_119=float4(l9_118.yz,0.0,-0.333333);
}
float4 l9_120=l9_119;
float4 l9_121;
if (l9_118.x<l9_120.x)
{
l9_121=float4(l9_120.xyw,l9_118.x);
}
else
{
l9_121=float4(l9_118.x,l9_120.yzx);
}
float4 l9_122=l9_121;
float l9_123=l9_122.x-fast::min(l9_122.w,l9_122.y);
float l9_124=abs(((l9_122.w-l9_122.y)/((6.0*l9_123)+1e-07))+l9_122.z);
float l9_125=l9_122.x;
float3 l9_126=float3(l9_124,l9_123,l9_125);
float3 l9_127=l9_126;
float l9_128=l9_127.z-(l9_127.y*0.5);
float l9_129=l9_127.y/((1.0-abs((2.0*l9_128)-1.0))+1e-07);
float3 l9_130=float3(l9_127.x,l9_129,l9_128);
float3 l9_131=float3(l9_116,l9_130.y,l9_115.z);
float l9_132=l9_131.x;
float l9_133=abs((6.0*l9_132)-3.0)-1.0;
float l9_134=2.0-abs((6.0*l9_132)-2.0);
float l9_135=2.0-abs((6.0*l9_132)-4.0);
float3 l9_136=fast::clamp(float3(l9_133,l9_134,l9_135),float3(0.0),float3(1.0));
float3 l9_137=l9_136;
float l9_138=(1.0-abs((2.0*l9_131.z)-1.0))*l9_131.y;
l9_137=((l9_137-float3(0.5))*l9_138)+float3(l9_131.z);
float3 l9_139=l9_137;
float3 l9_140=l9_139;
return l9_140;
}
else
{
if ((int(BLEND_MODE_COLOR_tmp)!=0))
{
float3 param_4=a;
float3 param_5=b;
float3 l9_141=param_5;
float3 l9_142=l9_141;
float4 l9_143;
if (l9_142.y<l9_142.z)
{
l9_143=float4(l9_142.zy,-1.0,0.666667);
}
else
{
l9_143=float4(l9_142.yz,0.0,-0.333333);
}
float4 l9_144=l9_143;
float4 l9_145;
if (l9_142.x<l9_144.x)
{
l9_145=float4(l9_144.xyw,l9_142.x);
}
else
{
l9_145=float4(l9_142.x,l9_144.yzx);
}
float4 l9_146=l9_145;
float l9_147=l9_146.x-fast::min(l9_146.w,l9_146.y);
float l9_148=abs(((l9_146.w-l9_146.y)/((6.0*l9_147)+1e-07))+l9_146.z);
float l9_149=l9_146.x;
float3 l9_150=float3(l9_148,l9_147,l9_149);
float3 l9_151=l9_150;
float l9_152=l9_151.z-(l9_151.y*0.5);
float l9_153=l9_151.y/((1.0-abs((2.0*l9_152)-1.0))+1e-07);
float3 l9_154=float3(l9_151.x,l9_153,l9_152);
float3 l9_155=l9_154;
float l9_156=l9_155.x;
float l9_157=l9_155.y;
float3 l9_158=param_4;
float3 l9_159=l9_158;
float4 l9_160;
if (l9_159.y<l9_159.z)
{
l9_160=float4(l9_159.zy,-1.0,0.666667);
}
else
{
l9_160=float4(l9_159.yz,0.0,-0.333333);
}
float4 l9_161=l9_160;
float4 l9_162;
if (l9_159.x<l9_161.x)
{
l9_162=float4(l9_161.xyw,l9_159.x);
}
else
{
l9_162=float4(l9_159.x,l9_161.yzx);
}
float4 l9_163=l9_162;
float l9_164=l9_163.x-fast::min(l9_163.w,l9_163.y);
float l9_165=abs(((l9_163.w-l9_163.y)/((6.0*l9_164)+1e-07))+l9_163.z);
float l9_166=l9_163.x;
float3 l9_167=float3(l9_165,l9_164,l9_166);
float3 l9_168=l9_167;
float l9_169=l9_168.z-(l9_168.y*0.5);
float l9_170=l9_168.y/((1.0-abs((2.0*l9_169)-1.0))+1e-07);
float3 l9_171=float3(l9_168.x,l9_170,l9_169);
float3 l9_172=float3(l9_156,l9_157,l9_171.z);
float l9_173=l9_172.x;
float l9_174=abs((6.0*l9_173)-3.0)-1.0;
float l9_175=2.0-abs((6.0*l9_173)-2.0);
float l9_176=2.0-abs((6.0*l9_173)-4.0);
float3 l9_177=fast::clamp(float3(l9_174,l9_175,l9_176),float3(0.0),float3(1.0));
float3 l9_178=l9_177;
float l9_179=(1.0-abs((2.0*l9_172.z)-1.0))*l9_172.y;
l9_178=((l9_178-float3(0.5))*l9_179)+float3(l9_172.z);
float3 l9_180=l9_178;
float3 l9_181=l9_180;
return l9_181;
}
else
{
if ((int(BLEND_MODE_LUMINOSITY_tmp)!=0))
{
float3 param_6=a;
float3 param_7=b;
float3 l9_182=param_6;
float3 l9_183=l9_182;
float4 l9_184;
if (l9_183.y<l9_183.z)
{
l9_184=float4(l9_183.zy,-1.0,0.666667);
}
else
{
l9_184=float4(l9_183.yz,0.0,-0.333333);
}
float4 l9_185=l9_184;
float4 l9_186;
if (l9_183.x<l9_185.x)
{
l9_186=float4(l9_185.xyw,l9_183.x);
}
else
{
l9_186=float4(l9_183.x,l9_185.yzx);
}
float4 l9_187=l9_186;
float l9_188=l9_187.x-fast::min(l9_187.w,l9_187.y);
float l9_189=abs(((l9_187.w-l9_187.y)/((6.0*l9_188)+1e-07))+l9_187.z);
float l9_190=l9_187.x;
float3 l9_191=float3(l9_189,l9_188,l9_190);
float3 l9_192=l9_191;
float l9_193=l9_192.z-(l9_192.y*0.5);
float l9_194=l9_192.y/((1.0-abs((2.0*l9_193)-1.0))+1e-07);
float3 l9_195=float3(l9_192.x,l9_194,l9_193);
float3 l9_196=l9_195;
float l9_197=l9_196.x;
float l9_198=l9_196.y;
float3 l9_199=param_7;
float3 l9_200=l9_199;
float4 l9_201;
if (l9_200.y<l9_200.z)
{
l9_201=float4(l9_200.zy,-1.0,0.666667);
}
else
{
l9_201=float4(l9_200.yz,0.0,-0.333333);
}
float4 l9_202=l9_201;
float4 l9_203;
if (l9_200.x<l9_202.x)
{
l9_203=float4(l9_202.xyw,l9_200.x);
}
else
{
l9_203=float4(l9_200.x,l9_202.yzx);
}
float4 l9_204=l9_203;
float l9_205=l9_204.x-fast::min(l9_204.w,l9_204.y);
float l9_206=abs(((l9_204.w-l9_204.y)/((6.0*l9_205)+1e-07))+l9_204.z);
float l9_207=l9_204.x;
float3 l9_208=float3(l9_206,l9_205,l9_207);
float3 l9_209=l9_208;
float l9_210=l9_209.z-(l9_209.y*0.5);
float l9_211=l9_209.y/((1.0-abs((2.0*l9_210)-1.0))+1e-07);
float3 l9_212=float3(l9_209.x,l9_211,l9_210);
float3 l9_213=float3(l9_197,l9_198,l9_212.z);
float l9_214=l9_213.x;
float l9_215=abs((6.0*l9_214)-3.0)-1.0;
float l9_216=2.0-abs((6.0*l9_214)-2.0);
float l9_217=2.0-abs((6.0*l9_214)-4.0);
float3 l9_218=fast::clamp(float3(l9_215,l9_216,l9_217),float3(0.0),float3(1.0));
float3 l9_219=l9_218;
float l9_220=(1.0-abs((2.0*l9_213.z)-1.0))*l9_213.y;
l9_219=((l9_219-float3(0.5))*l9_220)+float3(l9_213.z);
float3 l9_221=l9_219;
float3 l9_222=l9_221;
return l9_222;
}
else
{
float3 param_8=a;
float3 param_9=b;
float3 l9_223=param_8;
float l9_224=((0.299*l9_223.x)+(0.587*l9_223.y))+(0.114*l9_223.z);
float l9_225=l9_224;
float l9_226=1.0;
float l9_227=pow(l9_225,1.0/UserUniforms.correctedIntensity);
float2 l9_228=UserUniforms.intensityTextureDims.xy;
float2 l9_229=l9_228;
int l9_230;
if ((int(intensityTextureHasSwappedViews_tmp)!=0))
{
int l9_231;
if (sc_StereoRenderingMode_tmp==0)
{
l9_231=0;
}
else
{
l9_231=varStereoViewID;
}
int l9_232=l9_231;
l9_230=1-l9_232;
}
else
{
int l9_233;
if (sc_StereoRenderingMode_tmp==0)
{
l9_233=0;
}
else
{
l9_233=varStereoViewID;
}
int l9_234=l9_233;
l9_230=l9_234;
}
int l9_235=l9_230;
float2 l9_236=l9_229;
int l9_237=intensityTextureLayout_tmp;
int l9_238=l9_235;
float2 l9_239=float2(l9_227,0.5);
bool l9_240=(int(SC_USE_UV_TRANSFORM_intensityTexture_tmp)!=0);
float3x3 l9_241=UserUniforms.intensityTextureTransform;
int2 l9_242=int2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp);
bool l9_243=(int(SC_USE_UV_MIN_MAX_intensityTexture_tmp)!=0);
float4 l9_244=UserUniforms.intensityTextureUvMinMax;
bool l9_245=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp)!=0);
float4 l9_246=UserUniforms.intensityTextureBorderColor;
float l9_247=0.0;
bool l9_248=l9_245&&(!l9_243);
float l9_249=1.0;
float l9_250=l9_239.x;
int l9_251=l9_242.x;
if (l9_251==1)
{
l9_250=fract(l9_250);
}
else
{
if (l9_251==2)
{
float l9_252=fract(l9_250);
float l9_253=l9_250-l9_252;
float l9_254=step(0.25,fract(l9_253*0.5));
l9_250=mix(l9_252,1.0-l9_252,fast::clamp(l9_254,0.0,1.0));
}
}
l9_239.x=l9_250;
float l9_255=l9_239.y;
int l9_256=l9_242.y;
if (l9_256==1)
{
l9_255=fract(l9_255);
}
else
{
if (l9_256==2)
{
float l9_257=fract(l9_255);
float l9_258=l9_255-l9_257;
float l9_259=step(0.25,fract(l9_258*0.5));
l9_255=mix(l9_257,1.0-l9_257,fast::clamp(l9_259,0.0,1.0));
}
}
l9_239.y=l9_255;
if (l9_243)
{
bool l9_260=l9_245;
bool l9_261;
if (l9_260)
{
l9_261=l9_242.x==3;
}
else
{
l9_261=l9_260;
}
float l9_262=l9_239.x;
float l9_263=l9_244.x;
float l9_264=l9_244.z;
bool l9_265=l9_261;
float l9_266=l9_249;
float l9_267=fast::clamp(l9_262,l9_263,l9_264);
float l9_268=step(abs(l9_262-l9_267),1e-05);
l9_266*=(l9_268+((1.0-float(l9_265))*(1.0-l9_268)));
l9_262=l9_267;
l9_239.x=l9_262;
l9_249=l9_266;
bool l9_269=l9_245;
bool l9_270;
if (l9_269)
{
l9_270=l9_242.y==3;
}
else
{
l9_270=l9_269;
}
float l9_271=l9_239.y;
float l9_272=l9_244.y;
float l9_273=l9_244.w;
bool l9_274=l9_270;
float l9_275=l9_249;
float l9_276=fast::clamp(l9_271,l9_272,l9_273);
float l9_277=step(abs(l9_271-l9_276),1e-05);
l9_275*=(l9_277+((1.0-float(l9_274))*(1.0-l9_277)));
l9_271=l9_276;
l9_239.y=l9_271;
l9_249=l9_275;
}
float2 l9_278=l9_239;
bool l9_279=l9_240;
float3x3 l9_280=l9_241;
if (l9_279)
{
l9_278=float2((l9_280*float3(l9_278,1.0)).xy);
}
float2 l9_281=l9_278;
float2 l9_282=l9_281;
float2 l9_283=l9_282;
l9_239=l9_283;
float l9_284=l9_239.x;
int l9_285=l9_242.x;
bool l9_286=l9_248;
float l9_287=l9_249;
if ((l9_285==0)||(l9_285==3))
{
float l9_288=l9_284;
float l9_289=0.0;
float l9_290=1.0;
bool l9_291=l9_286;
float l9_292=l9_287;
float l9_293=fast::clamp(l9_288,l9_289,l9_290);
float l9_294=step(abs(l9_288-l9_293),1e-05);
l9_292*=(l9_294+((1.0-float(l9_291))*(1.0-l9_294)));
l9_288=l9_293;
l9_284=l9_288;
l9_287=l9_292;
}
l9_239.x=l9_284;
l9_249=l9_287;
float l9_295=l9_239.y;
int l9_296=l9_242.y;
bool l9_297=l9_248;
float l9_298=l9_249;
if ((l9_296==0)||(l9_296==3))
{
float l9_299=l9_295;
float l9_300=0.0;
float l9_301=1.0;
bool l9_302=l9_297;
float l9_303=l9_298;
float l9_304=fast::clamp(l9_299,l9_300,l9_301);
float l9_305=step(abs(l9_299-l9_304),1e-05);
l9_303*=(l9_305+((1.0-float(l9_302))*(1.0-l9_305)));
l9_299=l9_304;
l9_295=l9_299;
l9_298=l9_303;
}
l9_239.y=l9_295;
l9_249=l9_298;
float2 l9_306=l9_236;
float2 l9_307=l9_239;
int l9_308=l9_237;
int l9_309=l9_238;
float l9_310=l9_247;
float2 l9_311=l9_307;
int l9_312=l9_308;
int l9_313=l9_309;
float3 l9_314;
if (l9_312==0)
{
l9_314=float3(l9_311,0.0);
}
else
{
if (l9_312==1)
{
l9_314=float3(l9_311.x,(l9_311.y*0.5)+(0.5-(float(l9_313)*0.5)),0.0);
}
else
{
l9_314=float3(l9_311,float(l9_313));
}
}
float3 l9_315=l9_314;
float3 l9_316=l9_315;
float2 l9_317=l9_306;
float2 l9_318=l9_316.xy;
float l9_319=l9_310;
float4 l9_320=intensityTexture.sample(intensityTextureSmpSC,l9_318,bias(l9_319));
float4 l9_321=l9_320;
float4 l9_322=l9_321;
if (l9_245)
{
l9_322=mix(l9_246,l9_322,float4(l9_249));
}
float4 l9_323=l9_322;
float4 l9_324=l9_323;
float3 l9_325=l9_323.xyz;
float3 l9_326=l9_325;
float l9_327=16.0;
float l9_328=((((l9_326.x*256.0)+l9_326.y)+(l9_326.z/256.0))/257.004)*l9_327;
float l9_329=l9_328;
if ((int(BLEND_MODE_FORGRAY_tmp)!=0))
{
l9_329=fast::max(l9_329,1.0);
}
if ((int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
l9_329=fast::min(l9_329,1.0);
}
float l9_330=l9_225;
float3 l9_331=param_8;
float3 l9_332=param_9;
float l9_333=l9_226;
float l9_334=l9_329;
float3 l9_335=transformColor(l9_330,l9_331,l9_332,l9_333,l9_334);
return l9_335;
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
fragment main_frag_out main_frag(main_frag_in in [[stage_in]],constant sc_Set2& sc_set2 [[buffer(2)]],float4 gl_FragCoord [[position]])
{
main_frag_out out={};
ssPreviewInfo PreviewInfo;
float Dummy1;
float2 Dummy2;
float3 Dummy3;
float4 Dummy4;
ssGlobals tempGlobals;
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
if ((sc_StereoRenderingMode_tmp==1)&&(sc_StereoRendering_IsClipDistanceEnabled_tmp==0))
{
if (in.varClipDistance<0.0)
{
discard_fragment();
}
}
PreviewInfo.Color=in.PreviewVertexColor;
PreviewInfo.Saved=((in.PreviewVertexSaved*1.0)!=0.0) ? true : false;
float4 FinalColor=float4(1.0);
float l9_0;
if ((*sc_set2.UserUniforms).overrideTimeEnabled==1)
{
l9_0=(*sc_set2.UserUniforms).overrideTimeElapsed;
}
else
{
l9_0=(*sc_set2.UserUniforms).sc_Time.x;
}
ssGlobals Globals;
Globals.gTimeElapsed=l9_0;
float l9_1;
if ((*sc_set2.UserUniforms).overrideTimeEnabled==1)
{
l9_1=(*sc_set2.UserUniforms).overrideTimeDelta;
}
else
{
l9_1=(*sc_set2.UserUniforms).sc_Time.y;
}
Globals.gTimeDelta=l9_1;
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set2.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
float2 UVCoord_N11=float2(0.0);
UVCoord_N11=Globals.Surface_UVCoord0;
float Output_N0=0.0;
ssGlobals param_1=Globals;
float param=(*sc_set2.UserUniforms).uvScale;
Output_N0=param;
float2 CoordsOut_N16=float2(0.0);
CoordsOut_N16=((UVCoord_N11-(*sc_set2.UserUniforms).Port_Center_N016)*float2(Output_N0))+(*sc_set2.UserUniforms).Port_Center_N016;
float4 Output_N1=float4(0.0);
float2 l9_2=(*sc_set2.UserUniforms).baseTexDims.xy;
float2 l9_3=l9_2;
int l9_4;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_5;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5=0;
}
else
{
l9_5=in.varStereoViewID;
}
int l9_6=l9_5;
l9_4=1-l9_6;
}
else
{
int l9_7;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7=0;
}
else
{
l9_7=in.varStereoViewID;
}
int l9_8=l9_7;
l9_4=l9_8;
}
int l9_9=l9_4;
float2 param_2=l9_3;
int param_3=baseTexLayout_tmp;
int param_4=l9_9;
float2 param_5=CoordsOut_N16;
bool param_6=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 param_7=(*sc_set2.UserUniforms).baseTexTransform;
int2 param_8=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool param_9=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 param_10=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool param_11=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 param_12=(*sc_set2.UserUniforms).baseTexBorderColor;
float param_13=0.0;
bool l9_10=param_11&&(!param_9);
float l9_11=1.0;
float l9_12=param_5.x;
int l9_13=param_8.x;
if (l9_13==1)
{
l9_12=fract(l9_12);
}
else
{
if (l9_13==2)
{
float l9_14=fract(l9_12);
float l9_15=l9_12-l9_14;
float l9_16=step(0.25,fract(l9_15*0.5));
l9_12=mix(l9_14,1.0-l9_14,fast::clamp(l9_16,0.0,1.0));
}
}
param_5.x=l9_12;
float l9_17=param_5.y;
int l9_18=param_8.y;
if (l9_18==1)
{
l9_17=fract(l9_17);
}
else
{
if (l9_18==2)
{
float l9_19=fract(l9_17);
float l9_20=l9_17-l9_19;
float l9_21=step(0.25,fract(l9_20*0.5));
l9_17=mix(l9_19,1.0-l9_19,fast::clamp(l9_21,0.0,1.0));
}
}
param_5.y=l9_17;
if (param_9)
{
bool l9_22=param_11;
bool l9_23;
if (l9_22)
{
l9_23=param_8.x==3;
}
else
{
l9_23=l9_22;
}
float l9_24=param_5.x;
float l9_25=param_10.x;
float l9_26=param_10.z;
bool l9_27=l9_23;
float l9_28=l9_11;
float l9_29=fast::clamp(l9_24,l9_25,l9_26);
float l9_30=step(abs(l9_24-l9_29),1e-05);
l9_28*=(l9_30+((1.0-float(l9_27))*(1.0-l9_30)));
l9_24=l9_29;
param_5.x=l9_24;
l9_11=l9_28;
bool l9_31=param_11;
bool l9_32;
if (l9_31)
{
l9_32=param_8.y==3;
}
else
{
l9_32=l9_31;
}
float l9_33=param_5.y;
float l9_34=param_10.y;
float l9_35=param_10.w;
bool l9_36=l9_32;
float l9_37=l9_11;
float l9_38=fast::clamp(l9_33,l9_34,l9_35);
float l9_39=step(abs(l9_33-l9_38),1e-05);
l9_37*=(l9_39+((1.0-float(l9_36))*(1.0-l9_39)));
l9_33=l9_38;
param_5.y=l9_33;
l9_11=l9_37;
}
float2 l9_40=param_5;
bool l9_41=param_6;
float3x3 l9_42=param_7;
if (l9_41)
{
l9_40=float2((l9_42*float3(l9_40,1.0)).xy);
}
float2 l9_43=l9_40;
float2 l9_44=l9_43;
float2 l9_45=l9_44;
param_5=l9_45;
float l9_46=param_5.x;
int l9_47=param_8.x;
bool l9_48=l9_10;
float l9_49=l9_11;
if ((l9_47==0)||(l9_47==3))
{
float l9_50=l9_46;
float l9_51=0.0;
float l9_52=1.0;
bool l9_53=l9_48;
float l9_54=l9_49;
float l9_55=fast::clamp(l9_50,l9_51,l9_52);
float l9_56=step(abs(l9_50-l9_55),1e-05);
l9_54*=(l9_56+((1.0-float(l9_53))*(1.0-l9_56)));
l9_50=l9_55;
l9_46=l9_50;
l9_49=l9_54;
}
param_5.x=l9_46;
l9_11=l9_49;
float l9_57=param_5.y;
int l9_58=param_8.y;
bool l9_59=l9_10;
float l9_60=l9_11;
if ((l9_58==0)||(l9_58==3))
{
float l9_61=l9_57;
float l9_62=0.0;
float l9_63=1.0;
bool l9_64=l9_59;
float l9_65=l9_60;
float l9_66=fast::clamp(l9_61,l9_62,l9_63);
float l9_67=step(abs(l9_61-l9_66),1e-05);
l9_65*=(l9_67+((1.0-float(l9_64))*(1.0-l9_67)));
l9_61=l9_66;
l9_57=l9_61;
l9_60=l9_65;
}
param_5.y=l9_57;
l9_11=l9_60;
float2 l9_68=param_2;
float2 l9_69=param_5;
int l9_70=param_3;
int l9_71=param_4;
float l9_72=param_13;
float2 l9_73=l9_69;
int l9_74=l9_70;
int l9_75=l9_71;
float3 l9_76;
if (l9_74==0)
{
l9_76=float3(l9_73,0.0);
}
else
{
if (l9_74==1)
{
l9_76=float3(l9_73.x,(l9_73.y*0.5)+(0.5-(float(l9_75)*0.5)),0.0);
}
else
{
l9_76=float3(l9_73,float(l9_75));
}
}
float3 l9_77=l9_76;
float3 l9_78=l9_77;
float2 l9_79=l9_68;
float2 l9_80=l9_78.xy;
float l9_81=l9_72;
float4 l9_82=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_80,bias(l9_81));
float4 l9_83=l9_82;
float4 l9_84=l9_83;
if (param_11)
{
l9_84=mix(param_12,l9_84,float4(l9_11));
}
float4 l9_85=l9_84;
float4 l9_86=l9_85;
Output_N1=l9_85;
float Output_N5=0.0;
Output_N5=Output_N1.w;
float4 Output_N9=float4(0.0);
float2 param_14=CoordsOut_N16;
ssGlobals param_16=Globals;
float2 l9_87=(*sc_set2.UserUniforms).normalTexDims.xy;
float2 l9_88=l9_87;
int l9_89;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_90;
if (sc_StereoRenderingMode_tmp==0)
{
l9_90=0;
}
else
{
l9_90=in.varStereoViewID;
}
int l9_91=l9_90;
l9_89=1-l9_91;
}
else
{
int l9_92;
if (sc_StereoRenderingMode_tmp==0)
{
l9_92=0;
}
else
{
l9_92=in.varStereoViewID;
}
int l9_93=l9_92;
l9_89=l9_93;
}
int l9_94=l9_89;
float2 l9_95=l9_88;
int l9_96=normalTexLayout_tmp;
int l9_97=l9_94;
float2 l9_98=param_14;
bool l9_99=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_100=(*sc_set2.UserUniforms).normalTexTransform;
int2 l9_101=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_102=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_103=(*sc_set2.UserUniforms).normalTexUvMinMax;
bool l9_104=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_105=(*sc_set2.UserUniforms).normalTexBorderColor;
float l9_106=0.0;
bool l9_107=l9_104&&(!l9_102);
float l9_108=1.0;
float l9_109=l9_98.x;
int l9_110=l9_101.x;
if (l9_110==1)
{
l9_109=fract(l9_109);
}
else
{
if (l9_110==2)
{
float l9_111=fract(l9_109);
float l9_112=l9_109-l9_111;
float l9_113=step(0.25,fract(l9_112*0.5));
l9_109=mix(l9_111,1.0-l9_111,fast::clamp(l9_113,0.0,1.0));
}
}
l9_98.x=l9_109;
float l9_114=l9_98.y;
int l9_115=l9_101.y;
if (l9_115==1)
{
l9_114=fract(l9_114);
}
else
{
if (l9_115==2)
{
float l9_116=fract(l9_114);
float l9_117=l9_114-l9_116;
float l9_118=step(0.25,fract(l9_117*0.5));
l9_114=mix(l9_116,1.0-l9_116,fast::clamp(l9_118,0.0,1.0));
}
}
l9_98.y=l9_114;
if (l9_102)
{
bool l9_119=l9_104;
bool l9_120;
if (l9_119)
{
l9_120=l9_101.x==3;
}
else
{
l9_120=l9_119;
}
float l9_121=l9_98.x;
float l9_122=l9_103.x;
float l9_123=l9_103.z;
bool l9_124=l9_120;
float l9_125=l9_108;
float l9_126=fast::clamp(l9_121,l9_122,l9_123);
float l9_127=step(abs(l9_121-l9_126),1e-05);
l9_125*=(l9_127+((1.0-float(l9_124))*(1.0-l9_127)));
l9_121=l9_126;
l9_98.x=l9_121;
l9_108=l9_125;
bool l9_128=l9_104;
bool l9_129;
if (l9_128)
{
l9_129=l9_101.y==3;
}
else
{
l9_129=l9_128;
}
float l9_130=l9_98.y;
float l9_131=l9_103.y;
float l9_132=l9_103.w;
bool l9_133=l9_129;
float l9_134=l9_108;
float l9_135=fast::clamp(l9_130,l9_131,l9_132);
float l9_136=step(abs(l9_130-l9_135),1e-05);
l9_134*=(l9_136+((1.0-float(l9_133))*(1.0-l9_136)));
l9_130=l9_135;
l9_98.y=l9_130;
l9_108=l9_134;
}
float2 l9_137=l9_98;
bool l9_138=l9_99;
float3x3 l9_139=l9_100;
if (l9_138)
{
l9_137=float2((l9_139*float3(l9_137,1.0)).xy);
}
float2 l9_140=l9_137;
float2 l9_141=l9_140;
float2 l9_142=l9_141;
l9_98=l9_142;
float l9_143=l9_98.x;
int l9_144=l9_101.x;
bool l9_145=l9_107;
float l9_146=l9_108;
if ((l9_144==0)||(l9_144==3))
{
float l9_147=l9_143;
float l9_148=0.0;
float l9_149=1.0;
bool l9_150=l9_145;
float l9_151=l9_146;
float l9_152=fast::clamp(l9_147,l9_148,l9_149);
float l9_153=step(abs(l9_147-l9_152),1e-05);
l9_151*=(l9_153+((1.0-float(l9_150))*(1.0-l9_153)));
l9_147=l9_152;
l9_143=l9_147;
l9_146=l9_151;
}
l9_98.x=l9_143;
l9_108=l9_146;
float l9_154=l9_98.y;
int l9_155=l9_101.y;
bool l9_156=l9_107;
float l9_157=l9_108;
if ((l9_155==0)||(l9_155==3))
{
float l9_158=l9_154;
float l9_159=0.0;
float l9_160=1.0;
bool l9_161=l9_156;
float l9_162=l9_157;
float l9_163=fast::clamp(l9_158,l9_159,l9_160);
float l9_164=step(abs(l9_158-l9_163),1e-05);
l9_162*=(l9_164+((1.0-float(l9_161))*(1.0-l9_164)));
l9_158=l9_163;
l9_154=l9_158;
l9_157=l9_162;
}
l9_98.y=l9_154;
l9_108=l9_157;
float2 l9_165=l9_95;
float2 l9_166=l9_98;
int l9_167=l9_96;
int l9_168=l9_97;
float l9_169=l9_106;
float2 l9_170=l9_166;
int l9_171=l9_167;
int l9_172=l9_168;
float3 l9_173;
if (l9_171==0)
{
l9_173=float3(l9_170,0.0);
}
else
{
if (l9_171==1)
{
l9_173=float3(l9_170.x,(l9_170.y*0.5)+(0.5-(float(l9_172)*0.5)),0.0);
}
else
{
l9_173=float3(l9_170,float(l9_172));
}
}
float3 l9_174=l9_173;
float3 l9_175=l9_174;
float2 l9_176=l9_165;
float2 l9_177=l9_175.xy;
float l9_178=l9_169;
float4 l9_179=sc_set2.normalTex.sample(sc_set2.normalTexSmpSC,l9_177,bias(l9_178));
float4 l9_180=l9_179;
float4 l9_181=l9_180;
if (l9_104)
{
l9_181=mix(l9_105,l9_181,float4(l9_108));
}
float4 l9_182=l9_181;
float4 l9_183=l9_182;
float4 param_15=l9_182;
float3 l9_184=(param_15.xyz*1.99219)-float3(1.0);
param_15=float4(l9_184.x,l9_184.y,l9_184.z,param_15.w);
Output_N9=param_15;
float4 Output_N2=float4(0.0);
float2 l9_185=(*sc_set2.UserUniforms).materialParamsTexDims.xy;
float2 l9_186=l9_185;
int l9_187;
if ((int(materialParamsTexHasSwappedViews_tmp)!=0))
{
int l9_188;
if (sc_StereoRenderingMode_tmp==0)
{
l9_188=0;
}
else
{
l9_188=in.varStereoViewID;
}
int l9_189=l9_188;
l9_187=1-l9_189;
}
else
{
int l9_190;
if (sc_StereoRenderingMode_tmp==0)
{
l9_190=0;
}
else
{
l9_190=in.varStereoViewID;
}
int l9_191=l9_190;
l9_187=l9_191;
}
int l9_192=l9_187;
float2 param_17=l9_186;
int param_18=materialParamsTexLayout_tmp;
int param_19=l9_192;
float2 param_20=CoordsOut_N16;
bool param_21=(int(SC_USE_UV_TRANSFORM_materialParamsTex_tmp)!=0);
float3x3 param_22=(*sc_set2.UserUniforms).materialParamsTexTransform;
int2 param_23=int2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp);
bool param_24=(int(SC_USE_UV_MIN_MAX_materialParamsTex_tmp)!=0);
float4 param_25=(*sc_set2.UserUniforms).materialParamsTexUvMinMax;
bool param_26=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp)!=0);
float4 param_27=(*sc_set2.UserUniforms).materialParamsTexBorderColor;
float param_28=0.0;
bool l9_193=param_26&&(!param_24);
float l9_194=1.0;
float l9_195=param_20.x;
int l9_196=param_23.x;
if (l9_196==1)
{
l9_195=fract(l9_195);
}
else
{
if (l9_196==2)
{
float l9_197=fract(l9_195);
float l9_198=l9_195-l9_197;
float l9_199=step(0.25,fract(l9_198*0.5));
l9_195=mix(l9_197,1.0-l9_197,fast::clamp(l9_199,0.0,1.0));
}
}
param_20.x=l9_195;
float l9_200=param_20.y;
int l9_201=param_23.y;
if (l9_201==1)
{
l9_200=fract(l9_200);
}
else
{
if (l9_201==2)
{
float l9_202=fract(l9_200);
float l9_203=l9_200-l9_202;
float l9_204=step(0.25,fract(l9_203*0.5));
l9_200=mix(l9_202,1.0-l9_202,fast::clamp(l9_204,0.0,1.0));
}
}
param_20.y=l9_200;
if (param_24)
{
bool l9_205=param_26;
bool l9_206;
if (l9_205)
{
l9_206=param_23.x==3;
}
else
{
l9_206=l9_205;
}
float l9_207=param_20.x;
float l9_208=param_25.x;
float l9_209=param_25.z;
bool l9_210=l9_206;
float l9_211=l9_194;
float l9_212=fast::clamp(l9_207,l9_208,l9_209);
float l9_213=step(abs(l9_207-l9_212),1e-05);
l9_211*=(l9_213+((1.0-float(l9_210))*(1.0-l9_213)));
l9_207=l9_212;
param_20.x=l9_207;
l9_194=l9_211;
bool l9_214=param_26;
bool l9_215;
if (l9_214)
{
l9_215=param_23.y==3;
}
else
{
l9_215=l9_214;
}
float l9_216=param_20.y;
float l9_217=param_25.y;
float l9_218=param_25.w;
bool l9_219=l9_215;
float l9_220=l9_194;
float l9_221=fast::clamp(l9_216,l9_217,l9_218);
float l9_222=step(abs(l9_216-l9_221),1e-05);
l9_220*=(l9_222+((1.0-float(l9_219))*(1.0-l9_222)));
l9_216=l9_221;
param_20.y=l9_216;
l9_194=l9_220;
}
float2 l9_223=param_20;
bool l9_224=param_21;
float3x3 l9_225=param_22;
if (l9_224)
{
l9_223=float2((l9_225*float3(l9_223,1.0)).xy);
}
float2 l9_226=l9_223;
float2 l9_227=l9_226;
float2 l9_228=l9_227;
param_20=l9_228;
float l9_229=param_20.x;
int l9_230=param_23.x;
bool l9_231=l9_193;
float l9_232=l9_194;
if ((l9_230==0)||(l9_230==3))
{
float l9_233=l9_229;
float l9_234=0.0;
float l9_235=1.0;
bool l9_236=l9_231;
float l9_237=l9_232;
float l9_238=fast::clamp(l9_233,l9_234,l9_235);
float l9_239=step(abs(l9_233-l9_238),1e-05);
l9_237*=(l9_239+((1.0-float(l9_236))*(1.0-l9_239)));
l9_233=l9_238;
l9_229=l9_233;
l9_232=l9_237;
}
param_20.x=l9_229;
l9_194=l9_232;
float l9_240=param_20.y;
int l9_241=param_23.y;
bool l9_242=l9_193;
float l9_243=l9_194;
if ((l9_241==0)||(l9_241==3))
{
float l9_244=l9_240;
float l9_245=0.0;
float l9_246=1.0;
bool l9_247=l9_242;
float l9_248=l9_243;
float l9_249=fast::clamp(l9_244,l9_245,l9_246);
float l9_250=step(abs(l9_244-l9_249),1e-05);
l9_248*=(l9_250+((1.0-float(l9_247))*(1.0-l9_250)));
l9_244=l9_249;
l9_240=l9_244;
l9_243=l9_248;
}
param_20.y=l9_240;
l9_194=l9_243;
float2 l9_251=param_17;
float2 l9_252=param_20;
int l9_253=param_18;
int l9_254=param_19;
float l9_255=param_28;
float2 l9_256=l9_252;
int l9_257=l9_253;
int l9_258=l9_254;
float3 l9_259;
if (l9_257==0)
{
l9_259=float3(l9_256,0.0);
}
else
{
if (l9_257==1)
{
l9_259=float3(l9_256.x,(l9_256.y*0.5)+(0.5-(float(l9_258)*0.5)),0.0);
}
else
{
l9_259=float3(l9_256,float(l9_258));
}
}
float3 l9_260=l9_259;
float3 l9_261=l9_260;
float2 l9_262=l9_251;
float2 l9_263=l9_261.xy;
float l9_264=l9_255;
float4 l9_265=sc_set2.materialParamsTex.sample(sc_set2.materialParamsTexSmpSC,l9_263,bias(l9_264));
float4 l9_266=l9_265;
float4 l9_267=l9_266;
if (param_26)
{
l9_267=mix(param_27,l9_267,float4(l9_194));
}
float4 l9_268=l9_267;
float4 l9_269=l9_268;
Output_N2=l9_268;
float Value1_N3=0.0;
float Value2_N3=0.0;
float Value3_N3=0.0;
float Value4_N3=0.0;
float4 param_29=Output_N2;
ssGlobals param_34=Globals;
float param_30=param_29.x;
float param_31=param_29.y;
float param_32=param_29.z;
float param_33=param_29.w;
Value1_N3=param_30;
Value2_N3=param_31;
Value3_N3=param_32;
Value4_N3=param_33;
float4 Output_N6=float4(0.0);
float3 param_35=Output_N1.xyz;
float param_36=Output_N5;
float3 param_37=Output_N9.xyz;
float3 param_38=(*sc_set2.UserUniforms).Port_Emissive_N006;
float param_39=Value1_N3;
float param_40=Value2_N3;
float3 param_41=float3(Value3_N3);
float3 param_42=(*sc_set2.UserUniforms).Port_SpecularAO_N006;
ssGlobals param_44=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_44.BumpedNormal=float3x3(float3(param_44.VertexTangent_WorldSpace),float3(param_44.VertexBinormal_WorldSpace),float3(param_44.VertexNormal_WorldSpace))*param_37;
}
param_36=fast::clamp(param_36,0.0,1.0);
float l9_270=param_36;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_270<(*sc_set2.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_271=gl_FragCoord;
float2 l9_272=floor(mod(l9_271.xy,float2(4.0)));
float l9_273=(mod(dot(l9_272,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_270<l9_273)
{
discard_fragment();
}
}
param_35=fast::max(param_35,float3(0.0));
float4 param_43;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_39=fast::clamp(param_39,0.0,1.0);
param_40=fast::clamp(param_40,0.0,1.0);
param_41=fast::clamp(param_41,float3(0.0),float3(1.0));
float3 l9_274=param_35;
float l9_275=param_36;
float3 l9_276=param_44.BumpedNormal;
float3 l9_277=param_44.PositionWS;
float3 l9_278=param_44.ViewDirWS;
float3 l9_279=param_38;
float l9_280=param_39;
float l9_281=param_40;
float3 l9_282=param_41;
float3 l9_283=param_42;
SurfaceProperties l9_284;
l9_284.albedo=float3(0.0);
l9_284.opacity=1.0;
l9_284.normal=float3(0.0);
l9_284.positionWS=float3(0.0);
l9_284.viewDirWS=float3(0.0);
l9_284.metallic=0.0;
l9_284.roughness=0.0;
l9_284.emissive=float3(0.0);
l9_284.ao=float3(1.0);
l9_284.specularAo=float3(1.0);
l9_284.bakedShadows=float3(1.0);
SurfaceProperties l9_285=l9_284;
SurfaceProperties l9_286=l9_285;
l9_286.opacity=l9_275;
float3 l9_287=l9_274;
float3 l9_288;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_288=float3(pow(l9_287.x,2.2),pow(l9_287.y,2.2),pow(l9_287.z,2.2));
}
else
{
l9_288=l9_287*l9_287;
}
float3 l9_289=l9_288;
l9_286.albedo=l9_289;
l9_286.normal=normalize(l9_276);
l9_286.positionWS=l9_277;
l9_286.viewDirWS=l9_278;
float3 l9_290=l9_279;
float3 l9_291;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_291=float3(pow(l9_290.x,2.2),pow(l9_290.y,2.2),pow(l9_290.z,2.2));
}
else
{
l9_291=l9_290*l9_290;
}
float3 l9_292=l9_291;
l9_286.emissive=l9_292;
l9_286.metallic=l9_280;
l9_286.roughness=l9_281;
l9_286.ao=l9_282;
l9_286.specularAo=l9_283;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 l9_293=l9_286.positionWS;
l9_286.ao=evaluateSSAO(l9_293,in.varStereoViewID,(*sc_set2.UserUniforms),sc_set2.sc_SSAOTexture,sc_set2.sc_SSAOTextureSmpSC);
}
SurfaceProperties l9_294=l9_286;
SurfaceProperties l9_295=l9_294;
float3 l9_296=mix(float3(0.04),l9_295.albedo*l9_295.metallic,float3(l9_295.metallic));
float3 l9_297=mix(l9_295.albedo*(1.0-l9_295.metallic),float3(0.0),float3(l9_295.metallic));
l9_294.albedo=l9_297;
l9_294.specColor=l9_296;
SurfaceProperties l9_298=l9_294;
l9_286=l9_298;
SurfaceProperties l9_299=l9_286;
LightingComponents l9_300;
l9_300.directDiffuse=float3(0.0);
l9_300.directSpecular=float3(0.0);
l9_300.indirectDiffuse=float3(1.0);
l9_300.indirectSpecular=float3(0.0);
l9_300.emitted=float3(0.0);
l9_300.transmitted=float3(0.0);
LightingComponents l9_301=l9_300;
LightingComponents l9_302=l9_301;
float3 l9_303=l9_299.viewDirWS;
int l9_304=0;
float4 l9_305=float4(l9_299.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_306;
LightProperties l9_307;
int l9_308=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_308<sc_DirectionalLightsCount_tmp)
{
l9_306.direction=(*sc_set2.UserUniforms).sc_DirectionalLights[l9_308].direction;
l9_306.color=(*sc_set2.UserUniforms).sc_DirectionalLights[l9_308].color;
l9_307.direction=l9_306.direction;
l9_307.color=l9_306.color.xyz;
l9_307.attenuation=l9_306.color.w;
l9_307.attenuation*=l9_305[(l9_304<3) ? l9_304 : 3];
l9_304++;
LightingComponents l9_309=l9_302;
LightProperties l9_310=l9_307;
SurfaceProperties l9_311=l9_299;
float3 l9_312=l9_303;
SurfaceProperties l9_313=l9_311;
float3 l9_314=l9_310.direction;
float l9_315=dot(l9_313.normal,l9_314);
float l9_316=fast::clamp(l9_315,0.0,1.0);
float3 l9_317=float3(l9_316);
l9_309.directDiffuse+=((l9_317*l9_310.color)*l9_310.attenuation);
SurfaceProperties l9_318=l9_311;
float3 l9_319=l9_310.direction;
float3 l9_320=l9_312;
l9_309.directSpecular+=((calculateDirectSpecular(l9_318,l9_319,l9_320)*l9_310.color)*l9_310.attenuation);
LightingComponents l9_321=l9_309;
l9_302=l9_321;
l9_308++;
continue;
}
else
{
break;
}
}
}
if (sc_PointLightsCount_tmp>0)
{
sc_PointLight_t_1 l9_322;
LightProperties l9_323;
int l9_324=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_324<sc_PointLightsCount_tmp)
{
l9_322.falloffEnabled=(*sc_set2.UserUniforms).sc_PointLights[l9_324].falloffEnabled!=0;
l9_322.falloffEndDistance=(*sc_set2.UserUniforms).sc_PointLights[l9_324].falloffEndDistance;
l9_322.negRcpFalloffEndDistance4=(*sc_set2.UserUniforms).sc_PointLights[l9_324].negRcpFalloffEndDistance4;
l9_322.angleScale=(*sc_set2.UserUniforms).sc_PointLights[l9_324].angleScale;
l9_322.angleOffset=(*sc_set2.UserUniforms).sc_PointLights[l9_324].angleOffset;
l9_322.direction=(*sc_set2.UserUniforms).sc_PointLights[l9_324].direction;
l9_322.position=(*sc_set2.UserUniforms).sc_PointLights[l9_324].position;
l9_322.color=(*sc_set2.UserUniforms).sc_PointLights[l9_324].color;
float3 l9_325=l9_322.position-l9_299.positionWS;
l9_323.direction=normalize(l9_325);
l9_323.color=l9_322.color.xyz;
l9_323.attenuation=l9_322.color.w;
l9_323.attenuation*=l9_305[(l9_304<3) ? l9_304 : 3];
float3 l9_326=l9_323.direction;
float3 l9_327=l9_322.direction;
float l9_328=l9_322.angleScale;
float l9_329=l9_322.angleOffset;
float l9_330=dot(l9_326,l9_327);
float l9_331=fast::clamp((l9_330*l9_328)+l9_329,0.0,1.0);
float l9_332=l9_331*l9_331;
l9_323.attenuation*=l9_332;
if (l9_322.falloffEnabled)
{
float l9_333=length(l9_325);
float l9_334=l9_322.falloffEndDistance;
l9_323.attenuation*=computeDistanceAttenuation(l9_333,l9_334);
}
l9_304++;
LightingComponents l9_335=l9_302;
LightProperties l9_336=l9_323;
SurfaceProperties l9_337=l9_299;
float3 l9_338=l9_303;
SurfaceProperties l9_339=l9_337;
float3 l9_340=l9_336.direction;
float l9_341=dot(l9_339.normal,l9_340);
float l9_342=fast::clamp(l9_341,0.0,1.0);
float3 l9_343=float3(l9_342);
l9_335.directDiffuse+=((l9_343*l9_336.color)*l9_336.attenuation);
SurfaceProperties l9_344=l9_337;
float3 l9_345=l9_336.direction;
float3 l9_346=l9_338;
l9_335.directSpecular+=((calculateDirectSpecular(l9_344,l9_345,l9_346)*l9_336.color)*l9_336.attenuation);
LightingComponents l9_347=l9_335;
l9_302=l9_347;
l9_324++;
continue;
}
else
{
break;
}
}
}
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float3 l9_348;
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float2 l9_349=abs(in.varShadowTex-float2(0.5));
float l9_350=fast::max(l9_349.x,l9_349.y);
float l9_351=step(l9_350,0.5);
float4 l9_352=sc_set2.sc_ShadowTexture.sample(sc_set2.sc_ShadowTextureSmpSC,in.varShadowTex)*l9_351;
float3 l9_353=mix((*sc_set2.UserUniforms).sc_ShadowColor.xyz,(*sc_set2.UserUniforms).sc_ShadowColor.xyz*l9_352.xyz,float3((*sc_set2.UserUniforms).sc_ShadowColor.w));
float l9_354=l9_352.w*(*sc_set2.UserUniforms).sc_ShadowDensity;
l9_348=mix(float3(1.0),l9_353,float3(l9_354));
}
else
{
l9_348=float3(1.0);
}
float3 l9_355=l9_348;
float3 l9_356=l9_355;
l9_302.directDiffuse*=l9_356;
l9_302.directSpecular*=l9_356;
}
SurfaceProperties l9_357=l9_299;
float3 l9_358=l9_357.normal;
float3 l9_359=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_360=l9_358;
float3 l9_361=l9_360;
float l9_362=(*sc_set2.UserUniforms).sc_EnvmapRotation.y;
float l9_363=l9_361.x;
float l9_364=-l9_361.z;
float l9_365=(l9_363<0.0) ? (-1.0) : 1.0;
float l9_366=l9_365*acos(fast::clamp(l9_364/length(float2(l9_363,l9_364)),-1.0,1.0));
float2 l9_367;
l9_367.x=l9_366-1.5708;
l9_367.y=acos(l9_361.y);
l9_367/=float2(6.28319,3.14159);
l9_367.y=1.0-l9_367.y;
l9_367.x+=(l9_362/360.0);
l9_367.x=fract((l9_367.x+floor(l9_367.x))+1.0);
float2 l9_368=l9_367;
float2 l9_369=l9_368;
float4 l9_370;
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_371=l9_369;
float2 l9_372=(*sc_set2.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_373=5.0;
l9_369=calcSeamlessPanoramicUvsForSampling(l9_371,l9_372,l9_373);
}
float2 l9_374=l9_369;
float l9_375=13.0;
int l9_376;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_377;
if (sc_StereoRenderingMode_tmp==0)
{
l9_377=0;
}
else
{
l9_377=in.varStereoViewID;
}
int l9_378=l9_377;
l9_376=1-l9_378;
}
else
{
int l9_379;
if (sc_StereoRenderingMode_tmp==0)
{
l9_379=0;
}
else
{
l9_379=in.varStereoViewID;
}
int l9_380=l9_379;
l9_376=l9_380;
}
int l9_381=l9_376;
float2 l9_382=l9_374;
int l9_383=l9_381;
float l9_384=l9_375;
float2 l9_385=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_386=l9_385;
float2 l9_387=l9_382;
int l9_388=sc_EnvmapSpecularLayout_tmp;
int l9_389=l9_383;
float l9_390=l9_384;
float2 l9_391=l9_387;
int l9_392=l9_388;
int l9_393=l9_389;
float3 l9_394;
if (l9_392==0)
{
l9_394=float3(l9_391,0.0);
}
else
{
if (l9_392==1)
{
l9_394=float3(l9_391.x,(l9_391.y*0.5)+(0.5-(float(l9_393)*0.5)),0.0);
}
else
{
l9_394=float3(l9_391,float(l9_393));
}
}
float3 l9_395=l9_394;
float3 l9_396=l9_395;
float2 l9_397=l9_386;
float2 l9_398=l9_396.xy;
float l9_399=l9_390;
float4 l9_400=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_398,bias(l9_399));
float4 l9_401=l9_400;
float4 l9_402=l9_401;
float4 l9_403=l9_402;
float4 l9_404=l9_403;
l9_370=l9_404;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_405=l9_369;
float2 l9_406=(*sc_set2.UserUniforms).sc_EnvmapDiffuseSize.xy;
float l9_407=0.0;
l9_369=calcSeamlessPanoramicUvsForSampling(l9_405,l9_406,l9_407);
float2 l9_408=l9_369;
float l9_409=-13.0;
int l9_410;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_411;
if (sc_StereoRenderingMode_tmp==0)
{
l9_411=0;
}
else
{
l9_411=in.varStereoViewID;
}
int l9_412=l9_411;
l9_410=1-l9_412;
}
else
{
int l9_413;
if (sc_StereoRenderingMode_tmp==0)
{
l9_413=0;
}
else
{
l9_413=in.varStereoViewID;
}
int l9_414=l9_413;
l9_410=l9_414;
}
int l9_415=l9_410;
float2 l9_416=l9_408;
int l9_417=l9_415;
float l9_418=l9_409;
float2 l9_419=(*sc_set2.UserUniforms).sc_EnvmapDiffuseDims.xy;
float2 l9_420=l9_419;
float2 l9_421=l9_416;
int l9_422=sc_EnvmapDiffuseLayout_tmp;
int l9_423=l9_417;
float l9_424=l9_418;
float2 l9_425=l9_421;
int l9_426=l9_422;
int l9_427=l9_423;
float3 l9_428;
if (l9_426==0)
{
l9_428=float3(l9_425,0.0);
}
else
{
if (l9_426==1)
{
l9_428=float3(l9_425.x,(l9_425.y*0.5)+(0.5-(float(l9_427)*0.5)),0.0);
}
else
{
l9_428=float3(l9_425,float(l9_427));
}
}
float3 l9_429=l9_428;
float3 l9_430=l9_429;
float2 l9_431=l9_420;
float2 l9_432=l9_430.xy;
float l9_433=l9_424;
float4 l9_434=sc_set2.sc_EnvmapDiffuse.sample(sc_set2.sc_EnvmapDiffuseSmpSC,l9_432,bias(l9_433));
float4 l9_435=l9_434;
float4 l9_436=l9_435;
float4 l9_437=l9_436;
float4 l9_438=l9_437;
l9_370=l9_438;
}
else
{
float2 l9_439=l9_369;
float l9_440=13.0;
int l9_441;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_442;
if (sc_StereoRenderingMode_tmp==0)
{
l9_442=0;
}
else
{
l9_442=in.varStereoViewID;
}
int l9_443=l9_442;
l9_441=1-l9_443;
}
else
{
int l9_444;
if (sc_StereoRenderingMode_tmp==0)
{
l9_444=0;
}
else
{
l9_444=in.varStereoViewID;
}
int l9_445=l9_444;
l9_441=l9_445;
}
int l9_446=l9_441;
float2 l9_447=l9_439;
int l9_448=l9_446;
float l9_449=l9_440;
float2 l9_450=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_451=l9_450;
float2 l9_452=l9_447;
int l9_453=sc_EnvmapSpecularLayout_tmp;
int l9_454=l9_448;
float l9_455=l9_449;
float2 l9_456=l9_452;
int l9_457=l9_453;
int l9_458=l9_454;
float3 l9_459;
if (l9_457==0)
{
l9_459=float3(l9_456,0.0);
}
else
{
if (l9_457==1)
{
l9_459=float3(l9_456.x,(l9_456.y*0.5)+(0.5-(float(l9_458)*0.5)),0.0);
}
else
{
l9_459=float3(l9_456,float(l9_458));
}
}
float3 l9_460=l9_459;
float3 l9_461=l9_460;
float2 l9_462=l9_451;
float2 l9_463=l9_461.xy;
float l9_464=l9_455;
float4 l9_465=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_463,bias(l9_464));
float4 l9_466=l9_465;
float4 l9_467=l9_466;
float4 l9_468=l9_467;
float4 l9_469=l9_468;
l9_370=l9_469;
}
}
float4 l9_470=l9_370;
float3 l9_471=l9_470.xyz*(1.0/l9_470.w);
float3 l9_472=l9_471*(*sc_set2.UserUniforms).sc_EnvmapExposure;
l9_359=l9_472;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_473=(*sc_set2.UserUniforms).sc_Sh[0];
float3 l9_474=(*sc_set2.UserUniforms).sc_Sh[1];
float3 l9_475=(*sc_set2.UserUniforms).sc_Sh[2];
float3 l9_476=(*sc_set2.UserUniforms).sc_Sh[3];
float3 l9_477=(*sc_set2.UserUniforms).sc_Sh[4];
float3 l9_478=(*sc_set2.UserUniforms).sc_Sh[5];
float3 l9_479=(*sc_set2.UserUniforms).sc_Sh[6];
float3 l9_480=(*sc_set2.UserUniforms).sc_Sh[7];
float3 l9_481=(*sc_set2.UserUniforms).sc_Sh[8];
float3 l9_482=-l9_358;
float l9_483=l9_482.x;
float l9_484=l9_482.y;
float l9_485=l9_482.z;
float l9_486=l9_483*l9_483;
float l9_487=l9_484*l9_484;
float l9_488=l9_485*l9_485;
float l9_489=l9_483*l9_484;
float l9_490=l9_484*l9_485;
float l9_491=l9_483*l9_485;
float3 l9_492=((((((l9_481*0.429043)*(l9_486-l9_487))+((l9_479*0.743125)*l9_488))+(l9_473*0.886227))-(l9_479*0.247708))+((((l9_477*l9_489)+(l9_480*l9_491))+(l9_478*l9_490))*0.858086))+((((l9_476*l9_483)+(l9_474*l9_484))+(l9_475*l9_485))*1.02333);
l9_359=l9_492*(*sc_set2.UserUniforms).sc_ShIntensity;
}
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_359+=((*sc_set2.UserUniforms).sc_AmbientLights[0].color*(*sc_set2.UserUniforms).sc_AmbientLights[0].intensity);
}
else
{
l9_359.x+=(1e-06*(*sc_set2.UserUniforms).sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_359+=((*sc_set2.UserUniforms).sc_AmbientLights[1].color*(*sc_set2.UserUniforms).sc_AmbientLights[1].intensity);
}
else
{
l9_359.x+=(1e-06*(*sc_set2.UserUniforms).sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_359+=((*sc_set2.UserUniforms).sc_AmbientLights[2].color*(*sc_set2.UserUniforms).sc_AmbientLights[2].intensity);
}
else
{
l9_359.x+=(1e-06*(*sc_set2.UserUniforms).sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_493=l9_358;
float3 l9_494=(*sc_set2.UserUniforms).sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_495;
float l9_496;
int l9_497=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_497<sc_LightEstimationSGCount_tmp)
{
l9_495.color=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_497].color;
l9_495.sharpness=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_497].sharpness;
l9_495.axis=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_497].axis;
float3 l9_498=l9_493;
float l9_499=dot(l9_495.axis,l9_498);
float l9_500=l9_495.sharpness;
float l9_501=0.36;
float l9_502=1.0/(4.0*l9_501);
float l9_503=exp(-l9_500);
float l9_504=l9_503*l9_503;
float l9_505=1.0/l9_500;
float l9_506=(1.0+(2.0*l9_504))-l9_505;
float l9_507=((l9_503-l9_504)*l9_505)-l9_504;
float l9_508=sqrt(1.0-l9_506);
float l9_509=l9_501*l9_499;
float l9_510=l9_502*l9_508;
float l9_511=l9_509+l9_510;
float l9_512=l9_499;
float l9_513=fast::clamp(l9_512,0.0,1.0);
float l9_514=l9_513;
if (step(abs(l9_509),l9_510)>0.5)
{
l9_496=(l9_511*l9_511)/l9_508;
}
else
{
l9_496=l9_514;
}
l9_514=l9_496;
float l9_515=(l9_506*l9_514)+l9_507;
sc_SphericalGaussianLight_t l9_516=l9_495;
float3 l9_517=(l9_516.color/float3(l9_516.sharpness))*6.28319;
float3 l9_518=(l9_517*l9_515)/float3(3.14159);
l9_494+=l9_518;
l9_497++;
continue;
}
else
{
break;
}
}
float3 l9_519=l9_494;
l9_359+=l9_519;
}
float3 l9_520=l9_359;
float3 l9_521=l9_520;
l9_302.indirectDiffuse=l9_521;
SurfaceProperties l9_522=l9_299;
float3 l9_523=l9_303;
float3 l9_524=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_525=l9_522;
float3 l9_526=l9_523;
float3 l9_527=l9_525.normal;
float3 l9_528=reflect(-l9_526,l9_527);
float3 l9_529=l9_527;
float3 l9_530=l9_528;
float l9_531=l9_525.roughness;
l9_528=getSpecularDominantDir(l9_529,l9_530,l9_531);
float l9_532=l9_525.roughness;
float l9_533=pow(l9_532,0.666667);
float l9_534=fast::clamp(l9_533,0.0,1.0);
float l9_535=l9_534*5.0;
float l9_536=l9_535;
float l9_537=l9_536;
float3 l9_538=l9_528;
float l9_539=l9_537;
float3 l9_540=l9_538;
float l9_541=l9_539;
float3 l9_542=l9_540;
float l9_543=(*sc_set2.UserUniforms).sc_EnvmapRotation.y;
float l9_544=l9_542.x;
float l9_545=-l9_542.z;
float l9_546=(l9_544<0.0) ? (-1.0) : 1.0;
float l9_547=l9_546*acos(fast::clamp(l9_545/length(float2(l9_544,l9_545)),-1.0,1.0));
float2 l9_548;
l9_548.x=l9_547-1.5708;
l9_548.y=acos(l9_542.y);
l9_548/=float2(6.28319,3.14159);
l9_548.y=1.0-l9_548.y;
l9_548.x+=(l9_543/360.0);
l9_548.x=fract((l9_548.x+floor(l9_548.x))+1.0);
float2 l9_549=l9_548;
float2 l9_550=l9_549;
float4 l9_551;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_552=floor(l9_541);
float l9_553=ceil(l9_541);
float l9_554=l9_541-l9_552;
float2 l9_555=l9_550;
float2 l9_556=(*sc_set2.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_557=l9_552;
float2 l9_558=calcSeamlessPanoramicUvsForSampling(l9_555,l9_556,l9_557);
float2 l9_559=l9_558;
float l9_560=l9_552;
float2 l9_561=l9_559;
float l9_562=l9_560;
int l9_563;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_564;
if (sc_StereoRenderingMode_tmp==0)
{
l9_564=0;
}
else
{
l9_564=in.varStereoViewID;
}
int l9_565=l9_564;
l9_563=1-l9_565;
}
else
{
int l9_566;
if (sc_StereoRenderingMode_tmp==0)
{
l9_566=0;
}
else
{
l9_566=in.varStereoViewID;
}
int l9_567=l9_566;
l9_563=l9_567;
}
int l9_568=l9_563;
float2 l9_569=l9_561;
int l9_570=l9_568;
float l9_571=l9_562;
float2 l9_572=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_573=l9_572;
float2 l9_574=l9_569;
int l9_575=sc_EnvmapSpecularLayout_tmp;
int l9_576=l9_570;
float l9_577=l9_571;
float2 l9_578=l9_574;
int l9_579=l9_575;
int l9_580=l9_576;
float3 l9_581;
if (l9_579==0)
{
l9_581=float3(l9_578,0.0);
}
else
{
if (l9_579==1)
{
l9_581=float3(l9_578.x,(l9_578.y*0.5)+(0.5-(float(l9_580)*0.5)),0.0);
}
else
{
l9_581=float3(l9_578,float(l9_580));
}
}
float3 l9_582=l9_581;
float3 l9_583=l9_582;
float2 l9_584=l9_573;
float2 l9_585=l9_583.xy;
float l9_586=l9_577;
float4 l9_587=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_585,level(l9_586));
float4 l9_588=l9_587;
float4 l9_589=l9_588;
float4 l9_590=l9_589;
float4 l9_591=l9_590;
float4 l9_592=l9_591;
float4 l9_593=l9_592;
float2 l9_594=l9_550;
float2 l9_595=(*sc_set2.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_596=l9_553;
float2 l9_597=calcSeamlessPanoramicUvsForSampling(l9_594,l9_595,l9_596);
float2 l9_598=l9_597;
float l9_599=l9_553;
float2 l9_600=l9_598;
float l9_601=l9_599;
int l9_602;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_603;
if (sc_StereoRenderingMode_tmp==0)
{
l9_603=0;
}
else
{
l9_603=in.varStereoViewID;
}
int l9_604=l9_603;
l9_602=1-l9_604;
}
else
{
int l9_605;
if (sc_StereoRenderingMode_tmp==0)
{
l9_605=0;
}
else
{
l9_605=in.varStereoViewID;
}
int l9_606=l9_605;
l9_602=l9_606;
}
int l9_607=l9_602;
float2 l9_608=l9_600;
int l9_609=l9_607;
float l9_610=l9_601;
float2 l9_611=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_612=l9_611;
float2 l9_613=l9_608;
int l9_614=sc_EnvmapSpecularLayout_tmp;
int l9_615=l9_609;
float l9_616=l9_610;
float2 l9_617=l9_613;
int l9_618=l9_614;
int l9_619=l9_615;
float3 l9_620;
if (l9_618==0)
{
l9_620=float3(l9_617,0.0);
}
else
{
if (l9_618==1)
{
l9_620=float3(l9_617.x,(l9_617.y*0.5)+(0.5-(float(l9_619)*0.5)),0.0);
}
else
{
l9_620=float3(l9_617,float(l9_619));
}
}
float3 l9_621=l9_620;
float3 l9_622=l9_621;
float2 l9_623=l9_612;
float2 l9_624=l9_622.xy;
float l9_625=l9_616;
float4 l9_626=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_624,level(l9_625));
float4 l9_627=l9_626;
float4 l9_628=l9_627;
float4 l9_629=l9_628;
float4 l9_630=l9_629;
float4 l9_631=l9_630;
float4 l9_632=l9_631;
l9_551=mix(l9_593,l9_632,float4(l9_554));
}
else
{
float2 l9_633=l9_550;
float l9_634=l9_541;
float2 l9_635=l9_633;
float l9_636=l9_634;
int l9_637;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_638;
if (sc_StereoRenderingMode_tmp==0)
{
l9_638=0;
}
else
{
l9_638=in.varStereoViewID;
}
int l9_639=l9_638;
l9_637=1-l9_639;
}
else
{
int l9_640;
if (sc_StereoRenderingMode_tmp==0)
{
l9_640=0;
}
else
{
l9_640=in.varStereoViewID;
}
int l9_641=l9_640;
l9_637=l9_641;
}
int l9_642=l9_637;
float2 l9_643=l9_635;
int l9_644=l9_642;
float l9_645=l9_636;
float2 l9_646=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_647=l9_646;
float2 l9_648=l9_643;
int l9_649=sc_EnvmapSpecularLayout_tmp;
int l9_650=l9_644;
float l9_651=l9_645;
float2 l9_652=l9_648;
int l9_653=l9_649;
int l9_654=l9_650;
float3 l9_655;
if (l9_653==0)
{
l9_655=float3(l9_652,0.0);
}
else
{
if (l9_653==1)
{
l9_655=float3(l9_652.x,(l9_652.y*0.5)+(0.5-(float(l9_654)*0.5)),0.0);
}
else
{
l9_655=float3(l9_652,float(l9_654));
}
}
float3 l9_656=l9_655;
float3 l9_657=l9_656;
float2 l9_658=l9_647;
float2 l9_659=l9_657.xy;
float l9_660=l9_651;
float4 l9_661=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_659,level(l9_660));
float4 l9_662=l9_661;
float4 l9_663=l9_662;
float4 l9_664=l9_663;
float4 l9_665=l9_664;
float4 l9_666=l9_665;
l9_551=l9_666;
}
float4 l9_667=l9_551;
float3 l9_668=l9_667.xyz*(1.0/l9_667.w);
float3 l9_669=l9_668;
float3 l9_670=l9_669*(*sc_set2.UserUniforms).sc_EnvmapExposure;
l9_670+=float3(1e-06);
float3 l9_671=l9_670;
float3 l9_672=l9_671;
SurfaceProperties l9_673=l9_525;
float l9_674=abs(dot(l9_527,l9_526));
float3 l9_675=l9_672*envBRDFApprox(l9_673,l9_674);
l9_524+=l9_675;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_676=l9_522;
float3 l9_677=l9_523;
float l9_678=fast::clamp(l9_676.roughness*l9_676.roughness,0.01,1.0);
float3 l9_679=(*sc_set2.UserUniforms).sc_LightEstimationData.ambientLight*l9_676.specColor;
sc_SphericalGaussianLight_t l9_680;
sc_SphericalGaussianLight_t l9_681;
sc_SphericalGaussianLight_t l9_682;
int l9_683=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_683<sc_LightEstimationSGCount_tmp)
{
l9_680.color=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_683].color;
l9_680.sharpness=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_683].sharpness;
l9_680.axis=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_683].axis;
float3 l9_684=l9_676.normal;
float l9_685=l9_678;
float3 l9_686=l9_677;
float3 l9_687=l9_676.specColor;
float3 l9_688=l9_684;
float l9_689=l9_685;
l9_681.axis=l9_688;
float l9_690=l9_689*l9_689;
l9_681.sharpness=2.0/l9_690;
l9_681.color=float3(1.0/(3.14159*l9_690));
sc_SphericalGaussianLight_t l9_691=l9_681;
sc_SphericalGaussianLight_t l9_692=l9_691;
sc_SphericalGaussianLight_t l9_693=l9_692;
float3 l9_694=l9_686;
l9_682.axis=reflect(-l9_694,l9_693.axis);
l9_682.color=l9_693.color;
l9_682.sharpness=l9_693.sharpness;
l9_682.sharpness/=(4.0*fast::max(dot(l9_693.axis,l9_694),0.0001));
sc_SphericalGaussianLight_t l9_695=l9_682;
sc_SphericalGaussianLight_t l9_696=l9_695;
sc_SphericalGaussianLight_t l9_697=l9_696;
sc_SphericalGaussianLight_t l9_698=l9_680;
float l9_699=length((l9_697.axis*l9_697.sharpness)+(l9_698.axis*l9_698.sharpness));
float3 l9_700=(l9_697.color*exp((l9_699-l9_697.sharpness)-l9_698.sharpness))*l9_698.color;
float l9_701=1.0-exp((-2.0)*l9_699);
float3 l9_702=((l9_700*6.28319)*l9_701)/float3(l9_699);
float3 l9_703=l9_702;
float3 l9_704=l9_696.axis;
float l9_705=l9_685*l9_685;
float l9_706=dot(l9_684,l9_704);
float l9_707=fast::clamp(l9_706,0.0,1.0);
float l9_708=l9_707;
float l9_709=dot(l9_684,l9_686);
float l9_710=fast::clamp(l9_709,0.0,1.0);
float l9_711=l9_710;
float3 l9_712=normalize(l9_696.axis+l9_686);
float l9_713=l9_705;
float l9_714=l9_708;
float l9_715=1.0/(l9_714+sqrt(l9_713+(((1.0-l9_713)*l9_714)*l9_714)));
float l9_716=l9_705;
float l9_717=l9_711;
float l9_718=1.0/(l9_717+sqrt(l9_716+(((1.0-l9_716)*l9_717)*l9_717)));
l9_703*=(l9_715*l9_718);
float l9_719=dot(l9_704,l9_712);
float l9_720=fast::clamp(l9_719,0.0,1.0);
float l9_721=pow(1.0-l9_720,5.0);
l9_703*=(l9_687+((float3(1.0)-l9_687)*l9_721));
l9_703*=l9_708;
float3 l9_722=l9_703;
l9_679+=l9_722;
l9_683++;
continue;
}
else
{
break;
}
}
float3 l9_723=l9_679;
l9_524+=l9_723;
}
float3 l9_724=l9_524;
l9_302.indirectSpecular=l9_724;
LightingComponents l9_725=l9_302;
LightingComponents l9_726=l9_725;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_726.directDiffuse=float3(0.0);
l9_726.indirectDiffuse=float3(0.0);
float4 l9_727;
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_728=out.FragColor0;
float4 l9_729=l9_728;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_729.x+=(*sc_set2.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_730=l9_729;
l9_727=l9_730;
}
else
{
float4 l9_731=gl_FragCoord;
float2 l9_732=(l9_731.xy*(*sc_set2.UserUniforms).sc_WindowToViewportTransform.xy)+(*sc_set2.UserUniforms).sc_WindowToViewportTransform.zw;
float2 l9_733=l9_732;
float2 l9_734;
if (sc_StereoRenderingMode_tmp==1)
{
float3 l9_735=float3(l9_733,0.0);
int l9_736=1;
int l9_737;
if (sc_StereoRenderingMode_tmp==0)
{
l9_737=0;
}
else
{
l9_737=in.varStereoViewID;
}
int l9_738=l9_737;
int l9_739=l9_738;
float3 l9_740=float3(l9_733,0.0);
int l9_741=l9_736;
int l9_742=l9_739;
if (l9_741==1)
{
l9_740.y=((2.0*l9_740.y)+float(l9_742))-1.0;
}
float2 l9_743=l9_740.xy;
l9_734=l9_743;
}
else
{
l9_734=l9_733;
}
float2 l9_744=l9_734;
float2 l9_745=l9_744;
float2 l9_746=l9_745;
int l9_747;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_748;
if (sc_StereoRenderingMode_tmp==0)
{
l9_748=0;
}
else
{
l9_748=in.varStereoViewID;
}
int l9_749=l9_748;
l9_747=1-l9_749;
}
else
{
int l9_750;
if (sc_StereoRenderingMode_tmp==0)
{
l9_750=0;
}
else
{
l9_750=in.varStereoViewID;
}
int l9_751=l9_750;
l9_747=l9_751;
}
int l9_752=l9_747;
float2 l9_753=l9_746;
int l9_754=l9_752;
float2 l9_755=l9_753;
int l9_756=l9_754;
float l9_757=0.0;
float2 l9_758=(*sc_set2.UserUniforms).sc_ScreenTextureDims.xy;
float2 l9_759=l9_758;
float2 l9_760=l9_755;
int l9_761=sc_ScreenTextureLayout_tmp;
int l9_762=l9_756;
float l9_763=l9_757;
float2 l9_764=l9_760;
int l9_765=l9_761;
int l9_766=l9_762;
float3 l9_767;
if (l9_765==0)
{
l9_767=float3(l9_764,0.0);
}
else
{
if (l9_765==1)
{
l9_767=float3(l9_764.x,(l9_764.y*0.5)+(0.5-(float(l9_766)*0.5)),0.0);
}
else
{
l9_767=float3(l9_764,float(l9_766));
}
}
float3 l9_768=l9_767;
float3 l9_769=l9_768;
float2 l9_770=l9_759;
float2 l9_771=l9_769.xy;
float l9_772=l9_763;
float4 l9_773=sc_set2.sc_ScreenTexture.sample(sc_set2.sc_ScreenTextureSmpSC,l9_771,bias(l9_772));
float4 l9_774=l9_773;
float4 l9_775=l9_774;
float4 l9_776=l9_775;
float4 l9_777=l9_776;
float4 l9_778=l9_777;
l9_727=l9_778;
}
float4 l9_779=l9_727;
float4 l9_780=l9_779;
float3 l9_781=l9_780.xyz;
float3 l9_782;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_782=float3(pow(l9_781.x,2.2),pow(l9_781.y,2.2),pow(l9_781.z,2.2));
}
else
{
l9_782=l9_781*l9_781;
}
float3 l9_783=l9_782;
float3 l9_784=l9_783;
l9_726.transmitted=l9_784*mix(float3(1.0),l9_286.albedo,float3(l9_286.opacity));
l9_286.opacity=1.0;
}
bool l9_785=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_785=true;
}
SurfaceProperties l9_786=l9_286;
LightingComponents l9_787=l9_726;
bool l9_788=l9_785;
float3 l9_789=l9_786.albedo*(l9_787.directDiffuse+(l9_787.indirectDiffuse*l9_786.ao));
float3 l9_790=l9_787.directSpecular+(l9_787.indirectSpecular*l9_786.specularAo);
float3 l9_791=l9_786.emissive;
float3 l9_792=l9_787.transmitted;
if (l9_788)
{
float l9_793=l9_786.opacity;
l9_789*=srgbToLinear(l9_793);
}
float3 l9_794=((l9_789+l9_790)+l9_791)+l9_792;
float3 l9_795=l9_794;
float4 l9_796=float4(l9_795,l9_286.opacity);
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 l9_797=l9_796.xyz;
float3 l9_798=linearToneMapping(l9_797);
l9_796=float4(l9_798.x,l9_798.y,l9_798.z,l9_796.w);
}
float3 l9_799=l9_796.xyz;
float l9_800=l9_799.x;
float l9_801=l9_799.y;
float l9_802=l9_799.z;
float3 l9_803=float3(linearToSrgb(l9_800),linearToSrgb(l9_801),linearToSrgb(l9_802));
l9_796=float4(l9_803.x,l9_803.y,l9_803.z,l9_796.w);
float4 l9_804=l9_796;
param_43=l9_804;
}
else
{
param_43=float4(param_35,param_36);
}
param_43=fast::max(param_43,float4(0.0));
Output_N6=param_43;
FinalColor=Output_N6;
float4 param_45=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_805=param_45;
float4 l9_806=l9_805;
float l9_807=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_807=l9_806.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_807=fast::clamp(l9_806.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_807=fast::clamp(dot(l9_806.xyz,float3(l9_806.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_807=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_807=(1.0-dot(l9_806.xyz,float3(0.33333)))*l9_806.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_807=(1.0-fast::clamp(dot(l9_806.xyz,float3(1.0)),0.0,1.0))*l9_806.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_807=fast::clamp(dot(l9_806.xyz,float3(1.0)),0.0,1.0)*l9_806.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_807=fast::clamp(dot(l9_806.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_807=fast::clamp(dot(l9_806.xyz,float3(1.0)),0.0,1.0)*l9_806.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_807=dot(l9_806.xyz,float3(0.33333))*l9_806.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_807=1.0-fast::clamp(dot(l9_806.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_807=fast::clamp(dot(l9_806.xyz,float3(1.0)),0.0,1.0);
}
}
}
}
}
}
}
}
}
}
}
}
float l9_808=l9_807;
float l9_809=l9_808;
float l9_810=(*sc_set2.UserUniforms).sc_ShadowDensity*l9_809;
float3 l9_811=mix((*sc_set2.UserUniforms).sc_ShadowColor.xyz,(*sc_set2.UserUniforms).sc_ShadowColor.xyz*l9_805.xyz,float3((*sc_set2.UserUniforms).sc_ShadowColor.w));
float4 l9_812=float4(l9_811.x,l9_811.y,l9_811.z,l9_810);
param_45=l9_812;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_45=float4(param_45.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_813=param_45;
float4 l9_814;
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_815=out.FragColor0;
float4 l9_816=l9_815;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_816.x+=(*sc_set2.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_817=l9_816;
l9_814=l9_817;
}
else
{
float4 l9_818=gl_FragCoord;
float2 l9_819=(l9_818.xy*(*sc_set2.UserUniforms).sc_WindowToViewportTransform.xy)+(*sc_set2.UserUniforms).sc_WindowToViewportTransform.zw;
float2 l9_820=l9_819;
float2 l9_821;
if (sc_StereoRenderingMode_tmp==1)
{
float3 l9_822=float3(l9_820,0.0);
int l9_823=1;
int l9_824;
if (sc_StereoRenderingMode_tmp==0)
{
l9_824=0;
}
else
{
l9_824=in.varStereoViewID;
}
int l9_825=l9_824;
int l9_826=l9_825;
float3 l9_827=float3(l9_820,0.0);
int l9_828=l9_823;
int l9_829=l9_826;
if (l9_828==1)
{
l9_827.y=((2.0*l9_827.y)+float(l9_829))-1.0;
}
float2 l9_830=l9_827.xy;
l9_821=l9_830;
}
else
{
l9_821=l9_820;
}
float2 l9_831=l9_821;
float2 l9_832=l9_831;
float2 l9_833=l9_832;
int l9_834;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_835;
if (sc_StereoRenderingMode_tmp==0)
{
l9_835=0;
}
else
{
l9_835=in.varStereoViewID;
}
int l9_836=l9_835;
l9_834=1-l9_836;
}
else
{
int l9_837;
if (sc_StereoRenderingMode_tmp==0)
{
l9_837=0;
}
else
{
l9_837=in.varStereoViewID;
}
int l9_838=l9_837;
l9_834=l9_838;
}
int l9_839=l9_834;
float2 l9_840=l9_833;
int l9_841=l9_839;
float2 l9_842=l9_840;
int l9_843=l9_841;
float l9_844=0.0;
float2 l9_845=(*sc_set2.UserUniforms).sc_ScreenTextureDims.xy;
float2 l9_846=l9_845;
float2 l9_847=l9_842;
int l9_848=sc_ScreenTextureLayout_tmp;
int l9_849=l9_843;
float l9_850=l9_844;
float2 l9_851=l9_847;
int l9_852=l9_848;
int l9_853=l9_849;
float3 l9_854;
if (l9_852==0)
{
l9_854=float3(l9_851,0.0);
}
else
{
if (l9_852==1)
{
l9_854=float3(l9_851.x,(l9_851.y*0.5)+(0.5-(float(l9_853)*0.5)),0.0);
}
else
{
l9_854=float3(l9_851,float(l9_853));
}
}
float3 l9_855=l9_854;
float3 l9_856=l9_855;
float2 l9_857=l9_846;
float2 l9_858=l9_856.xy;
float l9_859=l9_850;
float4 l9_860=sc_set2.sc_ScreenTexture.sample(sc_set2.sc_ScreenTextureSmpSC,l9_858,bias(l9_859));
float4 l9_861=l9_860;
float4 l9_862=l9_861;
float4 l9_863=l9_862;
float4 l9_864=l9_863;
float4 l9_865=l9_864;
l9_814=l9_865;
}
float4 l9_866=l9_814;
float4 l9_867=l9_866;
float3 l9_868=l9_867.xyz;
float3 l9_869=l9_868;
float3 l9_870=l9_813.xyz;
float3 l9_871=definedBlend(l9_869,l9_870,in.varStereoViewID,(*sc_set2.UserUniforms),sc_set2.intensityTexture,sc_set2.intensityTextureSmpSC);
float4 l9_872;
l9_872=float4(l9_871.x,l9_871.y,l9_871.z,l9_872.w);
float3 l9_873=mix(l9_868,l9_872.xyz,float3(l9_813.w));
l9_872=float4(l9_873.x,l9_873.y,l9_873.z,l9_872.w);
l9_872.w=1.0;
float4 l9_874=l9_872;
param_45=l9_874;
}
else
{
float4 l9_875=param_45;
float4 l9_876;
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_876=float4(mix(float3(1.0),l9_875.xyz,float3(l9_875.w)),l9_875.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_877=l9_875.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_877=fast::clamp(l9_877,0.0,1.0);
}
l9_876=float4(l9_875.xyz*l9_877,l9_877);
}
else
{
l9_876=l9_875;
}
}
float4 l9_878=l9_876;
param_45=l9_878;
}
}
}
float4 l9_879=param_45;
FinalColor=l9_879;
if ((*sc_set2.UserUniforms).PreviewEnabled==1)
{
if (PreviewInfo.Saved)
{
FinalColor=float4(PreviewInfo.Color);
}
else
{
FinalColor=float4(0.0);
}
}
float4 l9_880;
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_880=float4((*sc_set2.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_880=float4(0.0);
}
float4 l9_881=l9_880;
float4 Cost=l9_881;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float4 param_46=FinalColor;
out.FragColor0=param_46;
float4 param_47=FinalColor;
return out;
}
} // FRAGMENT SHADER
