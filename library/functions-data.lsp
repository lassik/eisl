;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; ISLisp Functions List 
;;;
;;; written by GOMI Hiroshi 2011
;;; Modifing by Kenichi Sasagawa 2021/4~
;;; We would like to thank Mr.Poldy for his contribution.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; array
((BASIC-ARRAY-P obj) boolean "Check if obj is an array, a string, a vector")
((BASIC-ARRAY*-P obj) boolean "Check if obj is an array")
((GENERAL-ARRAY*-P obj) boolean "Check if obj is a general-array")
((CREATE-ARRAY dimensions initial-element +) <basic-array> "Generate an array")
((AREF basic-array z *) <object> "Extract the zth element of the array basic-array")
((GAREF general-array z *) <object> "Extract the zth element of the general-array")
((SET-AREF obj basic-array z *) <object> "Set the zth element obj of the basic-array ")
((SET-GAREF obj general-array z *) <object> "Set the zth element obj of the general-array")
((ARRAY-DIMENSIONS basic-array) <list> "Return a list of the dimensions of an basic-array")

;;; char
((CHARACTERP obj) boolean "Check if obj is a string")
((CHAR= char1 char2) boolean "Check if the characters in char1 and char2 are equal")
((CHAR/= char1 char2) boolean "Check if the characters in char1 and char2 are not equal")
((CHAR< char1 char2) boolean "Check if the character code of char1 is larger than char2")
((CHAR> char1 char2) boolean "Check if the character code of char1 is smaller than char2")
((CHAR<= char1 char2) boolean "Check if the character code of char1 is greater than or equal to char2")
((CHAR>= char1 char2) boolean "Check if the character code of char1 is less than or equal to char2")

;;; cond
((error error-string obj *) <object> "Signal an error")
((cerror continue-string error-string obj *) <object> "Signal a continuable error")
((signal-condition condition continuable) <object> "Signal to manipulate the condition")
((ignore-errors form *) <object> "Ignore error(special form)")
((report-condition condition stream) <condition> "Report condition condition to stream stream") 
((condition-continuable condition) <object> "Check if it is continuable")
((continue-condition condition value +) <object> "Continue from the condition")
((with-handler handler form *) <object> "Evaluate the handler and execute the form (special form)")
((arithmetic-error-operation arithmetic-error) <function> "Return the operand of an arithmetic error")
((arithmetic-error-operands arithmetic-error) <list> "Return the operand of an arithmetic error")
((domain-error-object domain-error) <object>  "Return the object created by the domain error domain-error")
((domain-error-expected-class domain-error) <class> "Domain error, Return the desired domain generated by domain-error")
((parse-error-string parse-error) <string> "Parsing error, Return the string generated by parse-error")
((parse-error-expected-class parse-error) <class>  "Parsing error, Return the desired class generated by parse-error")
((simple-error-format-string simple-error) <string> "Return the string generated by simple-error")
((simple-error-format-arguments simple-error) <list> "Return a list of arguments generated by simple-error")
((stream-error-stream stream-error) <stream> "Stream error, returns the stream generated by stream-error")
((undefined-entity-name undefined-entity) <symbol> "Return the symbol generated by the undefined entity undefined-entity")
((undefined-entity-namespace undefined-entity) <symbol> "Return the namespace generated by the undefined entity undefined-entity")

