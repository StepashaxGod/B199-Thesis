/ Add two numbers

ORG 10

START,  LDA NUM1
        ADD NUM2
        STA RESULT
        HLT

NUM1,   DEC 25
NUM2,   DEC 5
RESULT, DEC 0

END
