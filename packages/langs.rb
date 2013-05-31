package :openjdk_7 do
  description "install openjdk 7"
  apt "openjdk-7-jdk"
  verify do
    has_executable "java"
  end
end

package :ruby do
  description "install ruby (default version)"
  apt "ruby"
  verify do
    has_executable "ruby"
  end
end
