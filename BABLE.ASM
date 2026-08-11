        TITLE   ### BABLE TERROR ###
;               --------------------
PROT    EQU     2
DISK    EQU     1
TAPE    EQU     0
TYPE    EQU     DISK
;
        COND    0!(TYPE=TAPE)!(TYPE=DISK)
        ORG     3C00H+44
        DEFB    191
        DEFM    ' BABLE TERROR    **'
        ORG     3C40H+44
        DEFB    191
        DEFM    ' TRS-80 - MOD I/III'
        ORG     3C80H+44
        DEFW    8383H
        DEFW    8383H
        DEFW    8383H
        DEFW    8383H
        DEFW    8383H
        DEFW    8383H
        DEFW    8383H
        DEFW    8383H
        DEFW    8383H
        DEFW    8383H
        ENDC
        COND    TYPE=PROT
        ORG     4800H
        ENDC
        COND    TYPE=TAPE
        ORG     4300H
        ENDC
        COND    TYPE=DISK
        INCLUDE SYSMACRO
        ORG     8000H
        ENDC
        INCLUDE BABLE1
        INCLUDE INIT
DBAD    LD      IX,TBAD
        LD      B,9
DBD0    PUSH    BC
        LD      A,(IX)
        CP      2
        JP      C,DBD1
        LD      A,(X)
        LD      B,A
        LD      DE,7
        CALL    MUL16
        PUSH    HL
        LD      A,(IX+1)
        LD      B,A
        LD      DE,7
        CALL    MUL16
        POP     DE
        OR      A
        SBC     HL,DE
        LD      A,(MX)
        LD      B,A
        LD      A,L
        SUB     B
        INC     A
        LD      E,A
        LD      A,(IX+3)
        CP      1
        JR      NZ,DBD2
        LD      A,(IX+4)
        LD      B,A
        LD      A,E
        SUB     B
        LD      E,A
        JR      DBD3
DBD2    CP      3
        JR      NZ,DBD3
        LD      A,(IX+4)
        ADD     A,E
        LD      E,A
DBD3    PUSH    DE
        LD      A,(Y)
        LD      B,A
        LD      DE,9
        CALL    MUL16
        PUSH    HL
        LD      A,(IX+2)
        LD      B,A
        LD      DE,9
        CALL    MUL16
        POP     DE
        OR      A
        SBC     HL,DE
        LD      A,(MY)
        LD      B,A
        LD      A,L
        SUB     B
        ADD     A,4
        POP     DE
        LD      D,A
        LD      A,(IX+3)
        CP      0
        JR      NZ,DBD5
        LD      A,(IX+4)
        LD      B,A
        LD      A,D
        SUB     B
        LD      D,A
        JR      DBD6
DBD5    CP      2
        JR      NZ,DBD6
        LD      A,(IX+4)
        ADD     A,D
        LD      D,A
DBD6    LD      A,E
        CP      253
        JR      NC,DBD7
        CP      64
        JP      NC,DBD1
DBD7    LD      A,D
        CP      254
        JR      NC,DBD8
        CP      48
        JP      NC,DBD1
DBD8    PUSH    IX
        CALL    POSI
        POP     IX
        EXX
        PUSH    AF
        LD      A,(IX)
        SUB     2
        ADD     A,A
        LD      E,A
        LD      D,0
        LD      HL,TABD
        ADD     HL,DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        LD      A,(IX+3)
        AND     2
        SRL     A
        LD      C,A
        LD      B,0
        LD      HL,TABR
        ADD     HL,BC
        LD      L,(HL)
        LD      H,0
        ADD     HL,DE
        EX      DE,HL
        POP     AF
        LD      C,A
        LD      B,0
        LD      HL,TABC
        ADD     HL,BC
        LD      L,(HL)
        LD      H,0
        ADD     HL,DE
        EXX
        LD      B,3
DBD9    LD      A,D
        CP      48
        JR      NC,DBD10
        CP      3
        JR      C,DBD10
        LD      C,4
DBD11   LD      A,E
        CP      64
        JR      NC,DBD12
        EXX
        LD      A,(HL)
        INC     HL
        EXX
        OR      (HL)
        LD      (HL),A
DBD13   INC     HL
        INC     E
        DEC     C
        JR      NZ,DBD11
        JR      DBD14
DBD12   EXX
        INC     HL
        EXX
        JR      DBD13
DBD10   EXX
        INC     HL
        INC     HL
        INC     HL
        INC     HL
        EXX
        PUSH    DE
        LD      DE,64
        ADD     HL,DE
        POP     DE
        JR      DBD15
DBD14   PUSH    DE
        LD      DE,60
        ADD     HL,DE
        POP     DE
        LD      A,E
        SUB     4
        LD      E,A
DBD15   INC     D
        INC     D
        INC     D
        DJNZ    DBD9
DBD1    LD      DE,5
        ADD     IX,DE
        POP     BC
        DEC     B
        JP      NZ,DBD0
        RET
DCROI   LD      A,(YH)
        SUB     4
        LD      D,A
        LD      A,(XHH)
        ADD     A,2
        LD      E,A
        CALL    POSI
        EXX
        LD      L,A
        LD      H,0
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        LD      DE,TCROI
        ADD     HL,DE
        LD      A,(ALTC)
        LD      E,A
        LD      D,0
        ADD     HL,DE
        EXX
        LD      B,2
