#version 330 core					
layout (location=0) in vec3 aPos;
layout (location=1) in vec3 aNormal;
layout (location=2) in vec2 aTexCoord;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
uniform mat4 lightSpaceMatrix;

out vec3 fragPos;
out vec3 normal;
out vec2 texCoord;
out vec4 fragPosLightSpace;

void main()						
{								
	gl_Position = projection * view * model * vec4(aPos, 1.0);
	fragPos = vec3(model * vec4(aPos, 1.0));
	fragPosLightSpace = lightSpaceMatrix * vec4(fragPos, 1.0);
	texCoord = aTexCoord;
	mat3 normalMat = inverse(transpose(mat3(model)));
	normal = normalMat * aNormal;
};