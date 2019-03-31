
const n0 = F => x => x
const n1 = F => x => F(x) 
const n2 = F => x => F(F(x)) 
const INC = n => F => y => F((n (F) (y)))
const PLUS = n => m => n (INC) (m)
const MULT = n => m => n (PLUS (m)) (n0)
const PAIR = a => b => s => s (a) (b)
const FST = a => b => a
const SND = a => b => b
const NexPair = p => PAIR (p (SND)) (INC (p (SND)))
const DECR = n => IF (ISZERO (n))(n0)((n (NexPair (PAIR (n0) (n0)))) (FST))
const SUB = n => m => n (DECR) (m)
const IF = C => x => y => C (x) (y)
const TRUE = x => y => x
const FALSE = x => y => y
const ISZERO = n => n (x=>FALSE) (TRUE)
const LEQ = n => m => ISZERO (SUB (m) (n))
const FACT_ = f => n => IF (LEQ (n) (n1)) (n1) (MULT (n) (((f (f))(DECR(n)))))
const FACT = FACT_ (FACT_)
const FIBO_ = f => n => IF (LEQ (n) (n1)) (n1) (PLUS (()=>(f (f)) (DECR (n))) (()=>(f (f)) (SUB (n2)(n))))
const FIBO = FIBO_ (FIBO_)


//outputs: 
console.log(n1(x=>x+1) (0))								//1
console.log(INC (n1) (x=>x+1) (0))						//2
console.log(PLUS (n2) (n1) (x=>x+1) (0))				//3
console.log(MULT (n2) (PLUS (n1) (n2)) (x=>x+1) (0))	//6
console.log(DECR (n2) (x=>x+1) (0))						//1
console.log(SUB (n1) (n2) (x=>x+1) (0))					//1
console.log((ISZERO (n1)) ("true") ("false"))			//false
console.log((ISZERO (n0)) ("true") ("false"))			//true
console.log((LEQ (n0) (n1)) ("true") ("false"))			//true
console.log((LEQ (n1) (n1)) ("true") ("false"))			//true
console.log((LEQ (n2) (n1)) ("true") ("false"))			//false
console.log((FACT (n2)) (x=>x+1) (0))
console.log((FIBO (n0)) (x=>x+1) (0))