DCR0    LD      A,D
        CP      48
        JR      NC,DCR1
        CP      3
        JR      C,DCR1
        LD      C,4
DCR2    LD      A,E
        CP      64
        JR      NC,DCR3
        EXX
        LD      A,(HL)
        INC     HL
        EXX
        OR      (HL)
        LD      (HL),A
DCR5    INC     HL
        INC     E
        DEC     C
        JR      NZ,DCR2
        JR      DCR4
DCR3    EXX
        INC     HL
        EXX
        JR      DCR5
DCR1    EXX
        INC     HL
        INC     HL
        INC     HL
        INC     HL
        EXX
        PUSH    DE
        LD      DE,64
        ADD     HL,DE
        POP     DE
        JR      DCR6
DCR4    PUSH    DE
        LD      DE,60
        ADD     HL,DE
        POP     DE
        LD      A,E
        SUB     4
        LD      E,A
DCR6    INC     D
        INC     D
        INC     D
        DJNZ    DCR0
        RET
        COND    TYPE=TAPE
TRCLN   LD      A,(BASE)
        CP      1
        RET     NZ
        LD      H,40H
        LD      L,0E1H
        INC     H
        INC     L
        LD      A,(HL)
        DEC     A
        CP      79H
        JR      NZ,CLEAN
        INC     HL
        LD      A,(HL)
        DEC     A
        CP      7FH
        JR      NZ,CLEAN
        INC     HL
        LD      A,(HL)
        DEC     A
        CP      42H
        RET     Z
CLEAN   LD      HL,8000H
        LD      DE,4000H
        LD      BC,8000H
        LDIR
        RET
        ENDC
        COND    TYPE=PROT
TRCLN   LD      A,(BASE)
        CP      1
        RET     NZ
        LD      H,44H
        LD      L,10H
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        EX      DE,HL
        XOR     A
        LD      (HL),A
        CP      (HL)
        JP      Z,CLEANP
        DEC     HL
        LD      (HL),A
        CP      (HL)
        JP      NZ,CLEANP
        LD      A,(9000H)
        CP      0CDH
        JP      NZ,CLEANP
        RET
        ENDC
ALTC    DEFB    0
DMAZE   LD      A,(ALTC)
        XOR     24
        LD      (ALTC),A
        LD      A,(MY)
        LD      B,A
        LD      A,11
        SUB     B
        LD      (YH),A
        LD      D,A
        LD      A,(MX)
        LD      B,A
        LD      A,0FFH
        SUB     B
        LD      (XH),A
        LD      (XHH),A
        LD      E,A
        CALL    POSI
        LD      (PH),HL
        LD      (PHH),HL
        LD      C,3
DMA0    OR      A
        JR      Z,DMA1
        SLA     C
        SLA     C
        DEC     A
        JR      DMA0
DMA1    LD      A,C
        LD      (CH),A
        LD      A,(MY)
        LD      B,A
        LD      A,2
        SUB     B
        LD      (YV),A
        LD      D,A
        LD      A,(MX)
        LD      B,A
        LD      A,6
        SUB     B
        LD      (XV),A
        LD      (XVV),A
        LD      E,A
        CALL    POSI
        LD      (PV),HL
        LD      (PVV),HL
        LD      B,3FH
        LD      C,3
DMA2    OR      A
        JR      Z,DMA3
        PUSH    AF
        SLA     B
        SLA     B
        LD      A,C
        SLA     A
        SLA     A
        OR      3
        LD      C,A
        POP     AF
        DEC     A
        JR      DMA2
DMA3    LD      A,B
        AND     3FH
        LD      (CVD),A
        LD      A,C
        AND     3FH
        LD      (CVF),A
        LD      A,(Y)
        DEC     A
        JP      P,DMZ
        ADD     A,13
DMZ     LD      B,A
        LD      DE,21
        CALL    MUL16
        LD      A,(X)
        LD      E,A
        LD      D,0
        ADD     HL,DE
        LD      DE,MAZE
        ADD     HL,DE
        LD      B,6
DMA4    PUSH    BC
        LD      B,10
DMA5    PUSH    BC
        PUSH    HL
        LD      DE,MAZE+274
        OR      A
        SBC     HL,DE
        POP     HL
        JP      M,DMZ0
        LD      DE,-273
        ADD     HL,DE
DMZ0    LD      A,(HL)
        INC     HL
        PUSH    HL
        PUSH    AF
        BIT     0,A
        CALL    NZ,VLINE
        POP     AF
        PUSH    AF
        BIT     1,A
        CALL    NZ,HLINE
        POP     AF
        BIT     2,A
        CALL    NZ,DCROI
        LD      A,(XHH)
        ADD     A,7
        LD      (XHH),A
        LD      HL,(PHH)
        LD      DE,7
        ADD     HL,DE
        LD      (PHH),HL
        LD      A,(XVV)
        ADD     A,7
        LD      (XVV),A
        LD      HL,(PVV)
        ADD     HL,DE
        LD      (PVV),HL
        POP     HL
        POP     BC
        DJNZ    DMA5
        PUSH    HL
        LD      A,(XH)
        LD      (XHH),A
        LD      A,(YH)
        ADD     A,9
        LD      (YH),A
        LD      HL,(PH)
        LD      DE,192
        ADD     HL,DE
        LD      (PH),HL
        LD      (PHH),HL
        LD      A,(XV)
        LD      (XVV),A
        LD      A,(YV)
        ADD     A,9
        LD      (YV),A
        LD      HL,(PV)
        ADD     HL,DE
        LD      (PV),HL
        LD      (PVV),HL
        POP     HL
        LD      DE,11
        ADD     HL,DE
        POP     BC
        DEC     B
        JP      NZ,DMA4
        RET
