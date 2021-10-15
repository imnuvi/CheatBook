### Learning go

install go with
<code>brew install go</code>
or download it from website.

#### Setup and running

- all go projects live in the same environment called the workspace. This is a directory called "go" in your home directory. you can check this by typing <code>go env GOPATH</code> . users/username/go/src is where the code lives
- within src, you can create directories for each project. Each of these projects will have a file that will be run.
<br>
<br>

- the first line of a go file needs to be the name of the package. each package needs to have a name main if it needs to be executed
<code>name main</code>
- the second line is the import line where other packages are imported.
<code>
import (<br>
  "fmt"<br>
  "math"<br>
)</code>
- there needs to be a function called main within the main package for the program to run. This is where the program starts


<br>
<br>

- you can run the program using <br>
<code>go run hello.go</code><br>
- to compile the code, you can use <br>
<code>go build</code><br> from within the folder and it will put a binary file with the project name which can be executed as a bin file
- alternatively you can use
<code>go intall</code><br> which will put the binary file in a separate folder called bin within the go directory. This will put the required compiled external dependencies for cached loading.


#### Syntax

- declaration: <br>
<code>var var_name type</code>
<br>var_name is variable name and type is the type( int, float, string)
- assignment: <br>
<code>var a int = 10</code>
assignment can be done during declaration or at a later stage.

- The walrus operator <code>:=</code> can be used to assign and declare at the same time and go can infer the type by itself.<br>
<code>a := 10</code>


- if/else if/else condition: if followed by condition followed by curly braces<br>
<code>if a\<b {<br>
  }else if{<br>
}else{<br>
}</code><br>
note: else if and else need to placed next to the curly brace and not on the next line

- array: array sizes are fixed and the type is declared first hand<br>
<code>var b [5]int</code><br>

here 5 is the array size and int is the type

you can use the shorthand notation of assignment by giving the array within curly braces after the walrus operator<br>
<code>new_arr := [5]int{3,2,4,5,5}</code>
- slice: it is inconvenient to have a fixed size of arrays so the concept of slices which is an abstraction over arrays. If you leave the array size as empty it will create a slice
<code>new_slice := []int{3,2,4}</code><br>
now you can use the append function to add items to the slice. the append function returns a new list and doesnt edit the old one<br>
<code>up_slice = append(new_slice, 4)</code>
- maps: maps are like dictionaries in python and hold key value pairs.
use the walrus operator along with the make function to create a map The square bracket contains the type of key and followed by the type of value it holds.<br>
<code>vertices := make(map[string]int)</code><br>
<code>vertices["square"] = 4</code><br>
you can use the delete function to remove a key<br>
<code>delete(vertices, "square")</code><br>

###  loops

- the only loop is the for loop. for keyword followed by the walrus declaration shorthand followed by loop condition and the incrementer separated by ";" <br>
<code>for i := 0; i \< 5; i++ {<br>
fmt.Println(i)
}</code><br>
- if you remove the declaration and the incrementer it will act as a while loop as well<br>
<code>i := 0<br>
for i \< 5 {<br>
fmt.Println(i)<br>
i++<br>
}</code><br>
- you can iterate through an array using for loop with the help of range function.<br>
<code>for index, value := range my_arr {<br>
fmt.Println(index, value)
}</code><br>
you can do the same for maps and you will get the key instead of index


###  new functions

- you can create new functions with func keyword. The arguments need to have a name and type and if we return something should be declared a type  outside the parantheses.<br>
<code>func summer(x int, y int) int {<br>
return x + y<br>
}</code>
- you can return multiple values defined in parantheses. But wherver return is called all those values need to be returned.<br>
<code>func square_root(x int) (int, error) {<br>
  if x < 0 {<br>
    return 0, errors.New("undefined for negatives")<br>
  } else {<br>
  return math.Sqrt(x), nil  <br>
  }<br>
}</code>

### Structs

Struct is a collection of fields so you can create a more logical type for your stuff.<br>
<code>type person struct{<br>
  name string<br>
  age int<br>
  }</code><br>
define this at the top of the program and you can define a struct by using the syntax<br>
<code>p1 := person{name:"ram", age:21}</code>
you can access the values with dot notation


### Memories and pointers
you can get the memory address of a variable by using ampersand before the vairable
<code>f := 7<br>
fmt.Println(&f)
<code>
