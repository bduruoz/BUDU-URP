// Made with Amplify Shader Editor v1.9.4.4
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BUDU Shaders/BSkybox"
{
	Properties
	{
		[Toggle]_EnableFog("Enable Fog", Float) = 0
		[Toggle]_Gradient("Gradient", Float) = 0
		[Toggle]_EnableHaze("Enable Haze", Float) = 0
		[HDR][Gamma][NoScaleOffset]_Tex("Cubemap", CUBE) = "black" {}
		[HDR][Gamma][NoScaleOffset]_Tex1("Cubemap Layer", CUBE) = "black" {}
		[Space(10)]_CubemapTransition("Cubemap Blend", Range( 0 , 1)) = 0
		_Exposure("Cubemap Exposure", Range( 0 , 8)) = 1
		[HDR][Gamma]_TopColor("Top Color", Color) = (0.467,0.735135,1,1)
		[HDR][Gamma]_TintColor("Cubemap Tint Color", Color) = (0.5,0.5,0.5,1)
		[HDR][Gamma]_BottomColor("Bottom Color", Color) = (0.348,0.2635828,0.1479,1)
		[HDR][Gamma]_Power("Power", Range( 0 , 8)) = 1
		_PositionY("PositionY", Float) = 0
		[HDR]_Falloff("Falloff", Range( 0 , 10)) = 0.5
		[HDR]_HorizonHeight("Horizon Height", Range( -1 , 1)) = 0
		_HazePosition("Haze Position", Float) = 0
		_FogPosition("Fog Position", Float) = 0
		_Rotation("Rotation", Range( 0 , 360)) = 0
		_RotationSpeed("Rotation Speed", Float) = 1
		[HideInInspector]_Tex_HDR1("DecodeInstructions", Vector) = (0,0,0,0)
		[HideInInspector]_Tex_HDR("DecodeInstructions", Vector) = (0,0,0,0)
		_PositionX("PositionX", Float) = 0
		_HazeHeight("Haze Height", Range( 0 , 1)) = 0.3
		_FogHeight("Fog Height", Range( 0 , 1)) = 0.45
		_PositionZ("PositionZ", Float) = 0
		[Toggle]_EnableRotation("Enable Rotation", Float) = 0
		_FogIntensity("Fog Intensity", Range( 0 , 1)) = 1
		_HazeIntensity("Haze Intensity", Range( 0 , 1)) = 1
		_FogFill("Fog Fill", Range( 0 , 1)) = 0.3
		_HazeFill("Haze Fill", Range( 0 , 1)) = 0
		_FogSmoothness("Fog Smoothness", Range( -2 , 1)) = 0.2
		_HazeSmoothness("Haze Smoothness", Range( -2 , 1)) = 0.175
		[HDR][Gamma]_HazeColor("Haze Color", Color) = (1,0.5969347,0,1)
		[Toggle]_CustomFogColor("Custom Fog Color", Float) = 1
		[HDR][Gamma]_FogColor("Fog Color", Color) = (0.4875,0.455,0.65,1)
		[Toggle]_BlendSky("Blend Sky", Float) = 0
		[Toggle]_CubemapSky("Cubemap Sky", Float) = 0
		[Toggle]_AdditiveGradient("Additive Gradient", Float) = 0
		[HDR][Gamma]_BaseColor("Base Color", Color) = (1,1,1,1)
		[Toggle]_EnablePosition("EnablePosition", Float) = 0

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Opaque" }
	LOD 100

		CGINCLUDE
		#pragma target 3.0
		ENDCG
		Blend Off
		AlphaToMask Off
		Cull Back
		ColorMask RGBA
		ZWrite On
		ZTest LEqual
		Offset 0 , 0
		
		
		
		Pass
		{
			Name "Unlit"

			CGPROGRAM

			

			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#include "UnityShaderVariables.cginc"
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_POSITION


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half4 _Tex_HDR;
			uniform half4 _Tex_HDR1;
			uniform float _EnableFog;
			uniform float _EnableHaze;
			uniform float _AdditiveGradient;
			uniform float _Gradient;
			uniform float4 _BaseColor;
			uniform float4 _TopColor;
			uniform float4 _BottomColor;
			uniform float _HorizonHeight;
			uniform float _Falloff;
			uniform float _Power;
			uniform float _CubemapSky;
			uniform float _BlendSky;
			uniform samplerCUBE _Tex;
			uniform float _EnableRotation;
			uniform float _EnablePosition;
			uniform float _PositionX;
			uniform float _PositionY;
			uniform float _PositionZ;
			uniform float _Rotation;
			uniform float _RotationSpeed;
			uniform samplerCUBE _Tex1;
			uniform half _CubemapTransition;
			uniform half4 _TintColor;
			uniform half _Exposure;
			uniform float4 _HazeColor;
			uniform float _HazePosition;
			uniform half _HazeHeight;
			uniform half _HazeSmoothness;
			uniform half _HazeFill;
			uniform half _HazeIntensity;
			uniform float _CustomFogColor;
			uniform float4 _FogColor;
			uniform float _FogPosition;
			uniform half _FogHeight;
			uniform half _FogSmoothness;
			uniform half _FogFill;
			uniform half _FogIntensity;

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float lerpResult28 = lerp( 1.0 , ( unity_OrthoParams.y / unity_OrthoParams.x ) , unity_OrthoParams.w);
				half CameraMode30 = lerpResult28;
				float3 appendResult20 = (float3(v.vertex.xyz.x , ( v.vertex.xyz.y * CameraMode30 ) , v.vertex.xyz.z));
				float3 appendResult103 = (float3(0.0 , 0.0 , 0.0));
				float3 appendResult100 = (float3(_PositionX , -_PositionY , _PositionZ));
				float3 temp_output_16_0 = ( appendResult20 + (( _EnablePosition )?( appendResult100 ):( appendResult103 )) );
				float3 VertexPos5_g1 = appendResult20;
				float3 appendResult10_g1 = (float3(0.0 , VertexPos5_g1.y , 0.0));
				float3 VertexPosRotationAxis11_g1 = appendResult10_g1;
				float3 break13_g1 = VertexPos5_g1;
				float3 appendResult14_g1 = (float3(break13_g1.x , 0.0 , break13_g1.z));
				float3 VertexPosOtherAxis12_g1 = appendResult14_g1;
				float Angle3_g1 = ( radians( _Rotation ) + ( _Time.y * _RotationSpeed ) );
				float3 temp_output_18_0 = ( ( VertexPosRotationAxis11_g1 + ( VertexPosOtherAxis12_g1 * cos( Angle3_g1 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis12_g1 ) * sin( Angle3_g1 ) ) ) + appendResult100 + (( _EnablePosition )?( appendResult100 ):( appendResult103 )) );
				float3 vertexToFrag124 = (( _EnableRotation )?( temp_output_18_0 ):( temp_output_16_0 ));
				o.ase_texcoord2.xyz = vertexToFrag124;
				
				o.ase_texcoord1 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = vertexValue;
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);

				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				#endif
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				float4 BaseColor71 = _BaseColor;
				float3 temp_cast_0 = (i.ase_texcoord1.xyz.y).xxx;
				float3 temp_cast_1 = ((0.0 + (_HorizonHeight - -1.0) * (3.0 - 0.0) / (1.0 - -1.0))).xxx;
				float3 temp_cast_2 = (( 1.0 - (-3.0 + (0.5 - 0.0) * (1.0 - -3.0) / (1.0 - 0.0)) )).xxx;
				float HorizonPos136 = ( distance( max( ( abs( ( temp_cast_0 - temp_cast_1 ) ) - ( temp_cast_2 * float3( 0.5,0.5,0.5 ) ) ) , float3( 0,0,0 ) ) , float3( 0,0,0 ) ) / (0.01 + (_Falloff - 0.0) * (1.0 - 0.01) / (1.0 - 0.0)) );
				float saferPower145 = abs( HorizonPos136 );
				float4 lerpResult87 = lerp( _TopColor , _BottomColor , pow( saferPower145 , (0.001 + (_Power - 0.0) * (10.0 - 0.001) / (20.0 - 0.0)) ));
				float4 Gradient88 = lerpResult87;
				float3 vertexToFrag124 = i.ase_texcoord2.xyz;
				float4 texCUBENode130 = texCUBE( _Tex, vertexToFrag124 );
				float4 lerpResult118 = lerp( texCUBENode130 , texCUBE( _Tex1, vertexToFrag124 ) , _CubemapTransition);
				half4 CubeMap123 = ( (( _BlendSky )?( lerpResult118 ):( texCUBENode130 )) * _TintColor * _Exposure * unity_ColorSpaceDouble );
				float4 FinalComp77 = (( _AdditiveGradient )?( ( (( _Gradient )?( Gradient88 ):( BaseColor71 )) + (( _CubemapSky )?( CubeMap123 ):( BaseColor71 )) ) ):( ( (( _Gradient )?( Gradient88 ):( BaseColor71 )) * (( _CubemapSky )?( CubeMap123 ):( BaseColor71 )) ) ));
				float4 HazeColor61 = _HazeColor;
				float Zero64 = 0.0;
				float One65 = 1.0;
				float lerpResult46 = lerp( saturate( pow( (Zero64 + (abs( ( i.ase_texcoord1.xyz.y + -_HazePosition ) ) - Zero64) * (One65 - Zero64) / (_HazeHeight - Zero64)) , ( 1.0 - _HazeSmoothness ) ) ) , 0.0 , _HazeFill);
				float lerpResult47 = lerp( 1.0 , lerpResult46 , _HazeIntensity);
				half Haze48 = lerpResult47;
				float4 lerpResult82 = lerp( HazeColor61 , FinalComp77 , Haze48);
				float4 FogColor60 = (( _CustomFogColor )?( _FogColor ):( unity_FogColor ));
				float lerpResult55 = lerp( saturate( pow( (Zero64 + (abs( ( i.ase_texcoord1.xyz.y + -_FogPosition ) ) - Zero64) * (One65 - Zero64) / (_FogHeight - Zero64)) , ( 1.0 - _FogSmoothness ) ) ) , 0.0 , _FogFill);
				float lerpResult56 = lerp( 1.0 , lerpResult55 , _FogIntensity);
				half Fog57 = lerpResult56;
				float4 lerpResult78 = lerp( FogColor60 , (( _EnableHaze )?( lerpResult82 ):( FinalComp77 )) , Fog57);
				float4 Result147 = (( _EnableFog )?( lerpResult78 ):( (( _EnableHaze )?( lerpResult82 ):( FinalComp77 )) ));
				
				
				finalColor = Result147;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "BSkyboxEditor"
	
	Fallback Off
}
/*ASEBEGIN
Version=19404
Node;AmplifyShaderEditor.CommentaryNode;25;-5328,-688;Inherit;False;1146.89;300.717;Perspective|Orthographic;5;30;29;28;27;26;Perspective|Orthographic;1,0,1,1;0;0
Node;AmplifyShaderEditor.OrthoParams;27;-5296,-576;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;26;-5040,-608;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-4848,-640;Half;False;Constant;_Float7;Float 7;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;28;-4656,-624;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0.5;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;15;-7600,-368;Inherit;False;2227.392;753.6918;Cubemap Coordinates;23;146;124;105;104;103;102;101;100;99;98;97;96;95;94;31;24;23;21;20;19;18;16;150;Cubemap Coordinates;0,0.4980392,0,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;30;-4400,-624;Half;True;CameraMode;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;146;-6912,208;Inherit;False;Property;_PositionY;PositionY;11;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;24;-7568,-256;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;31;-7568,-80;Inherit;False;30;CameraMode;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;96;-7568,144;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;98;-7584,224;Float;False;Property;_RotationSpeed;Rotation Speed;18;0;Create;True;0;0;0;False;0;False;1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;97;-7584,32;Float;False;Property;_Rotation;Rotation;17;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;99;-6752,224;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;101;-6752,304;Inherit;False;Property;_PositionZ;PositionZ;24;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;102;-6752,128;Inherit;False;Property;_PositionX;PositionX;21;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-7296,-96;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;-7312,144;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;94;-7280,32;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;14;-7600,-1312;Inherit;False;2217.7;857.2597;Gradient;19;145;144;143;142;141;140;139;138;137;136;132;131;91;90;89;88;87;86;85;Gradient;1,0,1,1;0;0
Node;AmplifyShaderEditor.DynamicAppendNode;100;-6576,192;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;103;-6592,-16;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;20;-7088,-224;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;95;-7120,128;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;104;-6416,80;Inherit;False;Property;_EnablePosition;EnablePosition;39;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;150;-6720,-320;Inherit;True;ComputeRotationY;-1;;1;735e1ea1387616c47955e6ec5703988c;0;2;4;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;139;-7552,-688;Inherit;False;Constant;_HorizonSize;Horizon Size;3;2;[HDR];[Gamma];Create;True;0;0;0;False;0;False;0.5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;16;-6144,32;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;18;-6144,-224;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;140;-7360,-688;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-3;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;90;-7168,-688;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;91;-6976,-1040;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;142;-7168,-592;Inherit;False;Property;_Falloff;Falloff;12;1;[HDR];Create;True;0;0;0;False;0;False;0.5;1;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;105;-5920,-96;Inherit;False;Property;_EnableRotation;Enable Rotation;25;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;137;-7472,-880;Inherit;False;Property;_HorizonHeight;Horizon Height;13;1;[HDR];Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;17;-5328,-352;Inherit;False;1714.901;941.7689;Base;12;130;129;128;127;126;125;123;122;120;119;118;93;Base;0,0.4980392,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;37;-5328,672;Inherit;False;1797.025;545.9419;Haze;20;134;117;109;108;107;106;70;69;61;48;47;46;45;44;43;42;41;40;39;38;Haze;0.5283019,0.1564771,0,1;0;0
Node;AmplifyShaderEditor.VertexToFragmentNode;124;-5632,-96;Inherit;True;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;85;-6784,-768;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;86;-6752,-896;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;141;-6864,-656;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.01;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;89;-7168,-880;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;13;-3872,-976;Inherit;False;485.7056;582.0319;Vars;8;71;65;32;64;62;133;66;63;Vars;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;108;-5280,880;Inherit;False;Property;_HazePosition;Haze Position;15;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;120;-5248,224;Half;False;Property;_CubemapTransition;Cubemap Blend;5;0;Create;False;0;0;0;False;1;Space(10);False;0;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;125;-5264,16;Inherit;True;Property;_Tex1;Cubemap Layer;4;3;[HDR];[Gamma];[NoScaleOffset];Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;black;LockedToCube;False;Object;-1;Auto;Cube;8;0;SAMPLERCUBE;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;130;-5280,-224;Inherit;True;Property;_Tex;Cubemap;3;3;[HDR];[Gamma];[NoScaleOffset];Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;black;LockedToCube;False;Object;-1;Auto;Cube;8;0;SAMPLERCUBE;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;138;-6704,-880;Inherit;False;BoxMask;-1;;52;9dce4093ad5a42b4aa255f0153c4f209;0;4;1;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;10;FLOAT3;0,0,0;False;17;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;143;-6656,-576;Inherit;False;Property;_Power;Power;10;2;[HDR];[Gamma];Create;True;0;0;0;False;0;False;1;1;0;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;33;-7600,464;Inherit;False;1961.222;685.6313;Fog;22;135;116;115;111;110;68;67;60;59;58;57;56;55;54;53;52;51;50;49;36;35;34;Fog;0.3899074,0.5224131,0.6132076,1;0;0
Node;AmplifyShaderEditor.PosVertexDataNode;38;-5216,736;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.NegateNode;43;-5104,880;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;63;-3824,-816;Inherit;False;Constant;_Zero;[Zero];38;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;66;-3824,-704;Inherit;False;Constant;_One;[One];38;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;118;-4640,-112;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;136;-6416,-864;Inherit;False;HorizonPos;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;144;-6368,-640;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;20;False;3;FLOAT;0.001;False;4;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;39;-4976,736;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;51;-7584,688;Inherit;False;Property;_FogPosition;Fog Position;16;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;93;-4432,288;Half;False;Property;_Exposure;Cubemap Exposure;6;0;Create;False;0;0;0;False;0;False;1;1;0;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;122;-4368,-224;Inherit;False;Property;_BlendSky;Blend Sky;35;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorSpaceDouble;127;-4368,-64;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;131;-6704,-1264;Inherit;False;Property;_TopColor;Top Color;7;2;[HDR];[Gamma];Create;True;0;0;0;False;0;False;0.467,0.735135,1,1;0,0.5,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;132;-6704,-1072;Inherit;False;Property;_BottomColor;Bottom Color;9;2;[HDR];[Gamma];Create;True;0;0;0;False;0;False;0.348,0.2635828,0.1479,1;0.6415094,0.1476068,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;64;-3616,-816;Inherit;False;Zero;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;65;-3616,-704;Inherit;False;One;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;145;-6176,-784;Inherit;True;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;126;-4368,112;Half;False;Property;_TintColor;Cubemap Tint Color;8;2;[HDR];[Gamma];Create;False;0;0;0;False;0;False;0.5,0.5,0.5,1;0.5,0.5,0.5,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PosVertexDataNode;36;-7488,528;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.AbsOpNode;40;-4816,736;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;50;-7408,688;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;69;-4880,832;Inherit;False;64;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;70;-4880,1008;Inherit;False;65;One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;87;-5904,-1056;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;109;-4992,928;Half;False;Property;_HazeHeight;Haze Height;22;0;Create;True;0;0;0;False;0;False;0.3;0.3;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;117;-4976,1088;Half;False;Property;_HazeSmoothness;Haze Smoothness;31;0;Create;True;0;0;0;False;0;False;0.175;0.175;-2;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;119;-4048,-224;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;133;-3840,-592;Inherit;False;Property;_BaseColor;Base Color;38;2;[HDR];[Gamma];Create;True;0;0;0;False;0;False;1,1,1,1;0.5,0.5,0.5,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;12;-5328,-1328;Inherit;False;1419.438;544.2423;Composite;9;121;114;92;77;76;75;74;73;72;Composite;1,0.5249614,0,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;34;-7248,544;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;41;-4656,736;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;44;-4624,1088;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;88;-5648,-1056;Inherit;True;Gradient;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;123;-3856,-208;Half;True;CubeMap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;71;-3616,-592;Inherit;False;BaseColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.AbsOpNode;35;-7120,544;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;42;-4448,736;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;67;-7168,640;Inherit;False;64;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;68;-7168,800;Inherit;False;65;One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;72;-5088,-960;Inherit;False;123;CubeMap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;73;-5264,-1136;Inherit;False;71;BaseColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;115;-7264,720;Half;False;Property;_FogHeight;Fog Height;23;0;Create;True;0;0;0;False;0;False;0.45;0.45;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;116;-7264,880;Half;False;Property;_FogSmoothness;Fog Smoothness;30;0;Create;True;0;0;0;False;0;False;0.2;0.2;-2;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;121;-5088,-1216;Inherit;False;88;Gradient;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;45;-4288,752;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;49;-6960,544;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;52;-6928,880;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;76;-4896,-1280;Inherit;True;Property;_Gradient;Gradient;1;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;107;-4416,848;Half;False;Property;_HazeFill;Haze Fill;29;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;114;-4896,-1040;Inherit;True;Property;_CubemapSky;Cubemap Sky;36;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;46;-4128,752;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;53;-6752,544;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;74;-4576,-1056;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;75;-4592,-1280;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;106;-4240,928;Half;False;Property;_HazeIntensity;Haze Intensity;27;0;Create;True;0;0;0;False;1;;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;47;-3952,736;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;54;-6576,544;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;92;-4384,-1184;Inherit;True;Property;_AdditiveGradient;Additive Gradient;37;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;111;-6704,656;Half;False;Property;_FogFill;Fog Fill;28;0;Create;True;0;0;0;False;0;False;0.3;0.3;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;134;-4032,1024;Inherit;False;Property;_HazeColor;Haze Color;32;2;[HDR];[Gamma];Create;True;0;0;0;False;0;False;1,0.5969347,0,1;1,0.5969347,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;11;-3360,-976;Inherit;False;1353.133;457.4001;Final;10;113;112;84;83;82;81;80;79;78;147;Final;0.4188679,1,0.6931632,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;48;-3792,736;Half;False;Haze;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;55;-6400,544;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;61;-3776,1024;Inherit;False;HazeColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;77;-4128,-1168;Inherit;False;FinalComp;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;110;-6512,768;Half;False;Property;_FogIntensity;Fog Intensity;26;0;Create;True;0;0;0;False;1;;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FogAndAmbientColorsNode;58;-6576,864;Inherit;False;unity_FogColor;0;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;135;-6608,960;Inherit;False;Property;_FogColor;Fog Color;34;2;[HDR];[Gamma];Create;True;0;0;0;False;0;False;0.4875,0.455,0.65,1;0.4875,0.455,0.65,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;56;-6208,544;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;59;-6080,864;Inherit;False;Property;_CustomFogColor;Custom Fog Color;33;0;Create;True;0;0;0;False;0;False;1;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;81;-3264,-928;Inherit;False;61;HazeColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;83;-3264,-688;Inherit;False;48;Haze;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;84;-3296,-816;Inherit;False;77;FinalComp;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;57;-6032,528;Half;True;Fog;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;60;-5856,864;Inherit;False;FogColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;82;-3072,-784;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;79;-2880,-720;Inherit;False;60;FogColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;112;-2912,-864;Inherit;False;Property;_EnableHaze;Enable Haze;2;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;80;-2896,-624;Inherit;False;57;Fog;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;78;-2656,-704;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;113;-2464,-784;Inherit;False;Property;_EnableFog;Enable Fog;0;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;147;-2224,-784;Inherit;False;Result;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;23;-5952,-256;Float;False;Property;_EnableRotation;Enable Rotation;14;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;62;-3824,-912;Inherit;False;Constant;_GrayFifty;[GrayFifty];8;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;128;-5280,352;Half;False;Property;_Tex_HDR;DecodeInstructions;20;1;[HideInInspector];Create;False;0;0;0;True;0;False;0,0,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;129;-5056,352;Half;False;Property;_Tex_HDR1;DecodeInstructions;19;1;[HideInInspector];Create;False;0;0;0;True;0;False;0,0,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;32;-3616,-912;Inherit;False;Gray50;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;148;-1824,-832;Inherit;True;147;Result;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;176;-1584,-832;Float;False;True;-1;2;BSkyboxEditor;100;5;BUDU Shaders/BSkybox;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;RenderType=Opaque=RenderType;True;2;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;1;True;False;;False;0
WireConnection;26;0;27;2
WireConnection;26;1;27;1
WireConnection;28;0;29;0
WireConnection;28;1;26;0
WireConnection;28;2;27;4
WireConnection;30;0;28;0
WireConnection;99;0;146;0
WireConnection;19;0;24;2
WireConnection;19;1;31;0
WireConnection;21;0;96;0
WireConnection;21;1;98;0
WireConnection;94;0;97;0
WireConnection;100;0;102;0
WireConnection;100;1;99;0
WireConnection;100;2;101;0
WireConnection;20;0;24;1
WireConnection;20;1;19;0
WireConnection;20;2;24;3
WireConnection;95;0;94;0
WireConnection;95;1;21;0
WireConnection;104;0;103;0
WireConnection;104;1;100;0
WireConnection;150;4;20;0
WireConnection;150;2;95;0
WireConnection;16;0;20;0
WireConnection;16;1;104;0
WireConnection;18;0;150;0
WireConnection;18;1;100;0
WireConnection;18;2;104;0
WireConnection;140;0;139;0
WireConnection;90;0;140;0
WireConnection;105;0;16;0
WireConnection;105;1;18;0
WireConnection;124;0;105;0
WireConnection;85;0;90;0
WireConnection;86;0;91;2
WireConnection;141;0;142;0
WireConnection;89;0;137;0
WireConnection;125;1;124;0
WireConnection;130;1;124;0
WireConnection;138;1;86;0
WireConnection;138;4;89;0
WireConnection;138;10;85;0
WireConnection;138;17;141;0
WireConnection;43;0;108;0
WireConnection;118;0;130;0
WireConnection;118;1;125;0
WireConnection;118;2;120;0
WireConnection;136;0;138;0
WireConnection;144;0;143;0
WireConnection;39;0;38;2
WireConnection;39;1;43;0
WireConnection;122;0;130;0
WireConnection;122;1;118;0
WireConnection;64;0;63;0
WireConnection;65;0;66;0
WireConnection;145;0;136;0
WireConnection;145;1;144;0
WireConnection;40;0;39;0
WireConnection;50;0;51;0
WireConnection;87;0;131;0
WireConnection;87;1;132;0
WireConnection;87;2;145;0
WireConnection;119;0;122;0
WireConnection;119;1;126;0
WireConnection;119;2;93;0
WireConnection;119;3;127;0
WireConnection;34;0;36;2
WireConnection;34;1;50;0
WireConnection;41;0;40;0
WireConnection;41;1;69;0
WireConnection;41;2;109;0
WireConnection;41;3;69;0
WireConnection;41;4;70;0
WireConnection;44;0;117;0
WireConnection;88;0;87;0
WireConnection;123;0;119;0
WireConnection;71;0;133;0
WireConnection;35;0;34;0
WireConnection;42;0;41;0
WireConnection;42;1;44;0
WireConnection;45;0;42;0
WireConnection;49;0;35;0
WireConnection;49;1;67;0
WireConnection;49;2;115;0
WireConnection;49;3;67;0
WireConnection;49;4;68;0
WireConnection;52;0;116;0
WireConnection;76;0;73;0
WireConnection;76;1;121;0
WireConnection;114;0;73;0
WireConnection;114;1;72;0
WireConnection;46;0;45;0
WireConnection;46;2;107;0
WireConnection;53;0;49;0
WireConnection;53;1;52;0
WireConnection;74;0;76;0
WireConnection;74;1;114;0
WireConnection;75;0;76;0
WireConnection;75;1;114;0
WireConnection;47;1;46;0
WireConnection;47;2;106;0
WireConnection;54;0;53;0
WireConnection;92;0;74;0
WireConnection;92;1;75;0
WireConnection;48;0;47;0
WireConnection;55;0;54;0
WireConnection;55;2;111;0
WireConnection;61;0;134;0
WireConnection;77;0;92;0
WireConnection;56;1;55;0
WireConnection;56;2;110;0
WireConnection;59;0;58;0
WireConnection;59;1;135;0
WireConnection;57;0;56;0
WireConnection;60;0;59;0
WireConnection;82;0;81;0
WireConnection;82;1;84;0
WireConnection;82;2;83;0
WireConnection;112;0;84;0
WireConnection;112;1;82;0
WireConnection;78;0;79;0
WireConnection;78;1;112;0
WireConnection;78;2;80;0
WireConnection;113;0;112;0
WireConnection;113;1;78;0
WireConnection;147;0;113;0
WireConnection;23;1;16;0
WireConnection;23;0;18;0
WireConnection;32;0;62;0
WireConnection;176;0;148;0
ASEEND*/
//CHKSM=6FA4E6DD9AC554FD04E1C0C69C213B48E16404B3