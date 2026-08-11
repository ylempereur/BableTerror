RANDOM  MACRO   #MIN,#MAX
        LD      B,#MAX-#MIN+1
        CALL    RAND
        ADD     A,#MIN
        ENDM
DINT    MACRO
        LD      A,0F0H
        OR      3
        LD      (IT#$YM),A
IT#$YM  NOP
        XOR     A
        LD      (IT#$YM),A
        ENDM
;---------------------------------
VIDEO   EQU     3C00H
STACK   EQU     $
SCR     DEFS    1024
        DEFS    64
SCRTIR  DEFS    1024
DCB     DEFS    64
DEMO    DEFS    1
NPLAY   DEFS    1
HSCORE  EQU     $+10
TSCOR   DEFS    10*(10+6)
        COND    TYPE=PROT
        DEFS    96
        ENDC
TBAD    DEFS    9*5
MZXY    DEFS    274*2
MAZE    DEFS    274
CH      DEFB    0
PH      DEFW    0
PHH     DEFW    0
XH      DEFB    0
XHH     DEFB    0
YH      DEFB    0
CVD     DEFB    0
CVF     DEFB    0
PV      DEFW    0
PVV     DEFW    0
XV      DEFB    0
XVV     DEFB    0
YV      DEFB    0
Z1      DEFB    0
Z2      DEFB    0
Z3      DEFB    0
Z4      DEFB    0
K       DEFW    0
PR      DEFW    0
SCORE1  DEFM    '000000'
SCORE2  DEFM    '000000'
SHP1    DEFB    0
SHP2    DEFB    0
LAST1   DEFB    '0'
LAST2   DEFB    '0'
DIS1    DEFB    0
DIS2    DEFB    0
DVBB1   DEFM    '000000'
DVBB2   DEFM    '000000'
PLAY    DEFB    0
BLINK   DEFB    0
BASE    DEFB    0
WBAS    DEFB    0
COUNT   DEFB    0
X       DEFB    0
MX      DEFB    0
Y       DEFB    0
MY      DEFB    0
PX      DEFB    0
PY      DEFB    0
DECX    DEFB    0
DECY    DEFB    0
PXS     DEFB    0
PYS     DEFB    0
DIRE    DEFB    0
NCROI   DEFB    0
DEMDIR  DEFB    0
WBAB    DEFM    '000000'
TINIT   DEFM    '000000'
        DEFM    '000000'
        DEFB    3
        DEFB    3
        DEFB    '0'
        DEFB    '0'
        DEFB    3
        DEFB    3
        DEFM    '000300'
        DEFM    '000300'
        DEFB    1
        DEFB    0
TINIT0  DEFB    0
        DEFB    32
        DEFB    0
        DEFB    0
        DEFB    6
        DEFB    0
        DEFB    8
        DEFB    1
        DEFB    1
        DEFB    0
        DEFB    0
        DEFB    2
        DEFB    5
        DEFB    0
        DEFB    10
        DEFB    0
        DEFM    '000000'
BABTER  DEFW    8080H   ; 1E LIGNE
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8F8FH
        DEFW    8F8FH
        DEFW    0BF8FH
        DEFW    80BCH
        DEFW    8080H
        DEFW    8F80H
        DEFW    8F8FH
        DEFW    808FH
        DEFW    8080H
        DEFW    8F8FH
        DEFW    8F8FH
        DEFW    0BF8FH
        DEFW    80BCH
        DEFW    8F80H
        DEFW    808FH
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8F8FH
        DEFW    8F8FH
        DEFW    8F8FH
        DEFW    8F8FH
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H   ; 2E LIGNE
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    0BCBCH
        DEFW    0BCBCH
        DEFW    0BFBCH
        DEFW    0B0B3H
        DEFW    8080H
        DEFW    0BCBCH
        DEFW    0BCBCH
        DEFW    0BCBCH
        DEFW    8080H
        DEFW    0BCBCH
        DEFW    0BCBCH
        DEFW    0BFBCH
        DEFW    0B0B3H
        DEFW    0BC80H
        DEFW    80BCH
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    0BCBCH
        DEFW    0BCBCH
        DEFW    0BCBCH
        DEFW    0BCBCH
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H   ; 3E LIGNE
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    0BFBFH
        DEFW    0B0B0H
        DEFW    0B0B0H
        DEFW    0BFBFH
        DEFW    0BA80H
        DEFW    85BFH
        DEFW    8080H
        DEFW    0BF8AH
        DEFW    80B5H
        DEFW    0BFBFH
        DEFW    0B0B0H
        DEFW    0B0B0H
        DEFW    0BFBFH
        DEFW    0BF80H
        DEFW    0B0BFH
        DEFW    0B0B0H
        DEFW    0B0B0H
        DEFW    80B0H
        DEFW    0BFBFH
        DEFW    0B0B0H
        DEFW    0B0B0H
        DEFW    0B0B0H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H   ; 4E LIGNE
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8383H
        DEFW    8383H
        DEFW    8383H
        DEFW    8083H
        DEFW    8380H
        DEFW    8083H
        DEFW    8080H
        DEFW    8380H
        DEFW    8083H
        DEFW    8383H
        DEFW    8383H
        DEFW    8383H
        DEFW    8083H
        DEFW    8380H
        DEFW    8383H
        DEFW    8383H
        DEFW    8383H
        DEFW    8083H
        DEFW    8383H
        DEFW    8383H
        DEFW    8383H
        DEFW    8383H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H   ; 5E LIGNE
        DEFW    8080H
        DEFW    8A80H
        DEFW    8F8FH
        DEFW    8F8FH
        DEFW    8F8FH
        DEFW    858FH
        DEFW    8F8AH
        DEFW    8F8FH
        DEFW    8F8FH
        DEFW    8F8FH
        DEFW    8A85H
        DEFW    8F8FH
        DEFW    8F8FH
        DEFW    0AF8FH
        DEFW    94BDH
        DEFW    8F8AH
        DEFW    8F8FH
        DEFW    8F8FH
        DEFW    0BDAFH
        DEFW    8894H
        DEFW    8F8EH
        DEFW    8F8FH
        DEFW    8F8FH
        DEFW    848DH
        DEFW    8F8AH
        DEFW    8F8FH
        DEFW    8F8FH
        DEFW    0BDAFH
        DEFW    8094H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H   ; 6E LIGNE
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    0BCA8H
        DEFW    8094H
        DEFW    8080H
        DEFW    0BCA8H
        DEFW    0BCBCH
        DEFW    0BCBCH
        DEFW    0BCBCH
        DEFW    0A894H
        DEFW    0BCBCH
        DEFW    0BCBCH
        DEFW    0BEBCH
        DEFW    859FH
        DEFW    0BCA8H
        DEFW    0BCBCH
        DEFW    0BCBCH
        DEFW    9FBEH
        DEFW    0A885H
        DEFW    94BCH
        DEFW    8080H
        DEFW    0A880H
        DEFW    94BCH
        DEFW    0BCA8H
        DEFW    0BCBCH
        DEFW    0BCBCH
        DEFW    9FBEH
        DEFW    8085H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H   ; 7E LIGNE
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    0BFAAH
        DEFW    8095H
        DEFW    8080H
        DEFW    0BFAAH
        DEFW    0B0B5H
        DEFW    0B0B0H
        DEFW    0B0B0H
        DEFW    0AA90H
        DEFW    95BFH
        DEFW    8080H
        DEFW    0BF8BH
        DEFW    80B4H
        DEFW    0BFAAH
        DEFW    8095H
        DEFW    8B80H
        DEFW    0B4BFH
        DEFW    0AA80H
        DEFW    0B5BFH
        DEFW    0B0B0H
        DEFW    0BAB0H
        DEFW    95BFH
        DEFW    0BFAAH
        DEFW    8095H
        DEFW    8B80H
        DEFW    0B4BFH
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H   ; 8E LIGNE
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    8382H
        DEFW    8081H
        DEFW    8080H
        DEFW    8382H
        DEFW    8383H
        DEFW    8383H
        DEFW    8383H
        DEFW    8281H
        DEFW    8183H
        DEFW    8080H
        DEFW    8280H
        DEFW    8183H
        DEFW    8382H
        DEFW    8081H
        DEFW    8080H
        DEFW    8382H
        DEFW    8081H
        DEFW    8382H
        DEFW    8383H
        DEFW    8383H
        DEFW    8081H
        DEFW    8382H
        DEFW    8081H
        DEFW    8080H
        DEFW    8382H
        DEFW    8081H
        DEFW    8080H
        DEFW    8080H
BT0     DEFM    'By  Y. Lempereur'
        DEFM    'Copyright (C) 1982 by  Funsoft, Inc.'
        DEFM    '28611 Canwood, Agoura, CA 91301 (213) 991-6540'
GHOST   DEFW    0AFB8H
        DEFW    0B49FH
        DEFW    0BDAFH
        DEFW    9FBEH
        DEFW    8080H
        DEFW    8080H
        DEFW    0BCA0H
        DEFW    90BCH
        DEFW    0B6BFH
        DEFW    0BFB9H
        DEFW    8382H
        DEFW    8183H
        DEFW    0B080H
        DEFW    80B0H
        DEFW    9BBEH
        DEFW    0BDA7H
        DEFW    8F8BH
        DEFW    878FH
GHOSTL  DEFW    0BF98H
        DEFW    0B4AFH
        DEFW    0BCAFH
        DEFW    9FBFH
        DEFW    8080H
        DEFW    8080H
        DEFW    0BCA0H
        DEFW    90BCH
        DEFW    0B3BDH
        DEFW    0BFBEH
        DEFW    8382H
        DEFW    8183H
        DEFW    0B080H
        DEFW    80B0H
        DEFW    8FB6H
        DEFW    0BDBBH
        DEFW    8F8BH
        DEFW    878FH
GHOSTR  DEFW    9FB8H
        DEFW    0A4BFH
        DEFW    0BFAFH
        DEFW    9FBCH
        DEFW    8080H
        DEFW    8080H
        DEFW    0BCA0H
        DEFW    90BCH
        DEFW    0BDBFH
        DEFW    0BEB3H
        DEFW    8382H
        DEFW    8183H
        DEFW    0B080H
        DEFW    80B0H
        DEFW    0B7BEH
        DEFW    0B98FH
        DEFW    8F8BH
        DEFW    878FH
GHOSTU  DEFW    9BB8H
        DEFW    0B4A7H
        DEFW    0BFAFH
        DEFW    9FBFH
        DEFW    8080H
        DEFW    8080H
        DEFW    0ACA0H
        DEFW    909CH
        DEFW    0BDBFH
        DEFW    0BFBEH
        DEFW    8382H
        DEFW    8183H
        DEFW    0B080H
        DEFW    80B0H
        DEFW    0B6BEH
        DEFW    0BDB9H
        DEFW    8F8BH
        DEFW    878FH
GHOSTD  DEFW    0BFB8H
        DEFW    0B4BFH
        DEFW    0B6AFH
        DEFW    9FB9H
        DEFW    8080H
        DEFW    8080H
        DEFW    0BCA0H
        DEFW    90BCH
        DEFW    9BBFH
        DEFW    0BFA7H
        DEFW    8382H
        DEFW    8183H
        DEFW    0B080H
        DEFW    80B0H
        DEFW    0AFBEH
        DEFW    0BD9FH
        DEFW    8D8BH
        DEFW    878EH
TADD    DEFW    GHOST
        DEFW    GHOSTL
        DEFW    GHOSTR
        DEFW    GHOSTU
        DEFW    GHOSTD
TREC    DEFB    0*12
        DEFB    1*12
        DEFB    2*12
TCROI   DEFW    0AE88H
        DEFW    849DH
        DEFW    8080H
        DEFW    8080H
        DEFW    0B8A0H
        DEFW    90B4H
        DEFW    8280H
        DEFW    8081H
        DEFW    0A080H
        DEFW    8090H
        DEFW    8B82H
        DEFW    8187H
        DEFW    99A2H
        DEFW    91A6H
        DEFW    8080H
        DEFW    8080H
        DEFW    0A488H
        DEFW    8498H
        DEFW    8182H
        DEFW    8182H
        DEFW    90A0H
        DEFW    90A0H
        DEFW    8688H
        DEFW    8489H
BADLD   DEFW    0BFB6H
        DEFW    94BBH
        DEFW    0B4B5H
        DEFW    95B4H
        DEFW    8080H
        DEFW    8080H
        DEFW    0BC98H
        DEFW    90ACH
        DEFW    9397H
        DEFW    9593H
        DEFW    8383H
        DEFW    8183H
        DEFW    0B0A0H
        DEFW    80B0H
        DEFW    8F9DH
        DEFW    958EH
        DEFW    8D8DH
        DEFW    858DH
BADRD   DEFW    0B7A8H
        DEFW    0B9BFH
        DEFW    0B8AAH
        DEFW    0BAB8H
        DEFW    8080H
        DEFW    8080H
        DEFW    9CA0H
        DEFW    0A4BCH
        DEFW    0A3AAH
        DEFW    0ABA3H
        DEFW    8382H
        DEFW    8383H
        DEFW    0B080H
        DEFW    90B0H
        DEFW    8DAAH
        DEFW    0AE8FH
        DEFW    8E8AH
        DEFW    8E8EH
BADLU   DEFW    0BFB6H
        DEFW    94BBH
        DEFW    8D8DH
        DEFW    858DH
        DEFW    8080H
        DEFW    8080H
        DEFW    0BC98H
        DEFW    90ACH
        DEFW    0B7B7H
        DEFW    95B7H
        DEFW    8080H
        DEFW    8080H
        DEFW    0B0A0H
        DEFW    80B0H
        DEFW    9F9DH
        DEFW    959EH
        DEFW    8383H
        DEFW    8183H
BADRU   DEFW    0B7A8H
        DEFW    0B9BFH
        DEFW    8E8AH
        DEFW    8E8EH
        DEFW    8080H
        DEFW    8080H
        DEFW    9CA0H
        DEFW    0A4BCH
        DEFW    0BBAAH
        DEFW    0BBBBH
        DEFW    8080H
        DEFW    8080H
        DEFW    0B080H
        DEFW    90B0H
        DEFW    0ADAAH
        DEFW    0AEAFH
        DEFW    8382H
        DEFW    8383H
FANTL   DEFW    8FB6H
        DEFW    94BBH
        DEFW    8F82H
        DEFW    80B7H
        DEFW    8080H
        DEFW    8080H
        DEFW    0BC98H
        DEFW    90ACH
        DEFW    0BC8BH
        DEFW    819FH
        DEFW    8080H
        DEFW    8083H
        DEFW    0B0A0H
        DEFW    80B0H
        DEFW    0B3ADH
        DEFW    85BEH
        DEFW    8380H
        DEFW    808DH
FANTR   DEFW    0B7A8H
        DEFW    0B98FH
        DEFW    0BB80H
        DEFW    818FH
        DEFW    8080H
        DEFW    8080H
        DEFW    9CA0H
        DEFW    0A4BCH
        DEFW    0AF82H
        DEFW    87BCH
        DEFW    8380H
        DEFW    8080H
        DEFW    0B080H
        DEFW    90B0H
        DEFW    0BD8AH
        DEFW    9EB3H
        DEFW    8E80H
        DEFW    8083H
DIABL   DEFW    0B0A8H
        DEFW    80B4H
        DEFW    0B3ADH
        DEFW    85BEH
        DEFW    8080H
        DEFW    8080H
        DEFW    80A0H
        DEFW    8090H
        DEFW    8FB6H
        DEFW    94BBH
        DEFW    8382H
        DEFW    8083H
        DEFW    8080H
        DEFW    8080H
        DEFW    0BC9AH
        DEFW    90ADH
        DEFW    8C8BH
        DEFW    818FH
DIABR   DEFW    0B880H
        DEFW    94B0H
        DEFW    0BD8AH
        DEFW    9EB3H
        DEFW    8080H
        DEFW    8080H
        DEFW    0A080H
        DEFW    9080H
        DEFW    0B7A8H
        DEFW    0B98FH
        DEFW    8380H
        DEFW    8183H
        DEFW    8080H
        DEFW    8080H
        DEFW    9EA0H
        DEFW    0A5BCH
        DEFW    8F82H
        DEFW    878CH
TABD    DEFW    BADLD
        DEFW    BADLU
        DEFW    FANTL
        DEFW    DIABL
TABR    DEFB    0*36
        DEFB    1*36
TABC    DEFB    0*12
        DEFB    1*12
        DEFB    2*12
BABL    DEFW    0BF98H
        DEFW    90ADH
        DEFW    9C9FH
        DEFW    959FH
        DEFW    8080H
        DEFW    8080H
        DEFW    0BCA0H
        DEFW    80B4H
        DEFW    0B3BDH
        DEFW    95BEH
        DEFW    8181H
        DEFW    8181H
        DEFW    0B080H
        DEFW    8090H
        DEFW    8FB6H
        DEFW    94BBH
        DEFW    8787H
        DEFW    8587H
BABR    DEFW    9EA0H
        DEFW    0A4BFH
        DEFW    0AFAAH
        DEFW    0AFACH
        DEFW    8080H
        DEFW    8080H
        DEFW    0B880H
        DEFW    90BCH
        DEFW    0BDAAH
        DEFW    0BEB3H
        DEFW    8282H
        DEFW    8282H
        DEFW    0A080H
        DEFW    80B0H
        DEFW    0B7A8H
        DEFW    0B98FH
        DEFW    8B8AH
        DEFW    8B8BH
AFFLIN  LD      HL,SCR
        LD      DE,SCR+1
        LD      BC,3FH
        LD      (HL),8CH
        LDIR
        LD      HL,SCR+896
        LD      DE,SCR+897
        LD      BC,3FH
        LD      (HL),0B0H
        LDIR
        LD      HL,SCR
        LD      DE,SCR+3FH
        LD      B,0FH
        LD      A,0BCH
EFF1    LD      (HL),A
        LD      (DE),A
        PUSH    BC
        LD      BC,64
        ADD     HL,BC
        EX      DE,HL
        ADD     HL,BC
        EX      DE,HL
        POP     BC
        LD      A,0BFH
        DJNZ    EFF1
        RET
EFFPOI  LD      HL,3C00H
        LD      DE,3C01H
        LD      BC,3FH
        LD      (HL),8CH
        LDIR
        LD      HL,3F80H
        LD      DE,3F81H
        LD      BC,3FH
        LD      (HL),0B0H
        LDIR
        LD      HL,3C00H
        LD      DE,3C3FH
        LD      B,0FH
        LD      A,0BCH
EFF0    LD      (HL),A
        LD      (DE),A
        PUSH    BC
        LD      BC,64
        ADD     HL,BC
        EX      DE,HL
        ADD     HL,BC
        EX      DE,HL
        POP     BC
        LD      A,0BFH
        DJNZ    EFF0
        RET
AFFPOI  LD      A,(COPOI)
        INC     A
        AND     3
        CALL    SOUND
        LD      (COPOI),A
        LD      HL,3F80H
        LD      DE,-64
        LD      B,14
FPO0    OR      A
        JR      Z,FPO3
        CP      1
        JR      Z,FPO2
        CP      2
        JR      Z,FPO1
        LD      (HL),0BCH
        JR      FPO4
FPO1    LD      (HL),0B3H
        JR      FPO4
FPO2    LD      (HL),8FH
        JR      FPO4
FPO3    LD      (HL),0BFH
FPO4    INC     A
        CALL    SOUND
        AND     3
        ADD     HL,DE
        DJNZ    FPO0
        LD      A,(COPOI)
        LD      B,64
        CP      3
        JR      Z,FPO5
        OR      A
        JR      Z,FOP0
        LD      (HL),0BCH
        JR      FPO7
FOP0    LD      (HL),0B0H
        JR      FPO7
FPO5    OR      A
        CALL    SOUND
        JR      NZ,FPO6
        LD      (HL),80H
        JR      FPO7
FPO6    LD      (HL),8CH
FPO7    INC     HL
        CALL    SOUND
        DEC     A
        AND     3
        DJNZ    FPO5
        LD      A,(COPOI)
        OR      A
        JR      Z,FPO8
        CP      3
        JR      NC,FOP1
        DEC     HL
        LD      (HL),0BCH
        JR      FPO8
FOP1    DEC     HL
        LD      (HL),0B0H
FPO8    LD      HL,3C7FH
        CALL    SOUND
        LD      B,14
        LD      DE,64
FPO9    OR      A
        JR      Z,FPO12
        CP      1
        JR      Z,FPO11
        CP      2
        JR      Z,FPO10
        LD      (HL),8FH
        JR      FPO13
FPO10   LD      (HL),0B3H
        JR      FPO13
FPO11   LD      (HL),0BCH
        JR      FPO13
FPO12   LD      (HL),0BFH
        CALL    SOUND
FPO13   INC     A
        CALL    SOUND
        AND     3
        ADD     HL,DE
        DJNZ    FPO9
        LD      A,(COPOI)
        INC     A
        AND     3
        LD      B,62
        LD      HL,3FBEH
FPO14   OR      A
        JR      NZ,FPO15
        LD      (HL),80H
        JR      FPO16
FPO15   LD      (HL),0B0H
FPO16   DEC     HL
        CALL    SOUND
        DEC     A
        AND     3
        DJNZ    FPO14
        RET
COPOI   DEFB    0
DISPL   LD      A,(CMODE)
        OR      A
        JP      Z,SWEEP
        DEC     A
        JP      Z,ESSGLA
        DEC     A
        JP      Z,GRILL
        DEC     A
        JP      Z,ALEA
        DEC     A
        JP      Z,HGRILL
        DEC     A
        JP      Z,RADAR
        JP      SPIRE
CMODE   DEFB    0
COMMOD  LD      HL,CMODE
        LD      A,(HL)
        INC     A
        AND     7
        CP      7
        JR      NZ,COM0
        XOR     A
COM0    LD      (HL),A
        RET
SCR191  LD      HL,SCR
        LD      DE,SCR+1
        LD      (HL),0BFH
SCR0    LD      B,15
SCR1    PUSH    BC
        LD      BC,64
        LDIR
        CALL    SOUND
        POP     BC
        DJNZ    SCR1
        LD      BC,63
        LDIR
        CALL    SOUND
        RET
CLSVID  LD      HL,VIDEO
        LD      DE,VIDEO+1
CLS0    LD      (HL),80H
        JR      SCR0
CLSSCR  LD      DE,SCR+1
        LD      HL,SCR
        JR      CLS0
CLSTIR  LD      HL,SCRTIR
        LD      DE,SCRTIR+1
        LD      BC,1024+64-1
        LD      (HL),80H
        LDIR
        RET
AFF     LD      HL,SCR
        LD      DE,VIDEO
        LD      B,16
AFF0    PUSH    BC
        LD      BC,64
        LDIR
        CALL    SOUND
        POP     BC
        DJNZ    AFF0
        RET
RESET   LD      A,86H
        JR      TEST10
TEST    LD      A,46H
        JR      TEST10
SET     LD      A,0C6H
TEST10  LD      (INST0+1),A
        LD      A,D
        LD      B,0FFH
LOOP    INC     B
        SUB     3
        JP      P,LOOP
        ADD     A,3
        SLA     A
        LD      C,A
        LD      L,B
        LD      H,0
        LD      B,6
LOOP1   ADD     HL,HL
        DJNZ    LOOP1
        LD      D,0
        SRL     E
        JR      NC,CONT
        INC     C
CONT    ADD     HL,DE
BUFFER  LD      DE,VIDEO
        ADD     HL,DE
        SLA     C
        SLA     C
        SLA     C
INST0   LD      A,0
        ADD     A,C
        LD      (INST1+1),A
INST1   DEFB    0CBH
        DEFB    0
        RET
        COND    TYPE=TAPE
EHS     EQU     EHA
        ENDC
        COND    TYPE=DISK
FILES   DEFM    'BABLE/HSC'
        DEFB    0DH
EHS     LD      HL,FILES
        LD      DE,DCB
        LD      BC,13
        LDIR
        INIT    DCB,ERROR,SCR,10*(10+6)
        JR      NC,EHS0
        POSN    DCB,ERROR,0
        CALL    EHA
        WRITLR  DCB,ERROR,TSCOR
        JR      EHS1
EHS0    POSN    DCB,ERROR,0
        READLR  DCB,ERROR,TSCOR
        LD      A,0C9H
        LD      (EHS),A
EHS1    CLOSE   DCB,ERROR
        DINT
        RET
ERROR   JP      0
        ENDC
        COND    TYPE=PROT
EHS     CALL    READ
        LD      A,(TSCOR)
        OR      A
        JR      Z,EHS0
        LD      A,0C9H
        LD      (EHS),A
EHS1    DINT
        RET
EHS0    CALL    EHA
        CALL    WRITE
        JR      EHS1
READ    LD      HL,TSCOR
        JP      4402H
WRITE   LD      HL,TSCOR
        JP      4405H
        ENDC
EHA     LD      HL,TSCOR
        LD      DE,TSCOR+1
        LD      BC,10*(10+6)-1
        LD      (HL),0
        LDIR
        LD      HL,THS
        LD      DE,TSCOR
        LD      BC,16
        LDIR
        LD      A,0C9H
        LD      (EHS),A
        RET
THS     DEFM    'Yves L.   002790'
TADHS   DEFM    'HIGH  SCORES'
AFFHS   LD      HL,TADHS
        LD      DE,SCR+64+46
        LD      BC,12
        CALL    AFF1L
        LD      HL,SCR+128+42
        LD      B,20
AFH0    LD      (HL),8CH
        INC     HL
        DJNZ    AFH0
        LD      HL,SCR+64+41
        LD      DE,SCR+64+62
        LD      A,0BFH
        LD      B,12
AFH1    LD      (HL),A
        LD      (DE),A
        PUSH    BC
        LD      BC,64
        ADD     HL,BC
        EX      DE,HL
        ADD     HL,BC
        EX      DE,HL
        POP     BC
        DJNZ    AFH1
        LD      B,22
        LD      HL,SCR+832+41
AFH2    LD      (HL),83H
        INC     HL
        DJNZ    AFH2
        LD      DE,SCR+192+43
        LD      HL,TSCOR
        LD      B,10
AFH3    LD      A,(HL)
        OR      A
        RET     Z
        PUSH    BC
        LD      B,10
AFH4    CALL    AFF1C
        INC     DE
        INC     HL
        DJNZ    AFH4
        LD      A,' '
        LD      (DE),A
        INC     DE
        XOR     A
        LD      (FL00),A
        CALL    AFF3C
        DEC     DE
        LD      A,(DE)
        INC     DE
        CP      80H
        JR      Z,AFH5
        LD      A,','
        LD      (DE),A
AFH5    INC     DE
        CALL    AFF3C
        POP     BC
        PUSH    HL
        LD      HL,46
        ADD     HL,DE
        EX      DE,HL
        POP     HL
        DJNZ    AFH3
        RET
FL00    DEFB    0
AFF3C   LD      B,3
AHK0    LD      A,(HL)
        CP      '0'
        JR      Z,AHK3
AHK1    LD      (DE),A
        LD      A,1
        LD      (FL00),A
AHK2    INC     DE
        INC     HL
        DJNZ    AHK0
        RET
AHK3    LD      A,(FL00)
        OR      A
        JR      Z,AHK2
        LD      A,'0'
        JR      AHK1
BLK1    DEFW    VIDEO+192+43
BLK2    DEFW    0
BLKC    DEFB    0
BLKHS   LD      A,(BLKC)
        INC     A
        AND     0FH
        LD      (BLKC),A
        CALL    SOUND
        JR      Z,BLH0
        CP      4
        JR      Z,BLH3
        LD      BC,9
        JP      PAUSE
BLH0    LD      HL,(BLK1)
        CALL    BLH1
        LD      HL,(BLK2)
BLH1    LD      B,18
BLH2    LD      (HL),' '
        INC     HL
        BIT     0,L
        CALL    Z,SOUND
        DJNZ    BLH2
        RET
BLH3    LD      DE,(BLK1)
        CALL    BLH4
        LD      DE,(BLK2)
BLH4    LD      A,D
        OR      E
        RET     Z
        LD      HL,SCR-VIDEO
        ADD     HL,DE
        LD      BC,18
        LDIR
        JP      SOUND
TSP12   DEFM    'Press <1> or <2> to start game'
TSP     DEFM    ', Press <SPACE> for Instructions'
ALEA    LD      BC,100H
ALE0    CALL    RND
        AND     0FCH
        LD      E,A
        CALL    RND
        AND     3
        LD      D,A
ALE1    LD      HL,SCR
        ADD     HL,DE
        LD      A,(HL)
        OR      A
        JR      Z,ALE2
        CALL    ASQU
        DEC     BC
        LD      A,B
        OR      C
        JR      NZ,ALE0
        LD      HL,VIDEO
        LD      DE,SCR
        LD      BC,400H
        LDIR
        RET
ALE2    LD      HL,12
        ADD     HL,DE
        EX      DE,HL
        LD      A,D
        AND     3
        LD      D,A
        JR      ALE1
ASQU    PUSH    DE
        POP     HL
        ADD     HL,HL
        ADD     HL,HL
        LD      D,H
        LD      A,E
        RRCA
        RRCA
        AND     0FH
        LD      E,A
        CALL    SQUARE
        RET
SPIRE   LD      L,1
        LD      DE,0FFH
        LD      C,10H
SPIR1   LD      B,C
SPIR2   LD      A,E
        ADD     A,L
        LD      E,A
        CALL    SQUARE
        DJNZ    SPIR2
        DEC     C
        JR      Z,SPIR4
        LD      B,C
SPIR3   LD      A,D
        ADD     A,L
        LD      D,A
        CALL    SQUARE
        DJNZ    SPIR3
        LD      A,L
        NEG
        LD      L,A
        JR      SPIR1
SPIR4   LD      HL,VIDEO
        LD      DE,SCR
        LD      BC,400H
        LDIR
        RET
SQUARE  PUSH    DE
        EXX
        POP     DE
        LD      L,D
        LD      H,0
        LD      B,6
SQU0    ADD     HL,HL
        DJNZ    SQU0
        SLA     E
        SLA     E
        LD      D,0
        ADD     HL,DE
        PUSH    HL
        POP     BC
        LD      HL,VIDEO
        ADD     HL,BC
        EX      DE,HL
        LD      HL,SCR
        ADD     HL,BC
        LD      B,4
SQU1    LD      A,(HL)
        LD      (DE),A
        LD      (HL),0
        INC     HL
        INC     DE
        DJNZ    SQU1
        EXX
        CALL    SON1
        RET
SON1    PUSH    DE
        EXX
        POP     DE
        SRL     E
        INC     E
        SLA     D
        INC     D
        LD      C,10H
SOS     LD      A,1
        OUT     (255),A
        LD      B,E
        DJNZ    $
        LD      A,0
        OUT     (255),A
        LD      B,D
        DJNZ    $
        DEC     C
        JR      NZ,SOS
        EXX
        RET
DLINE   LD      HL,(YA)
        LD      DE,(YB)
        CALL    LINE
        LD      A,(RX)
        LD      E,A
        LD      A,(RY)
        LD      D,A
        CALL    SON1
        RET
SRT     LD      A,D
        SUB     E
        ADD     A,64
        LD      E,A
        LD      C,35
SRT0    LD      A,1
        OUT     (255),A
        LD      B,E
        DJNZ    $
        XOR     A
        OUT     (255),A
        LD      B,40
        DJNZ    $
        DEC     C
        JR      NZ,SRT0
        RET
SWEEP   LD      DE,700H
SWP0    CALL    SWP1
        PUSH    DE
        CALL    SRT
        POP     DE
        LD      A,D
        OR      A
        JR      NZ,SWP2
        INC     E
        JR      SWP3
SWP2    DEC     D
SWP3    LD      A,E
        CP      32
        JR      C,SWP0
        CALL    AFF
        RET
SWP1    PUSH    DE
SWP4    CALL    SWP5
        INC     D
        INC     E
        LD      A,D
        CP      8
        JR      NC,SWP6
        LD      A,E
        CP      32
        JR      NC,SWP6
        JR      SWP4
SWP6    POP     DE
        RET
SWP5    PUSH    DE
        CALL    SWP8
        POP     DE
        PUSH    DE
        LD      A,63
        SUB     E
        LD      E,A
        CALL    SWP8
        POP     DE
        PUSH    DE
        LD      A,15
        SUB     D
        LD      D,A
        CALL    SWP8
        POP     DE
        PUSH    DE
        LD      A,15
        SUB     D
        LD      D,A
        LD      A,63
        SUB     E
        LD      E,A
        CALL    SWP8
        POP     DE
        RET
SWP8    LD      L,D
        LD      H,0
        LD      B,6
SWP7    ADD     HL,HL
        DJNZ    SWP7
        LD      D,0
        ADD     HL,DE
        LD      DE,VIDEO
        ADD     HL,DE
        EX      DE,HL
        LD      HL,SCR-VIDEO
        ADD     HL,DE
        LD      A,(HL)
        LD      (DE),A
        RET
ESSGLA  LD      HL,1F0FH
        LD      (YA),HL
        LD      HL,0FH
        LD      (YB),HL
ESG0    CALL    DLINE
        LD      A,(YB)
        OR      A
        JR      Z,ESG1
        DEC     A
        LD      (YB),A
        JR      ESG0
ESG1    CALL    DLINE
        LD      A,(XB)
        CP      63
        JR      Z,ESG2
        INC     A
        LD      (XB),A
        JR      ESG1
ESG2    CALL    DLINE
        LD      A,(YB)
        CP      15
        RET     Z
        INC     A
        LD      (YB),A
        JR      ESG2
HGRILL  LD      HL,0
        LD      (YA),HL
        LD      HL,3FCH
        LD      (YB),HL
        LD      B,16
HGR0    PUSH    BC
        LD      B,8
HGR1    PUSH    BC
        LD      DE,(YA)
        CALL    ASQU
        LD      DE,(YB)
        CALL    ASQU
        LD      HL,(YA)
        LD      DE,128
        ADD     HL,DE
        LD      (YA),HL
        LD      HL,(YB)
        LD      DE,-128
        ADD     HL,DE
        LD      (YB),HL
        POP     BC
        DJNZ    HGR1
        LD      HL,(YA)
        LD      DE,-1020
        ADD     HL,DE
        LD      (YA),HL
        LD      HL,(YB)
        LD      DE,1020
        ADD     HL,DE
        LD      (YB),HL
        POP     BC
        DJNZ    HGR0
        LD      HL,VIDEO
        LD      DE,SCR
        LD      BC,400H
        LDIR
        RET
GRILL   LD      HL,0
        LD      (YA),HL
        LD      HL,3FCH
        LD      (YB),HL
        LD      B,128
GRI0    PUSH    BC
        LD      DE,(YA)
        CALL    ASQU
        LD      DE,(YB)
        CALL    ASQU
        LD      HL,(YA)
        LD      DE,8
        ADD     HL,DE
        LD      (YA),HL
        LD      HL,(YB)
        LD      DE,-8
        ADD     HL,DE
        LD      (YB),HL
        POP     BC
        DJNZ    GRI0
        LD      HL,VIDEO
        LD      DE,SCR
        LD      BC,400H
        LDIR
        RET
RADAR   LD      HL,1F07H
        LD      (YA),HL
        LD      HL,1F00H
        LD      (YB),HL
RAD0    CALL    DLINE
        LD      A,(XB)
        CP      63
        JR      Z,RAD1
        INC     A
        LD      (XB),A
        JR      RAD0
RAD1    CALL    DLINE
        LD      A,(YB)
        CP      15
        JR      Z,RAD2
        INC     A
        LD      (YB),A
        JR      RAD1
RAD2    CALL    DLINE
        LD      A,(XB)
        OR      A
        JR      Z,RAD3
        DEC     A
        LD      (XB),A
        JR      RAD2
RAD3    CALL    DLINE
        LD      A,(YB)
        OR      A
        JR      Z,RAD4
        DEC     A
        LD      (YB),A
        JR      RAD3
RAD4    CALL    DLINE
        LD      A,(XB)
        CP      31
        RET     Z
        INC     A
        LD      (XB),A
        JR      RAD4
YA      DEFB    0
XA      DEFB    0
YB      DEFB    0
XB      DEFB    0
LINE    LD      (RY),HL
        CALL    PLOT
        PUSH    DE
        LD      A,H
        CP      D
        JR      NC,LIN0
        LD      D,1
        JR      LIN1
LIN0    LD      D,0FFH
LIN1    LD      A,L
        CP      E
        JR      NC,LIN2
        LD      E,1
        JR      LIN3
LIN2    LD      E,0FFH
LIN3    POP     BC
        LD      A,H
        SUB     B
        JP      P,LIN4
        NEG
LIN4    LD      H,A
        LD      A,L
        SUB     C
        JP      P,LIN5
        NEG
LIN5    LD      L,A
        LD      A,H
        CP      L
        JR      C,LIN6
        JR      Z,LIN6
        SRL     A
        LD      C,A
        LD      B,H
LIN7    LD      A,(RX)
        ADD     A,D
        LD      (RX),A
        LD      A,C
        ADD     A,L
        LD      C,A
        CP      H
        JR      C,LIN8
        SUB     H
        LD      C,A
        LD      A,(RY)
        ADD     A,E
        LD      (RY),A
LIN8    CALL    PLOT
        DJNZ    LIN7
        RET
LIN6    LD      A,L
        SRL     A
        LD      C,A
        LD      B,L
LIN9    LD      A,(RY)
        ADD     A,E
        LD      (RY),A
        LD      A,C
        ADD     A,H
        LD      C,A
        CP      L
        JR      C,LIN10
        SUB     L
        LD      C,A
        LD      A,(RX)
        ADD     A,D
        LD      (RX),A
LIN10   CALL    PLOT
        DJNZ    LIN9
        RET
RY      DEFB    0
RX      DEFB    0
PLOT    EXX
        LD      A,(RY)
        LD      L,A
        LD      H,0
        LD      B,6
PLO0    ADD     HL,HL
        DJNZ    PLO0
        LD      A,(RX)
        LD      E,A
        LD      D,0
        ADD     HL,DE
        PUSH    HL
        POP     BC
        LD      HL,VIDEO
        ADD     HL,BC
        EX      DE,HL
        LD      HL,SCR
        ADD     HL,BC
        LD      A,(HL)
        LD      (DE),A
        EXX
        RET
VALSH   DEFB    9
AFFSHP  LD      HL,VALSH
        DEC     (HL)
        JR      NZ,ASP0
        LD      (HL),9
        LD      DE,TSHP1
        JR      ASP1
ASP0    LD      A,(HL)
        CP      5
        JR      NZ,ASP2
        LD      DE,TSHP2
ASP1    LD      HL,VIDEO+320+6
        EX      DE,HL
        LD      BC,30
        LDIR
        LD      DE,VIDEO+384+6
        LD      BC,30
        LDIR
        CALL    SOUND
ASP2    RET
TSHP1   DEFW    0BF98H
        DEFW    90ADH
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    0BF98H
        DEFW    90ADH
        DEFW    8080H
        DEFW    0BFB6H
        DEFW    94BBH
        DEFW    0B680H
        DEFW    0BB8FH
        DEFW    8094H
        DEFW    0B0A8H
        DEFW    80B4H
        DEFW    9C9FH
        DEFW    959FH
        DEFW    0AE88H
        DEFW    849DH
        DEFW    8080H
        DEFW    0BCAFH
        DEFW    85BFH
        DEFW    8080H
        DEFW    0B4B5H
        DEFW    95B4H
        DEFW    8280H
        DEFW    0B78FH
        DEFW    8080H
        DEFW    0B3ADH
        DEFW    85BEH
TSHP2   DEFW    0BF98H
        DEFW    90ADH
        DEFW    8080H
        DEFW    8080H
        DEFW    8080H
        DEFW    0BF98H
        DEFW    90ADH
        DEFW    8080H
        DEFW    0BFB6H
        DEFW    94BBH
        DEFW    0B680H
        DEFW    0BB8FH
        DEFW    8094H
        DEFW    0B0A8H
        DEFW    80B4H
        DEFW    9C9FH
        DEFW    959FH
        DEFW    99A2H
        DEFW    91A6H
        DEFW    8080H
        DEFW    0BCAFH
        DEFW    85BFH
        DEFW    8080H
        DEFW    8D8DH
        DEFW    858DH
        DEFW    8280H
        DEFW    0B78FH
        DEFW    8080H
        DEFW    0B3ADH
        DEFW    85BEH
PAUSE   DEC     BC
        LD      A,B
        OR      C
        JR      NZ,PAUSE
        RET
PROBAB  CALL    IPRO
        XOR     A
        LD      (INP1+1),A
        LD      HL,BABTER
        LD      DE,SCR+128
        LD      BC,8*64
        LDIR
        LD      HL,BT0
        LD      DE,SCR+704+24
        LD      BC,16
        CALL    AFF1L
        LD      DE,SCR+768+14
        LD      BC,36
        CALL    AFF1L
        LD      DE,SCR+832+9
        LD      BC,46
        CALL    AFF1L
        LD      HL,TSP12
        LD      DE,SCR+960+1
        LD      BC,62
        CALL    AFF1L
        CALL    AFFLIN
        CALL    DISPL
        LD      BC,4000H
        CALL    PAUSE
        XOR     A
        CALL    VOICE
        CALL    AFFPOI
PRB0    CALL    INP12
        CALL    INPSP
        CALL    TRPOI
        JR      PRB0
PROEXP  CALL    IPRO
        LD      A,1
        LD      (INP1+1),A
        CALL    AFFHS
        LD      HL,TAEXP
        LD      DE,SCR+128+4
        LD      B,12
PRE1    PUSH    DE
PRE2    LD      A,(HL)
        INC     HL
        CP      '%'
        JR      Z,PRE3
        DEC     HL
        CALL    AFF1C
        INC     HL
        INC     DE
        JR      PRE2
PRE3    POP     DE
        PUSH    HL
        LD      HL,64
        ADD     HL,DE
        EX      DE,HL
        POP     HL
        DJNZ    PRE1
        LD      HL,SCR+64+13
        LD      DE,SCR+192+13
        LD      B,16
        LD      A,83H
PRE4    LD      (HL),8CH
        LD      (DE),A
        INC     HL
        INC     DE
        DJNZ    PRE4
        LD      A,0BCH
        LD      (SCR+64+13),A
        LD      (SCR+64+28),A
        LD      A,0BFH
        LD      (SCR+128+13),A
        LD      (SCR+128+28),A
        LD      HL,TSHP1
        LD      DE,SCR+320+6
        LD      BC,30
        LDIR
        LD      DE,SCR+384+6
        LD      BC,30
        LDIR
        LD      HL,TSP12
        LD      DE,SCR+960+17
        LD      BC,30
        CALL    AFF1L
        CALL    AFFLIN
        CALL    DISPL
        CALL    AFFPOI
PRE0    CALL    INP12
        CALL    TRPOI
        JR      PRE0
TAEXP   DEFM    '           BABLE TERROR%'
        DEFM    '%'
        DEFM    '       Eat bables and stars%'
        DEFM    '%'
        DEFM    '%'
        DEFM    '  100  30   You   ----Danger----%'
        DEFM    'Use  arrow keys  to move your ship%'
        DEFM    'and press "SPACEBAR" to disappear.%'
        DEFM    'An  extra ship  is  awarded  after%'
        DEFM    'each 1,000 pts.%'
        DEFM    'Press  "BREAK" & "CLEAR"  to abort%'
        DEFM    'game. Good luck...%'
INP12   LD      A,(3810H)
        AND     6
        JR      Z,INP1
        SRL     A
        CP      1
        JR      Z,INP0
        LD      A,2
INP0    LD      (NPLAY),A
        LD      HL,10000
        LD      (IPRO+1),HL
        POP     HL
        POP     HL
        CALL    EFFPOI
        XOR     A
        JP      STRT0
INP1    LD      A,0
        OR      A
        JR      Z,INP4
INP2    LD      A,6
        DEC     A
        JR      NZ,INP3
        LD      A,6
INP3    LD      (INP2+1),A
        JR      NZ,INP4
        CALL    AFFSHP
        CALL    BLKHS
        JR      INP5
INP4    LD      B,200
        DJNZ    $
INP5    LD      HL,0
        DEC     HL
        LD      (INP5+1),HL
        LD      A,H
        OR      L
        JR      NZ,BLINKR
        POP     HL
        CALL    EFFPOI
        RET
BLINKR  LD      A,50
        DEC     A
        JR      NZ,BKR0
        LD      A,50
BKR0    LD      (BLINKR+1),A
        JR      NZ,BKR6
BKR7    LD      A,1
        NEG
        LD      (BKR7+1),A
        LD      A,79H
        JP      P,BKR1
        XOR     A
BKR1    LD      (BKR8),A
        LD      HL,SCR+960
        LD      DE,VIDEO+960
        LD      BC,64*256+' '
BKR2    LD      A,(HL)
        CP      '<'
        JR      Z,BKR5
BKR3    INC     HL
        INC     DE
        DJNZ    BKR2
        RET
BKR4    LD      A,(HL)
        CP      '>'
        JR      Z,BKR3
BKR8    NOP
        LD      (DE),A
BKR5    INC     HL
        INC     DE
        DJNZ    BKR4
        RET
BKR6    LD      B,0
        DJNZ    $
        RET
INPSP   LD      A,(3840H)
        AND     80H
        RET     Z
        LD      HL,10000
        LD      (IPRO+1),HL
        POP     HL
        POP     HL
        CALL    EFFPOI
        JP      STRT1
IPRO    LD      HL,10000
        LD      (INP5+1),HL
        CALL    SCR191
        CALL    DISPL
        CALL    CLSSCR
        RET
TRPOI   LD      A,8
        DEC     A
        JR      NZ,TPO0
        LD      A,8
TPO0    LD      (TRPOI+1),A
        RET     NZ
        JP      AFFPOI
AFF1L   CALL    AFF1C
        DEC     BC
        INC     HL
        INC     DE
        LD      A,B
        OR      C
        JR      NZ,AFF1L
        RET
AFF1C   LD      A,(HL)
        CP      60H
        JR      C,AFF1C2
        CP      80H
        JR      NC,AFF1C2
        PUSH    HL
        LD      HL,LOWER1
        DEC     (HL)
        POP     HL
        JR      NZ,AFF1C1
        LD      A,(VIDEO)
        PUSH    AF
        LD      A,0C0H
        LD      (VIDEO),A
        LD      A,(VIDEO)
        CP      0C0H
        LD      A,0E0H
        JR      NZ,AFF1C0
        XOR     A
AFF1C0  LD      (LOWER0),A
        POP     AF
        LD      (VIDEO),A
        LD      A,(HL)
AFF1C1  PUSH    HL
        LD      HL,LOWER0
        ADD     A,(HL)
        POP     HL
AFF1C2  LD      (DE),A
        RET
LOWER0  DEFB    0
LOWER1  DEFB    1
SOUND   PUSH    HL
        PUSH    AF
        LD      A,(COUNTS)
        OR      A
        JR      Z,SOUND3
        LD      HL,STATE
        LD      A,(HL)
        OR      A
        INC     HL
        JR      NZ,SOUND1
        DEC     (HL)
        JR      NZ,SOUND4
        LD      A,2
        LD      (STATE),A
SOUND0  OUT     (255),A
        JR      SOUND4
SOUND1  INC     HL
        DEC     (HL)
        JR      NZ,SOUND4
        XOR     A
        LD      (STATE),A
        INC     A
SOUND2  OUT     (255),A
        INC     HL
        DEC     (HL)
        JR      Z,SOUND5
        LD      HL,(ADDSON)
        LD      A,(HL)
        AND     3FH
        LD      (LOCOU),A
        LD      (HICOU),A
        JR      SOUND4
SOUND3  PUSH    BC
        LD      B,6
        DJNZ    $
        POP     BC
SOUND4  POP     AF
        POP     HL
        RET
SOUND5  LD      HL,(ADDSON)
        INC     HL
        INC     HL
SOUND6  LD      (ADDSON),HL
        LD      A,(HL)
        OR      A
        JP      P,SOUND7
        LD      HL,0
        LD      (SOUND0),HL
        LD      (SOUND2),HL
        JR      SOUND8
SOUND7  LD      HL,0FFD3H
        LD      (SOUND0),HL
        LD      (SOUND2),HL
SOUND8  AND     3FH
        LD      (LOCOU),A
        LD      (HICOU),A
        LD      HL,(ADDSON)
        INC     HL
        LD      A,(HL)
        LD      (COUNTS),A
        JR      SOUND4
CSOUND  LD      DE,SOUND9
        PUSH    DE
        PUSH    DE
        PUSH    DE
        JR      SOUND6
SOUND9  LD      A,1
        OUT     (255),A
        RET
STATE   DEFB    0
LOCOU   DEFB    0
HICOU   DEFB    0
COUNTS  DEFB    0
ADDSON  DEFW    0
START   DINT
        LD      HL,STACK
        LD      SP,HL
        LD      H,37H
        LD      L,0E4H
        LD      (HL),1
        CALL    EHS
        CALL    PROBAB
STRT1   CALL    PROEXP
        LD      HL,2000
        LD      (IPRO+1),HL
        LD      A,2
        LD      (NPLAY),A
STRT0   LD      (DEMO),A
        CALL    COMMOD
        JP      BEGIN