;;; control
((quote obj) <object> "Return a reference to obj (special format)")
((setq var form) <object> "Assign the evaluation result of the form form to the variable var (special form)")
((setf place form) <object> "Assign the evaluation result of form form to place (special format)")
((let ((var form) *) body-form *) <object> "Define a local variable and execute it in that environment (special form)")
((let* ((var form) *) body-form *) <object>  "Similar to let, except that local variables are bound sequentially (special form)")
((dynamic var) <object> "Declare dynamic variables (special form)")
((setf (dynamic var) form) <object> "Assign a value to a dynamic variable (special form)")
((dynamic-let ((var form) *) body-form *) <object> "Temporarily bind dynamic variables (special form)")
((if test-form then-form else-form+) <object> "Branch according to the result of the condition (special form)")
((cond (test form *) *) <object> "Branch according to the result of the condition (special form)")
((case keyform ((key *) form *) * (t form *)+) <object> "Branches in various ways depending on the value of keyform (special form)")
((case-using predform keyform ((key *) form *) * (t form *) +) <object> "Almost the same as the case statement, but using the predicate function predform for comparison (special form)")
((progn form*) <object> "Perform sequential execution (special format)")
((while test-form body-form *) <null> "Execute body-form while est-form is not nil (special form)")
((for (iteration-spec *) (end-test result *) form *) <object> "Iterate repeatedly while end-test is not nil, using the initial values and steppers indicated by iteration-spec (special form). ")
((block name form *) <object> "Execute sequentially with block tags (special format) ")
((return-from name result-form) transfers-control-and-data "Exit the name block (special form)")
((catch tag-form form *) <object> "Catch tag-form and execute form (special form)")
((throw tag-form result-form) transfers-control-and-data "Throw tag-form (special form)")
((tagbody tagbody-tag * form *) <object> "Execute sequentially with tagbody-tag (special form)")
((go tagbody-tag) transfers-control "Transfer control to the tag-body block (special format)")
((unwind-protect form cleanup-form *) <object>  "Execute cleanup-form whenever you finish the evaluation of form (special form)")

;;; declare
((THE class-name form) <object> "Declare the class of the execution result of form as class-name (special form) ")
((ASSURE class-name form) <object> "Claim the class of the execution result of form as class-name, if it is different, an error will occur (special form) ")
((CONVERT obj class-name) <object> "Convert obj to class class-name (special form)")

;;; files
((probe-file filename) boolean "Check if the file with filename exists")
((file-position stream) <integer> "Return the current file position of stream stream")
((set-file-position stream z) <integer> "Set the file position of stream to z")
((file-length filename element-class) <integer> "Return the size of the filename file as an element-class file")

;;; formeval
((functionp obj) boolean "Check if obj is a function")
((function function-name) <function> "Returns a function named function-name (special form)")
((lambda lambda-list form *) <function> "Generate a lambda expression (special form)")
((labels ((function-name lambda-list form *) *) body-forms *) <object>  "It differs from flet in that it binds local functions in sequence (recursive definition is possible) (special form). ")
((flet ((function-name lambda-list form *) *) body-forms *) <object>  "Bind local functions (special form)")
((apply function obj * list) <object> "Apply function")
((funcall function obj *) <object> "Call function")
((defconstant name form) <symbol> "Declare a constant (special form)")
((defglobal name form) <symbol> "Declare a global variable (special form)")
((defdynamic name form) <symbol> "Declare a dynamic variable (special form)")
((defun function-name lambda-list form *) <symbol> "Define a function (special form)")

;;; io
((read input-stream + eos-error-p + eos-value +) <object> "Read as an S-expression from input-stream")
((read-char input-stream + eos-error-p + eos-value +) <object> "Read one character from input-stream")
((preview-char input-stream + eos-error-p + eos-value +) <object>  "Returns the next character to read (one character look-ahead, file position does not change)")
((read-line input-stream + eos-error-p + eos-value +) <object> "Read one line as a string")
((stream-ready-p input-stream) boolean "Is the stream readable?")
((format output-stream format-string obj *) <null> "Output obj according to format-string")
((format-char output-stream char) <null> "Output one character")
((format-float output-stream float) <null> "Output as a floating point number")
((format-fresh-line output-stream) <null> "Begin on a new line")
((format-integer output-stream integer radix) <null> "Output as an integer")
((format-object output-stream obj escape-p) <null> "Output as an object")
((format-tab output-stream column) <null> "Output tab")
((read-byte input-stream eos-error-p + eos-value +) <integer> "Read as a byte")
((write-byte z output-stream) <integer> "Write as a byte")