PEBAS   DEFW    0
EBASE   LD      HL,(PEBAS)
        LD      A,H
        OR      L
        RET     Z
        LD      B,3
EBA0    LD      C,4
EBA1    LD      (HL),80H
        INC     HL
        DEC     C
        JR      NZ,EBA1
        LD      DE,60
        ADD     HL,DE
        DJNZ    EBA0
        LD      HL,0
        LD      (PEBAS),HL
        RET
DBASE   LD      A,(BASE)
        CP      1
        JP      NZ,DEXP
        LD      A,(DIRE)
        ADD     A,A
        LD      E,A
        LD      D,0
        LD      HL,TADD
        ADD     HL,DE
        PUSH    HL
        LD      A,(PYS)
        LD      L,A
        LD      H,0
        LD      D,3
        CALL    DIV16
        POP     DE
        LD      C,H
        LD      B,0
        LD      HL,TREC
        ADD     HL,BC
        LD      L,(HL)
        LD      H,0
        LD      A,(DE)
        LD      C,A
        INC     DE
        LD      A,(DE)
        LD      B,A
        ADD     HL,BC
        CALL    SOUND
        EX      DE,HL
        PUSH    IX
        POP     HL
        LD      B,6
DB0     ADD     HL,HL
        DJNZ    DB0
        LD      A,(PXS)
        LD      C,A
        LD      B,0
        ADD     HL,BC
        LD      BC,SCR
        ADD     HL,BC
        LD      B,3
        PUSH    HL
        EXX
        POP     HL
        LD      DE,SCRTIR-SCR
        ADD     HL,DE
        LD      (PEBAS),HL
        LD      E,0
        EXX
DB1     LD      C,4
DB2     LD      A,(DE)
        AND     (HL)
        EXX
        OR      E
        LD      E,A
        EXX
        LD      A,(DE)
        EXX
        LD      (HL),A
        INC     HL
        EXX
        LD      A,(DE)
        OR      (HL)
        LD      (HL),A
        INC     DE
        INC     HL
        DEC     C
        JR      NZ,DB2
        DJNZ    DB3
        JR      DB4
DB3     PUSH    DE
        LD      DE,60
        ADD     HL,DE
        POP     DE
        EXX
        PUSH    DE
        LD      DE,60
        ADD     HL,DE
        POP     DE
        EXX
        JR      DB1
DB4     CALL    SOUND
        EXX
        LD      A,E
        EXX
        AND     3FH
        RET     Z
        LD      A,2
        LD      (BASE),A
        LD      A,32
        LD      (WEXP),A
        LD      A,(PLAY)
        CP      1
        JR      NZ,DFG3
        LD      HL,SHP1
        JR      DFG4
DFG3    LD      HL,SHP2
DFG4    DEC     (HL)
        CALL    INVERT
        RET
ALTZ    DEFB    0
DEXP    CP      2
        RET     NZ
        LD      A,(PYS)
        LD      L,A
        LD      H,0
        LD      D,3
        CALL    DIV16
        LD      C,H
        LD      B,0
        LD      HL,TREC
        ADD     HL,BC
        LD      L,(HL)
        LD      H,0
        LD      BC,GHOST
        ADD     HL,BC
        CALL    SOUND
        EX      DE,HL
        PUSH    IX
        POP     HL
        LD      B,6
DEX0    ADD     HL,HL
        DJNZ    DEX0
        LD      A,(PXS)
        LD      C,A
        LD      B,0
        ADD     HL,BC
        LD      BC,SCR
        ADD     HL,BC
        LD      B,3
        EXX
        LD      A,(ALTZ)
        LD      E,A
        EXX
DEX1    LD      C,4
DEX2    LD      A,(DE)
        EXX
        XOR     E
        EXX
        OR      (HL)
        LD      (HL),A
        INC     DE
        INC     HL
        DEC     C
        JR      NZ,DEX2
        DJNZ    DEX3
        JR      DEX4
DEX3    PUSH    DE
        LD      DE,60
        ADD     HL,DE
        POP     DE
        JR      DEX1
DEX4    CALL    SOUND
        RET
NMAZE   LD      A,(BASE)
        CP      1
        RET     NZ
        LD      A,(NCROI)
        OR      A
        RET     NZ
        CALL    CLSVID
        CALL    CMAZE
        CALL    INIT0
        LD      HL,WBAB
        LD      DE,WBAB+1
        LD      BC,5
        LD      (HL),'0'
        LDIR
        LD      A,(PLAY)
        CP      1
        JR      Z,NMA0
        LD      HL,DVBB2
        JR      NMA1
NMA0    LD      HL,DVBB1
NMA1    PUSH    HL
        LD      B,6
        XOR     A
NMA2    OR      (HL)
        INC     HL
        DJNZ    NMA2
        POP     HL
        CP      '0'
        RET     Z
        LD      BC,4
        ADD     HL,BC
        DEC     (HL)
