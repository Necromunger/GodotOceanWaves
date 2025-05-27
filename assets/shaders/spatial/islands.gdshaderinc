// Returns blend factor easing to 0 based on the distance to the nearest island
float get_island_blend(vec2 pos, int count, vec4[16] islands) {
    if (count < 1)
        return 1.0;
	
    float min_blend = 1.0;
    for (int i = 0; i < count; ++i) {
        vec2 center = islands[i].xy;
        float radius = islands[i].z;
        float falloff = islands[i].w;
        falloff = max(0.0, falloff);
        float dist = length(pos - center);
        float blend = smoothstep(radius, radius + falloff, dist);
        min_blend = min(min_blend, blend);
    }
	
    return min_blend;
}