;;; list
((CONSP obj) boolean "Check if it is a cons")
((CONS obj1 obj2) <cons> "Generate cons")
((CAR cons) <object> "Take out the Car part of the cons")
((CDR cons) <object> "Take out the Cdr part of the cons")
((SET-CAR obj cons) <object> "Set in the Car part of the cons")
((SET-CDR obj cons) <object> "Set in the Cdr part of the cons")
((NULL obj) boolean "Check if it is null")
((LISTP obj) boolean "Check if it is a list")
((CREATE-LIST i initial-element +) <list> "Generates a list of length i initial values initial-element")
((LIST obj *) <list> "Generate a list with obj as an element")
((REVERSE list) <list> "Reverse the list (do not destroy the original list)")
((NREVERSE list) <list> "Reverse the list (the original list is destroyed)")
((APPEND list *) <list> "Concatenate lists")
((MEMBER obj list) <list>  "If the list list contains obj, it returns a partial list starting with obj.")
((MAPCAR function list +) <list> "Execute the function function on the elements of list list and returns a list of results")
((MAPC function list +) <list>  "Execute the function function on the elements of list list and returns a list of arguments list")
((MAPCAN function list +) <list>  "Execute MAPCAR operations by destroying list")
((MAPLIST function list +) <list>  "Execute the function function on a partial list of list list and returns a list of results")
((MAPL function list +) <list>  "Executes the function function on a partial list of list list and returns the argument list list")
((MAPCON function list +) <list> "Execute MAPLIST operations by destroying list")
((ASSOC obj association-list) <cons>  "Return an obj-keyed value for the association-list")

;;; macro
((defmacro macro-name lambda-list form *) <symbol> "Define a macro (special form)")

;;; misc
((IDENTITY obj) <object> "Return obj as is")
((GET-UNIVERSAL-TIME) <integer> "Returns universal time (seconds)")
((GET-INTERNAL-RUN-TIME) <integer> "Return the execution time")
((GET-INTERNAL-REAL-TIME) <integer> "Return elapsed time")
((internal-time-units-per-second) <integer> "Return internal time units per second")

;;; number
((NUMBERP obj) boolean "Test if 'obj' is a number")
((PARSE-NUMBER string) <number> "Parse the string 'string' and convert it into a number")
((= x1 x2) boolean "Test if two numeric values are equal")
((/= x1 x2) boolean "Test if two numeric values are not equal")
((>= x1 x2) boolean "Test if numeric value 'x1' is greater than or equal to 'x2'")
((<= x1 x2) boolean "Test if numeric value 'x1' is less than or equal to 'x2'")
((> x1 x2) boolean "Test if numeric value 'x1' is greater than 'x2'")
((< x1 x2) boolean "Test if numeric value 'x1' is less than 'x2'")
((+ x *) <number> "Sum of the numbers 'x ...'")
((* x *) <number> "Product of the numbers 'x ...'")
((- x y *) <number> "数値を減算する")
((QUOTIENT dividend divisor +) <number> "数値を除算する")
((RECIPROCAL x) <number> "数値を逆数にする")
((MAX x y *) <number> "数値の最大値を返す")
((MIN x y *) <number> "数値の最小値を返す")
((ABS x) <number> "数値の絶対値を返す")
((EXP x) <number> "数値の指数関数の値を返す")
((LOG x) <number> "数値の自然対数の値を返す")
((EXPT x1 x2) <number> "数値をべき乗する")
((SQRT x) <number> "数値の平方根を返す")
((SIN x) <number> "数値の sin 関数の値を返す")
((COS x) <number> "数値の cos 関数の値を返す")
((TAN x) <number> "数値の tan 関数の値を返す")
((ATAN x) <number> "数値の atan 関数の値を返す")
((ATAN2 x1 x2) <number> "数値の atan2 関数の値を返す")
((SINH x) <number> "数値の sinh 関数の値を返す")
((COSH x) <number> "数値の cosh 関数の値を返す")
((TANH x) <number> "数値の tanh 関数の値を返す")
((ATANH x) <number> "数値の atanh 関数の値を返す")
((FLOATP obj) boolean "obj が浮動小数点数であるかをチェックする")
((FLOAT x) <float> "数型 x を浮動小数点数に変換する")
((FLOOR x) <integer> "切り下げを行なう")
((CEILING x) <integer> "切り上げを行なう")
((TRUNCATE x) <integer> "0方向に丸める")
((ROUND x) <integer> "四捨五入を行なう")
((INTEGERP obj) boolean "obj が整数であるかをチェックする")
((DIV z1 z2) <integer> "数値を整数除算する")
((MOD z1 z2) <integer> "数値を剰余計算する")
((GCD z1 z2) <integer> "最大公約数を返す")
((LCM z1 z2) <integer> "最小公倍数を返す")
((ISQRT z) <integer> "整数平方根を返す")