NMA3    LD      A,(HL)
        DEC     A
        CP      '0'
        JR      NC,NMA4
        ADD     A,10
        LD      (HL),A
        DEC     C
        DEC     HL
        JP      P,NMA3
        INC     HL
        PUSH    HL
        POP     DE
        INC     DE
        LD      BC,5
        LD      (HL),'0'
        LDIR
        RET
NMA4    LD      (HL),A
        RET
BONUS0  CALL    SCOR12
        LD      BC,5
        ADD     HL,BC
        LD      DE,WBAB+5
BUN0    LD      A,(DE)
        SUB     '0'
        ADD     A,(HL)
        ADD     A,B
        CP      '9'+1
        JR      C,BUN3
        LD      B,1
        SUB     10
BUN1    CP      '9'+1
        JR      C,BUN2
        SUB     10
        INC     B
        JR      BUN1
BUN2    LD      (HL),A
        DEC     C
        DEC     HL
        DEC     DE
        JP      P,BUN0
        LD      HL,WBAB
        LD      DE,WBAB+1
        LD      BC,5
        LD      (HL),'0'
        LDIR
        RET
BUN3    LD      B,0
        JR      BUN2
CASE    LD      A,(PY)
        DEC     A
        LD      B,A
        LD      DE,21
        CALL    MUL16
        LD      A,(PX)
        LD      E,A
        LD      D,0
        ADD     HL,DE
        LD      DE,MAZE
        ADD     HL,DE
        RET
ALTB    DEFB    0
MBAD    LD      A,(ALTB)
        XOR     1
        LD      (ALTB),A
        LD      IX,TBAD
        LD      B,9
MBD0    PUSH    BC
        LD      A,(IX)
        CP      2
        JR      C,MBD1
        CP      4
        JR      NC,MBDS
        LD      B,A
        LD      A,(ALTB)
        XOR     B
        LD      (IX),A
MBDS    CALL    MOVE
MBD1    LD      DE,5
        ADD     IX,DE
        POP     BC
        DEC     B
        JP      NZ,MBD0
        RET
MOVE    RANDOM  1,2
        CP      1
        JR      NZ,MOVS3
        LD      A,3CH
        LD      (MOVS1),A
        INC     A
        LD      (MOVS2),A
        JR      MOVS4
MOVS3   LD      A,3CH
        LD      (MOVS2),A
        INC     A
        LD      (MOVS1),A
MOVS4   LD      A,(IX+4)
        OR      A
        JR      Z,MBD2
        LD      A,(IX+3)
        OR      A
        JR      Z,MBDU
        DEC     A
        JR      Z,MBDL
        DEC     A
        JR      Z,MBDD
        JR      MBDR
MBDU    LD      A,(IX+4)
        INC     A
        LD      (IX+4),A
        CP      9
        RET     C
        LD      (IX+4),0
        DEC     (IX+2)
        RET
MBDL    LD      A,(IX+4)
        INC     A
        LD      (IX+4),A
        CP      7
        RET     C
        LD      (IX+4),0
        DEC     (IX+1)
        RET
MBDD    LD      A,(IX+4)
        INC     A
        LD      (IX+4),A
        CP      9
        RET     C
        LD      (IX+4),0
        INC     (IX+2)
        RET
MBDR    LD      A,(IX+4)
        INC     A
        LD      (IX+4),A
        CP      7
        RET     C
        LD      (IX+4),0
        INC     (IX+1)
        RET
MBD2    LD      A,(IX+3)
MOVS1   INC     A
MBD3    AND     3
        PUSH    AF
        OR      A
        JR      Z,MDAU
        DEC     A
        JR      Z,MDAL
        DEC     A
        JR      Z,MDAD
        JR      MDAR
MDAU    LD      A,(IX+2)
        CP      1
        JR      Z,MDAN
        CALL    CASE0
        LD      DE,-21
        ADD     HL,DE
        BIT     1,(HL)
        JR      NZ,MDAN
        JR      MDAK
MDAL    LD      A,(IX+1)
        CP      1
        JR      Z,MDAN
        CALL    CASE0
        DEC     HL
        BIT     0,(HL)
        JR      NZ,MDAN
        JR      MDAK
MDAD    LD      A,(IX+2)
        CP      13
        JR      Z,MDAN
        CALL    CASE0
        BIT     1,(HL)
        JR      NZ,MDAN
        JR      MDAK
MDAR    LD      A,(IX+1)
        CP      21
        JR      Z,MDAN
        CALL    CASE0
        BIT     0,(HL)
        JR      Z,MDAK
MDAN    POP     AF
MOVS2   DEC     A
        JR      MBD3
MDAK    POP     AF
        LD      (IX+3),A
        INC     (IX+4)
        RET
CASE0   LD      A,(IX+2)
        DEC     A
        LD      B,A
        LD      DE,21
        CALL    MUL16
        LD      A,(IX+1)
        LD      E,A
        LD      D,0
        ADD     HL,DE
        LD      DE,MAZE
        ADD     HL,DE
        RET
MCROI   LD      A,(BASE)
        CP      1
        RET     NZ
        LD      A,(DECX)
        OR      A
        RET     NZ
        LD      A,(DECY)
        OR      A
        RET     NZ
        CALL    CASE
        BIT     2,(HL)
        RET     Z
        RES     2,(HL)
        LD      A,1
        CALL    ADDPO
        LD      HL,NCROI
        DEC     (HL)
        CALL    Z,BONUS0
        LD      IX,TBAD
        LD      B,5
