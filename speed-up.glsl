// can be run to shadertoy

vec3 palette(float t, vec3 a, vec3 b, vec3 c, vec3 d) {
  return a + b * cos(6.28318 * (c * t + d));
}

vec3 myPalette(float t) {
    vec3 a = vec3(0.5,0.5,0.5);
    vec3 b = vec3(0.5,0.5,0.5);
    vec3 c = vec3(1.0,1.0,1.0);
    vec3 d = vec3(0.263, 0.416,0.557);

    return palette(t, a,b,c,d);
     
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = (fragCoord * 2.0 - iResolution.xy) / iResolution.y;
    vec2 uv0 = uv;
    
    uv *= 2.0;
    uv = fract(uv * 1.5 + tan(iTime * 0.5));
    uv -= 0.5;
    
    
    float d = length(uv);
    vec3 col = myPalette(length(uv0) + iTime*0.5);
    
    d = sin(d*10.0 +iTime) / 5.0;
    d = abs(d);
    
    d = 0.02 / d;
    
    
    col *= d;
    
    fragColor = vec4(col, 1.0);
}
