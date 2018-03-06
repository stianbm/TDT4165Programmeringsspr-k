functor
import
System
define
X = "This is a string"
thread {System.showInfo Y} end
Y = X
end

/*
showInfo can print Y because Oz links all the variables before running.
*/