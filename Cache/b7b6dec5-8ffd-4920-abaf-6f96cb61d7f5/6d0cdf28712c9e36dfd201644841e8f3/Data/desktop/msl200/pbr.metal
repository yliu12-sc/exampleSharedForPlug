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
#ifdef uv2
#undef uv2
#endif
#ifdef uv3
#undef uv3
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
//output uvec4 position_and_mask 0
//output uvec4 normal_and_more 1
//sampler sampler baseTexSmpSC 2:28
//sampler sampler intensityTextureSmpSC 2:29
//sampler sampler materialParamsTexSmpSC 2:30
//sampler sampler normalTexSmpSC 2:31
//sampler sampler sc_EnvmapDiffuseSmpSC 2:32
//sampler sampler sc_EnvmapSpecularSmpSC 2:33
//sampler sampler sc_RayTracedReflectionTextureSmpSC 2:37
//sampler sampler sc_SSAOTextureSmpSC 2:39
//sampler sampler sc_ScreenTextureSmpSC 2:40
//sampler sampler sc_ShadowTextureSmpSC 2:41
//sampler sampler z_hitIdAndBarycentricSmp 2:43
//sampler sampler z_rayDirectionsSmpSC 2:44
//texture texture2D baseTex 2:4:2:28
//texture texture2D intensityTexture 2:5:2:29
//texture texture2D materialParamsTex 2:6:2:30
//texture texture2D normalTex 2:7:2:31
//texture texture2D sc_EnvmapDiffuse 2:8:2:32
//texture texture2D sc_EnvmapSpecular 2:9:2:33
//texture texture2D sc_RayTracedReflectionTexture 2:20:2:37
//texture texture2D sc_SSAOTexture 2:22:2:39
//texture texture2D sc_ScreenTexture 2:23:2:40
//texture texture2D sc_ShadowTexture 2:24:2:41
//texture utexture2D z_hitIdAndBarycentric 2:26:2:43
//texture texture2D z_rayDirections 2:27:2:44
//ubo int UserUniforms 2:45:4576 {
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
//bool receivesRayTracedReflections 3488
//bool isProxyMode 3492
//bool receivesRayTracedShadows 3496
//bool receivesRayTracedDiffuseIndirect 3500
//bool receivesRayTracedAo 3504
//float4 sc_RayTracedReflectionTextureSize 3520
//float4 sc_RayTracedReflectionTextureDims 3536
//float4 sc_RayTracedReflectionTextureView 3552
//float4 sc_RayTracedShadowTextureSize 3568
//float4 sc_RayTracedShadowTextureDims 3584
//float4 sc_RayTracedShadowTextureView 3600
//float4 sc_RayTracedDiffIndTextureSize 3616
//float4 sc_RayTracedDiffIndTextureDims 3632
//float4 sc_RayTracedDiffIndTextureView 3648
//float4 sc_RayTracedAoTextureSize 3664
//float4 sc_RayTracedAoTextureDims 3680
//float4 sc_RayTracedAoTextureView 3696
//float receiver_mask 3712
//float3 OriginNormalizationScale 3728
//float3 OriginNormalizationScaleInv 3744
//float3 OriginNormalizationOffset 3760
//int receiverId 3776
//int instance_id 3780
//int lray_triangles_last 3784
//bool noEarlyZ 3788
//bool has_animated_pn 3792
//int emitter_stride 3796
//int proxy_offset_position 3800
//int proxy_offset_normal 3804
//int proxy_offset_tangent 3808
//int proxy_offset_color 3812
//int proxy_offset_texture0 3816
//int proxy_offset_texture1 3820
//int proxy_offset_texture2 3824
//int proxy_offset_texture3 3828
//int proxy_format_position 3832
//int proxy_format_normal 3836
//int proxy_format_tangent 3840
//int proxy_format_color 3844
//int proxy_format_texture0 3848
//int proxy_format_texture1 3852
//int proxy_format_texture2 3856
//int proxy_format_texture3 3860
//float4 z_rayDirectionsSize 3872
//float4 z_rayDirectionsDims 3888
//float4 z_rayDirectionsView 3904
//float correctedIntensity 3920
//float4 intensityTextureSize 3936
//float4 intensityTextureDims 3952
//float4 intensityTextureView 3968
//float3x3 intensityTextureTransform 3984
//float4 intensityTextureUvMinMax 4032
//float4 intensityTextureBorderColor 4048
//float reflBlurWidth 4064
//float reflBlurMinRough 4068
//float reflBlurMaxRough 4072
//int overrideTimeEnabled 4076
//float overrideTimeElapsed 4080
//float overrideTimeDelta 4084
//int PreviewEnabled 4088
//int PreviewNodeID 4092
//float alphaTestThreshold 4096
//float4 baseTexSize 4112
//float4 baseTexDims 4128
//float4 baseTexView 4144
//float3x3 baseTexTransform 4160
//float4 baseTexUvMinMax 4208
//float4 baseTexBorderColor 4224
//float uvScale 4240
//float4 normalTexSize 4256
//float4 normalTexDims 4272
//float4 normalTexView 4288
//float3x3 normalTexTransform 4304
//float4 normalTexUvMinMax 4352
//float4 normalTexBorderColor 4368
//float4 materialParamsTexSize 4384
//float4 materialParamsTexDims 4400
//float4 materialParamsTexView 4416
//float3x3 materialParamsTexTransform 4432
//float4 materialParamsTexUvMinMax 4480
//float4 materialParamsTexBorderColor 4496
//float2 Port_Center_N016 4512
//float3 Port_Emissive_N006 4528
//float3 Port_SpecularAO_N006 4544
//float depthRef 4560
//}
//ubo float sc_BonesUBO 2:3:96 {
//sc_Bone_t sc_Bones 0:[]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ssbo int layoutIndices 2:0:4 {
//uint _Triangles 0:[]:4
//}
//ssbo float layoutVertices 2:1:4 {
//float _Vertices 0:[]:4
//}
//ssbo float layoutVerticesPN 2:2:4 {
//float _VerticesPN 0:[]:4
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
//spec_const bool sc_BlendMode_Max 1055
//spec_const bool sc_BlendMode_Min 1056
//spec_const bool sc_BlendMode_MultiplyOriginal 1057
//spec_const bool sc_BlendMode_Multiply 1058
//spec_const bool sc_BlendMode_Normal 1059
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 1060
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 1061
//spec_const bool sc_BlendMode_PremultipliedAlpha 1062
//spec_const bool sc_BlendMode_Screen 1063
//spec_const bool sc_DepthOnly 1064
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 1065
//spec_const bool sc_EnvmapSpecularHasSwappedViews 1066
//spec_const bool sc_FramebufferFetch 1067
//spec_const bool sc_HasDiffuseEnvmap 1068
//spec_const bool sc_LightEstimation 1069
//spec_const bool sc_OITCompositingPass 1070
//spec_const bool sc_OITDepthBoundsPass 1071
//spec_const bool sc_OITDepthGatherPass 1072
//spec_const bool sc_ProjectiveShadowsCaster 1073
//spec_const bool sc_ProjectiveShadowsReceiver 1074
//spec_const bool sc_ProxyAlphaOne 1075
//spec_const bool sc_RayTracedReflectionTextureHasSwappedViews 1076
//spec_const bool sc_RenderAlphaToColor 1077
//spec_const bool sc_SSAOEnabled 1078
//spec_const bool sc_ScreenTextureHasSwappedViews 1079
//spec_const bool sc_ShaderComplexityAnalyzer 1080
//spec_const bool sc_UseFramebufferFetchMarker 1081
//spec_const bool sc_VertexBlendingUseNormals 1082
//spec_const bool sc_VertexBlending 1083
//spec_const int SC_DEVICE_CLASS 1084
//spec_const int SC_SOFTWARE_WRAP_MODE_U_baseTex 1085
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 1086
//spec_const int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex 1087
//spec_const int SC_SOFTWARE_WRAP_MODE_U_normalTex 1088
//spec_const int SC_SOFTWARE_WRAP_MODE_V_baseTex 1089
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 1090
//spec_const int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex 1091
//spec_const int SC_SOFTWARE_WRAP_MODE_V_normalTex 1092
//spec_const int baseTexLayout 1093
//spec_const int intensityTextureLayout 1094
//spec_const int materialParamsTexLayout 1095
//spec_const int normalTexLayout 1096
//spec_const int sc_AmbientLightMode0 1097
//spec_const int sc_AmbientLightMode1 1098
//spec_const int sc_AmbientLightMode2 1099
//spec_const int sc_AmbientLightMode_Constant 1100
//spec_const int sc_AmbientLightMode_EnvironmentMap 1101
//spec_const int sc_AmbientLightMode_FromCamera 1102
//spec_const int sc_AmbientLightMode_SphericalHarmonics 1103
//spec_const int sc_AmbientLightsCount 1104
//spec_const int sc_DepthBufferMode 1105
//spec_const int sc_DirectionalLightsCount 1106
//spec_const int sc_EnvLightMode 1107
//spec_const int sc_EnvmapDiffuseLayout 1108
//spec_const int sc_EnvmapSpecularLayout 1109
//spec_const int sc_LightEstimationSGCount 1110
//spec_const int sc_MaxTextureImageUnits 1111
//spec_const int sc_PointLightsCount 1112
//spec_const int sc_RayTracedReflectionTextureLayout 1113
//spec_const int sc_RenderingSpace 1114
//spec_const int sc_ScreenTextureLayout 1115
//spec_const int sc_SkinBonesCount 1116
//spec_const int sc_StereoRenderingMode 1117
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 1118
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
constant bool sc_BlendMode_Max [[function_constant(1055)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(1056)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(1057)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(1058)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(1059)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(1060)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(1061)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(1062)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(1063)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(1064)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_EnvmapDiffuseHasSwappedViews [[function_constant(1065)]];
constant bool sc_EnvmapDiffuseHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapDiffuseHasSwappedViews) ? sc_EnvmapDiffuseHasSwappedViews : false;
constant bool sc_EnvmapSpecularHasSwappedViews [[function_constant(1066)]];
constant bool sc_EnvmapSpecularHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapSpecularHasSwappedViews) ? sc_EnvmapSpecularHasSwappedViews : false;
constant bool sc_FramebufferFetch [[function_constant(1067)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_HasDiffuseEnvmap [[function_constant(1068)]];
constant bool sc_HasDiffuseEnvmap_tmp = is_function_constant_defined(sc_HasDiffuseEnvmap) ? sc_HasDiffuseEnvmap : false;
constant bool sc_LightEstimation [[function_constant(1069)]];
constant bool sc_LightEstimation_tmp = is_function_constant_defined(sc_LightEstimation) ? sc_LightEstimation : false;
constant bool sc_OITCompositingPass [[function_constant(1070)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(1071)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(1072)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(1073)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(1074)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_ProxyAlphaOne [[function_constant(1075)]];
constant bool sc_ProxyAlphaOne_tmp = is_function_constant_defined(sc_ProxyAlphaOne) ? sc_ProxyAlphaOne : false;
constant bool sc_RayTracedReflectionTextureHasSwappedViews [[function_constant(1076)]];
constant bool sc_RayTracedReflectionTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedReflectionTextureHasSwappedViews) ? sc_RayTracedReflectionTextureHasSwappedViews : false;
constant bool sc_RenderAlphaToColor [[function_constant(1077)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_SSAOEnabled [[function_constant(1078)]];
constant bool sc_SSAOEnabled_tmp = is_function_constant_defined(sc_SSAOEnabled) ? sc_SSAOEnabled : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(1079)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(1080)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(1081)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(1082)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(1083)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant int SC_DEVICE_CLASS [[function_constant(1084)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex [[function_constant(1085)]];
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_baseTex) ? SC_SOFTWARE_WRAP_MODE_U_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(1086)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex [[function_constant(1087)]];
constant int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex) ? SC_SOFTWARE_WRAP_MODE_U_materialParamsTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_normalTex [[function_constant(1088)]];
constant int SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_normalTex) ? SC_SOFTWARE_WRAP_MODE_U_normalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex [[function_constant(1089)]];
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_baseTex) ? SC_SOFTWARE_WRAP_MODE_V_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(1090)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex [[function_constant(1091)]];
constant int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_materialParamsTex) ? SC_SOFTWARE_WRAP_MODE_V_materialParamsTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_normalTex [[function_constant(1092)]];
constant int SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_normalTex) ? SC_SOFTWARE_WRAP_MODE_V_normalTex : -1;
constant int baseTexLayout [[function_constant(1093)]];
constant int baseTexLayout_tmp = is_function_constant_defined(baseTexLayout) ? baseTexLayout : 0;
constant int intensityTextureLayout [[function_constant(1094)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int materialParamsTexLayout [[function_constant(1095)]];
constant int materialParamsTexLayout_tmp = is_function_constant_defined(materialParamsTexLayout) ? materialParamsTexLayout : 0;
constant int normalTexLayout [[function_constant(1096)]];
constant int normalTexLayout_tmp = is_function_constant_defined(normalTexLayout) ? normalTexLayout : 0;
constant int sc_AmbientLightMode0 [[function_constant(1097)]];
constant int sc_AmbientLightMode0_tmp = is_function_constant_defined(sc_AmbientLightMode0) ? sc_AmbientLightMode0 : 0;
constant int sc_AmbientLightMode1 [[function_constant(1098)]];
constant int sc_AmbientLightMode1_tmp = is_function_constant_defined(sc_AmbientLightMode1) ? sc_AmbientLightMode1 : 0;
constant int sc_AmbientLightMode2 [[function_constant(1099)]];
constant int sc_AmbientLightMode2_tmp = is_function_constant_defined(sc_AmbientLightMode2) ? sc_AmbientLightMode2 : 0;
constant int sc_AmbientLightMode_Constant [[function_constant(1100)]];
constant int sc_AmbientLightMode_Constant_tmp = is_function_constant_defined(sc_AmbientLightMode_Constant) ? sc_AmbientLightMode_Constant : 0;
constant int sc_AmbientLightMode_EnvironmentMap [[function_constant(1101)]];
constant int sc_AmbientLightMode_EnvironmentMap_tmp = is_function_constant_defined(sc_AmbientLightMode_EnvironmentMap) ? sc_AmbientLightMode_EnvironmentMap : 0;
constant int sc_AmbientLightMode_FromCamera [[function_constant(1102)]];
constant int sc_AmbientLightMode_FromCamera_tmp = is_function_constant_defined(sc_AmbientLightMode_FromCamera) ? sc_AmbientLightMode_FromCamera : 0;
constant int sc_AmbientLightMode_SphericalHarmonics [[function_constant(1103)]];
constant int sc_AmbientLightMode_SphericalHarmonics_tmp = is_function_constant_defined(sc_AmbientLightMode_SphericalHarmonics) ? sc_AmbientLightMode_SphericalHarmonics : 0;
constant int sc_AmbientLightsCount [[function_constant(1104)]];
constant int sc_AmbientLightsCount_tmp = is_function_constant_defined(sc_AmbientLightsCount) ? sc_AmbientLightsCount : 0;
constant int sc_DepthBufferMode [[function_constant(1105)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_DirectionalLightsCount [[function_constant(1106)]];
constant int sc_DirectionalLightsCount_tmp = is_function_constant_defined(sc_DirectionalLightsCount) ? sc_DirectionalLightsCount : 0;
constant int sc_EnvLightMode [[function_constant(1107)]];
constant int sc_EnvLightMode_tmp = is_function_constant_defined(sc_EnvLightMode) ? sc_EnvLightMode : 0;
constant int sc_EnvmapDiffuseLayout [[function_constant(1108)]];
constant int sc_EnvmapDiffuseLayout_tmp = is_function_constant_defined(sc_EnvmapDiffuseLayout) ? sc_EnvmapDiffuseLayout : 0;
constant int sc_EnvmapSpecularLayout [[function_constant(1109)]];
constant int sc_EnvmapSpecularLayout_tmp = is_function_constant_defined(sc_EnvmapSpecularLayout) ? sc_EnvmapSpecularLayout : 0;
constant int sc_LightEstimationSGCount [[function_constant(1110)]];
constant int sc_LightEstimationSGCount_tmp = is_function_constant_defined(sc_LightEstimationSGCount) ? sc_LightEstimationSGCount : 0;
constant int sc_MaxTextureImageUnits [[function_constant(1111)]];
constant int sc_MaxTextureImageUnits_tmp = is_function_constant_defined(sc_MaxTextureImageUnits) ? sc_MaxTextureImageUnits : 0;
constant int sc_PointLightsCount [[function_constant(1112)]];
constant int sc_PointLightsCount_tmp = is_function_constant_defined(sc_PointLightsCount) ? sc_PointLightsCount : 0;
constant int sc_RayTracedReflectionTextureLayout [[function_constant(1113)]];
constant int sc_RayTracedReflectionTextureLayout_tmp = is_function_constant_defined(sc_RayTracedReflectionTextureLayout) ? sc_RayTracedReflectionTextureLayout : 0;
constant int sc_RenderingSpace [[function_constant(1114)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(1115)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_SkinBonesCount [[function_constant(1116)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(1117)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(1118)]];
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
int receivesRayTracedReflections;
int isProxyMode;
int receivesRayTracedShadows;
int receivesRayTracedDiffuseIndirect;
int receivesRayTracedAo;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
float4 sc_RayTracedShadowTextureSize;
float4 sc_RayTracedShadowTextureDims;
float4 sc_RayTracedShadowTextureView;
float4 sc_RayTracedDiffIndTextureSize;
float4 sc_RayTracedDiffIndTextureDims;
float4 sc_RayTracedDiffIndTextureView;
float4 sc_RayTracedAoTextureSize;
float4 sc_RayTracedAoTextureDims;
float4 sc_RayTracedAoTextureView;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int receiverId;
int instance_id;
int lray_triangles_last;
int noEarlyZ;
int has_animated_pn;
int emitter_stride;
int proxy_offset_position;
int proxy_offset_normal;
int proxy_offset_tangent;
int proxy_offset_color;
int proxy_offset_texture0;
int proxy_offset_texture1;
int proxy_offset_texture2;
int proxy_offset_texture3;
int proxy_format_position;
int proxy_format_normal;
int proxy_format_tangent;
int proxy_format_color;
int proxy_format_texture0;
int proxy_format_texture1;
int proxy_format_texture2;
int proxy_format_texture3;
float4 z_rayDirectionsSize;
float4 z_rayDirectionsDims;
float4 z_rayDirectionsView;
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
float depthRef;
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
struct layoutIndices_obj
{
uint _Triangles[1];
};
struct layoutVertices_obj
{
float _Vertices[1];
};
struct layoutVerticesPN_obj
{
float _VerticesPN[1];
};
struct sc_AmbientLightCompatibility_t
{
float3 color;
};
struct sc_Set2
{
const device layoutIndices_obj* layoutIndices [[id(0)]];
const device layoutVertices_obj* layoutVertices [[id(1)]];
const device layoutVerticesPN_obj* layoutVerticesPN [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> baseTex [[id(4)]];
texture2d<float> intensityTexture [[id(5)]];
texture2d<float> materialParamsTex [[id(6)]];
texture2d<float> normalTex [[id(7)]];
texture2d<float> sc_EnvmapDiffuse [[id(8)]];
texture2d<float> sc_EnvmapSpecular [[id(9)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(20)]];
texture2d<float> sc_SSAOTexture [[id(22)]];
texture2d<float> sc_ScreenTexture [[id(23)]];
texture2d<float> sc_ShadowTexture [[id(24)]];
texture2d<uint> z_hitIdAndBarycentric [[id(26)]];
texture2d<float> z_rayDirections [[id(27)]];
sampler baseTexSmpSC [[id(28)]];
sampler intensityTextureSmpSC [[id(29)]];
sampler materialParamsTexSmpSC [[id(30)]];
sampler normalTexSmpSC [[id(31)]];
sampler sc_EnvmapDiffuseSmpSC [[id(32)]];
sampler sc_EnvmapSpecularSmpSC [[id(33)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(37)]];
sampler sc_SSAOTextureSmpSC [[id(39)]];
sampler sc_ScreenTextureSmpSC [[id(40)]];
sampler sc_ShadowTextureSmpSC [[id(41)]];
sampler z_hitIdAndBarycentricSmp [[id(43)]];
sampler z_rayDirectionsSmpSC [[id(44)]];
constant userUniformsObj* UserUniforms [[id(45)]];
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
bool l9_0=(*sc_set2.UserUniforms).isProxyMode!=0;
ssPreviewInfo PreviewInfo;
float Dummy1;
float2 Dummy2;
float3 Dummy3;
float4 Dummy4;
ssGlobals tempGlobals;
if (l9_0)
{
float4 param=float4(in.position.xy,(*sc_set2.UserUniforms).depthRef+(1e-10*in.position.z),1.0+(1e-10*in.position.w));
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_1=param;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_2=dot(l9_1,(*sc_set2.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_3=l9_2;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
float l9_4=l9_3;
}
else
{
out.varClipDistance=l9_3;
}
}
float4 l9_5=float4(param.x,-param.y,(param.z*0.5)+(param.w*0.5),param.w);
out.gl_Position=l9_5;
return out;
}
out.PreviewVertexColor=float4(0.5);
PreviewInfo.Color=float4(0.5);
PreviewInfo.Saved=false;
out.PreviewVertexSaved=0.0;
sc_Vertex_t l9_7;
l9_7.position=in.position;
l9_7.normal=in.normal;
l9_7.tangent=in.tangent.xyz;
l9_7.texture0=in.texture0;
l9_7.texture1=in.texture1;
sc_Vertex_t l9_8=l9_7;
sc_Vertex_t param_1=l9_8;
sc_Vertex_t l9_9=param_1;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_10=l9_9;
float3 l9_11=in.blendShape0Pos;
float3 l9_12=in.blendShape0Normal;
float l9_13=(*sc_set2.UserUniforms).weights0.x;
sc_Vertex_t l9_14=l9_10;
float3 l9_15=l9_11;
float l9_16=l9_13;
float3 l9_17=l9_14.position.xyz+(l9_15*l9_16);
l9_14.position=float4(l9_17.x,l9_17.y,l9_17.z,l9_14.position.w);
l9_10=l9_14;
l9_10.normal+=(l9_12*l9_13);
l9_9=l9_10;
sc_Vertex_t l9_18=l9_9;
float3 l9_19=in.blendShape1Pos;
float3 l9_20=in.blendShape1Normal;
float l9_21=(*sc_set2.UserUniforms).weights0.y;
sc_Vertex_t l9_22=l9_18;
float3 l9_23=l9_19;
float l9_24=l9_21;
float3 l9_25=l9_22.position.xyz+(l9_23*l9_24);
l9_22.position=float4(l9_25.x,l9_25.y,l9_25.z,l9_22.position.w);
l9_18=l9_22;
l9_18.normal+=(l9_20*l9_21);
l9_9=l9_18;
sc_Vertex_t l9_26=l9_9;
float3 l9_27=in.blendShape2Pos;
float3 l9_28=in.blendShape2Normal;
float l9_29=(*sc_set2.UserUniforms).weights0.z;
sc_Vertex_t l9_30=l9_26;
float3 l9_31=l9_27;
float l9_32=l9_29;
float3 l9_33=l9_30.position.xyz+(l9_31*l9_32);
l9_30.position=float4(l9_33.x,l9_33.y,l9_33.z,l9_30.position.w);
l9_26=l9_30;
l9_26.normal+=(l9_28*l9_29);
l9_9=l9_26;
}
else
{
sc_Vertex_t l9_34=l9_9;
float3 l9_35=in.blendShape0Pos;
float l9_36=(*sc_set2.UserUniforms).weights0.x;
float3 l9_37=l9_34.position.xyz+(l9_35*l9_36);
l9_34.position=float4(l9_37.x,l9_37.y,l9_37.z,l9_34.position.w);
l9_9=l9_34;
sc_Vertex_t l9_38=l9_9;
float3 l9_39=in.blendShape1Pos;
float l9_40=(*sc_set2.UserUniforms).weights0.y;
float3 l9_41=l9_38.position.xyz+(l9_39*l9_40);
l9_38.position=float4(l9_41.x,l9_41.y,l9_41.z,l9_38.position.w);
l9_9=l9_38;
sc_Vertex_t l9_42=l9_9;
float3 l9_43=in.blendShape2Pos;
float l9_44=(*sc_set2.UserUniforms).weights0.z;
float3 l9_45=l9_42.position.xyz+(l9_43*l9_44);
l9_42.position=float4(l9_45.x,l9_45.y,l9_45.z,l9_42.position.w);
l9_9=l9_42;
sc_Vertex_t l9_46=l9_9;
float3 l9_47=in.blendShape3Pos;
float l9_48=(*sc_set2.UserUniforms).weights0.w;
float3 l9_49=l9_46.position.xyz+(l9_47*l9_48);
l9_46.position=float4(l9_49.x,l9_49.y,l9_49.z,l9_46.position.w);
l9_9=l9_46;
sc_Vertex_t l9_50=l9_9;
float3 l9_51=in.blendShape4Pos;
float l9_52=(*sc_set2.UserUniforms).weights1.x;
float3 l9_53=l9_50.position.xyz+(l9_51*l9_52);
l9_50.position=float4(l9_53.x,l9_53.y,l9_53.z,l9_50.position.w);
l9_9=l9_50;
sc_Vertex_t l9_54=l9_9;
float3 l9_55=in.blendShape5Pos;
float l9_56=(*sc_set2.UserUniforms).weights1.y;
float3 l9_57=l9_54.position.xyz+(l9_55*l9_56);
l9_54.position=float4(l9_57.x,l9_57.y,l9_57.z,l9_54.position.w);
l9_9=l9_54;
}
}
param_1=l9_9;
sc_Vertex_t l9_58=param_1;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_59=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_59=float4(1.0,fract(in.boneData.yzw));
l9_59.x-=dot(l9_59.yzw,float3(1.0));
}
float4 l9_60=l9_59;
float4 l9_61=l9_60;
int l9_62=0;
int l9_63=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_63=int(in.boneData[l9_62]);
}
int l9_64=l9_63;
int l9_65=l9_64;
int l9_66=1;
int l9_67=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_67=int(in.boneData[l9_66]);
}
int l9_68=l9_67;
int l9_69=l9_68;
int l9_70=2;
int l9_71=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_71=int(in.boneData[l9_70]);
}
int l9_72=l9_71;
int l9_73=l9_72;
int l9_74=3;
int l9_75=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_75=int(in.boneData[l9_74]);
}
int l9_76=l9_75;
int l9_77=l9_76;
int l9_78=l9_65;
float4 l9_79=l9_58.position;
float3 l9_80;
if (sc_SkinBonesCount_tmp>0)
{
int l9_81=l9_78;
float4 l9_82=(*sc_set2.sc_BonesUBO).sc_Bones[l9_81].boneMatrix[0];
float4 l9_83=(*sc_set2.sc_BonesUBO).sc_Bones[l9_81].boneMatrix[1];
float4 l9_84=(*sc_set2.sc_BonesUBO).sc_Bones[l9_81].boneMatrix[2];
float4x3 l9_85=float4x3(float3(l9_82.x,l9_83.x,l9_84.x),float3(l9_82.y,l9_83.y,l9_84.y),float3(l9_82.z,l9_83.z,l9_84.z),float3(l9_82.w,l9_83.w,l9_84.w));
l9_80=l9_85*l9_79;
}
else
{
l9_80=l9_79.xyz;
}
float3 l9_86=l9_80;
float3 l9_87=l9_86;
float l9_88=l9_61.x;
int l9_89=l9_69;
float4 l9_90=l9_58.position;
float3 l9_91;
if (sc_SkinBonesCount_tmp>0)
{
int l9_92=l9_89;
float4 l9_93=(*sc_set2.sc_BonesUBO).sc_Bones[l9_92].boneMatrix[0];
float4 l9_94=(*sc_set2.sc_BonesUBO).sc_Bones[l9_92].boneMatrix[1];
float4 l9_95=(*sc_set2.sc_BonesUBO).sc_Bones[l9_92].boneMatrix[2];
float4x3 l9_96=float4x3(float3(l9_93.x,l9_94.x,l9_95.x),float3(l9_93.y,l9_94.y,l9_95.y),float3(l9_93.z,l9_94.z,l9_95.z),float3(l9_93.w,l9_94.w,l9_95.w));
l9_91=l9_96*l9_90;
}
else
{
l9_91=l9_90.xyz;
}
float3 l9_97=l9_91;
float3 l9_98=l9_97;
float l9_99=l9_61.y;
int l9_100=l9_73;
float4 l9_101=l9_58.position;
float3 l9_102;
if (sc_SkinBonesCount_tmp>0)
{
int l9_103=l9_100;
float4 l9_104=(*sc_set2.sc_BonesUBO).sc_Bones[l9_103].boneMatrix[0];
float4 l9_105=(*sc_set2.sc_BonesUBO).sc_Bones[l9_103].boneMatrix[1];
float4 l9_106=(*sc_set2.sc_BonesUBO).sc_Bones[l9_103].boneMatrix[2];
float4x3 l9_107=float4x3(float3(l9_104.x,l9_105.x,l9_106.x),float3(l9_104.y,l9_105.y,l9_106.y),float3(l9_104.z,l9_105.z,l9_106.z),float3(l9_104.w,l9_105.w,l9_106.w));
l9_102=l9_107*l9_101;
}
else
{
l9_102=l9_101.xyz;
}
float3 l9_108=l9_102;
float3 l9_109=l9_108;
float l9_110=l9_61.z;
int l9_111=l9_77;
float4 l9_112=l9_58.position;
float3 l9_113;
if (sc_SkinBonesCount_tmp>0)
{
int l9_114=l9_111;
float4 l9_115=(*sc_set2.sc_BonesUBO).sc_Bones[l9_114].boneMatrix[0];
float4 l9_116=(*sc_set2.sc_BonesUBO).sc_Bones[l9_114].boneMatrix[1];
float4 l9_117=(*sc_set2.sc_BonesUBO).sc_Bones[l9_114].boneMatrix[2];
float4x3 l9_118=float4x3(float3(l9_115.x,l9_116.x,l9_117.x),float3(l9_115.y,l9_116.y,l9_117.y),float3(l9_115.z,l9_116.z,l9_117.z),float3(l9_115.w,l9_116.w,l9_117.w));
l9_113=l9_118*l9_112;
}
else
{
l9_113=l9_112.xyz;
}
float3 l9_119=l9_113;
float3 l9_120=(((l9_87*l9_88)+(l9_98*l9_99))+(l9_109*l9_110))+(l9_119*l9_61.w);
l9_58.position=float4(l9_120.x,l9_120.y,l9_120.z,l9_58.position.w);
int l9_121=l9_65;
float3x3 l9_122=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_121].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_121].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_121].normalMatrix[2].xyz));
float3x3 l9_123=l9_122;
float3x3 l9_124=l9_123;
int l9_125=l9_69;
float3x3 l9_126=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_125].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_125].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_125].normalMatrix[2].xyz));
float3x3 l9_127=l9_126;
float3x3 l9_128=l9_127;
int l9_129=l9_73;
float3x3 l9_130=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_129].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_129].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_129].normalMatrix[2].xyz));
float3x3 l9_131=l9_130;
float3x3 l9_132=l9_131;
int l9_133=l9_77;
float3x3 l9_134=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_133].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_133].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_133].normalMatrix[2].xyz));
float3x3 l9_135=l9_134;
float3x3 l9_136=l9_135;
l9_58.normal=((((l9_124*l9_58.normal)*l9_61.x)+((l9_128*l9_58.normal)*l9_61.y))+((l9_132*l9_58.normal)*l9_61.z))+((l9_136*l9_58.normal)*l9_61.w);
l9_58.tangent=((((l9_124*l9_58.tangent)*l9_61.x)+((l9_128*l9_58.tangent)*l9_61.y))+((l9_132*l9_58.tangent)*l9_61.z))+((l9_136*l9_58.tangent)*l9_61.w);
}
param_1=l9_58;
if (sc_RenderingSpace_tmp==3)
{
out.varPos=float3(0.0);
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==4)
{
out.varPos=float3(0.0);
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
out.varPos=param_1.position.xyz;
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
out.varPos=((*sc_set2.UserUniforms).sc_ModelMatrix*param_1.position).xyz;
out.varNormal=(*sc_set2.UserUniforms).sc_NormalMatrix*param_1.normal;
float3 l9_137=(*sc_set2.UserUniforms).sc_NormalMatrix*param_1.tangent;
out.varTangent=float4(l9_137.x,l9_137.y,l9_137.z,out.varTangent.w);
}
}
}
}
if ((*sc_set2.UserUniforms).PreviewEnabled==1)
{
param_1.texture0.x=1.0-param_1.texture0.x;
}
out.varColor=in.color;
sc_Vertex_t v=param_1;
float l9_138;
if ((*sc_set2.UserUniforms).overrideTimeEnabled==1)
{
l9_138=(*sc_set2.UserUniforms).overrideTimeElapsed;
}
else
{
l9_138=(*sc_set2.UserUniforms).sc_Time.x;
}
ssGlobals Globals;
Globals.gTimeElapsed=l9_138;
float l9_139;
if ((*sc_set2.UserUniforms).overrideTimeEnabled==1)
{
l9_139=(*sc_set2.UserUniforms).overrideTimeDelta;
}
else
{
l9_139=(*sc_set2.UserUniforms).sc_Time.y;
}
Globals.gTimeDelta=l9_139;
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
sc_Vertex_t param_2=v;
float3 param_3=WorldPosition;
float3 param_4=WorldNormal;
float3 param_5=WorldTangent;
float4 param_6=v.position;
out.varPos=param_3;
out.varNormal=normalize(param_4);
float3 l9_140=normalize(param_5);
out.varTangent=float4(l9_140.x,l9_140.y,l9_140.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_141=param_2.position;
float4 l9_142;
if (sc_RenderingSpace_tmp==3)
{
int l9_143;
if (sc_StereoRenderingMode_tmp==0)
{
l9_143=0;
}
else
{
l9_143=gl_InstanceIndex%2;
}
int l9_144=l9_143;
l9_142=(*sc_set2.UserUniforms).sc_ProjectionMatrixInverseArray[l9_144]*l9_141;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_145;
if (sc_StereoRenderingMode_tmp==0)
{
l9_145=0;
}
else
{
l9_145=gl_InstanceIndex%2;
}
int l9_146=l9_145;
l9_142=(*sc_set2.UserUniforms).sc_ViewMatrixArray[l9_146]*l9_141;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_147;
if (sc_StereoRenderingMode_tmp==0)
{
l9_147=0;
}
else
{
l9_147=gl_InstanceIndex%2;
}
int l9_148=l9_147;
l9_142=(*sc_set2.UserUniforms).sc_ModelViewMatrixArray[l9_148]*l9_141;
}
else
{
l9_142=l9_141;
}
}
}
float4 l9_149=l9_142;
out.varViewSpaceDepth=-l9_149.z;
}
float4 l9_150=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_150=param_6;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_151;
if (sc_StereoRenderingMode_tmp==0)
{
l9_151=0;
}
else
{
l9_151=gl_InstanceIndex%2;
}
int l9_152=l9_151;
l9_150=((*sc_set2.UserUniforms).sc_ModelViewMatrixArray[l9_152]*param_2.position)*float4(1.0/(*sc_set2.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_153;
if (sc_StereoRenderingMode_tmp==0)
{
l9_153=0;
}
else
{
l9_153=gl_InstanceIndex%2;
}
int l9_154=l9_153;
l9_150=(*sc_set2.UserUniforms).sc_ViewProjectionMatrixArray[l9_154]*float4(out.varPos,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_155;
if (sc_StereoRenderingMode_tmp==0)
{
l9_155=0;
}
else
{
l9_155=gl_InstanceIndex%2;
}
int l9_156=l9_155;
l9_150=(*sc_set2.UserUniforms).sc_ViewProjectionMatrixArray[l9_156]*float4(out.varPos,1.0);
}
}
}
}
out.varPackedTex=float4(param_2.texture0,param_2.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_157=param_2.position;
float4 l9_158=l9_157;
if (sc_RenderingSpace_tmp==1)
{
l9_158=(*sc_set2.UserUniforms).sc_ModelMatrix*l9_157;
}
float4 l9_159=(*sc_set2.UserUniforms).sc_ProjectorMatrix*l9_158;
float2 l9_160=((l9_159.xy/float2(l9_159.w))*0.5)+float2(0.5);
out.varShadowTex=l9_160;
}
float4 l9_161=l9_150;
if (sc_DepthBufferMode_tmp==1)
{
float l9_162=2.0/log2((*sc_set2.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_161.z=((log2(fast::max((*sc_set2.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_161.w))*l9_162)-1.0)*l9_161.w;
}
float4 l9_163=l9_161;
l9_150=l9_163;
float4 l9_164=l9_150;
float4 l9_165=l9_164;
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_166=l9_165;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_167=dot(l9_166,(*sc_set2.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_168=l9_167;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
float l9_169=l9_168;
}
else
{
out.varClipDistance=l9_168;
}
}
float4 l9_170=float4(l9_165.x,-l9_165.y,(l9_165.z*0.5)+(l9_165.w*0.5),l9_165.w);
out.gl_Position=l9_170;
v=param_2;
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct RayHitPayload
{
float3 viewDirWS;
float3 positionWS;
float3 normalWS;
float4 tangentWS;
float4 color;
float2 uv0;
float2 uv1;
float2 uv2;
float2 uv3;
uint2 id;
};
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
int receivesRayTracedReflections;
int isProxyMode;
int receivesRayTracedShadows;
int receivesRayTracedDiffuseIndirect;
int receivesRayTracedAo;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
float4 sc_RayTracedShadowTextureSize;
float4 sc_RayTracedShadowTextureDims;
float4 sc_RayTracedShadowTextureView;
float4 sc_RayTracedDiffIndTextureSize;
float4 sc_RayTracedDiffIndTextureDims;
float4 sc_RayTracedDiffIndTextureView;
float4 sc_RayTracedAoTextureSize;
float4 sc_RayTracedAoTextureDims;
float4 sc_RayTracedAoTextureView;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int receiverId;
int instance_id;
int lray_triangles_last;
int noEarlyZ;
int has_animated_pn;
int emitter_stride;
int proxy_offset_position;
int proxy_offset_normal;
int proxy_offset_tangent;
int proxy_offset_color;
int proxy_offset_texture0;
int proxy_offset_texture1;
int proxy_offset_texture2;
int proxy_offset_texture3;
int proxy_format_position;
int proxy_format_normal;
int proxy_format_tangent;
int proxy_format_color;
int proxy_format_texture0;
int proxy_format_texture1;
int proxy_format_texture2;
int proxy_format_texture3;
float4 z_rayDirectionsSize;
float4 z_rayDirectionsDims;
float4 z_rayDirectionsView;
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
struct layoutVertices_obj
{
float _Vertices[1];
};
struct layoutVerticesPN_obj
{
float _VerticesPN[1];
};
struct layoutIndices_obj
{
uint _Triangles[1];
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
const device layoutIndices_obj* layoutIndices [[id(0)]];
const device layoutVertices_obj* layoutVertices [[id(1)]];
const device layoutVerticesPN_obj* layoutVerticesPN [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> baseTex [[id(4)]];
texture2d<float> intensityTexture [[id(5)]];
texture2d<float> materialParamsTex [[id(6)]];
texture2d<float> normalTex [[id(7)]];
texture2d<float> sc_EnvmapDiffuse [[id(8)]];
texture2d<float> sc_EnvmapSpecular [[id(9)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(20)]];
texture2d<float> sc_SSAOTexture [[id(22)]];
texture2d<float> sc_ScreenTexture [[id(23)]];
texture2d<float> sc_ShadowTexture [[id(24)]];
texture2d<uint> z_hitIdAndBarycentric [[id(26)]];
texture2d<float> z_rayDirections [[id(27)]];
sampler baseTexSmpSC [[id(28)]];
sampler intensityTextureSmpSC [[id(29)]];
sampler materialParamsTexSmpSC [[id(30)]];
sampler normalTexSmpSC [[id(31)]];
sampler sc_EnvmapDiffuseSmpSC [[id(32)]];
sampler sc_EnvmapSpecularSmpSC [[id(33)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(37)]];
sampler sc_SSAOTextureSmpSC [[id(39)]];
sampler sc_ScreenTextureSmpSC [[id(40)]];
sampler sc_ShadowTextureSmpSC [[id(41)]];
sampler z_hitIdAndBarycentricSmp [[id(43)]];
sampler z_rayDirectionsSmpSC [[id(44)]];
constant userUniformsObj* UserUniforms [[id(45)]];
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
RayHitPayload GetHitData(thread const int2& screenPos,constant userUniformsObj& UserUniforms,thread texture2d<float> z_rayDirections,thread sampler z_rayDirectionsSmpSC,thread texture2d<uint> z_hitIdAndBarycentric,thread sampler z_hitIdAndBarycentricSmp,const device layoutVertices_obj& layoutVertices,const device layoutVerticesPN_obj& layoutVerticesPN,const device layoutIndices_obj& layoutIndices)
{
int2 param=screenPos;
uint4 l9_0=z_hitIdAndBarycentric.read(uint2(param),0);
uint4 id_and_barycentric=l9_0;
RayHitPayload rhp;
rhp.id=id_and_barycentric.xy;
if (rhp.id.x!=uint(UserUniforms.instance_id))
{
return rhp;
}
float2 brc_vw=float2(as_type<half2>(id_and_barycentric.z|(id_and_barycentric.w<<uint(16))));
float3 brc=float3((1.0-brc_vw.x)-brc_vw.y,brc_vw);
float2 param_1=z_rayDirections.read(uint2(screenPos),0).xy;
float3 l9_1=float3(param_1.x,param_1.y,(1.0-abs(param_1.x))-abs(param_1.y));
float l9_2=fast::clamp(-l9_1.z,0.0,1.0);
float l9_3;
if (l9_1.x>=0.0)
{
l9_3=-l9_2;
}
else
{
l9_3=l9_2;
}
float l9_4=l9_3;
float l9_5;
if (l9_1.y>=0.0)
{
l9_5=-l9_2;
}
else
{
l9_5=l9_2;
}
float2 l9_6=l9_1.xy+float2(l9_4,l9_5);
l9_1=float3(l9_6.x,l9_6.y,l9_1.z);
float3 l9_7=normalize(l9_1);
float3 rayDir=l9_7;
rhp.viewDirWS=-rayDir;
uint param_2=rhp.id.y;
uint l9_8=min(param_2,uint(UserUniforms.lray_triangles_last));
uint l9_9=l9_8*6u;
uint l9_10=l9_9&4294967292u;
uint4 l9_11=(uint4(uint2(layoutIndices._Triangles[l9_10/4u]),uint2(layoutIndices._Triangles[(l9_10/4u)+1u]))&uint4(65535u,4294967295u,65535u,4294967295u))>>uint4(0u,16u,0u,16u);
int3 l9_12;
if (l9_9==l9_10)
{
l9_12=int3(l9_11.xyz);
}
else
{
l9_12=int3(l9_11.yzw);
}
int3 l9_13=l9_12;
int3 i=l9_13;
if (UserUniforms.has_animated_pn!=0)
{
float3 param_3=brc;
int3 param_4=i;
int param_5=0;
int3 l9_14=(param_4*int3(6))+int3(param_5);
int l9_15=l9_14.x;
float3 l9_16=float3(layoutVerticesPN._VerticesPN[l9_15],layoutVerticesPN._VerticesPN[l9_15+1],layoutVerticesPN._VerticesPN[l9_15+2]);
int l9_17=l9_14.y;
float3 l9_18=float3(layoutVerticesPN._VerticesPN[l9_17],layoutVerticesPN._VerticesPN[l9_17+1],layoutVerticesPN._VerticesPN[l9_17+2]);
int l9_19=l9_14.z;
float3 l9_20=float3(layoutVerticesPN._VerticesPN[l9_19],layoutVerticesPN._VerticesPN[l9_19+1],layoutVerticesPN._VerticesPN[l9_19+2]);
float3 l9_21=((l9_16*param_3.x)+(l9_18*param_3.y))+(l9_20*param_3.z);
rhp.positionWS=l9_21;
}
else
{
float3 param_6=brc;
int3 param_7=i;
int3 l9_22=int3((param_7.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_position,(param_7.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_position,(param_7.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_position);
float3 l9_23;
if (UserUniforms.proxy_format_position==5)
{
int l9_24=l9_22.x;
float3 l9_25=float3(layoutVertices._Vertices[l9_24],layoutVertices._Vertices[l9_24+1],layoutVertices._Vertices[l9_24+2]);
int l9_26=l9_22.y;
float3 l9_27=float3(layoutVertices._Vertices[l9_26],layoutVertices._Vertices[l9_26+1],layoutVertices._Vertices[l9_26+2]);
int l9_28=l9_22.z;
float3 l9_29=float3(layoutVertices._Vertices[l9_28],layoutVertices._Vertices[l9_28+1],layoutVertices._Vertices[l9_28+2]);
l9_23=((l9_25*param_6.x)+(l9_27*param_6.y))+(l9_29*param_6.z);
}
else
{
if (UserUniforms.proxy_format_position==6)
{
int l9_30=l9_22.x;
float3 l9_31=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_30]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_30+1]))).x);
int l9_32=l9_22.y;
float3 l9_33=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_32]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_32+1]))).x);
int l9_34=l9_22.z;
float3 l9_35=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_34]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_34+1]))).x);
l9_23=((l9_31*param_6.x)+(l9_33*param_6.y))+(l9_35*param_6.z);
}
else
{
l9_23=float3(1.0,0.0,0.0);
}
}
float3 l9_36=l9_23;
float3 positionOS=l9_36;
rhp.positionWS=(UserUniforms.sc_ModelMatrix*float4(positionOS,1.0)).xyz;
}
if (UserUniforms.proxy_offset_normal>0)
{
if (UserUniforms.has_animated_pn!=0)
{
float3 param_8=brc;
int3 param_9=i;
int param_10=3;
int3 l9_37=(param_9*int3(6))+int3(param_10);
int l9_38=l9_37.x;
float3 l9_39=float3(layoutVerticesPN._VerticesPN[l9_38],layoutVerticesPN._VerticesPN[l9_38+1],layoutVerticesPN._VerticesPN[l9_38+2]);
int l9_40=l9_37.y;
float3 l9_41=float3(layoutVerticesPN._VerticesPN[l9_40],layoutVerticesPN._VerticesPN[l9_40+1],layoutVerticesPN._VerticesPN[l9_40+2]);
int l9_42=l9_37.z;
float3 l9_43=float3(layoutVerticesPN._VerticesPN[l9_42],layoutVerticesPN._VerticesPN[l9_42+1],layoutVerticesPN._VerticesPN[l9_42+2]);
float3 l9_44=((l9_39*param_8.x)+(l9_41*param_8.y))+(l9_43*param_8.z);
rhp.normalWS=l9_44;
}
else
{
float3 param_11=brc;
int3 param_12=i;
int3 l9_45=int3((param_12.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_normal,(param_12.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_normal,(param_12.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_normal);
float3 l9_46;
if (UserUniforms.proxy_format_normal==5)
{
int l9_47=l9_45.x;
float3 l9_48=float3(layoutVertices._Vertices[l9_47],layoutVertices._Vertices[l9_47+1],layoutVertices._Vertices[l9_47+2]);
int l9_49=l9_45.y;
float3 l9_50=float3(layoutVertices._Vertices[l9_49],layoutVertices._Vertices[l9_49+1],layoutVertices._Vertices[l9_49+2]);
int l9_51=l9_45.z;
float3 l9_52=float3(layoutVertices._Vertices[l9_51],layoutVertices._Vertices[l9_51+1],layoutVertices._Vertices[l9_51+2]);
l9_46=((l9_48*param_11.x)+(l9_50*param_11.y))+(l9_52*param_11.z);
}
else
{
if (UserUniforms.proxy_format_normal==6)
{
int l9_53=l9_45.x;
float3 l9_54=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_53]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_53+1]))).x);
int l9_55=l9_45.y;
float3 l9_56=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_55]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_55+1]))).x);
int l9_57=l9_45.z;
float3 l9_58=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_57]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_57+1]))).x);
l9_46=((l9_54*param_11.x)+(l9_56*param_11.y))+(l9_58*param_11.z);
}
else
{
l9_46=float3(1.0,0.0,0.0);
}
}
float3 l9_59=l9_46;
float3 normalOS=l9_59;
rhp.normalWS=normalize(UserUniforms.sc_NormalMatrix*normalOS);
}
}
else
{
rhp.normalWS=float3(1.0,0.0,0.0);
}
bool l9_60=!(UserUniforms.has_animated_pn!=0);
bool l9_61;
if (l9_60)
{
l9_61=UserUniforms.proxy_offset_tangent>0;
}
else
{
l9_61=l9_60;
}
if (l9_61)
{
float3 param_13=brc;
int3 param_14=i;
int3 l9_62=int3((param_14.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_tangent,(param_14.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_tangent,(param_14.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_tangent);
float4 l9_63;
if (UserUniforms.proxy_format_tangent==5)
{
int l9_64=l9_62.x;
float4 l9_65=float4(layoutVertices._Vertices[l9_64],layoutVertices._Vertices[l9_64+1],layoutVertices._Vertices[l9_64+2],layoutVertices._Vertices[l9_64+3]);
int l9_66=l9_62.y;
float4 l9_67=float4(layoutVertices._Vertices[l9_66],layoutVertices._Vertices[l9_66+1],layoutVertices._Vertices[l9_66+2],layoutVertices._Vertices[l9_66+3]);
int l9_68=l9_62.z;
float4 l9_69=float4(layoutVertices._Vertices[l9_68],layoutVertices._Vertices[l9_68+1],layoutVertices._Vertices[l9_68+2],layoutVertices._Vertices[l9_68+3]);
l9_63=((l9_65*param_13.x)+(l9_67*param_13.y))+(l9_69*param_13.z);
}
else
{
if (UserUniforms.proxy_format_tangent==6)
{
int l9_70=l9_62.x;
float4 l9_71=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_70]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_70+1]))));
int l9_72=l9_62.y;
float4 l9_73=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_72]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_72+1]))));
int l9_74=l9_62.z;
float4 l9_75=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_74]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_74+1]))));
l9_63=((l9_71*param_13.x)+(l9_73*param_13.y))+(l9_75*param_13.z);
}
else
{
if (UserUniforms.proxy_format_tangent==2)
{
int l9_76=l9_62.x;
uint l9_77=as_type<uint>(layoutVertices._Vertices[l9_76]);
uint l9_78=l9_77&255u;
uint l9_79=(l9_77>>uint(8))&255u;
uint l9_80=(l9_77>>uint(16))&255u;
uint l9_81=(l9_77>>uint(24))&255u;
float4 l9_82=float4(float(l9_78),float(l9_79),float(l9_80),float(l9_81))/float4(255.0);
int l9_83=l9_62.y;
uint l9_84=as_type<uint>(layoutVertices._Vertices[l9_83]);
uint l9_85=l9_84&255u;
uint l9_86=(l9_84>>uint(8))&255u;
uint l9_87=(l9_84>>uint(16))&255u;
uint l9_88=(l9_84>>uint(24))&255u;
float4 l9_89=float4(float(l9_85),float(l9_86),float(l9_87),float(l9_88))/float4(255.0);
int l9_90=l9_62.z;
uint l9_91=as_type<uint>(layoutVertices._Vertices[l9_90]);
uint l9_92=l9_91&255u;
uint l9_93=(l9_91>>uint(8))&255u;
uint l9_94=(l9_91>>uint(16))&255u;
uint l9_95=(l9_91>>uint(24))&255u;
float4 l9_96=float4(float(l9_92),float(l9_93),float(l9_94),float(l9_95))/float4(255.0);
l9_63=((l9_82*param_13.x)+(l9_89*param_13.y))+(l9_96*param_13.z);
}
else
{
l9_63=float4(1.0,0.0,0.0,0.0);
}
}
}
float4 l9_97=l9_63;
float4 tangentOS=l9_97;
float3 tangentWS=normalize(UserUniforms.sc_NormalMatrix*tangentOS.xyz);
rhp.tangentWS=float4(tangentWS,tangentOS.w);
}
else
{
rhp.tangentWS=float4(1.0,0.0,0.0,1.0);
}
if (UserUniforms.proxy_format_color>0)
{
float3 param_15=brc;
int3 param_16=i;
int3 l9_98=int3((param_16.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_color,(param_16.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_color,(param_16.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_color);
float4 l9_99;
if (UserUniforms.proxy_format_color==5)
{
int l9_100=l9_98.x;
float4 l9_101=float4(layoutVertices._Vertices[l9_100],layoutVertices._Vertices[l9_100+1],layoutVertices._Vertices[l9_100+2],layoutVertices._Vertices[l9_100+3]);
int l9_102=l9_98.y;
float4 l9_103=float4(layoutVertices._Vertices[l9_102],layoutVertices._Vertices[l9_102+1],layoutVertices._Vertices[l9_102+2],layoutVertices._Vertices[l9_102+3]);
int l9_104=l9_98.z;
float4 l9_105=float4(layoutVertices._Vertices[l9_104],layoutVertices._Vertices[l9_104+1],layoutVertices._Vertices[l9_104+2],layoutVertices._Vertices[l9_104+3]);
l9_99=((l9_101*param_15.x)+(l9_103*param_15.y))+(l9_105*param_15.z);
}
else
{
if (UserUniforms.proxy_format_color==6)
{
int l9_106=l9_98.x;
float4 l9_107=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_106]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_106+1]))));
int l9_108=l9_98.y;
float4 l9_109=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_108]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_108+1]))));
int l9_110=l9_98.z;
float4 l9_111=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_110]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_110+1]))));
l9_99=((l9_107*param_15.x)+(l9_109*param_15.y))+(l9_111*param_15.z);
}
else
{
if (UserUniforms.proxy_format_color==2)
{
int l9_112=l9_98.x;
uint l9_113=as_type<uint>(layoutVertices._Vertices[l9_112]);
uint l9_114=l9_113&255u;
uint l9_115=(l9_113>>uint(8))&255u;
uint l9_116=(l9_113>>uint(16))&255u;
uint l9_117=(l9_113>>uint(24))&255u;
float4 l9_118=float4(float(l9_114),float(l9_115),float(l9_116),float(l9_117))/float4(255.0);
int l9_119=l9_98.y;
uint l9_120=as_type<uint>(layoutVertices._Vertices[l9_119]);
uint l9_121=l9_120&255u;
uint l9_122=(l9_120>>uint(8))&255u;
uint l9_123=(l9_120>>uint(16))&255u;
uint l9_124=(l9_120>>uint(24))&255u;
float4 l9_125=float4(float(l9_121),float(l9_122),float(l9_123),float(l9_124))/float4(255.0);
int l9_126=l9_98.z;
uint l9_127=as_type<uint>(layoutVertices._Vertices[l9_126]);
uint l9_128=l9_127&255u;
uint l9_129=(l9_127>>uint(8))&255u;
uint l9_130=(l9_127>>uint(16))&255u;
uint l9_131=(l9_127>>uint(24))&255u;
float4 l9_132=float4(float(l9_128),float(l9_129),float(l9_130),float(l9_131))/float4(255.0);
l9_99=((l9_118*param_15.x)+(l9_125*param_15.y))+(l9_132*param_15.z);
}
else
{
l9_99=float4(1.0,0.0,0.0,0.0);
}
}
}
float4 l9_133=l9_99;
rhp.color=l9_133;
}
float2 dummy_red_black=float2(dot(brc,float3(int3(1)-(i%int3(2)))),0.0);
if (UserUniforms.proxy_format_texture0>0)
{
float3 param_17=brc;
int3 param_18=i;
int3 l9_134=int3((param_18.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture0,(param_18.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture0,(param_18.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture0);
float2 l9_135;
if (UserUniforms.proxy_format_texture0==5)
{
int l9_136=l9_134.x;
float2 l9_137=float2(layoutVertices._Vertices[l9_136],layoutVertices._Vertices[l9_136+1]);
int l9_138=l9_134.y;
float2 l9_139=float2(layoutVertices._Vertices[l9_138],layoutVertices._Vertices[l9_138+1]);
int l9_140=l9_134.z;
float2 l9_141=float2(layoutVertices._Vertices[l9_140],layoutVertices._Vertices[l9_140+1]);
l9_135=((l9_137*param_17.x)+(l9_139*param_17.y))+(l9_141*param_17.z);
}
else
{
if (UserUniforms.proxy_format_texture0==6)
{
int l9_142=l9_134.x;
float2 l9_143=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_142])));
int l9_144=l9_134.y;
float2 l9_145=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_144])));
int l9_146=l9_134.z;
float2 l9_147=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_146])));
l9_135=((l9_143*param_17.x)+(l9_145*param_17.y))+(l9_147*param_17.z);
}
else
{
l9_135=float2(1.0,0.0);
}
}
float2 l9_148=l9_135;
rhp.uv0=l9_148;
}
else
{
rhp.uv0=dummy_red_black;
}
if (UserUniforms.proxy_format_texture1>0)
{
float3 param_19=brc;
int3 param_20=i;
int3 l9_149=int3((param_20.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture1,(param_20.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture1,(param_20.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture1);
float2 l9_150;
if (UserUniforms.proxy_format_texture1==5)
{
int l9_151=l9_149.x;
float2 l9_152=float2(layoutVertices._Vertices[l9_151],layoutVertices._Vertices[l9_151+1]);
int l9_153=l9_149.y;
float2 l9_154=float2(layoutVertices._Vertices[l9_153],layoutVertices._Vertices[l9_153+1]);
int l9_155=l9_149.z;
float2 l9_156=float2(layoutVertices._Vertices[l9_155],layoutVertices._Vertices[l9_155+1]);
l9_150=((l9_152*param_19.x)+(l9_154*param_19.y))+(l9_156*param_19.z);
}
else
{
if (UserUniforms.proxy_format_texture1==6)
{
int l9_157=l9_149.x;
float2 l9_158=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_157])));
int l9_159=l9_149.y;
float2 l9_160=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_159])));
int l9_161=l9_149.z;
float2 l9_162=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_161])));
l9_150=((l9_158*param_19.x)+(l9_160*param_19.y))+(l9_162*param_19.z);
}
else
{
l9_150=float2(1.0,0.0);
}
}
float2 l9_163=l9_150;
rhp.uv1=l9_163;
}
else
{
rhp.uv1=dummy_red_black;
}
if (UserUniforms.proxy_format_texture2>0)
{
float3 param_21=brc;
int3 param_22=i;
int3 l9_164=int3((param_22.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture2,(param_22.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture2,(param_22.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture2);
float2 l9_165;
if (UserUniforms.proxy_format_texture2==5)
{
int l9_166=l9_164.x;
float2 l9_167=float2(layoutVertices._Vertices[l9_166],layoutVertices._Vertices[l9_166+1]);
int l9_168=l9_164.y;
float2 l9_169=float2(layoutVertices._Vertices[l9_168],layoutVertices._Vertices[l9_168+1]);
int l9_170=l9_164.z;
float2 l9_171=float2(layoutVertices._Vertices[l9_170],layoutVertices._Vertices[l9_170+1]);
l9_165=((l9_167*param_21.x)+(l9_169*param_21.y))+(l9_171*param_21.z);
}
else
{
if (UserUniforms.proxy_format_texture2==6)
{
int l9_172=l9_164.x;
float2 l9_173=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_172])));
int l9_174=l9_164.y;
float2 l9_175=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_174])));
int l9_176=l9_164.z;
float2 l9_177=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_176])));
l9_165=((l9_173*param_21.x)+(l9_175*param_21.y))+(l9_177*param_21.z);
}
else
{
l9_165=float2(1.0,0.0);
}
}
float2 l9_178=l9_165;
rhp.uv2=l9_178;
}
else
{
rhp.uv2=dummy_red_black;
}
if (UserUniforms.proxy_format_texture3>0)
{
float3 param_23=brc;
int3 param_24=i;
int3 l9_179=int3((param_24.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture3,(param_24.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture3,(param_24.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture3);
float2 l9_180;
if (UserUniforms.proxy_format_texture3==5)
{
int l9_181=l9_179.x;
float2 l9_182=float2(layoutVertices._Vertices[l9_181],layoutVertices._Vertices[l9_181+1]);
int l9_183=l9_179.y;
float2 l9_184=float2(layoutVertices._Vertices[l9_183],layoutVertices._Vertices[l9_183+1]);
int l9_185=l9_179.z;
float2 l9_186=float2(layoutVertices._Vertices[l9_185],layoutVertices._Vertices[l9_185+1]);
l9_180=((l9_182*param_23.x)+(l9_184*param_23.y))+(l9_186*param_23.z);
}
else
{
if (UserUniforms.proxy_format_texture3==6)
{
int l9_187=l9_179.x;
float2 l9_188=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_187])));
int l9_189=l9_179.y;
float2 l9_190=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_189])));
int l9_191=l9_179.z;
float2 l9_192=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_191])));
l9_180=((l9_188*param_23.x)+(l9_190*param_23.y))+(l9_192*param_23.z);
}
else
{
l9_180=float2(1.0,0.0);
}
}
float2 l9_193=l9_180;
rhp.uv3=l9_193;
}
else
{
rhp.uv3=dummy_red_black;
}
return rhp;
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
float r=fast::max(surfaceProperties.roughness,0.029999999);
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
float4 sampleRayTracedReflections(thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_RayTracedReflectionTexture,thread sampler sc_RayTracedReflectionTextureSmpSC,thread float4& gl_FragCoord)
{
bool l9_0=UserUniforms.receivesRayTracedReflections!=0;
if (!l9_0)
{
return float4(0.0);
}
else
{
float4 l9_1=gl_FragCoord;
float2 l9_2=(l9_1.xy*UserUniforms.sc_WindowToViewportTransform.xy)+UserUniforms.sc_WindowToViewportTransform.zw;
float2 p=l9_2;
float2 param=p;
int l9_3;
if ((int(sc_RayTracedReflectionTextureHasSwappedViews_tmp)!=0))
{
int l9_4;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
l9_3=1-l9_5;
}
else
{
int l9_6;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=varStereoViewID;
}
int l9_7=l9_6;
l9_3=l9_7;
}
int l9_8=l9_3;
float2 l9_9=param;
int l9_10=l9_8;
float2 l9_11=l9_9;
int l9_12=l9_10;
float l9_13=0.0;
float2 l9_14=UserUniforms.sc_RayTracedReflectionTextureDims.xy;
float2 l9_15=l9_14;
float2 l9_16=l9_11;
int l9_17=sc_RayTracedReflectionTextureLayout_tmp;
int l9_18=l9_12;
float l9_19=l9_13;
float2 l9_20=l9_16;
int l9_21=l9_17;
int l9_22=l9_18;
float3 l9_23;
if (l9_21==0)
{
l9_23=float3(l9_20,0.0);
}
else
{
if (l9_21==1)
{
l9_23=float3(l9_20.x,(l9_20.y*0.5)+(0.5-(float(l9_22)*0.5)),0.0);
}
else
{
l9_23=float3(l9_20,float(l9_22));
}
}
float3 l9_24=l9_23;
float3 l9_25=l9_24;
float2 l9_26=l9_15;
float2 l9_27=l9_25.xy;
float l9_28=l9_19;
float4 l9_29=sc_RayTracedReflectionTexture.sample(sc_RayTracedReflectionTextureSmpSC,l9_27,bias(l9_28));
float4 l9_30=l9_29;
float4 l9_31=l9_30;
float4 l9_32=l9_31;
float4 l9_33=l9_32;
float4 l9_34=l9_33;
return l9_34;
}
}
float3 envBRDFApprox(thread const SurfaceProperties& surfaceProperties,thread const float& NdotV)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float4 r=(float4(-1.0,-0.0275,-0.57200003,0.022)*surfaceProperties.roughness)+float4(1.0,0.0425,1.04,-0.039999999);
float a004=(fast::min(r.x*r.x,exp2((-9.2799997)*NdotV))*r.x)+r.y;
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
return pow(x,0.45454547);
}
else
{
return sqrt(x);
}
}
float4 ngsCalculateLighting(thread const float3& albedo,thread const float& opacity,thread const float3& normal,thread const float3& position,thread const float3& viewDir,thread const float3& emissive,thread const float& metallic,thread const float& roughness,thread const float3& ao,thread const float3& specularAO,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_EnvmapDiffuse,thread sampler sc_EnvmapDiffuseSmpSC,thread texture2d<float> sc_EnvmapSpecular,thread sampler sc_EnvmapSpecularSmpSC,thread texture2d<float> sc_ScreenTexture,thread sampler sc_ScreenTextureSmpSC,thread texture2d<float> sc_ShadowTexture,thread sampler sc_ShadowTextureSmpSC,thread texture2d<float> sc_SSAOTexture,thread sampler sc_SSAOTextureSmpSC,thread texture2d<float> sc_RayTracedReflectionTexture,thread sampler sc_RayTracedReflectionTextureSmpSC,thread float4& gl_FragCoord,thread float2& varShadowTex,thread float4& FragColor0)
{
SurfaceProperties l9_0;
l9_0.albedo=float3(0.0);
l9_0.opacity=1.0;
l9_0.normal=float3(0.0);
l9_0.positionWS=float3(0.0);
l9_0.viewDirWS=float3(0.0);
l9_0.metallic=0.0;
l9_0.roughness=0.0;
l9_0.emissive=float3(0.0);
l9_0.ao=float3(1.0);
l9_0.specularAo=float3(1.0);
l9_0.bakedShadows=float3(1.0);
SurfaceProperties l9_1=l9_0;
SurfaceProperties surfaceProperties=l9_1;
surfaceProperties.opacity=opacity;
float3 param=albedo;
float3 l9_2;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_2=float3(pow(param.x,2.2),pow(param.y,2.2),pow(param.z,2.2));
}
else
{
l9_2=param*param;
}
float3 l9_3=l9_2;
surfaceProperties.albedo=l9_3;
surfaceProperties.normal=normalize(normal);
surfaceProperties.positionWS=position;
surfaceProperties.viewDirWS=viewDir;
float3 param_1=emissive;
float3 l9_4;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_4=float3(pow(param_1.x,2.2),pow(param_1.y,2.2),pow(param_1.z,2.2));
}
else
{
l9_4=param_1*param_1;
}
float3 l9_5=l9_4;
surfaceProperties.emissive=l9_5;
surfaceProperties.metallic=metallic;
surfaceProperties.roughness=roughness;
surfaceProperties.ao=ao;
surfaceProperties.specularAo=specularAO;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 param_2=surfaceProperties.positionWS;
surfaceProperties.ao=evaluateSSAO(param_2,varStereoViewID,UserUniforms,sc_SSAOTexture,sc_SSAOTextureSmpSC);
}
SurfaceProperties param_3=surfaceProperties;
SurfaceProperties l9_6=param_3;
float3 l9_7=mix(float3(0.039999999),l9_6.albedo*l9_6.metallic,float3(l9_6.metallic));
float3 l9_8=mix(l9_6.albedo*(1.0-l9_6.metallic),float3(0.0),float3(l9_6.metallic));
param_3.albedo=l9_8;
param_3.specColor=l9_7;
SurfaceProperties l9_9=param_3;
surfaceProperties=l9_9;
SurfaceProperties param_4=surfaceProperties;
LightingComponents l9_10;
l9_10.directDiffuse=float3(0.0);
l9_10.directSpecular=float3(0.0);
l9_10.indirectDiffuse=float3(1.0);
l9_10.indirectSpecular=float3(0.0);
l9_10.emitted=float3(0.0);
l9_10.transmitted=float3(0.0);
LightingComponents l9_11=l9_10;
LightingComponents l9_12=l9_11;
float3 l9_13=param_4.viewDirWS;
int l9_14=0;
float4 l9_15=float4(param_4.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_16;
LightProperties l9_17;
int l9_18=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_18<sc_DirectionalLightsCount_tmp)
{
l9_16.direction=UserUniforms.sc_DirectionalLights[l9_18].direction;
l9_16.color=UserUniforms.sc_DirectionalLights[l9_18].color;
l9_17.direction=l9_16.direction;
l9_17.color=l9_16.color.xyz;
l9_17.attenuation=l9_16.color.w;
l9_17.attenuation*=l9_15[(l9_14<3) ? l9_14 : 3];
l9_14++;
LightingComponents l9_19=l9_12;
LightProperties l9_20=l9_17;
SurfaceProperties l9_21=param_4;
float3 l9_22=l9_13;
SurfaceProperties l9_23=l9_21;
float3 l9_24=l9_20.direction;
float l9_25=dot(l9_23.normal,l9_24);
float l9_26=fast::clamp(l9_25,0.0,1.0);
float3 l9_27=float3(l9_26);
l9_19.directDiffuse+=((l9_27*l9_20.color)*l9_20.attenuation);
SurfaceProperties l9_28=l9_21;
float3 l9_29=l9_20.direction;
float3 l9_30=l9_22;
l9_19.directSpecular+=((calculateDirectSpecular(l9_28,l9_29,l9_30)*l9_20.color)*l9_20.attenuation);
LightingComponents l9_31=l9_19;
l9_12=l9_31;
l9_18++;
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
sc_PointLight_t_1 l9_32;
LightProperties l9_33;
int l9_34=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_34<sc_PointLightsCount_tmp)
{
l9_32.falloffEnabled=UserUniforms.sc_PointLights[l9_34].falloffEnabled!=0;
l9_32.falloffEndDistance=UserUniforms.sc_PointLights[l9_34].falloffEndDistance;
l9_32.negRcpFalloffEndDistance4=UserUniforms.sc_PointLights[l9_34].negRcpFalloffEndDistance4;
l9_32.angleScale=UserUniforms.sc_PointLights[l9_34].angleScale;
l9_32.angleOffset=UserUniforms.sc_PointLights[l9_34].angleOffset;
l9_32.direction=UserUniforms.sc_PointLights[l9_34].direction;
l9_32.position=UserUniforms.sc_PointLights[l9_34].position;
l9_32.color=UserUniforms.sc_PointLights[l9_34].color;
float3 l9_35=l9_32.position-param_4.positionWS;
l9_33.direction=normalize(l9_35);
l9_33.color=l9_32.color.xyz;
l9_33.attenuation=l9_32.color.w;
l9_33.attenuation*=l9_15[(l9_14<3) ? l9_14 : 3];
float3 l9_36=l9_33.direction;
float3 l9_37=l9_32.direction;
float l9_38=l9_32.angleScale;
float l9_39=l9_32.angleOffset;
float l9_40=dot(l9_36,l9_37);
float l9_41=fast::clamp((l9_40*l9_38)+l9_39,0.0,1.0);
float l9_42=l9_41*l9_41;
l9_33.attenuation*=l9_42;
if (l9_32.falloffEnabled)
{
float l9_43=length(l9_35);
float l9_44=l9_32.falloffEndDistance;
l9_33.attenuation*=computeDistanceAttenuation(l9_43,l9_44);
}
l9_14++;
LightingComponents l9_45=l9_12;
LightProperties l9_46=l9_33;
SurfaceProperties l9_47=param_4;
float3 l9_48=l9_13;
SurfaceProperties l9_49=l9_47;
float3 l9_50=l9_46.direction;
float l9_51=dot(l9_49.normal,l9_50);
float l9_52=fast::clamp(l9_51,0.0,1.0);
float3 l9_53=float3(l9_52);
l9_45.directDiffuse+=((l9_53*l9_46.color)*l9_46.attenuation);
SurfaceProperties l9_54=l9_47;
float3 l9_55=l9_46.direction;
float3 l9_56=l9_48;
l9_45.directSpecular+=((calculateDirectSpecular(l9_54,l9_55,l9_56)*l9_46.color)*l9_46.attenuation);
LightingComponents l9_57=l9_45;
l9_12=l9_57;
l9_34++;
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
float3 l9_58;
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float2 l9_59=abs(varShadowTex-float2(0.5));
float l9_60=fast::max(l9_59.x,l9_59.y);
float l9_61=step(l9_60,0.5);
float4 l9_62=sc_ShadowTexture.sample(sc_ShadowTextureSmpSC,varShadowTex)*l9_61;
float3 l9_63=mix(UserUniforms.sc_ShadowColor.xyz,UserUniforms.sc_ShadowColor.xyz*l9_62.xyz,float3(UserUniforms.sc_ShadowColor.w));
float l9_64=l9_62.w*UserUniforms.sc_ShadowDensity;
l9_58=mix(float3(1.0),l9_63,float3(l9_64));
}
else
{
l9_58=float3(1.0);
}
float3 l9_65=l9_58;
float3 l9_66=l9_65;
l9_12.directDiffuse*=l9_66;
l9_12.directSpecular*=l9_66;
}
SurfaceProperties l9_67=param_4;
float3 l9_68=l9_67.normal;
float3 l9_69=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_70=l9_68;
float3 l9_71=l9_70;
float l9_72=UserUniforms.sc_EnvmapRotation.y;
float l9_73=l9_71.x;
float l9_74=-l9_71.z;
float l9_75=(l9_73<0.0) ? (-1.0) : 1.0;
float l9_76=l9_75*acos(fast::clamp(l9_74/length(float2(l9_73,l9_74)),-1.0,1.0));
float2 l9_77;
l9_77.x=l9_76-1.5707964;
l9_77.y=acos(l9_71.y);
l9_77/=float2(6.2831855,3.1415927);
l9_77.y=1.0-l9_77.y;
l9_77.x+=(l9_72/360.0);
l9_77.x=fract((l9_77.x+floor(l9_77.x))+1.0);
float2 l9_78=l9_77;
float2 l9_79=l9_78;
float4 l9_80;
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_81=l9_79;
float2 l9_82=UserUniforms.sc_EnvmapSpecularSize.xy;
float l9_83=5.0;
l9_79=calcSeamlessPanoramicUvsForSampling(l9_81,l9_82,l9_83);
}
float2 l9_84=l9_79;
float l9_85=13.0;
int l9_86;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_87;
if (sc_StereoRenderingMode_tmp==0)
{
l9_87=0;
}
else
{
l9_87=varStereoViewID;
}
int l9_88=l9_87;
l9_86=1-l9_88;
}
else
{
int l9_89;
if (sc_StereoRenderingMode_tmp==0)
{
l9_89=0;
}
else
{
l9_89=varStereoViewID;
}
int l9_90=l9_89;
l9_86=l9_90;
}
int l9_91=l9_86;
float2 l9_92=l9_84;
int l9_93=l9_91;
float l9_94=l9_85;
float2 l9_95=UserUniforms.sc_EnvmapSpecularDims.xy;
float2 l9_96=l9_95;
float2 l9_97=l9_92;
int l9_98=sc_EnvmapSpecularLayout_tmp;
int l9_99=l9_93;
float l9_100=l9_94;
float2 l9_101=l9_97;
int l9_102=l9_98;
int l9_103=l9_99;
float3 l9_104;
if (l9_102==0)
{
l9_104=float3(l9_101,0.0);
}
else
{
if (l9_102==1)
{
l9_104=float3(l9_101.x,(l9_101.y*0.5)+(0.5-(float(l9_103)*0.5)),0.0);
}
else
{
l9_104=float3(l9_101,float(l9_103));
}
}
float3 l9_105=l9_104;
float3 l9_106=l9_105;
float2 l9_107=l9_96;
float2 l9_108=l9_106.xy;
float l9_109=l9_100;
float4 l9_110=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_108,bias(l9_109));
float4 l9_111=l9_110;
float4 l9_112=l9_111;
float4 l9_113=l9_112;
float4 l9_114=l9_113;
l9_80=l9_114;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_115=l9_79;
float2 l9_116=UserUniforms.sc_EnvmapDiffuseSize.xy;
float l9_117=0.0;
l9_79=calcSeamlessPanoramicUvsForSampling(l9_115,l9_116,l9_117);
float2 l9_118=l9_79;
float l9_119=-13.0;
int l9_120;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_121;
if (sc_StereoRenderingMode_tmp==0)
{
l9_121=0;
}
else
{
l9_121=varStereoViewID;
}
int l9_122=l9_121;
l9_120=1-l9_122;
}
else
{
int l9_123;
if (sc_StereoRenderingMode_tmp==0)
{
l9_123=0;
}
else
{
l9_123=varStereoViewID;
}
int l9_124=l9_123;
l9_120=l9_124;
}
int l9_125=l9_120;
float2 l9_126=l9_118;
int l9_127=l9_125;
float l9_128=l9_119;
float2 l9_129=UserUniforms.sc_EnvmapDiffuseDims.xy;
float2 l9_130=l9_129;
float2 l9_131=l9_126;
int l9_132=sc_EnvmapDiffuseLayout_tmp;
int l9_133=l9_127;
float l9_134=l9_128;
float2 l9_135=l9_131;
int l9_136=l9_132;
int l9_137=l9_133;
float3 l9_138;
if (l9_136==0)
{
l9_138=float3(l9_135,0.0);
}
else
{
if (l9_136==1)
{
l9_138=float3(l9_135.x,(l9_135.y*0.5)+(0.5-(float(l9_137)*0.5)),0.0);
}
else
{
l9_138=float3(l9_135,float(l9_137));
}
}
float3 l9_139=l9_138;
float3 l9_140=l9_139;
float2 l9_141=l9_130;
float2 l9_142=l9_140.xy;
float l9_143=l9_134;
float4 l9_144=sc_EnvmapDiffuse.sample(sc_EnvmapDiffuseSmpSC,l9_142,bias(l9_143));
float4 l9_145=l9_144;
float4 l9_146=l9_145;
float4 l9_147=l9_146;
float4 l9_148=l9_147;
l9_80=l9_148;
}
else
{
float2 l9_149=l9_79;
float l9_150=13.0;
int l9_151;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_152;
if (sc_StereoRenderingMode_tmp==0)
{
l9_152=0;
}
else
{
l9_152=varStereoViewID;
}
int l9_153=l9_152;
l9_151=1-l9_153;
}
else
{
int l9_154;
if (sc_StereoRenderingMode_tmp==0)
{
l9_154=0;
}
else
{
l9_154=varStereoViewID;
}
int l9_155=l9_154;
l9_151=l9_155;
}
int l9_156=l9_151;
float2 l9_157=l9_149;
int l9_158=l9_156;
float l9_159=l9_150;
float2 l9_160=UserUniforms.sc_EnvmapSpecularDims.xy;
float2 l9_161=l9_160;
float2 l9_162=l9_157;
int l9_163=sc_EnvmapSpecularLayout_tmp;
int l9_164=l9_158;
float l9_165=l9_159;
float2 l9_166=l9_162;
int l9_167=l9_163;
int l9_168=l9_164;
float3 l9_169;
if (l9_167==0)
{
l9_169=float3(l9_166,0.0);
}
else
{
if (l9_167==1)
{
l9_169=float3(l9_166.x,(l9_166.y*0.5)+(0.5-(float(l9_168)*0.5)),0.0);
}
else
{
l9_169=float3(l9_166,float(l9_168));
}
}
float3 l9_170=l9_169;
float3 l9_171=l9_170;
float2 l9_172=l9_161;
float2 l9_173=l9_171.xy;
float l9_174=l9_165;
float4 l9_175=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_173,bias(l9_174));
float4 l9_176=l9_175;
float4 l9_177=l9_176;
float4 l9_178=l9_177;
float4 l9_179=l9_178;
l9_80=l9_179;
}
}
float4 l9_180=l9_80;
float3 l9_181=l9_180.xyz*(1.0/l9_180.w);
float3 l9_182=l9_181*UserUniforms.sc_EnvmapExposure;
l9_69=l9_182;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_183=UserUniforms.sc_Sh[0];
float3 l9_184=UserUniforms.sc_Sh[1];
float3 l9_185=UserUniforms.sc_Sh[2];
float3 l9_186=UserUniforms.sc_Sh[3];
float3 l9_187=UserUniforms.sc_Sh[4];
float3 l9_188=UserUniforms.sc_Sh[5];
float3 l9_189=UserUniforms.sc_Sh[6];
float3 l9_190=UserUniforms.sc_Sh[7];
float3 l9_191=UserUniforms.sc_Sh[8];
float3 l9_192=-l9_68;
float l9_193=l9_192.x;
float l9_194=l9_192.y;
float l9_195=l9_192.z;
float l9_196=l9_193*l9_193;
float l9_197=l9_194*l9_194;
float l9_198=l9_195*l9_195;
float l9_199=l9_193*l9_194;
float l9_200=l9_194*l9_195;
float l9_201=l9_193*l9_195;
float3 l9_202=((((((l9_191*0.42904299)*(l9_196-l9_197))+((l9_189*0.74312502)*l9_198))+(l9_183*0.88622701))-(l9_189*0.24770799))+((((l9_187*l9_199)+(l9_190*l9_201))+(l9_188*l9_200))*0.85808599))+((((l9_186*l9_193)+(l9_184*l9_194))+(l9_185*l9_195))*1.0233279);
l9_69=l9_202*UserUniforms.sc_ShIntensity;
}
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_69+=(UserUniforms.sc_AmbientLights[0].color*UserUniforms.sc_AmbientLights[0].intensity);
}
else
{
l9_69.x+=(1e-06*UserUniforms.sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_69+=(UserUniforms.sc_AmbientLights[1].color*UserUniforms.sc_AmbientLights[1].intensity);
}
else
{
l9_69.x+=(1e-06*UserUniforms.sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_69+=(UserUniforms.sc_AmbientLights[2].color*UserUniforms.sc_AmbientLights[2].intensity);
}
else
{
l9_69.x+=(1e-06*UserUniforms.sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_203=l9_68;
float3 l9_204=UserUniforms.sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_205;
float l9_206;
int l9_207=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_207<sc_LightEstimationSGCount_tmp)
{
l9_205.color=UserUniforms.sc_LightEstimationData.sg[l9_207].color;
l9_205.sharpness=UserUniforms.sc_LightEstimationData.sg[l9_207].sharpness;
l9_205.axis=UserUniforms.sc_LightEstimationData.sg[l9_207].axis;
float3 l9_208=l9_203;
float l9_209=dot(l9_205.axis,l9_208);
float l9_210=l9_205.sharpness;
float l9_211=0.36000001;
float l9_212=1.0/(4.0*l9_211);
float l9_213=exp(-l9_210);
float l9_214=l9_213*l9_213;
float l9_215=1.0/l9_210;
float l9_216=(1.0+(2.0*l9_214))-l9_215;
float l9_217=((l9_213-l9_214)*l9_215)-l9_214;
float l9_218=sqrt(1.0-l9_216);
float l9_219=l9_211*l9_209;
float l9_220=l9_212*l9_218;
float l9_221=l9_219+l9_220;
float l9_222=l9_209;
float l9_223=fast::clamp(l9_222,0.0,1.0);
float l9_224=l9_223;
if (step(abs(l9_219),l9_220)>0.5)
{
l9_206=(l9_221*l9_221)/l9_218;
}
else
{
l9_206=l9_224;
}
l9_224=l9_206;
float l9_225=(l9_216*l9_224)+l9_217;
sc_SphericalGaussianLight_t l9_226=l9_205;
float3 l9_227=(l9_226.color/float3(l9_226.sharpness))*6.2831855;
float3 l9_228=(l9_227*l9_225)/float3(3.1415927);
l9_204+=l9_228;
l9_207++;
continue;
}
else
{
break;
}
}
float3 l9_229=l9_204;
l9_69+=l9_229;
}
float3 l9_230=l9_69;
float3 l9_231=l9_230;
l9_12.indirectDiffuse=l9_231;
SurfaceProperties l9_232=param_4;
float3 l9_233=l9_13;
float3 l9_234=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_235=l9_232;
float3 l9_236=l9_233;
float3 l9_237=l9_235.normal;
float3 l9_238=reflect(-l9_236,l9_237);
float3 l9_239=l9_237;
float3 l9_240=l9_238;
float l9_241=l9_235.roughness;
l9_238=getSpecularDominantDir(l9_239,l9_240,l9_241);
float l9_242=l9_235.roughness;
float l9_243=pow(l9_242,0.66666669);
float l9_244=fast::clamp(l9_243,0.0,1.0);
float l9_245=l9_244*5.0;
float l9_246=l9_245;
float l9_247=l9_246;
float3 l9_248=l9_238;
float l9_249=l9_247;
float3 l9_250=l9_248;
float l9_251=l9_249;
float3 l9_252=l9_250;
float l9_253=UserUniforms.sc_EnvmapRotation.y;
float l9_254=l9_252.x;
float l9_255=-l9_252.z;
float l9_256=(l9_254<0.0) ? (-1.0) : 1.0;
float l9_257=l9_256*acos(fast::clamp(l9_255/length(float2(l9_254,l9_255)),-1.0,1.0));
float2 l9_258;
l9_258.x=l9_257-1.5707964;
l9_258.y=acos(l9_252.y);
l9_258/=float2(6.2831855,3.1415927);
l9_258.y=1.0-l9_258.y;
l9_258.x+=(l9_253/360.0);
l9_258.x=fract((l9_258.x+floor(l9_258.x))+1.0);
float2 l9_259=l9_258;
float2 l9_260=l9_259;
float4 l9_261;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_262=floor(l9_251);
float l9_263=ceil(l9_251);
float l9_264=l9_251-l9_262;
float2 l9_265=l9_260;
float2 l9_266=UserUniforms.sc_EnvmapSpecularSize.xy;
float l9_267=l9_262;
float2 l9_268=calcSeamlessPanoramicUvsForSampling(l9_265,l9_266,l9_267);
float2 l9_269=l9_268;
float l9_270=l9_262;
float2 l9_271=l9_269;
float l9_272=l9_270;
int l9_273;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_274;
if (sc_StereoRenderingMode_tmp==0)
{
l9_274=0;
}
else
{
l9_274=varStereoViewID;
}
int l9_275=l9_274;
l9_273=1-l9_275;
}
else
{
int l9_276;
if (sc_StereoRenderingMode_tmp==0)
{
l9_276=0;
}
else
{
l9_276=varStereoViewID;
}
int l9_277=l9_276;
l9_273=l9_277;
}
int l9_278=l9_273;
float2 l9_279=l9_271;
int l9_280=l9_278;
float l9_281=l9_272;
float2 l9_282=UserUniforms.sc_EnvmapSpecularDims.xy;
float2 l9_283=l9_282;
float2 l9_284=l9_279;
int l9_285=sc_EnvmapSpecularLayout_tmp;
int l9_286=l9_280;
float l9_287=l9_281;
float2 l9_288=l9_284;
int l9_289=l9_285;
int l9_290=l9_286;
float3 l9_291;
if (l9_289==0)
{
l9_291=float3(l9_288,0.0);
}
else
{
if (l9_289==1)
{
l9_291=float3(l9_288.x,(l9_288.y*0.5)+(0.5-(float(l9_290)*0.5)),0.0);
}
else
{
l9_291=float3(l9_288,float(l9_290));
}
}
float3 l9_292=l9_291;
float3 l9_293=l9_292;
float2 l9_294=l9_283;
float2 l9_295=l9_293.xy;
float l9_296=l9_287;
float4 l9_297=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_295,level(l9_296));
float4 l9_298=l9_297;
float4 l9_299=l9_298;
float4 l9_300=l9_299;
float4 l9_301=l9_300;
float4 l9_302=l9_301;
float4 l9_303=l9_302;
float2 l9_304=l9_260;
float2 l9_305=UserUniforms.sc_EnvmapSpecularSize.xy;
float l9_306=l9_263;
float2 l9_307=calcSeamlessPanoramicUvsForSampling(l9_304,l9_305,l9_306);
float2 l9_308=l9_307;
float l9_309=l9_263;
float2 l9_310=l9_308;
float l9_311=l9_309;
int l9_312;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_313;
if (sc_StereoRenderingMode_tmp==0)
{
l9_313=0;
}
else
{
l9_313=varStereoViewID;
}
int l9_314=l9_313;
l9_312=1-l9_314;
}
else
{
int l9_315;
if (sc_StereoRenderingMode_tmp==0)
{
l9_315=0;
}
else
{
l9_315=varStereoViewID;
}
int l9_316=l9_315;
l9_312=l9_316;
}
int l9_317=l9_312;
float2 l9_318=l9_310;
int l9_319=l9_317;
float l9_320=l9_311;
float2 l9_321=UserUniforms.sc_EnvmapSpecularDims.xy;
float2 l9_322=l9_321;
float2 l9_323=l9_318;
int l9_324=sc_EnvmapSpecularLayout_tmp;
int l9_325=l9_319;
float l9_326=l9_320;
float2 l9_327=l9_323;
int l9_328=l9_324;
int l9_329=l9_325;
float3 l9_330;
if (l9_328==0)
{
l9_330=float3(l9_327,0.0);
}
else
{
if (l9_328==1)
{
l9_330=float3(l9_327.x,(l9_327.y*0.5)+(0.5-(float(l9_329)*0.5)),0.0);
}
else
{
l9_330=float3(l9_327,float(l9_329));
}
}
float3 l9_331=l9_330;
float3 l9_332=l9_331;
float2 l9_333=l9_322;
float2 l9_334=l9_332.xy;
float l9_335=l9_326;
float4 l9_336=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_334,level(l9_335));
float4 l9_337=l9_336;
float4 l9_338=l9_337;
float4 l9_339=l9_338;
float4 l9_340=l9_339;
float4 l9_341=l9_340;
float4 l9_342=l9_341;
l9_261=mix(l9_303,l9_342,float4(l9_264));
}
else
{
float2 l9_343=l9_260;
float l9_344=l9_251;
float2 l9_345=l9_343;
float l9_346=l9_344;
int l9_347;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_348;
if (sc_StereoRenderingMode_tmp==0)
{
l9_348=0;
}
else
{
l9_348=varStereoViewID;
}
int l9_349=l9_348;
l9_347=1-l9_349;
}
else
{
int l9_350;
if (sc_StereoRenderingMode_tmp==0)
{
l9_350=0;
}
else
{
l9_350=varStereoViewID;
}
int l9_351=l9_350;
l9_347=l9_351;
}
int l9_352=l9_347;
float2 l9_353=l9_345;
int l9_354=l9_352;
float l9_355=l9_346;
float2 l9_356=UserUniforms.sc_EnvmapSpecularDims.xy;
float2 l9_357=l9_356;
float2 l9_358=l9_353;
int l9_359=sc_EnvmapSpecularLayout_tmp;
int l9_360=l9_354;
float l9_361=l9_355;
float2 l9_362=l9_358;
int l9_363=l9_359;
int l9_364=l9_360;
float3 l9_365;
if (l9_363==0)
{
l9_365=float3(l9_362,0.0);
}
else
{
if (l9_363==1)
{
l9_365=float3(l9_362.x,(l9_362.y*0.5)+(0.5-(float(l9_364)*0.5)),0.0);
}
else
{
l9_365=float3(l9_362,float(l9_364));
}
}
float3 l9_366=l9_365;
float3 l9_367=l9_366;
float2 l9_368=l9_357;
float2 l9_369=l9_367.xy;
float l9_370=l9_361;
float4 l9_371=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_369,level(l9_370));
float4 l9_372=l9_371;
float4 l9_373=l9_372;
float4 l9_374=l9_373;
float4 l9_375=l9_374;
float4 l9_376=l9_375;
l9_261=l9_376;
}
float4 l9_377=l9_261;
float3 l9_378=l9_377.xyz*(1.0/l9_377.w);
float3 l9_379=l9_378;
float3 l9_380=l9_379*UserUniforms.sc_EnvmapExposure;
l9_380+=float3(1e-06);
float3 l9_381=l9_380;
float3 l9_382=l9_381;
bool l9_383=UserUniforms.receivesRayTracedReflections!=0;
if (l9_383)
{
float4 l9_384=sampleRayTracedReflections(varStereoViewID,UserUniforms,sc_RayTracedReflectionTexture,sc_RayTracedReflectionTextureSmpSC,gl_FragCoord);
l9_382=mix(l9_382,l9_384.xyz,float3(l9_384.w));
}
SurfaceProperties l9_385=l9_235;
float l9_386=abs(dot(l9_237,l9_236));
float3 l9_387=l9_382*envBRDFApprox(l9_385,l9_386);
l9_234+=l9_387;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_388=l9_232;
float3 l9_389=l9_233;
float l9_390=fast::clamp(l9_388.roughness*l9_388.roughness,0.0099999998,1.0);
float3 l9_391=UserUniforms.sc_LightEstimationData.ambientLight*l9_388.specColor;
sc_SphericalGaussianLight_t l9_392;
sc_SphericalGaussianLight_t l9_393;
sc_SphericalGaussianLight_t l9_394;
int l9_395=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_395<sc_LightEstimationSGCount_tmp)
{
l9_392.color=UserUniforms.sc_LightEstimationData.sg[l9_395].color;
l9_392.sharpness=UserUniforms.sc_LightEstimationData.sg[l9_395].sharpness;
l9_392.axis=UserUniforms.sc_LightEstimationData.sg[l9_395].axis;
float3 l9_396=l9_388.normal;
float l9_397=l9_390;
float3 l9_398=l9_389;
float3 l9_399=l9_388.specColor;
float3 l9_400=l9_396;
float l9_401=l9_397;
l9_393.axis=l9_400;
float l9_402=l9_401*l9_401;
l9_393.sharpness=2.0/l9_402;
l9_393.color=float3(1.0/(3.1415927*l9_402));
sc_SphericalGaussianLight_t l9_403=l9_393;
sc_SphericalGaussianLight_t l9_404=l9_403;
sc_SphericalGaussianLight_t l9_405=l9_404;
float3 l9_406=l9_398;
l9_394.axis=reflect(-l9_406,l9_405.axis);
l9_394.color=l9_405.color;
l9_394.sharpness=l9_405.sharpness;
l9_394.sharpness/=(4.0*fast::max(dot(l9_405.axis,l9_406),9.9999997e-05));
sc_SphericalGaussianLight_t l9_407=l9_394;
sc_SphericalGaussianLight_t l9_408=l9_407;
sc_SphericalGaussianLight_t l9_409=l9_408;
sc_SphericalGaussianLight_t l9_410=l9_392;
float l9_411=length((l9_409.axis*l9_409.sharpness)+(l9_410.axis*l9_410.sharpness));
float3 l9_412=(l9_409.color*exp((l9_411-l9_409.sharpness)-l9_410.sharpness))*l9_410.color;
float l9_413=1.0-exp((-2.0)*l9_411);
float3 l9_414=((l9_412*6.2831855)*l9_413)/float3(l9_411);
float3 l9_415=l9_414;
float3 l9_416=l9_408.axis;
float l9_417=l9_397*l9_397;
float l9_418=dot(l9_396,l9_416);
float l9_419=fast::clamp(l9_418,0.0,1.0);
float l9_420=l9_419;
float l9_421=dot(l9_396,l9_398);
float l9_422=fast::clamp(l9_421,0.0,1.0);
float l9_423=l9_422;
float3 l9_424=normalize(l9_408.axis+l9_398);
float l9_425=l9_417;
float l9_426=l9_420;
float l9_427=1.0/(l9_426+sqrt(l9_425+(((1.0-l9_425)*l9_426)*l9_426)));
float l9_428=l9_417;
float l9_429=l9_423;
float l9_430=1.0/(l9_429+sqrt(l9_428+(((1.0-l9_428)*l9_429)*l9_429)));
l9_415*=(l9_427*l9_430);
float l9_431=dot(l9_416,l9_424);
float l9_432=fast::clamp(l9_431,0.0,1.0);
float l9_433=pow(1.0-l9_432,5.0);
l9_415*=(l9_399+((float3(1.0)-l9_399)*l9_433));
l9_415*=l9_420;
float3 l9_434=l9_415;
l9_391+=l9_434;
l9_395++;
continue;
}
else
{
break;
}
}
float3 l9_435=l9_391;
l9_234+=l9_435;
}
float3 l9_436=l9_234;
l9_12.indirectSpecular=l9_436;
LightingComponents l9_437=l9_12;
LightingComponents lighting=l9_437;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
lighting.directDiffuse=float3(0.0);
lighting.indirectDiffuse=float3(0.0);
float4 l9_438;
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_439=FragColor0;
float4 l9_440=l9_439;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_440.x+=UserUniforms._sc_framebufferFetchMarker;
}
float4 l9_441=l9_440;
l9_438=l9_441;
}
else
{
float4 l9_442=gl_FragCoord;
float2 l9_443=(l9_442.xy*UserUniforms.sc_WindowToViewportTransform.xy)+UserUniforms.sc_WindowToViewportTransform.zw;
float2 l9_444=l9_443;
float2 l9_445;
if (sc_StereoRenderingMode_tmp==1)
{
float3 l9_446=float3(l9_444,0.0);
int l9_447=1;
int l9_448;
if (sc_StereoRenderingMode_tmp==0)
{
l9_448=0;
}
else
{
l9_448=varStereoViewID;
}
int l9_449=l9_448;
int l9_450=l9_449;
float3 l9_451=float3(l9_444,0.0);
int l9_452=l9_447;
int l9_453=l9_450;
if (l9_452==1)
{
l9_451.y=((2.0*l9_451.y)+float(l9_453))-1.0;
}
float2 l9_454=l9_451.xy;
l9_445=l9_454;
}
else
{
l9_445=l9_444;
}
float2 l9_455=l9_445;
float2 l9_456=l9_455;
float2 l9_457=l9_456;
int l9_458;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_459;
if (sc_StereoRenderingMode_tmp==0)
{
l9_459=0;
}
else
{
l9_459=varStereoViewID;
}
int l9_460=l9_459;
l9_458=1-l9_460;
}
else
{
int l9_461;
if (sc_StereoRenderingMode_tmp==0)
{
l9_461=0;
}
else
{
l9_461=varStereoViewID;
}
int l9_462=l9_461;
l9_458=l9_462;
}
int l9_463=l9_458;
float2 l9_464=l9_457;
int l9_465=l9_463;
float2 l9_466=l9_464;
int l9_467=l9_465;
float l9_468=0.0;
float2 l9_469=UserUniforms.sc_ScreenTextureDims.xy;
float2 l9_470=l9_469;
float2 l9_471=l9_466;
int l9_472=sc_ScreenTextureLayout_tmp;
int l9_473=l9_467;
float l9_474=l9_468;
float2 l9_475=l9_471;
int l9_476=l9_472;
int l9_477=l9_473;
float3 l9_478;
if (l9_476==0)
{
l9_478=float3(l9_475,0.0);
}
else
{
if (l9_476==1)
{
l9_478=float3(l9_475.x,(l9_475.y*0.5)+(0.5-(float(l9_477)*0.5)),0.0);
}
else
{
l9_478=float3(l9_475,float(l9_477));
}
}
float3 l9_479=l9_478;
float3 l9_480=l9_479;
float2 l9_481=l9_470;
float2 l9_482=l9_480.xy;
float l9_483=l9_474;
float4 l9_484=sc_ScreenTexture.sample(sc_ScreenTextureSmpSC,l9_482,bias(l9_483));
float4 l9_485=l9_484;
float4 l9_486=l9_485;
float4 l9_487=l9_486;
float4 l9_488=l9_487;
float4 l9_489=l9_488;
l9_438=l9_489;
}
float4 l9_490=l9_438;
float4 l9_491=l9_490;
float3 param_5=l9_491.xyz;
float3 l9_492;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_492=float3(pow(param_5.x,2.2),pow(param_5.y,2.2),pow(param_5.z,2.2));
}
else
{
l9_492=param_5*param_5;
}
float3 l9_493=l9_492;
float3 framebuffer=l9_493;
lighting.transmitted=framebuffer*mix(float3(1.0),surfaceProperties.albedo,float3(surfaceProperties.opacity));
surfaceProperties.opacity=1.0;
}
bool enablePremultipliedAlpha=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
enablePremultipliedAlpha=true;
}
SurfaceProperties param_6=surfaceProperties;
LightingComponents param_7=lighting;
bool param_8=enablePremultipliedAlpha;
float3 l9_494=param_6.albedo*(param_7.directDiffuse+(param_7.indirectDiffuse*param_6.ao));
float3 l9_495=param_7.directSpecular+(param_7.indirectSpecular*param_6.specularAo);
float3 l9_496=param_6.emissive;
float3 l9_497=param_7.transmitted;
if (param_8)
{
float l9_498=param_6.opacity;
l9_494*=srgbToLinear(l9_498);
}
float3 l9_499=((l9_494+l9_495)+l9_496)+l9_497;
float3 l9_500=l9_499;
float4 Output=float4(l9_500,surfaceProperties.opacity);
bool l9_501=UserUniforms.isProxyMode!=0;
if (l9_501)
{
return Output;
}
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 param_9=Output.xyz;
float3 l9_502=linearToneMapping(param_9);
Output=float4(l9_502.x,l9_502.y,l9_502.z,Output.w);
}
float3 param_10=Output.xyz;
float l9_503=param_10.x;
float l9_504=param_10.y;
float l9_505=param_10.z;
float3 l9_506=float3(linearToSrgb(l9_503),linearToSrgb(l9_504),linearToSrgb(l9_505));
Output=float4(l9_506.x,l9_506.y,l9_506.z,Output.w);
return Output;
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
l9_1=float4(l9_0.zy,-1.0,0.66666669);
}
else
{
l9_1=float4(l9_0.yz,0.0,-0.33333334);
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
l9_64=float4(l9_63.zy,-1.0,0.66666669);
}
else
{
l9_64=float4(l9_63.yz,0.0,-0.33333334);
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
l9_79=float4(l9_78.zy,-1.0,0.66666669);
}
else
{
l9_79=float4(l9_78.yz,0.0,-0.33333334);
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
l9_103=float4(l9_102.zy,-1.0,0.66666669);
}
else
{
l9_103=float4(l9_102.yz,0.0,-0.33333334);
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
l9_119=float4(l9_118.zy,-1.0,0.66666669);
}
else
{
l9_119=float4(l9_118.yz,0.0,-0.33333334);
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
l9_143=float4(l9_142.zy,-1.0,0.66666669);
}
else
{
l9_143=float4(l9_142.yz,0.0,-0.33333334);
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
l9_160=float4(l9_159.zy,-1.0,0.66666669);
}
else
{
l9_160=float4(l9_159.yz,0.0,-0.33333334);
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
l9_184=float4(l9_183.zy,-1.0,0.66666669);
}
else
{
l9_184=float4(l9_183.yz,0.0,-0.33333334);
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
l9_201=float4(l9_200.zy,-1.0,0.66666669);
}
else
{
l9_201=float4(l9_200.yz,0.0,-0.33333334);
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
float l9_224=((0.29899999*l9_223.x)+(0.58700001*l9_223.y))+(0.114*l9_223.z);
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
float l9_268=step(abs(l9_262-l9_267),9.9999997e-06);
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
float l9_277=step(abs(l9_271-l9_276),9.9999997e-06);
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
float l9_294=step(abs(l9_288-l9_293),9.9999997e-06);
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
float l9_305=step(abs(l9_299-l9_304),9.9999997e-06);
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
float l9_328=((((l9_326.x*256.0)+l9_326.y)+(l9_326.z/256.0))/257.00391)*l9_327;
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
bool l9_2=(*sc_set2.UserUniforms).isProxyMode!=0;
if (l9_2)
{
float4 l9_3=gl_FragCoord;
int2 l9_4=int2(l9_3.xy);
RayHitPayload l9_5=GetHitData(l9_4,(*sc_set2.UserUniforms),sc_set2.z_rayDirections,sc_set2.z_rayDirectionsSmpSC,sc_set2.z_hitIdAndBarycentric,sc_set2.z_hitIdAndBarycentricSmp,(*sc_set2.layoutVertices),(*sc_set2.layoutVerticesPN),(*sc_set2.layoutIndices));
RayHitPayload rhp=l9_5;
bool l9_6=(*sc_set2.UserUniforms).noEarlyZ!=0;
if (l9_6)
{
if (rhp.id.x!=uint((*sc_set2.UserUniforms).instance_id))
{
return out;
}
}
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=rhp.viewDirWS;
Globals.PositionWS=rhp.positionWS;
Globals.VertexTangent_WorldSpace=rhp.tangentWS.xyz;
Globals.VertexNormal_WorldSpace=rhp.normalWS;
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*rhp.tangentWS.w;
Globals.Surface_UVCoord0=rhp.uv0;
}
else
{
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set2.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
}
float2 UVCoord_N11=float2(0.0);
UVCoord_N11=Globals.Surface_UVCoord0;
float Output_N0=0.0;
ssGlobals param_1=Globals;
float param=(*sc_set2.UserUniforms).uvScale;
Output_N0=param;
float2 CoordsOut_N16=float2(0.0);
CoordsOut_N16=((UVCoord_N11-(*sc_set2.UserUniforms).Port_Center_N016)*float2(Output_N0))+(*sc_set2.UserUniforms).Port_Center_N016;
float4 Output_N1=float4(0.0);
float2 l9_7=(*sc_set2.UserUniforms).baseTexDims.xy;
float2 l9_8=l9_7;
int l9_9;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_10;
if (sc_StereoRenderingMode_tmp==0)
{
l9_10=0;
}
else
{
l9_10=in.varStereoViewID;
}
int l9_11=l9_10;
l9_9=1-l9_11;
}
else
{
int l9_12;
if (sc_StereoRenderingMode_tmp==0)
{
l9_12=0;
}
else
{
l9_12=in.varStereoViewID;
}
int l9_13=l9_12;
l9_9=l9_13;
}
int l9_14=l9_9;
float2 param_2=l9_8;
int param_3=baseTexLayout_tmp;
int param_4=l9_14;
float2 param_5=CoordsOut_N16;
bool param_6=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 param_7=(*sc_set2.UserUniforms).baseTexTransform;
int2 param_8=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool param_9=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 param_10=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool param_11=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 param_12=(*sc_set2.UserUniforms).baseTexBorderColor;
float param_13=0.0;
bool l9_15=param_11&&(!param_9);
float l9_16=1.0;
float l9_17=param_5.x;
int l9_18=param_8.x;
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
param_5.x=l9_17;
float l9_22=param_5.y;
int l9_23=param_8.y;
if (l9_23==1)
{
l9_22=fract(l9_22);
}
else
{
if (l9_23==2)
{
float l9_24=fract(l9_22);
float l9_25=l9_22-l9_24;
float l9_26=step(0.25,fract(l9_25*0.5));
l9_22=mix(l9_24,1.0-l9_24,fast::clamp(l9_26,0.0,1.0));
}
}
param_5.y=l9_22;
if (param_9)
{
bool l9_27=param_11;
bool l9_28;
if (l9_27)
{
l9_28=param_8.x==3;
}
else
{
l9_28=l9_27;
}
float l9_29=param_5.x;
float l9_30=param_10.x;
float l9_31=param_10.z;
bool l9_32=l9_28;
float l9_33=l9_16;
float l9_34=fast::clamp(l9_29,l9_30,l9_31);
float l9_35=step(abs(l9_29-l9_34),9.9999997e-06);
l9_33*=(l9_35+((1.0-float(l9_32))*(1.0-l9_35)));
l9_29=l9_34;
param_5.x=l9_29;
l9_16=l9_33;
bool l9_36=param_11;
bool l9_37;
if (l9_36)
{
l9_37=param_8.y==3;
}
else
{
l9_37=l9_36;
}
float l9_38=param_5.y;
float l9_39=param_10.y;
float l9_40=param_10.w;
bool l9_41=l9_37;
float l9_42=l9_16;
float l9_43=fast::clamp(l9_38,l9_39,l9_40);
float l9_44=step(abs(l9_38-l9_43),9.9999997e-06);
l9_42*=(l9_44+((1.0-float(l9_41))*(1.0-l9_44)));
l9_38=l9_43;
param_5.y=l9_38;
l9_16=l9_42;
}
float2 l9_45=param_5;
bool l9_46=param_6;
float3x3 l9_47=param_7;
if (l9_46)
{
l9_45=float2((l9_47*float3(l9_45,1.0)).xy);
}
float2 l9_48=l9_45;
float2 l9_49=l9_48;
float2 l9_50=l9_49;
param_5=l9_50;
float l9_51=param_5.x;
int l9_52=param_8.x;
bool l9_53=l9_15;
float l9_54=l9_16;
if ((l9_52==0)||(l9_52==3))
{
float l9_55=l9_51;
float l9_56=0.0;
float l9_57=1.0;
bool l9_58=l9_53;
float l9_59=l9_54;
float l9_60=fast::clamp(l9_55,l9_56,l9_57);
float l9_61=step(abs(l9_55-l9_60),9.9999997e-06);
l9_59*=(l9_61+((1.0-float(l9_58))*(1.0-l9_61)));
l9_55=l9_60;
l9_51=l9_55;
l9_54=l9_59;
}
param_5.x=l9_51;
l9_16=l9_54;
float l9_62=param_5.y;
int l9_63=param_8.y;
bool l9_64=l9_15;
float l9_65=l9_16;
if ((l9_63==0)||(l9_63==3))
{
float l9_66=l9_62;
float l9_67=0.0;
float l9_68=1.0;
bool l9_69=l9_64;
float l9_70=l9_65;
float l9_71=fast::clamp(l9_66,l9_67,l9_68);
float l9_72=step(abs(l9_66-l9_71),9.9999997e-06);
l9_70*=(l9_72+((1.0-float(l9_69))*(1.0-l9_72)));
l9_66=l9_71;
l9_62=l9_66;
l9_65=l9_70;
}
param_5.y=l9_62;
l9_16=l9_65;
float2 l9_73=param_2;
float2 l9_74=param_5;
int l9_75=param_3;
int l9_76=param_4;
float l9_77=param_13;
float2 l9_78=l9_74;
int l9_79=l9_75;
int l9_80=l9_76;
float3 l9_81;
if (l9_79==0)
{
l9_81=float3(l9_78,0.0);
}
else
{
if (l9_79==1)
{
l9_81=float3(l9_78.x,(l9_78.y*0.5)+(0.5-(float(l9_80)*0.5)),0.0);
}
else
{
l9_81=float3(l9_78,float(l9_80));
}
}
float3 l9_82=l9_81;
float3 l9_83=l9_82;
float2 l9_84=l9_73;
float2 l9_85=l9_83.xy;
float l9_86=l9_77;
float4 l9_87=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_85,bias(l9_86));
float4 l9_88=l9_87;
float4 l9_89=l9_88;
if (param_11)
{
l9_89=mix(param_12,l9_89,float4(l9_16));
}
float4 l9_90=l9_89;
float4 l9_91=l9_90;
Output_N1=l9_90;
float Output_N5=0.0;
Output_N5=Output_N1.w;
float4 Output_N9=float4(0.0);
float2 param_14=CoordsOut_N16;
ssGlobals param_16=Globals;
float2 l9_92=(*sc_set2.UserUniforms).normalTexDims.xy;
float2 l9_93=l9_92;
int l9_94;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_95;
if (sc_StereoRenderingMode_tmp==0)
{
l9_95=0;
}
else
{
l9_95=in.varStereoViewID;
}
int l9_96=l9_95;
l9_94=1-l9_96;
}
else
{
int l9_97;
if (sc_StereoRenderingMode_tmp==0)
{
l9_97=0;
}
else
{
l9_97=in.varStereoViewID;
}
int l9_98=l9_97;
l9_94=l9_98;
}
int l9_99=l9_94;
float2 l9_100=l9_93;
int l9_101=normalTexLayout_tmp;
int l9_102=l9_99;
float2 l9_103=param_14;
bool l9_104=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_105=(*sc_set2.UserUniforms).normalTexTransform;
int2 l9_106=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_107=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_108=(*sc_set2.UserUniforms).normalTexUvMinMax;
bool l9_109=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_110=(*sc_set2.UserUniforms).normalTexBorderColor;
float l9_111=0.0;
bool l9_112=l9_109&&(!l9_107);
float l9_113=1.0;
float l9_114=l9_103.x;
int l9_115=l9_106.x;
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
l9_103.x=l9_114;
float l9_119=l9_103.y;
int l9_120=l9_106.y;
if (l9_120==1)
{
l9_119=fract(l9_119);
}
else
{
if (l9_120==2)
{
float l9_121=fract(l9_119);
float l9_122=l9_119-l9_121;
float l9_123=step(0.25,fract(l9_122*0.5));
l9_119=mix(l9_121,1.0-l9_121,fast::clamp(l9_123,0.0,1.0));
}
}
l9_103.y=l9_119;
if (l9_107)
{
bool l9_124=l9_109;
bool l9_125;
if (l9_124)
{
l9_125=l9_106.x==3;
}
else
{
l9_125=l9_124;
}
float l9_126=l9_103.x;
float l9_127=l9_108.x;
float l9_128=l9_108.z;
bool l9_129=l9_125;
float l9_130=l9_113;
float l9_131=fast::clamp(l9_126,l9_127,l9_128);
float l9_132=step(abs(l9_126-l9_131),9.9999997e-06);
l9_130*=(l9_132+((1.0-float(l9_129))*(1.0-l9_132)));
l9_126=l9_131;
l9_103.x=l9_126;
l9_113=l9_130;
bool l9_133=l9_109;
bool l9_134;
if (l9_133)
{
l9_134=l9_106.y==3;
}
else
{
l9_134=l9_133;
}
float l9_135=l9_103.y;
float l9_136=l9_108.y;
float l9_137=l9_108.w;
bool l9_138=l9_134;
float l9_139=l9_113;
float l9_140=fast::clamp(l9_135,l9_136,l9_137);
float l9_141=step(abs(l9_135-l9_140),9.9999997e-06);
l9_139*=(l9_141+((1.0-float(l9_138))*(1.0-l9_141)));
l9_135=l9_140;
l9_103.y=l9_135;
l9_113=l9_139;
}
float2 l9_142=l9_103;
bool l9_143=l9_104;
float3x3 l9_144=l9_105;
if (l9_143)
{
l9_142=float2((l9_144*float3(l9_142,1.0)).xy);
}
float2 l9_145=l9_142;
float2 l9_146=l9_145;
float2 l9_147=l9_146;
l9_103=l9_147;
float l9_148=l9_103.x;
int l9_149=l9_106.x;
bool l9_150=l9_112;
float l9_151=l9_113;
if ((l9_149==0)||(l9_149==3))
{
float l9_152=l9_148;
float l9_153=0.0;
float l9_154=1.0;
bool l9_155=l9_150;
float l9_156=l9_151;
float l9_157=fast::clamp(l9_152,l9_153,l9_154);
float l9_158=step(abs(l9_152-l9_157),9.9999997e-06);
l9_156*=(l9_158+((1.0-float(l9_155))*(1.0-l9_158)));
l9_152=l9_157;
l9_148=l9_152;
l9_151=l9_156;
}
l9_103.x=l9_148;
l9_113=l9_151;
float l9_159=l9_103.y;
int l9_160=l9_106.y;
bool l9_161=l9_112;
float l9_162=l9_113;
if ((l9_160==0)||(l9_160==3))
{
float l9_163=l9_159;
float l9_164=0.0;
float l9_165=1.0;
bool l9_166=l9_161;
float l9_167=l9_162;
float l9_168=fast::clamp(l9_163,l9_164,l9_165);
float l9_169=step(abs(l9_163-l9_168),9.9999997e-06);
l9_167*=(l9_169+((1.0-float(l9_166))*(1.0-l9_169)));
l9_163=l9_168;
l9_159=l9_163;
l9_162=l9_167;
}
l9_103.y=l9_159;
l9_113=l9_162;
float2 l9_170=l9_100;
float2 l9_171=l9_103;
int l9_172=l9_101;
int l9_173=l9_102;
float l9_174=l9_111;
float2 l9_175=l9_171;
int l9_176=l9_172;
int l9_177=l9_173;
float3 l9_178;
if (l9_176==0)
{
l9_178=float3(l9_175,0.0);
}
else
{
if (l9_176==1)
{
l9_178=float3(l9_175.x,(l9_175.y*0.5)+(0.5-(float(l9_177)*0.5)),0.0);
}
else
{
l9_178=float3(l9_175,float(l9_177));
}
}
float3 l9_179=l9_178;
float3 l9_180=l9_179;
float2 l9_181=l9_170;
float2 l9_182=l9_180.xy;
float l9_183=l9_174;
float4 l9_184=sc_set2.normalTex.sample(sc_set2.normalTexSmpSC,l9_182,bias(l9_183));
float4 l9_185=l9_184;
float4 l9_186=l9_185;
if (l9_109)
{
l9_186=mix(l9_110,l9_186,float4(l9_113));
}
float4 l9_187=l9_186;
float4 l9_188=l9_187;
float4 param_15=l9_187;
float3 l9_189=(param_15.xyz*1.9921875)-float3(1.0);
param_15=float4(l9_189.x,l9_189.y,l9_189.z,param_15.w);
Output_N9=param_15;
float4 Output_N2=float4(0.0);
float2 l9_190=(*sc_set2.UserUniforms).materialParamsTexDims.xy;
float2 l9_191=l9_190;
int l9_192;
if ((int(materialParamsTexHasSwappedViews_tmp)!=0))
{
int l9_193;
if (sc_StereoRenderingMode_tmp==0)
{
l9_193=0;
}
else
{
l9_193=in.varStereoViewID;
}
int l9_194=l9_193;
l9_192=1-l9_194;
}
else
{
int l9_195;
if (sc_StereoRenderingMode_tmp==0)
{
l9_195=0;
}
else
{
l9_195=in.varStereoViewID;
}
int l9_196=l9_195;
l9_192=l9_196;
}
int l9_197=l9_192;
float2 param_17=l9_191;
int param_18=materialParamsTexLayout_tmp;
int param_19=l9_197;
float2 param_20=CoordsOut_N16;
bool param_21=(int(SC_USE_UV_TRANSFORM_materialParamsTex_tmp)!=0);
float3x3 param_22=(*sc_set2.UserUniforms).materialParamsTexTransform;
int2 param_23=int2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp);
bool param_24=(int(SC_USE_UV_MIN_MAX_materialParamsTex_tmp)!=0);
float4 param_25=(*sc_set2.UserUniforms).materialParamsTexUvMinMax;
bool param_26=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp)!=0);
float4 param_27=(*sc_set2.UserUniforms).materialParamsTexBorderColor;
float param_28=0.0;
bool l9_198=param_26&&(!param_24);
float l9_199=1.0;
float l9_200=param_20.x;
int l9_201=param_23.x;
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
param_20.x=l9_200;
float l9_205=param_20.y;
int l9_206=param_23.y;
if (l9_206==1)
{
l9_205=fract(l9_205);
}
else
{
if (l9_206==2)
{
float l9_207=fract(l9_205);
float l9_208=l9_205-l9_207;
float l9_209=step(0.25,fract(l9_208*0.5));
l9_205=mix(l9_207,1.0-l9_207,fast::clamp(l9_209,0.0,1.0));
}
}
param_20.y=l9_205;
if (param_24)
{
bool l9_210=param_26;
bool l9_211;
if (l9_210)
{
l9_211=param_23.x==3;
}
else
{
l9_211=l9_210;
}
float l9_212=param_20.x;
float l9_213=param_25.x;
float l9_214=param_25.z;
bool l9_215=l9_211;
float l9_216=l9_199;
float l9_217=fast::clamp(l9_212,l9_213,l9_214);
float l9_218=step(abs(l9_212-l9_217),9.9999997e-06);
l9_216*=(l9_218+((1.0-float(l9_215))*(1.0-l9_218)));
l9_212=l9_217;
param_20.x=l9_212;
l9_199=l9_216;
bool l9_219=param_26;
bool l9_220;
if (l9_219)
{
l9_220=param_23.y==3;
}
else
{
l9_220=l9_219;
}
float l9_221=param_20.y;
float l9_222=param_25.y;
float l9_223=param_25.w;
bool l9_224=l9_220;
float l9_225=l9_199;
float l9_226=fast::clamp(l9_221,l9_222,l9_223);
float l9_227=step(abs(l9_221-l9_226),9.9999997e-06);
l9_225*=(l9_227+((1.0-float(l9_224))*(1.0-l9_227)));
l9_221=l9_226;
param_20.y=l9_221;
l9_199=l9_225;
}
float2 l9_228=param_20;
bool l9_229=param_21;
float3x3 l9_230=param_22;
if (l9_229)
{
l9_228=float2((l9_230*float3(l9_228,1.0)).xy);
}
float2 l9_231=l9_228;
float2 l9_232=l9_231;
float2 l9_233=l9_232;
param_20=l9_233;
float l9_234=param_20.x;
int l9_235=param_23.x;
bool l9_236=l9_198;
float l9_237=l9_199;
if ((l9_235==0)||(l9_235==3))
{
float l9_238=l9_234;
float l9_239=0.0;
float l9_240=1.0;
bool l9_241=l9_236;
float l9_242=l9_237;
float l9_243=fast::clamp(l9_238,l9_239,l9_240);
float l9_244=step(abs(l9_238-l9_243),9.9999997e-06);
l9_242*=(l9_244+((1.0-float(l9_241))*(1.0-l9_244)));
l9_238=l9_243;
l9_234=l9_238;
l9_237=l9_242;
}
param_20.x=l9_234;
l9_199=l9_237;
float l9_245=param_20.y;
int l9_246=param_23.y;
bool l9_247=l9_198;
float l9_248=l9_199;
if ((l9_246==0)||(l9_246==3))
{
float l9_249=l9_245;
float l9_250=0.0;
float l9_251=1.0;
bool l9_252=l9_247;
float l9_253=l9_248;
float l9_254=fast::clamp(l9_249,l9_250,l9_251);
float l9_255=step(abs(l9_249-l9_254),9.9999997e-06);
l9_253*=(l9_255+((1.0-float(l9_252))*(1.0-l9_255)));
l9_249=l9_254;
l9_245=l9_249;
l9_248=l9_253;
}
param_20.y=l9_245;
l9_199=l9_248;
float2 l9_256=param_17;
float2 l9_257=param_20;
int l9_258=param_18;
int l9_259=param_19;
float l9_260=param_28;
float2 l9_261=l9_257;
int l9_262=l9_258;
int l9_263=l9_259;
float3 l9_264;
if (l9_262==0)
{
l9_264=float3(l9_261,0.0);
}
else
{
if (l9_262==1)
{
l9_264=float3(l9_261.x,(l9_261.y*0.5)+(0.5-(float(l9_263)*0.5)),0.0);
}
else
{
l9_264=float3(l9_261,float(l9_263));
}
}
float3 l9_265=l9_264;
float3 l9_266=l9_265;
float2 l9_267=l9_256;
float2 l9_268=l9_266.xy;
float l9_269=l9_260;
float4 l9_270=sc_set2.materialParamsTex.sample(sc_set2.materialParamsTexSmpSC,l9_268,bias(l9_269));
float4 l9_271=l9_270;
float4 l9_272=l9_271;
if (param_26)
{
l9_272=mix(param_27,l9_272,float4(l9_199));
}
float4 l9_273=l9_272;
float4 l9_274=l9_273;
Output_N2=l9_273;
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
float l9_275=param_36;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_275<(*sc_set2.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_276=gl_FragCoord;
float2 l9_277=floor(mod(l9_276.xy,float2(4.0)));
float l9_278=(mod(dot(l9_277,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_275<l9_278)
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
float3 l9_279=param_35;
float l9_280=param_36;
float3 l9_281=param_44.BumpedNormal;
float3 l9_282=param_44.PositionWS;
float3 l9_283=param_44.ViewDirWS;
float3 l9_284=param_38;
float l9_285=param_39;
float l9_286=param_40;
float3 l9_287=param_41;
float3 l9_288=param_42;
param_43=ngsCalculateLighting(l9_279,l9_280,l9_281,l9_282,l9_283,l9_284,l9_285,l9_286,l9_287,l9_288,in.varStereoViewID,(*sc_set2.UserUniforms),sc_set2.sc_EnvmapDiffuse,sc_set2.sc_EnvmapDiffuseSmpSC,sc_set2.sc_EnvmapSpecular,sc_set2.sc_EnvmapSpecularSmpSC,sc_set2.sc_ScreenTexture,sc_set2.sc_ScreenTextureSmpSC,sc_set2.sc_ShadowTexture,sc_set2.sc_ShadowTextureSmpSC,sc_set2.sc_SSAOTexture,sc_set2.sc_SSAOTextureSmpSC,sc_set2.sc_RayTracedReflectionTexture,sc_set2.sc_RayTracedReflectionTextureSmpSC,gl_FragCoord,in.varShadowTex,out.FragColor0);
}
else
{
param_43=float4(param_35,param_36);
}
param_43=fast::max(param_43,float4(0.0));
Output_N6=param_43;
FinalColor=Output_N6;
bool l9_289=(*sc_set2.UserUniforms).isProxyMode!=0;
if (l9_289)
{
float4 param_45=FinalColor;
if ((int(sc_ProxyAlphaOne_tmp)!=0))
{
param_45.w=1.0;
}
float4 l9_290=fast::max(param_45,float4(0.0));
float4 param_46=l9_290;
out.FragColor0=param_46;
return out;
}
float4 param_47=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_291=param_47;
float4 l9_292=l9_291;
float l9_293=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_293=l9_292.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_293=fast::clamp(l9_292.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_293=fast::clamp(dot(l9_292.xyz,float3(l9_292.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_293=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_293=(1.0-dot(l9_292.xyz,float3(0.33333001)))*l9_292.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_293=(1.0-fast::clamp(dot(l9_292.xyz,float3(1.0)),0.0,1.0))*l9_292.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_293=fast::clamp(dot(l9_292.xyz,float3(1.0)),0.0,1.0)*l9_292.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_293=fast::clamp(dot(l9_292.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_293=fast::clamp(dot(l9_292.xyz,float3(1.0)),0.0,1.0)*l9_292.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_293=dot(l9_292.xyz,float3(0.33333001))*l9_292.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_293=1.0-fast::clamp(dot(l9_292.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_293=fast::clamp(dot(l9_292.xyz,float3(1.0)),0.0,1.0);
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
float l9_294=l9_293;
float l9_295=l9_294;
float l9_296=(*sc_set2.UserUniforms).sc_ShadowDensity*l9_295;
float3 l9_297=mix((*sc_set2.UserUniforms).sc_ShadowColor.xyz,(*sc_set2.UserUniforms).sc_ShadowColor.xyz*l9_291.xyz,float3((*sc_set2.UserUniforms).sc_ShadowColor.w));
float4 l9_298=float4(l9_297.x,l9_297.y,l9_297.z,l9_296);
param_47=l9_298;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_47=float4(param_47.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_299=param_47;
float4 l9_300;
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_301=out.FragColor0;
float4 l9_302=l9_301;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_302.x+=(*sc_set2.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_303=l9_302;
l9_300=l9_303;
}
else
{
float4 l9_304=gl_FragCoord;
float2 l9_305=(l9_304.xy*(*sc_set2.UserUniforms).sc_WindowToViewportTransform.xy)+(*sc_set2.UserUniforms).sc_WindowToViewportTransform.zw;
float2 l9_306=l9_305;
float2 l9_307;
if (sc_StereoRenderingMode_tmp==1)
{
float3 l9_308=float3(l9_306,0.0);
int l9_309=1;
int l9_310;
if (sc_StereoRenderingMode_tmp==0)
{
l9_310=0;
}
else
{
l9_310=in.varStereoViewID;
}
int l9_311=l9_310;
int l9_312=l9_311;
float3 l9_313=float3(l9_306,0.0);
int l9_314=l9_309;
int l9_315=l9_312;
if (l9_314==1)
{
l9_313.y=((2.0*l9_313.y)+float(l9_315))-1.0;
}
float2 l9_316=l9_313.xy;
l9_307=l9_316;
}
else
{
l9_307=l9_306;
}
float2 l9_317=l9_307;
float2 l9_318=l9_317;
float2 l9_319=l9_318;
int l9_320;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_321;
if (sc_StereoRenderingMode_tmp==0)
{
l9_321=0;
}
else
{
l9_321=in.varStereoViewID;
}
int l9_322=l9_321;
l9_320=1-l9_322;
}
else
{
int l9_323;
if (sc_StereoRenderingMode_tmp==0)
{
l9_323=0;
}
else
{
l9_323=in.varStereoViewID;
}
int l9_324=l9_323;
l9_320=l9_324;
}
int l9_325=l9_320;
float2 l9_326=l9_319;
int l9_327=l9_325;
float2 l9_328=l9_326;
int l9_329=l9_327;
float l9_330=0.0;
float2 l9_331=(*sc_set2.UserUniforms).sc_ScreenTextureDims.xy;
float2 l9_332=l9_331;
float2 l9_333=l9_328;
int l9_334=sc_ScreenTextureLayout_tmp;
int l9_335=l9_329;
float l9_336=l9_330;
float2 l9_337=l9_333;
int l9_338=l9_334;
int l9_339=l9_335;
float3 l9_340;
if (l9_338==0)
{
l9_340=float3(l9_337,0.0);
}
else
{
if (l9_338==1)
{
l9_340=float3(l9_337.x,(l9_337.y*0.5)+(0.5-(float(l9_339)*0.5)),0.0);
}
else
{
l9_340=float3(l9_337,float(l9_339));
}
}
float3 l9_341=l9_340;
float3 l9_342=l9_341;
float2 l9_343=l9_332;
float2 l9_344=l9_342.xy;
float l9_345=l9_336;
float4 l9_346=sc_set2.sc_ScreenTexture.sample(sc_set2.sc_ScreenTextureSmpSC,l9_344,bias(l9_345));
float4 l9_347=l9_346;
float4 l9_348=l9_347;
float4 l9_349=l9_348;
float4 l9_350=l9_349;
float4 l9_351=l9_350;
l9_300=l9_351;
}
float4 l9_352=l9_300;
float4 l9_353=l9_352;
float3 l9_354=l9_353.xyz;
float3 l9_355=l9_354;
float3 l9_356=l9_299.xyz;
float3 l9_357=definedBlend(l9_355,l9_356,in.varStereoViewID,(*sc_set2.UserUniforms),sc_set2.intensityTexture,sc_set2.intensityTextureSmpSC);
float4 l9_358;
l9_358=float4(l9_357.x,l9_357.y,l9_357.z,l9_358.w);
float3 l9_359=mix(l9_354,l9_358.xyz,float3(l9_299.w));
l9_358=float4(l9_359.x,l9_359.y,l9_359.z,l9_358.w);
l9_358.w=1.0;
float4 l9_360=l9_358;
param_47=l9_360;
}
else
{
float4 l9_361=param_47;
float4 l9_362;
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_362=float4(mix(float3(1.0),l9_361.xyz,float3(l9_361.w)),l9_361.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_363=l9_361.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_363=fast::clamp(l9_363,0.0,1.0);
}
l9_362=float4(l9_361.xyz*l9_363,l9_363);
}
else
{
l9_362=l9_361;
}
}
float4 l9_364=l9_362;
param_47=l9_364;
}
}
}
float4 l9_365=param_47;
FinalColor=l9_365;
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
float4 l9_366;
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_366=float4((*sc_set2.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_366=float4(0.0);
}
float4 l9_367=l9_366;
float4 Cost=l9_367;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float4 param_48=FinalColor;
out.FragColor0=param_48;
float4 param_49=FinalColor;
return out;
}
} // FRAGMENT SHADER

namespace SNAP_RECV {
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
int receivesRayTracedReflections;
int isProxyMode;
int receivesRayTracedShadows;
int receivesRayTracedDiffuseIndirect;
int receivesRayTracedAo;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
float4 sc_RayTracedShadowTextureSize;
float4 sc_RayTracedShadowTextureDims;
float4 sc_RayTracedShadowTextureView;
float4 sc_RayTracedDiffIndTextureSize;
float4 sc_RayTracedDiffIndTextureDims;
float4 sc_RayTracedDiffIndTextureView;
float4 sc_RayTracedAoTextureSize;
float4 sc_RayTracedAoTextureDims;
float4 sc_RayTracedAoTextureView;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int receiverId;
int instance_id;
int lray_triangles_last;
int noEarlyZ;
int has_animated_pn;
int emitter_stride;
int proxy_offset_position;
int proxy_offset_normal;
int proxy_offset_tangent;
int proxy_offset_color;
int proxy_offset_texture0;
int proxy_offset_texture1;
int proxy_offset_texture2;
int proxy_offset_texture3;
int proxy_format_position;
int proxy_format_normal;
int proxy_format_tangent;
int proxy_format_color;
int proxy_format_texture0;
int proxy_format_texture1;
int proxy_format_texture2;
int proxy_format_texture3;
float4 z_rayDirectionsSize;
float4 z_rayDirectionsDims;
float4 z_rayDirectionsView;
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
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct layoutIndices_obj
{
uint _Triangles[1];
};
struct layoutVertices_obj
{
float _Vertices[1];
};
struct layoutVerticesPN_obj
{
float _VerticesPN[1];
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_AmbientLightCompatibility_t
{
float3 color;
};
struct sc_Set2
{
const device layoutIndices_obj* layoutIndices [[id(0)]];
const device layoutVertices_obj* layoutVertices [[id(1)]];
const device layoutVerticesPN_obj* layoutVerticesPN [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> baseTex [[id(4)]];
texture2d<float> intensityTexture [[id(5)]];
texture2d<float> materialParamsTex [[id(6)]];
texture2d<float> normalTex [[id(7)]];
texture2d<float> sc_EnvmapDiffuse [[id(8)]];
texture2d<float> sc_EnvmapSpecular [[id(9)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(20)]];
texture2d<float> sc_SSAOTexture [[id(22)]];
texture2d<float> sc_ScreenTexture [[id(23)]];
texture2d<float> sc_ShadowTexture [[id(24)]];
texture2d<uint> z_hitIdAndBarycentric [[id(26)]];
texture2d<float> z_rayDirections [[id(27)]];
sampler baseTexSmpSC [[id(28)]];
sampler intensityTextureSmpSC [[id(29)]];
sampler materialParamsTexSmpSC [[id(30)]];
sampler normalTexSmpSC [[id(31)]];
sampler sc_EnvmapDiffuseSmpSC [[id(32)]];
sampler sc_EnvmapSpecularSmpSC [[id(33)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(37)]];
sampler sc_SSAOTextureSmpSC [[id(39)]];
sampler sc_ScreenTextureSmpSC [[id(40)]];
sampler sc_ShadowTextureSmpSC [[id(41)]];
sampler z_hitIdAndBarycentricSmp [[id(43)]];
sampler z_rayDirectionsSmpSC [[id(44)]];
constant userUniformsObj* UserUniforms [[id(45)]];
};
struct main_recv_out
{
uint4 position_and_mask [[color(0)]];
uint4 normal_and_more [[color(1)]];
};
struct main_recv_in
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
fragment main_recv_out main_recv(main_recv_in in [[stage_in]],constant sc_Set2& sc_set2 [[buffer(2)]],float4 gl_FragCoord [[position]])
{
main_recv_out out={};
float Dummy1;
float2 Dummy2;
float3 Dummy3;
float4 Dummy4;
ssPreviewInfo PreviewInfo;
ssGlobals tempGlobals;
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
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
float l9_30=step(abs(l9_24-l9_29),9.9999997e-06);
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
float l9_39=step(abs(l9_33-l9_38),9.9999997e-06);
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
float l9_56=step(abs(l9_50-l9_55),9.9999997e-06);
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
float l9_67=step(abs(l9_61-l9_66),9.9999997e-06);
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
float l9_127=step(abs(l9_121-l9_126),9.9999997e-06);
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
float l9_136=step(abs(l9_130-l9_135),9.9999997e-06);
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
float l9_153=step(abs(l9_147-l9_152),9.9999997e-06);
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
float l9_164=step(abs(l9_158-l9_163),9.9999997e-06);
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
float3 l9_184=(param_15.xyz*1.9921875)-float3(1.0);
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
float l9_213=step(abs(l9_207-l9_212),9.9999997e-06);
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
float l9_222=step(abs(l9_216-l9_221),9.9999997e-06);
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
float l9_239=step(abs(l9_233-l9_238),9.9999997e-06);
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
float l9_250=step(abs(l9_244-l9_249),9.9999997e-06);
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
float3 l9_274=param_44.PositionWS;
float3 l9_275=param_44.BumpedNormal;
float l9_276=param_40;
float3 l9_277=normalize((*sc_set2.UserUniforms).sc_Camera.position-l9_274);
if (dot(l9_277,l9_275)>=(-0.050000001))
{
uint3 l9_278=uint3(round((l9_274-(*sc_set2.UserUniforms).OriginNormalizationOffset)*(*sc_set2.UserUniforms).OriginNormalizationScale));
out.position_and_mask=uint4(l9_278.x,l9_278.y,l9_278.z,out.position_and_mask.w);
out.position_and_mask.w=uint((*sc_set2.UserUniforms).receiver_mask);
float3 l9_279=l9_275;
float l9_280=dot(abs(l9_279),float3(1.0));
l9_279/=float3(l9_280);
float l9_281=fast::clamp(-l9_279.z,0.0,1.0);
float2 l9_282=l9_279.xy;
float l9_283;
if (l9_279.x>=0.0)
{
l9_283=l9_281;
}
else
{
l9_283=-l9_281;
}
l9_282.x+=l9_283;
float l9_284;
if (l9_279.y>=0.0)
{
l9_284=l9_281;
}
else
{
l9_284=-l9_281;
}
l9_282.y+=l9_284;
float2 l9_285=l9_282;
float2 l9_286=l9_285;
uint2 l9_287=uint2(as_type<uint>(half2(float2(l9_286.x,0.0))),as_type<uint>(half2(float2(l9_286.y,0.0))));
out.normal_and_more=uint4(l9_287.x,l9_287.y,out.normal_and_more.z,out.normal_and_more.w);
out.normal_and_more.z=as_type<uint>(half2(float2(0.0)));
uint l9_288;
if (l9_276<0.0)
{
l9_288=1023u;
}
else
{
l9_288=uint(fast::clamp(l9_276,0.0,1.0)*1000.0);
}
uint l9_289=l9_288;
l9_289 |= uint(((*sc_set2.UserUniforms).receiverId%32)<<int(10u));
out.normal_and_more.w=l9_289;
}
else
{
out.position_and_mask=uint4(0u);
out.normal_and_more=uint4(0u);
}
float4 param_43;
Output_N6=param_43;
FinalColor=Output_N6;
return out;
}
} // RECEIVER MODE SHADER
