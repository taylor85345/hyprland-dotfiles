#define LOWP lowp
precision mediump float;

#define CRT_CURVE_AMNTx 0.1 // curve amount on x
#define CRT_CURVE_AMNTy 0.1 // curve amount on y
#define CRT_CASE_BORDR 0.0125
#define SCAN_LINE_MULT 1250.0

varying LOWP vec4 v_color;
varying vec2 v_texcoord;

uniform sampler2D tex;

void main() {
	vec2 tc = vec2(v_texcoord.x, v_texcoord.y);

	// Distance from the center
	float dx = abs(0.5-tc.x);
	float dy = abs(0.5-tc.y);

	// Square it to smooth the edges
	dx *= dx;
	dy *= dy;

	tc.x -= 0.5;
	tc.x *= 1.0 + (dy * CRT_CURVE_AMNTy);
	tc.x += 0.5;

	tc.y -= 0.5;
	tc.y *= 1.0 + (dx * CRT_CURVE_AMNTx);
	tc.y += 0.5;

	// Get texel, and add in scanline if need be
	vec4 cta = texture2D(tex, vec2(tc.x, tc.y));

	cta.rgb += sin(tc.y * SCAN_LINE_MULT) * 0.02;

	// Cutoff
	if(tc.y > 1.0 || tc.x < 0.0 || tc.x > 1.0 || tc.y < 0.0)
		cta = vec4(0.0);

	// Apply
	gl_FragColor = cta;
}
