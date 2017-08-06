rm -r root-project || true
mkdir -p root-project/{project-1,project-2}/sub-project-1/src/main/java/does/not/exist
mkdir -p root-project/project-1/sub-project-1/src/main/java/does/not/exist/a
mkdir -p root-project/project-2/sub-project-1/src/main/java/does/not/exist/b

cat <<EOT >> root-project/project-1/sub-project-1/src/main/java/does/not/exist/a/Main.java
package does.not.exist.a;

public class Main{

}
EOT

cat <<EOT >> root-project/project-1/sub-project-1/src/main/java/does/not/exist/a/Something.java
package does.not.exist.a;

public class Something{
	public String getMessage(){
		return "Hello, World!";
	}
}
EOT


cat <<EOT >> root-project/project-2/sub-project-1/src/main/java/does/not/exist/b/Main.java
package does.not.exist.b;

import does.not.exist.a.Something;

public class Main{

	public Main(){
		System.out.println(new Something().getMessage());
	}

}
EOT

cat <<EOT >> root-project/build.gradle
group 'something'
version '1.0-SNAPSHOT'

allprojects {
    apply plugin: 'java'
    apply plugin: 'jacoco'

    repositories {
        mavenCentral()
        jcenter()
    }
}
EOT

cat <<EOT >> root-project/settings.gradle
rootProject.name = 'root-project'
include 'project-1:sub-project-1'
include 'project-1:sub-project-2'
EOT
