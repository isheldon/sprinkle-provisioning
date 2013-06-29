package :openjdk_7 do
  description "install openjdk 7"
  apt "openjdk-7-jdk"
  verify do
    has_executable "java"
  end
end

package :ruby do
  description "install ruby 1.9.1(3)"
  apt "ruby1.9.1-full"
  verify do
    has_executable "ruby"
  end
end
