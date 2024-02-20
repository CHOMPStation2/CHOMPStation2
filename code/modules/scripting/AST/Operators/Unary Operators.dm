/*
	File: Unary Operators
*/
/*
	Class: unary
	Represents a unary operator in the AST. Unary operators take a single operand (referred to as x below) and return a value.
*/
<<<<<<< HEAD
/node/expression/op/unary
=======
/node/expression/operator/unary
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	precedence=OOP_UNARY

/*
	Class: LogicalNot
	Returns !x.

	Example:
	!true = false and !false = true
*/
//
<<<<<<< HEAD
/node/expression/op/unary/LogicalNot
=======
/node/expression/operator/unary/LogicalNot
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	name="logical not"

/*
	Class: BitwiseNot
	Returns the value of a bitwise not operation performed on x.

	Example:
	~10 (decimal 2) = 01 (decimal 1).
*/
//
<<<<<<< HEAD
/node/expression/op/unary/BitwiseNot
=======
/node/expression/operator/unary/BitwiseNot
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	name="bitwise not"

/*
	Class: Minus
	Returns -x.
*/
//
<<<<<<< HEAD
/node/expression/op/unary/Minus
=======
/node/expression/operator/unary/Minus
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	name="minus"

/*
	Class: group
	A special unary operator representing a value in parentheses.
*/
//
<<<<<<< HEAD
/node/expression/op/unary/group
	precedence=OOP_GROUP

/node/expression/op/unary/New(node/expression/exp)
=======
/node/expression/operator/unary/group
	precedence=OOP_GROUP

/node/expression/operator/unary/New(node/expression/exp)
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	src.exp=exp
	return ..()