;;; object
((defclass class-name (sc-name *) (slot-spec *) class-opt *) <symbol>  "Define a class (special form)")
((generic-function-p obj) boolean "Test of 'obj' is a generic function")
((defgeneric func-spec lambda-list option * method-desc *) <symbol>  "Define a generic function (special form)")
((defmethod func-spec method-qualifier * parameter-profile form *) <symbol> "Define a method (special form)")
((call-next-method) <object> "Call the next method in a class's precedence order (special form)")
((next-method-p) boolean "Test if a next method exists (special form)")
((create class initarg * initval *) <object> "Create an instance of a class (generic function)")
((initialize-object instance initialization-list) <object> "Initialize an object")
((class-of obj) <class> "Return the class of an object")
((instancep obj class) boolean "Test whether 'obj' is an instance of 'class'")
((subclassp class1 class2) boolean "Test for a subclass relation")
((class class-name) <class> "Return the class named 'class-name' (special form)")

;;; pred
((EQ obj1 obj2) boolean "Test whether obj1 and obj2 are 'eq'")
((EQL obj1 obj2) boolean "Test whether obj1 and obj2 are 'eql'")
((EQUAL obj1 obj2) boolean "Test whether obj1 and obj2 are 'equal'")
((NOT obj) boolean "Return the logical NOT of 'obj'")
((AND form *) <object> "Logical AND of the forms 'form ...' (special form)")
((OR form *) <object> "logical OR of the forms 'form ...' (special form)")

;;; seq
((LENGTH sequence) <integer> "Return the length of 'sequence'")
((ELT sequence z) <object> "Return element no. 'z' of 'sequence'")
((SET-ELT obj sequence z) <object> "Set item 'z' of 'sequence' to 'obj'")
((SUBSEQ sequence z1 z2) sequence "Get the portion of 'sequence' from indexes z1 to z2")
((MAP-INTO destination function seq *) sequence  "Apply 'function' to the elements of 'sequence' in turn, then store the results in 'destination'")

;;; stream
((streamp obj) boolean "Predicate that is true for streams")
((open-stream-p obj) boolean "Predicate is true for open streams")
((input-stream-p obj) boolean "Predicate that is true for input streams")
((output-stream-p obj) boolean "Predicate that is true for output streams")
((standard-input) <stream> "Return the standard input stream")
((standard-output) <stream> "Return the standard output stream")
((error-output) <stream> "Return the standard error stream")
((with-standard-input stream-form form *) <object>  "Evaluate the forms form ... with standard-output set to the result of 'steram-form' (special form)")
((with-standard-output stream-form form *) <object> "Evaluate the forms form ... with standard-output set to the result of 'steram-form' (special form)")
((with-error-output stream-form form *) <object>  "Evaluate the forms form ... with standard-error set to the result of 'stream-form' (special form)")
((open-input-file filename element-class +) <stream> "Open the file 'filename' as an input stream")
((open-output-file filename element-class +) <stream> "Open the file 'filename' as an output stream")
((open-io-file filename element-class +) <stream> "Open the file 'filename' for as an input/output stream")
((with-open-input-file (name file element-class +) form *) <object> "Evaluate 'form' with standard-input redirected from 'file' and afterwards close it (special form)")
((with-open-output-file (name file element-class +) form *) <object> "Evaluate 'form' with standard-output redirected to 'file' and afterwards close it (special form)")
((with-open-io-file (name file element-class +) form *) <object> "Evaluate 'form' with both standard-input and standard-output streams redirected to/from 'file' and afterwards close it (special form)")
((close stream) implementation-defined "Close a stream")
((create-string-input-stream string) <stream> "Create a string input stream")
((create-string-output-stream) <stream> "Create a string output stream")
((get-output-stream-string stream) <string> "Return a string containing the output that was sent to a string output stream")