MCR2    LD      A,(IX)
        CP      2
        JR      C,MCR3
        LD      (IX),1
MCR3    LD      DE,5
        ADD     IX,DE
        DJNZ    MCR2
        LD      A,(PLAY)
        CP      1
        JR      Z,MCR4
        LD      HL,DVBB2
        JR      MCR5
MCR4    LD      HL,DVBB1
MCR5    LD      BC,5
        ADD     HL,BC
        EX      DE,HL
        LD      HL,WBAB+5
MCR6    LD      A,(DE)
        SUB     '0'
        ADD     A,(HL)
        ADD     A,B
        CP      '9'+1
        JR      C,MCR9
        LD      B,1
        SUB     10
MCR7    CP      '9'+1
        JR      C,MCR8
        SUB     10
        INC     B
        JR      MCR7
MCR8    LD      (HL),A
        DEC     C
        DEC     HL
        DEC     DE
        JP      P,MCR6
        JR      MCR10
MCR9    LD      B,0
        JR      MCR8
MCR10   CALL    INVERT
        LD      C,40
MCR0    LD      A,1
        OUT     (255),A
        LD      B,50
        DJNZ    $
        XOR     A
        OUT     (255),A
        LD      B,50
        DJNZ    $
        DEC     C
        JR      NZ,MCR0
        CALL    INVERT
        RET
INVERT  LD      HL,VIDEO+64
        LD      BC,1024-64-1
INV0    LD      A,(HL)
        BIT     7,A
        JR      Z,INV1
        XOR     3FH
INV1    LD      (HL),A
        INC     HL
        DEC     BC
        LD      A,B
        OR      C
        JR      NZ,INV0
        RET
TPOI    DEFB    3
        DEFB    4
        DEFB    1
        DEFB    3
ADDPO   SUB     1
        ADD     A,A
        LD      C,A
        LD      B,0
        LD      HL,TPOI
        ADD     HL,BC
        LD      D,(HL)
        INC     HL
        LD      C,(HL)
        LD      B,0
        CALL    SCOR12
        CALL    SOUND
        ADD     HL,BC
ADP0    LD      A,(HL)
        ADD     A,D
        CP      '9'+1
        JR      C,ADP3
        LD      D,1
        SUB     10
ADP1    CP      '9'+1
        JR      C,ADP2
        SUB     '9'+1
        INC     D
        JR      ADP1
ADP2    LD      (HL),A
        DEC     C
        DEC     HL
        JP      P,ADP0
        CALL    SOUND
        RET
ADP3    LD      (HL),A
        CALL    SOUND
        RET
SCOR12  LD      A,(PLAY)
        CP      1
        JR      Z,SC12
        LD      HL,SCORE2
        RET
SC12    LD      HL,SCORE1
        RET
SBASE   LD      A,(BASE)
        CP      4
        JR      NZ,SBA0
        LD      A,(WSBA)
        OR      A
        JR      Z,SBA1
        DEC     A
        LD      (WSBA),A
        RET
SBA1    LD      A,1
        LD      (BASE),A
        CALL    SBA5
        CALL    SBA6
        RET
SBA0    CP      1
        RET     NZ
        LD      A,(3840H)
        AND     80H
        JR      NZ,SBA2
        IN      A,(0)
        CPL
        AND     10H
        JR      NZ,SBA2
        IN      A,(0)
        CPL
        AND     3
        CP      3
        RET     NZ
SBA2    LD      A,(PLAY)
        CP      1
        JR      NZ,SBA3
        LD      HL,DIS1
        JR      SBA4
SBA3    LD      HL,DIS2
SBA4    LD      A,(HL)
        OR      A
        JP      Z,DRMAZE
        DEC     (HL)
        LD      A,4
        LD      (BASE),A
        LD      A,32
        LD      (WSBA),A
        CALL    SBA6
        CALL    SBA5
        RET
SBA5    LD      C,16
SBA7    LD      A,1
        OUT     (255),A
        LD      B,50
        DJNZ    $
        XOR     A
        OUT     (255),A
        LD      B,50
        DJNZ    $
        DEC     C
        JR      NZ,SBA7
        RET
SBA6    LD      C,16
SBA8    LD      A,1
        OUT     (255),A
        LD      B,30
        DJNZ    $
        XOR     A
        OUT     (255),A
        LD      B,30
        DJNZ    $
        DEC     C
        JR      NZ,SBA8
        RET
WSBA    DEFB    0
MDBA    LD      A,(BASE)
        CP      1
        RET     NZ
        LD      A,(DEMO)
        OR      A
        RET     Z
        LD      A,(DECX)
        LD      B,A
        LD      A,(DECY)
        OR      B
        RET     NZ
        LD      A,(DEMDIR)
        DEC     A
MDB0    AND     3
        PUSH    AF
        OR      A
        JR      Z,MDU
        DEC     A
        JR      Z,MDL
        DEC     A
        JR      Z,MDD
        JR      MDR
MDU     LD      A,(PY)
        CP      1
        JR      Z,MDN
        CALL    CASE
        LD      DE,-21
        ADD     HL,DE
        BIT     1,(HL)
        JR      NZ,MDN
        JR      MDOK
