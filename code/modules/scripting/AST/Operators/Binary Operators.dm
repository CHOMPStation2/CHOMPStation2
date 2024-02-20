//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:33

/*
	File: Binary Operators
*/
/*
	Class: binary
	Represents a binary operator in the AST. A binary operator takes two operands (ie x and y) and returns a value.
*/
<<<<<<< HEAD
/node/expression/op/binary
=======
/node/expression/operator/binary
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	var/node/expression/exp2

////////// Comparison Operators //////////
/*
	Class: Equal
	Returns true if x = y.
*/
//
<<<<<<< HEAD
/node/expression/op/binary/Equal
=======
/node/expression/operator/binary/Equal
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	precedence=OOP_EQUAL

/*
	Class: NotEqual
	Returns true if x and y aren't equal.
*/
//
<<<<<<< HEAD
/node/expression/op/binary/NotEqual
=======
/node/expression/operator/binary/NotEqual
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	precedence=OOP_EQUAL

/*
	Class: Greater
	Returns true if x > y.
*/
//
<<<<<<< HEAD
/node/expression/op/binary/Greater
=======
/node/expression/operator/binary/Greater
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	precedence=OOP_COMPARE

/*
	Class: Less
	Returns true if x < y.
*/
//
<<<<<<< HEAD
/node/expression/op/binary/Less
=======
/node/expression/operator/binary/Less
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	precedence=OOP_COMPARE

/*
	Class: GreaterOrEqual
	Returns true if x >= y.
*/
//
<<<<<<< HEAD
/node/expression/op/binary/GreaterOrEqual
=======
/node/expression/operator/binary/GreaterOrEqual
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	precedence=OOP_COMPARE

/*
	Class: LessOrEqual
	Returns true if x <= y.
*/
//
<<<<<<< HEAD
/node/expression/op/binary/LessOrEqual
=======
/node/expression/operator/binary/LessOrEqual
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	precedence=OOP_COMPARE


////////// Logical Operators //////////

/*
	Class: LogicalAnd
	Returns true if x and y are true.
*/
//
<<<<<<< HEAD
/node/expression/op/binary/LogicalAnd
=======
/node/expression/operator/binary/LogicalAnd
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	precedence=OOP_AND

/*
	Class: LogicalOr
	Returns true if x, y, or both are true.
*/
//
<<<<<<< HEAD
/node/expression/op/binary/LogicalOr
=======
/node/expression/operator/binary/LogicalOr
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	precedence=OOP_OR

/*
	Class: LogicalXor
	Returns true if either x or y but not both are true.
*/
//
<<<<<<< HEAD
/node/expression/op/binary/LogicalXor					//Not implemented in nS
=======
/node/expression/operator/binary/LogicalXor					//Not implemented in nS
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	precedence=OOP_OR


////////// Bitwise Operators //////////

/*
	Class: BitwiseAnd
	Performs a bitwise and operation.

	Example:
	011 & 110 = 010
*/
//
<<<<<<< HEAD
/node/expression/op/binary/BitwiseAnd
=======
/node/expression/operator/binary/BitwiseAnd
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	precedence=OOP_BIT

/*
	Class: BitwiseOr
	Performs a bitwise or operation.

	Example:
	011 | 110 = 111
*/
//
<<<<<<< HEAD
/node/expression/op/binary/BitwiseOr
=======
/node/expression/operator/binary/BitwiseOr
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	precedence=OOP_BIT

/*
	Class: BitwiseXor
	Performs a bitwise exclusive or operation.

	Example:
	011 xor 110 = 101
*/
//
<<<<<<< HEAD
/node/expression/op/binary/BitwiseXor
=======
/node/expression/operator/binary/BitwiseXor
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	precedence=OOP_BIT


////////// Arithmetic Operators //////////

/*
	Class: Add
	Returns the sum of x and y.
*/
//
<<<<<<< HEAD
/node/expression/op/binary/Add
=======
/node/expression/operator/binary/Add
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	precedence=OOP_ADD

/*
	Class: Subtract
	Returns the difference of x and y.
*/
//
<<<<<<< HEAD
/node/expression/op/binary/Subtract
=======
/node/expression/operator/binary/Subtract
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	precedence=OOP_ADD

/*
	Class: Multiply
	Returns the product of x and y.
*/
//
<<<<<<< HEAD
/node/expression/op/binary/Multiply
=======
/node/expression/operator/binary/Multiply
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	precedence=OOP_MULTIPLY

/*
	Class: Divide
	Returns the quotient of x and y.
*/
//
<<<<<<< HEAD
/node/expression/op/binary/Divide
=======
/node/expression/operator/binary/Divide
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	precedence=OOP_MULTIPLY

/*
	Class: Power
	Returns x raised to the power of y.
*/
//
<<<<<<< HEAD
/node/expression/op/binary/Power
=======
/node/expression/operator/binary/Power
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	precedence=OOP_POW

/*
	Class: Modulo
	Returns the remainder of x / y.
*/
//
<<<<<<< HEAD
/node/expression/op/binary/Modulo
=======
/node/expression/operator/binary/Modulo
>>>>>>> 7c8bb85de3... Whitespace Standardization [MDB IGNORE] (#15748)
	precedence=OOP_MULTIPLY
