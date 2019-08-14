// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'
Shader "Gc/CameraLeft" { // defines the name of the shader 
	Properties{
		_MainTex("_MainTex", 2D) = "black" {}
	screenInfo("screenInfo", Vector) = (0,0,0,0)
		eyeBox("eyeBox", Vector) = (0,0,0,0)

		//_UA("旋转中点x",Float) = 0
		//_UB("旋转中点y",Float) = 0
		//_CenterX("平移x",float)=0
		//_CenterY("平移y",float) = 0
		//_RotateNum("旋转角度",Range(-360,360))=0
	}

		//the CG subshader
		SubShader{
		//only pass
		Pass{
		ZTest Always
		Cull Off
		ZWrite Off
		Fog{ Mode off }

		CGPROGRAM
// Upgrade NOTE: excluded shader from DX11, OpenGL ES 2.0 because it uses unsized arrays
// Upgrade NOTE: excluded shader from DX11, OpenGL ES 2.0 because it uses unsized arrays

// Upgrade NOTE: excluded shader from DX11, OpenGL ES 2.0 because it uses unsized arrays
// Upgrade NOTE: excluded shader from DX11, OpenGL ES 2.0 because it uses unsized arrays

// Upgrade NOTE: excluded shader from DX11, OpenGL ES 2.0 because it uses unsized arrays

// Upgrade NOTE: excluded shader from DX11, OpenGL ES 2.0 because it uses unsized arrays

// Upgrade NOTE: excluded shader from DX11, OpenGL ES 2.0 because it uses unsized arrays
//#pragma exclude_renderers d3d11 gles
// Upgrade NOTE: excluded shader from DX11, OpenGL ES 2.0 because it uses unsized arrays


		//tell the compiler about our vert and frag functions
#pragma vertex vert
#pragma fragment frag
#pragma target 3.0
#include "UnityCG.cginc"

		sampler2D _MainTex;
	fixed4 screenInfo;
	fixed4 eyeBox;

	float _UA;
	float _UB;
	float _RotateNum;
	float _CenterX;
	float _CenterY;

	struct vertfrag {
		float4 position : POSITION;
		float4 worldpos : TEXCOORD1;
	};

	//passthrough vert shader (why even bother multiplying by mvp?)
	vertfrag vert(appdata_base v) {
		vertfrag o;
		o.position = UnityObjectToClipPos(v.vertex);
		o.worldpos = o.position; //because glsl is better
		return o;
	}

	float2 map00(float x, float x2, float x3, float x4, float y, float y2, float y3, float y4) { return float2(x, y); } //bottom left
	float2 map10(float x, float x2, float x3, float x4, float y, float y2, float y3, float y4) {
		//these are the old coefficients!
		return float2(0.022162 +
			x	  *  1.165375 +
			y	  *  0.052539 +
			x2	  * -0.034822 +
			x*y	  *  0.283082 +
			y2	  *  0.040379 +
			x3	  * -0.054210 +
			x2*y  *  0.174904 +
			x*y2  *  0.157498 +
			y3	  * -0.012528 +
			x4	  *  0.215194 +
			x3*y  *  0.308627 +
			x2*y2 * -0.049195 +
			x*y3  *  0.123411 +
			y4	  * -0.032656
			,		-0.141015 +
			x	  * -0.221409 +
			y	  *  1.088636 +
			x2	  * -1.012132 +
			x*y	  *  0.018144 +
			y2	  *  0.423666 +
			x3	  * -0.001848 +
			x2*y  * -1.467441 +
			x*y2  * -0.052869 +
			y3	  * -0.137657 +
			x4	  *  0.492221 +
			x3*y  * -0.933112 +
			x2*y2 * -0.287140 +
			x*y3  * -0.234555 +
			y4	  * -0.060633
			);
	} //top left
	float2 map01(float x, float x2, float x3, float x4, float y, float y2, float y3, float y4) {
		return float2(
			-0.005732 +
			x	  * 1.233685 +
			y	  * 0.039561 +
			x2	  * -0.000649 +
			x*y	  * -0.073908 +
			y2	  * 0.008677 +
			x3	  * -0.128713 +
			x2*y  * 0.019731 +
			x*y2  * -0.051050 +
			y3	  * 0.001961 +
			x4	  * 0.081437 +
			x3*y  * 0.255228 +
			x2*y2 * 0.021673 +
			x*y3  * 0.148230 +
			y4	  * 0.000520,

			0.186200 +
			x	  * -0.077624 +
			y	  * 1.161327 +
			x2	  * -0.922708 +
			x*y	  * -0.073886 +
			y2	  * -0.073107 +
			x3	  *  0.040573 +
			x2*y  * -0.393019 +
			x*y2  * -0.005763 +
			y3	  * -0.063284 +
			x4	  * 0.181403 +
			x3*y  * 0.000397 +
			x2*y2 * 0.092176 +
			x*y3  * 0.000769 +
			y4	  * -0.006216
			);
	} //bottom right
	float2 map11(float x, float x2, float x3, float x4, float y, float y2, float y3, float y4) { return float2(x, y); } //top right

	
	float2 zkhao(float x, float x2, float x3, float x4, float y, float y2, float y3, float y4)
	{
				float a1;
				float a2;
				float a3;
				float a4;
				float a5;
				float a6;
				float a7;
				float a8;
				float a9;

				//float[] listast;
				//float[] listbst;
				//listast = new float[10]{ 0.0,0.,0.0,0.0,0,0,0,0,0,0 };
				//listbst = new float[10]{ 0,0,0,0,0,0,0,0,0,0 };
				/*listast[0] = 262.67944196866421;
				listast[1] = -0.10607920347823130;
				listast[2] = -4.9983649347717929e-05;
				listast[3] = 8.7253781977381095e-09;
				listast[4] = 0.74114369797932100;
				listast[5] = 0.00018938085926240023;
				listast[6] = 5.4555576056714017e-08;
				listast[7] = 3.2952653734819037e-05;
				listast[8] = 1.0441749687117863e-09;
				listast[9] = -1.9603058398764972e-08;

				listbst[0] = -268.33321746208532;
				listbst[1] = 2.0623515160344441;
				listbst[2] = -0.00094431287301255384;
				listbst[3] = 2.3305586849264870e-07;
				listbst[4] = 0.27485985896873832;
				listbst[5] = -0.00019296591484185832;
				listbst[6] = 3.1894095697815317e-09;
				listbst[7] = 9.5377063867529976e-05;
				listbst[8] = 1.1548737061106706e-07;
				listbst[9] = -2.8193764800565901e-07;
*/
				
				a1 = y;
				a2 = y2;
				a3 = y3;
				a4 = x;
				a5 = x*y;
				a6 = x*y2;
				a7 = x2;
				a8 = x2*y;
				a9 = x3;


				//float X = listast[0] + listast[1] * a1 + listast[2] * a2 + listast[3] * a3
				//	+ listast[4] * a4 + listast[5] * a5 + listast[6] * a6
				//	+ listast[7] * a7 + listast[8] * a8
				//	+ listast[9] * a9;

				//float Y = listbst[0] + listbst[1] * a1 + listbst[2] * a2 + listbst[3] * a3
				//	+ listbst[4] * a4 + listbst[5] * a5 + listbst[6] * a6
				//	+ listbst[7] * a7 + listbst[8] * a8
				//	+ listbst[9] * a9;
			/*	return float2(27.478971875392503 +
				a1*( -0.17226036281614598)+
				a2*(-1.9257965634955632e-05)+
				a3*(2.3000807924944411e-08)+
				a4*( 0.97480023296682539 )+
				a5*( 0.00033823676902727806 )+
				a6*(-3.4947608362756455e-08)+
				a7*4.4540954447891412e-05 +
				a8*7.7385595209644720e-08 +
				a9 *(-9.0886426162839484e-08),
					-161.86779856091539 +
				a1*1.0342629181572347 +
				a2*(3.8480778890237488e-05)+
				a3*(2.3089622769312257e-08)+
				a4* 0.66255127506034084 +
				a5*(-0.00013193158458779664)+
				a6*( -4.0902372044904212e-08 )+
				a7* (-0.00067588790087880213) +
				a8* 2.3672979532207705e-07 +
				a9*(-2.2977597935458505e-08));*///

				/*return float2(-138.44116248768688 +
					a1*(0.012142633490151211) +
					a2*(0.00023618053996354860) +
					a3*(-9.3986790128397502e-08) +
					a4*(1.3936390873011186) +
					a5*(-0.00025970278204490160) +
					a6*(-1.1013342138266324e-07) +
					a7*(-7.4773977178921314e-05) +
					a8*2.2305090330299038e-08 +
					a9 *(-4.2947178036101263e-09),
					51.729938775059708 +
					a1*(1.2152867043463178) +
					a2*(-0.00016311916418565442) +
					a3*(5.7313585155593927e-08) +
					a4*(-0.46775829625488352) +
					a5*(-0.00026124546700923013) +
					a6*(9.5823963375263332e-08) +
					a7* (0.00034681407062747693) +
					a8*(2.0896492108901654e-07) +
					a9*(1.2070308930134388e-07));*///

					return 	float2(960.00000714074258 +
					a1*(-1.1182727066572085e-07) +
					a2*(3.2719210674159172e-10) +
					a3*(-2.6290081223123707e-13) +
					a4*(-1.0000000046392754) +
					a5*(2.3585078334775744e-11) +
					a6*(1.8318679906315083e-15) +
					a7*(1.8318679906315083e-15) +
					a8*(-3.3861802251067274e-14) +
					a9 *(-9.2148511043887993e-15),
						-8.7939766182337848 +
					a1*(1.3491377930250406) +
					a2*(0.00064344469895327716) +
					a3*(-4.4154198264312328e-07) +
					a4*(-0.61419713636200801) +
					a5*(-0.00030308905729292679) +
					a6*(-9.5020489032648925e-08) +
					a7* (0.00071442399505411425) +
					a8*(3.9356062192519303e-07) +
					a9*(-7.0501088744734375e-08));	

				
	}
			float2 getzkhaoDistortion(float2 smp) {
				float x = smp.x * 960, y = smp.y * 1080, x2 = x*x,
					y2 = y*y, x3 = x2*x, y3 = y2*y, x4 = x3*x, y4 = y3*y;
				//float2	d1 = smp - zkhao(x, x2, x3, x4, y, y2, y3, y4),
				float2	d1 = zkhao(x, x2, x3, x4, y, y2, y3, y4);
				//d2 = smp - zkhao(x, x2, x3, x4, y, y2, y3, y4),
				//d3 = smp - zkhao(x, x2, x3, x4, y, y2, y3, y4),
				//d4 = smp - zkhao(x, x2, x3, x4, y, y2, y3, y4),
				//create uniform mix
				//accum = lerp(lerp(d1, d2, eyeBox.x), lerp(d3, d4, eyeBox.x), eyeBox.y);
				//accum = d1;
				//float2 accum(d1.x / 960, d1.y / 1080);
				//return accum;
				return float2(d1.x / 960, d1.y / 1080);
			}
			

			float2 getDistortion(float2 smp) {
				//mirror eye
				smp *= float2(eyeBox.w, 1.0);
				float x = smp.x, y = smp.y, x2 = x*x,
					y2 = y*y, x3 = x2*x, y3 = y2*y, x4 = x3*x, y4 = y3*y;
				float2	d1 = smp - map00(x, x2, x3, x4, y, y2, y3, y4),
					d2 = smp - map01(x, x2, x3, x4, y, y2, y3, y4),
					d3 = smp - map10(x, x2, x3, x4, y, y2, y3, y4),
					d4 = smp - map11(x, x2, x3, x4, y, y2, y3, y4),
					//create uniform mix
					accum = lerp(lerp(d1, d2, eyeBox.x), lerp(d3, d4, eyeBox.x), eyeBox.y);
				//add distortion and unmirror eye
				return (smp - accum) * float2(eyeBox.w, 1.0);
			}

			//if unity complains about SV_POSITION just ignore it
			fixed4 frag(vertfrag inp) : SV_Target{

		/*		float Rote = 0;// _RotateNum;
			float sinNum = sin(Rote);
			float cosNum = cos(Rote);
			float2 di = float2(_UA, _UB);
			float2 uv = mul(float3(inp.worldpos.xy - di, 1), float3x3(1, 0, 0, 0, 1, 0, _CenterX, _CenterY, 1)).xy;
			uv= mul(uv, float2x2(cosNum, -sinNum, sinNum, cosNum)) + di;
				*///
			//float2 smp = uv;
				float2 smp = inp.worldpos.xy;
				
				//new displacement with eyebox support
				
				float2 disp = smp*float2(0.5, 0.5) + 0.5;
				//float2 disp = smp*float2(-0.5, -0.5) + 0.5;
				float2 disp1 = getzkhaoDistortion(disp);
				//if distored outside defined area return black
				if (disp1.x < 0 || disp1.x > 1.0 || disp1.y <0 || disp1.y > 1.0) return fixed4(0., 0., 0., 1.);

				//the one texture sample
				//return tex2D(_MainTex, disp * float2(-0.5, 0.5) + 0.5);
				return tex2D(_MainTex, disp1);
			}

			ENDCG
		}
	}
////////////////////////////////////////////////////////
//	SubShader { // Unity chooses the subshader that fits the GPU best
//		Pass { // some shaders require multiple passes
//			GLSLPROGRAM // here begins the part in Unity's GLSL
//
//#ifdef VERTEX // here begins the vertex shader
//
//			uniform sampler2D _MainTex;
//			uniform vec4 screenInfo;
//			uniform vec4 eyeBox;
//	
//			void main() {
//				gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
//			}
//
//#endif // here ends the definition of the vertex shader
//#ifdef FRAGMENT // here begins the fragment shader
//
//			uniform sampler2D _MainTex;
//			uniform vec4 screenInfo;
//			uniform vec4 eyeBox;
//
//			vec2 map(float x, float x2, float x3, float x4, float y, float y2, float y3, float y4) {
//				return vec2(
//					/*x*/	-0.005732 +
//					x	  * 1.233685 +
//					y	  * 0.039561 +
//					x2	  * -0.000649 +
//					x*y	  * -0.073908 +
//					y2	  * 0.008677 +
//					x3	  * -0.128713 +
//					x2*y  * 0.019731 +
//					x*y2  * -0.051050 +
//					y3	  * 0.001961 +
//					x4	  * 0.081437 +
//					x3*y  * 0.255228 +
//					x2*y2 * 0.021673 +
//					x*y3  * 0.148230 +
//					y4	  * 0.000520,
//
//					/*y*/	0.186200 +
//					x	  * -0.077624 +
//					y	  * 1.161327 +
//					x2	  * -0.922708 +
//					x*y	  * -0.073886 +
//					y2	  * -0.073107 +
//					x3	  *  0.040573 +
//					x2*y  * -0.393019 +
//					x*y2  * -0.005763 +
//					y3	  * -0.063284 +
//					x4	  * 0.181403 +
//					x3*y  * 0.000397 +
//					x2*y2 * 0.092176 +
//					x*y3  * 0.000769 +
//					y4	  * -0.006216
//				);
//			}
//
//			vec2 getDistortion(vec2 smp) {
//				//mirror eye
//				smp *= vec2(-eyeBox.w, 1.0);
//				float x = smp.x, y = smp.y, x2 = x*x,
//					y2 = y*y, x3 = x2*x, y3 = y2*y, x4 = x3*x, y4 = y3*y;
//				vec2 d1 = smp - map(x, x2, x3, x4, y, y2, y3, y4);
//				//add distortion and unmirror eye
//				return (smp - d1) * vec2(-eyeBox.w, 1.0);
//			}
//
//			void main() {
//				vec2 smp = (gl_FragCoord.xy * screenInfo.zw - vec2(eyeBox.w * -0.5 + 0.5, 0.)) * 2.0 - 1.0;
//
//				//new displacement with eyebox support
//				vec2 disp = smp + (smp - getDistortion(smp));
//				
//				//if distored outside defined area return black
//				if (disp.x < -1.0 || disp.x > 1.0 || disp.y < -1.0 || disp.y > 1.0) {
//					gl_FragColor = vec4(0., 0., 0., 1.);
//					return;
//				}
//
//				//the one texture sample
//			gl_FragColor = texture2D(_MainTex, disp * vec2(-0.5, 0.5) + 0.5);
//			}
//#endif // here ends the definition of the fragment shader
//
//			ENDGLSL // here ends the part in GLSL
//		}
//	}
}