MDL     LD      A,(PX)
        CP      1
        JR      Z,MDN
        CALL    CASE
        DEC     HL
        BIT     0,(HL)
        JR      NZ,MDN
        JR      MDOK
MDD     LD      A,(PY)
        CP      13
        JR      Z,MDN
        CALL    CASE
        BIT     1,(HL)
        JR      NZ,MDN
        JR      MDOK
MDR     LD      A,(PX)
        CP      21
        JR      Z,MDN
        CALL    CASE
        BIT     0,(HL)
        JR      Z,MDOK
MDN     POP     AF
        INC     A
        JR      MDB0
MDOK    POP     AF
        LD      (DEMDIR),A
        RET
MBASE   LD      A,(BASE)
        OR      A
        JR      NZ,MBASE0
        LD      A,(WBAS)
        OR      A
        JR      NZ,MBASE1
        LD      A,1
        LD      (BASE),A
        RET
MBASE1  DEC     A
        LD      (WBAS),A
        RET
MBASE0  CP      1
        JP      NZ,MEXP
        XOR     A
        LD      (DIRE),A
        LD      H,0
        LD      A,(3840H)
        AND     20H
        LD      B,A
        LD      A,(3820H)
        AND     10H
        OR      B
        LD      B,A
        IN      A,(0)
        CPL
        AND     4
        OR      B
        JR      Z,MBR
        DEC     H
MBR     LD      A,(3840H)
        AND     40H
        LD      B,A
        LD      A,(3820H)
        AND     40H
        OR      B
        LD      B,A
        IN      A,(0)
        CPL
        AND     8
        OR      B
        JR      Z,MBH
        INC     H
MBH     LD      A,(DEMO)
        OR      A
        JR      Z,MBH0
        LD      A,(DEMDIR)
        CP      1
        JR      NZ,MBH1
        DEC     H
        JR      MBH0
MBH1    CP      3
        JR      NZ,MBH0
        INC     H
MBH0    LD      A,H
        OR      A
        JP      Z,MBU
        JP      P,MB0
        LD      A,(DECX)
        OR      A
        JR      NZ,MB5
        LD      A,(PX)
        CP      1
        JP      Z,MBU
        CALL    CASE
        DEC     HL
        BIT     0,(HL)
        JP      NZ,MBU
        LD      A,(DECY)
        OR      A
        JP      NZ,MBU
MB5     LD      A,(DECX)
        CP      0FAH
        JR      Z,MB1
        DEC     A
        LD      (DECX),A
        JR      MB2
MB1     XOR     A
        LD      (DECX),A
        LD      A,(PX)
        DEC     A
        LD      (PX),A
MB2     LD      A,1
        LD      (DIRE),A
        LD      A,(PXS)
        CP      17
        JR      C,MB3
        DEC     A
        LD      (PXS),A
        JP      MBU
MB3     CP      16
        JR      NZ,MB4
        LD      A,(X)
        OR      A
        JR      Z,MB4
        LD      A,(MX)
        DEC     A
        LD      (MX),A
        JP      P,MBU
        LD      A,6
        LD      (MX),A
        LD      A,(X)
        DEC     A
        LD      (X),A
        JP      MBU
MB4     LD      A,(PXS)
        CP      2
        JP      Z,MBU
        DEC     A
        LD      (PXS),A
        JP      MBU
MB0     LD      A,(DECX)
        OR      A
        JR      NZ,MB6
        LD      A,(PX)
        CP      21
        JP      Z,MBU
        CALL    CASE
        BIT     0,(HL)
        JP      NZ,MBU
        LD      A,(DECY)
        OR      A
        JP      NZ,MBU
MB6     LD      A,(DECX)
        CP      6
        JR      Z,MB7
        INC     A
        LD      (DECX),A
        JR      MB8
MB7     XOR     A
        LD      (DECX),A
        LD      A,(PX)
        INC     A
        LD      (PX),A
MB8     LD      A,2
        LD      (DIRE),A
        LD      A,(PXS)
        CP      44
        JR      NC,MB9
        INC     A
        LD      (PXS),A
        JP      MBU
MB9     CP      44
        JR      NZ,MB10
        LD      A,(MX)
        CP      6
        JR      NZ,MB11
        LD      A,(X)
        CP      12
        JP      Z,MB10
MB11    LD      A,(MX)
        INC     A
        LD      (MX),A
        CP      7
        JP      C,MBU
        XOR     A
        LD      (MX),A
        LD      A,(X)
        INC     A
        LD      (X),A
        JP      MBU
MB10    LD      A,(PXS)
        CP      58
        JP      Z,MBU
        INC     A
        LD      (PXS),A
MBU     LD      H,0
        LD      A,(3840H)
        AND     8
        LD      B,A
        IN      A,(0)
        CPL
        AND     1
        OR      B
        JR      Z,MBD
        DEC     H
MBD     LD      A,(3840H)
        AND     10H
        LD      B,A
        IN      A,(0)
        CPL
        AND     2
        OR      B
        JR      Z,MBV
        INC     H
MBV     LD      A,(DEMO)
        OR      A
        JR      Z,MBV0
        LD      A,(DEMDIR)
        CP      0
        JR      NZ,MBV1
        DEC     H
        JR      MBV0