;;; string
((STRINGP obj) boolean "Predicate that is true for strings")
((CREATE-STRING i initial-element+) <string> "Create a string of length 'i' filled with 'initial-element'")
((STRING= string1 string2) quasi-boolean "Are two strings equal?")
((STRING/= string1 string2) quasi-boolean "Are two strings not equal?")
((STRING< string1 string2) quasi-boolean "Is 'string1' before 'string2' in sort order?")
((STRING> string1 string2) quasi-boolean "Is 'string1' after 'string2' in sort order?")
((STRING>= string1 string2) quasi-boolean "Is 'string1' after or equal to 'string2' in sort order?")
((STRING<= string1 string2) quasi-boolean "Is 'string1' before or equal to 'string2' in sort order?")
((CHAR-INDEX character string start-position +) <object> "Return the position where 'character' occurs in 'string'")
((STRING-INDEX substring string start-position +) <object> "Return the position where 'substring' occurs in 'string'")
((STRING-APPEND string *) <string> "Concatenate the strings string ...")

;;; symbol
((SYMBOLP obj) boolean "Predicate that is true for <symbol> objects")
((PROPERTY symbol property-name obj +) <object> "Return a property of a symbol")
((SET-PROPERTY obj symbol property-name) <object> "Set a property of a symbol")
((REMOVE-PROPERTY symbol property-name) <object> "Remove a property from a symbol")
((GENSYM) <symbol> "Create an anonymous symbol")

;;; vector
((BASIC-VECTOR-P obj) boolean "Predicate that is true for <basic-vector> objects")
((GENERAL-VECTOR-P obj) boolean "Predicate that is true for <general-vector> objects")
((CREATE-VECTOR i initial-element +) <general-vector>  "Create a vector of length 'i', with each element initialised to 'initial-element'")
((VECTOR obj *) <general-vector> "Create a vector from the elements obj ...")

;;; OKI ISlisp
((load file) T "Load 'file' (extension)" )
((time form) <object> "Show the time to evaluate 'form' (special form) (extension)")
;((room) <null> "現在のメモリ使用状況を表示する（拡張）")
((eval form) <object> "Evaluate 'form' (extension)")
;((list* obj *) <list>  "関数 list とほぼ同じであるが最後の引数を最後のコンスの CDR 部に格納する（拡張）")
;((append* obj *) <list>  "関数 append とほぼ同じであるが最後の引数を最後のコンスの CDR 部に格納する（拡張）")
;((nth n list) <object> "list の n 番目の要素を返す（拡張）") 
;((compile fun) boolean "関数 fun をコンパイルする(拡張)")
((compile-file file) boolean "Compile 'file' (extension)")
;((compile-files dst-fname src-fname *) boolean  "src-fname の複数のファイルを dst-fname のファイルにコンパイルする(拡張)")
;((descibe obj) idef "obj の内容を表示する（拡張）")
((gbc) <null> "Force garbage collection (extension)")
;((write object stream +) <null> "object を stream に表示する(拡張)")
((quit) transfers-control "Exit the ISLisp interpreter (extension)")
