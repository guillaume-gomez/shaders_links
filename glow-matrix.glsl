// from the example here https://www.youtube.com/watch?v=f4s1h2YETNY
// some adjustements has been made 
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
    vec3 finalColor = vec3(0.0);
    
    for(float i = 0.0; i < 4.0; i++) {
        uv = fract(uv * 1.5)- 0.5;
        
        float d = length(uv) * exp(-length(uv0));
        vec3 col = myPalette(length(uv0) + iTime*0.5);

        d = sin(d*10.0 +  iTime) / 10.0;
        d = abs(d);

        d = pow(0.01 / d, 2.0);


        finalColor += col * d;
    
    }
    
    fragColor = vec4(finalColor, 1.0);
}