MBV1    CP      2
        JR      NZ,MBV0
        INC     H
MBV0    LD      A,H
        OR      A
        RET     Z
        JP      P,MB12
        LD      A,(DECY)
        OR      A
        JR      NZ,MB13
        LD      A,(PY)
        CP      1
        RET     Z
        CALL    CASE
        LD      DE,-21
        ADD     HL,DE
        BIT     1,(HL)
        RET     NZ
        LD      A,(DECX)
        OR      A
        RET     NZ
MB13    LD      A,(DECY)
        CP      0F8H
        JR      Z,MB14
        DEC     A
        LD      (DECY),A
        JR      MB15
MB14    XOR     A
        LD      (DECY),A
        LD      A,(PY)
        DEC     A
        LD      (PY),A
MB15    LD      A,3
        LD      (DIRE),A
        LD      A,(PYS)
        CP      15
        JR      C,MB16
        DEC     A
        LD      (PYS),A
        RET
MB16    CP      14
        JR      NZ,MB17
        LD      A,(Y)
        OR      A
        JR      Z,MB17
        LD      A,(MY)
        DEC     A
        LD      (MY),A
        RET     P
        LD      A,8
        LD      (MY),A
        LD      A,(Y)
        DEC     A
        LD      (Y),A
        RET
MB17    LD      A,(PYS)
        CP      5
        RET     Z
        DEC     A
        LD      (PYS),A
        RET
MB12    LD      A,(DECY)
        OR      A
        JR      NZ,MB18
        LD      A,(PY)
        CP      13
        RET     Z
        CALL    CASE
        BIT     1,(HL)
        RET     NZ
        LD      A,(DECX)
        OR      A
        RET     NZ
MB18    LD      A,(DECY)
        CP      8
        JR      Z,MB19
        INC     A
        LD      (DECY),A
        JR      MB20
MB19    XOR     A
        LD      (DECY),A
        LD      A,(PY)
        INC     A
        LD      (PY),A
MB20    LD      A,4
        LD      (DIRE),A
        LD      A,(PYS)
        CP      31
        JR      NC,MB21
        INC     A
        LD      (PYS),A
        RET
MB21    CP      31
        JR      NZ,MB22
        LD      A,(Y)
        CP      9
        JR      Z,MB22
        LD      A,(MY)
        INC     A
        LD      (MY),A
        CP      9
        RET     C
        XOR     A
        LD      (MY),A
        LD      A,(Y)
        INC     A
        LD      (Y),A
        RET
MB22    LD      A,(PYS)
        CP      40
        RET     Z
        INC     A
        LD      (PYS),A
        RET
WEXP    DEFB    32
MEXP    CP      2
        RET     NZ
        LD      A,(ALTZ)
        XOR     3FH
        LD      (ALTZ),A
        LD      A,(WEXP)
        OR      A
        JR      Z,MEX0
        DEC     A
        LD      (WEXP),A
        LD      A,(WEXP)
        ADD     A,7
        LD      E,A
        LD      C,8
MEX1    LD      A,1
        OUT     (255),A
        LD      B,E
        DJNZ    $
        XOR     A
        OUT     (255),A
        LD      B,E
        DJNZ    $
        DEC     C
        JR      NZ,MEX1
        RET
MEX0    LD      A,3
        LD      (BASE),A
        RET
DBAB    LD      IX,TBAD
        LD      B,5
DBB0    PUSH    BC
        LD      A,(IX)
        CP      1
        JP      NZ,DBB1
        LD      A,(X)
        LD      B,A
        LD      DE,7
        CALL    MUL16
        PUSH    HL
        LD      A,(IX+1)
        LD      B,A
        LD      DE,7
        CALL    MUL16
        POP     DE
        OR      A
        SBC     HL,DE
        LD      A,(MX)
        LD      B,A
        LD      A,L
        SUB     B
        INC     A
        LD      E,A
        LD      A,(IX+3)
        CP      1
        JR      NZ,DBB2
        LD      A,(IX+4)
        LD      B,A
        LD      A,E
        SUB     B
        LD      E,A
        JR      DBB3
DBB2    CP      3
        JR      NZ,DBB3
        LD      A,(IX+4)
        ADD     A,E
        LD      E,A
DBB3    PUSH    DE
        LD      A,(Y)
        LD      B,A
        LD      DE,9
        CALL    MUL16
        PUSH    HL
        LD      A,(IX+2)
        LD      B,A
        LD      DE,9
        CALL    MUL16
        POP     DE
        OR      A
        SBC     HL,DE
        LD      A,(MY)
        LD      B,A
        LD      A,L
        SUB     B
        ADD     A,4
        POP     DE
        LD      D,A
        LD      A,(IX+3)
        CP      0
        JR      NZ,DBB5
        LD      A,(IX+4)
        LD      B,A
        LD      A,D
        SUB     B
        LD      D,A
        JR      DBB6
DBB5    CP      2
        JR      NZ,DBB6
        LD      A,(IX+4)
        ADD     A,D
        LD      D,A
DBB6    LD      A,E
        CP      253
        JR      NC,DBB7
        CP      64
        JP      NC,DBB1
DBB7    LD      A,D
        CP      254
        JR      NC,DBB8
        CP      48
        JP      NC,DBB1
DBB8    PUSH    IX
        CALL    POSI
        POP     IX
        EXX
        PUSH    AF
        LD      DE,BABL
        LD      A,(IX+3)
        AND     2
        SRL     A
        LD      C,A
        LD      B,0
        LD      HL,TABR
        ADD     HL,BC
        LD      L,(HL)
        LD      H,0
        ADD     HL,DE
        EX      DE,HL
        POP     AF
        LD      C,A
        LD      B,0
        LD      HL,TABC
        ADD     HL,BC
        LD      L,(HL)
        LD      H,0
        ADD     HL,DE
        EXX
        PUSH    HL
        EXX
        POP     DE
        PUSH    HL
        LD      HL,SCRTIR-SCR
        ADD     HL,DE
        EX      DE,HL
        POP     HL
        LD      C,0
        EXX
        LD      B,3
DBB9    LD      A,D
        CP      48
        JR      NC,DBB10
        CP      3
        JR      C,DBB10
        LD      C,4
DBB11   LD      A,E
        CP      64
        JR      NC,DBB12
        EXX
        LD      A,(DE)
        AND     (HL)
        OR      C
        LD      C,A
        INC     DE
        LD      A,(HL)
        INC     HL
        EXX
        OR      (HL)
        LD      (HL),A
DBB13   INC     HL
        INC     E
        DEC     C
        JR      NZ,DBB11
        JR      DBB14
DBB12   EXX
        INC     HL
        INC     DE
        EXX
        JR      DBB13
DBB10   EXX
        INC     HL
        INC     HL
        INC     HL
        INC     HL
        PUSH    HL
        LD      HL,64
        ADD     HL,DE
        EX      DE,HL
        POP     HL
        EXX
        PUSH    DE
        LD      DE,64
        ADD     HL,DE
        POP     DE
        JR      DBB15
DBB14   PUSH    DE
        LD      DE,60
        ADD     HL,DE
        POP     DE
        EXX
        PUSH    HL
        LD      HL,60
        ADD     HL,DE
        EX      DE,HL
        POP     HL
        EXX
        LD      A,E
        SUB     4
        LD      E,A
DBB15   INC     D
        INC     D
        INC     D
        DJNZ    DBB9
        EXX
        LD      A,C
        EXX
        AND     3FH
        JR      Z,DBB1
        LD      A,2
        CALL    ADDPO
        RANDOM  2,3
        LD      (IX),A
        RANDOM  1,21
        LD      (IX+1),A
        RANDOM  1,13
        LD      (IX+2),A
        RANDOM  0,3
        LD      (IX+3),A
        LD      (IX+4),0
        CALL    INVERT
        LD      C,80
        XOR     A
MBB16   XOR     1
        OUT     (255),A
        LD      B,40
        DJNZ    $
        DEC     C
        JR      NZ,MBB16
DBB1    LD      DE,5
        ADD     IX,DE
        POP     BC
        DEC     B
        JP      NZ,DBB0
        RET
MBAB    LD      IX,TBAD
        LD      B,5
MBB0    PUSH    BC
        LD      A,(IX)
        CP      1
        JR      NZ,MBB1
        CALL    MOVE
MBB1    LD      DE,5
        ADD     IX,DE
        POP     BC
        DJNZ    MBB0
        LD      HL,WBAB
        PUSH    HL
        LD      B,6
        XOR     A
MBB6    OR      (HL)
        INC     HL
        DJNZ    MBB6
        POP     HL
        CP      '0'
        RET     Z
        LD      BC,5
        ADD     HL,BC
MBB7    LD      A,(HL)
        DEC     A
        CP      '0'-1
        JR      NZ,MBB8
        ADD     A,10
        LD      (HL),A
        DEC     C
        DEC     HL
        JP      P,MBB7
        LD      HL,WBAB
        LD      DE,WBAB+1
        LD      BC,5
        LD      (HL),'0'
        LDIR
MBB4    LD      IX,TBAD
        LD      B,5
MBB2    PUSH    BC
        LD      A,(IX)
        CP      1
        JR      NZ,MBB3
        RANDOM  2,3
        LD      (IX),A
MBB3    LD      DE,5
        ADD     IX,DE
        POP     BC
        DJNZ    MBB2
        RET
MBB8    LD      (HL),A
        LD      HL,WBAB
        LD      B,6
        XOR     A
MBB10   OR      (HL)
        INC     HL
        DJNZ    MBB10
        CP      '0'
        JR      Z,MBB4
        LD      HL,WBAB
        LD      B,5
        XOR     A
MBB9    OR      (HL)
        INC     HL
        DJNZ    MBB9
        CP      '0'
        RET     NZ
        LD      A,(HL)
        CP      '6'
        RET     NC
        LD      C,30
MBB5    LD      A,1
        OUT     (255),A
        LD      B,30
        DJNZ    $
        XOR     A
        OUT     (255),A
        LD      B,30
        DJNZ    $
        DEC     C
        JR      NZ,MBB5
        RET
        INCLUDE VOICE1
        DEFM    '--( BABLE TERROR IS THE 4TH '
        DEFM    'PROGRAM OF Y. LEMPEREUR )--'
        COND    0!(TYPE=DISK)!(TYPE=PROT)
        END     DEBUT
        ENDC
        COND    TYPE=TAPE
        ORG     4321H
        JP      DEBUT
        END     CLEAN
        ENDC
