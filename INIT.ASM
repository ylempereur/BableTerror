        COND    TYPE=DISK
WRITHS  LD      HL,FILES
        LD      DE,DCB
        LD      BC,13
        LDIR
        OPEN    DCB,ERROR,SCR,10*(10+6)
        POSN    DCB,ERROR,0
        WRITLR  DCB,ERROR,TSCOR
        CLOSE   DCB,ERROR
        DINT
        RET
        ENDC
        COND    TYPE=PROT
WRITHS  CALL    WRITE
        RET
        ENDC
SCHST   LD      IY,TSCOR
        CALL    SCOR12
        LD      B,5
        XOR     A
SCH0    OR      (HL)
        INC     HL
        DJNZ    SCH0
        CP      '0'
        RET     Z
        LD      B,10
SCH1    LD      C,10
        CALL    SCOR12
SCH2    LD      A,C
        LD      (SCH3+2),A
SCH3    LD      A,(IY+0)
        CP      (HL)
        JR      C,SCH5
        JR      NZ,SCH4
        INC     HL
        INC     C
        LD      A,C
        CP      16
        JR      NZ,SCH2
SCH4    LD      DE,16
        ADD     IY,DE
        DJNZ    SCH1
        RET
SCH5    PUSH    IY
        LD      A,B
        LD      (SVPL+1),A
        CP      1
        JR      Z,SCH7
        LD      HL,0
        LD      DE,16
        DEC     B
SCH6    ADD     HL,DE
        DJNZ    SCH6
        PUSH    HL
        POP     BC
        LD      HL,TSCOR+9*(10+6)-1
        LD      DE,TSCOR+10*(10+6)-1
        LDDR
SCH7    CALL    SCOR12
        POP     DE
        PUSH    DE
        LD      BC,10
        EX      DE,HL
        ADD     HL,BC
        EX      DE,HL
        LD      BC,6
        LDIR
SVPL    LD      B,0
        LD      HL,VIDEO+832+43
        LD      DE,-64
SCH8    ADD     HL,DE
        DJNZ    SCH8
        LD      IX,BLK1
        LD      A,(PLAY)
        CP      1
        JR      NZ,SCH9
        LD      IX,BLK2
SCH9    LD      (IX),L
        LD      (IX+1),H
        POP     HL
        LD      A,(PLAY)
        LD      B,A
        JP      INGS
SVHL    DEFW    0
SVBC    DEFW    0
WAITER  DEFW    0
INGS    PUSH    HL
        PUSH    BC
        LD      (SVBC),BC
        LD      (SVHL),HL
        LD      B,10
ING5    LD      (HL),' '
        INC     HL
        DJNZ    ING5
        LD      A,1
        LD      (EDIS),A
        LD      HL,15000
        LD      (WAITER),HL
        CALL    CLSSCR
        XOR     A
        LD      (BLINK),A
        CALL    DSCORE
        CALL    DHSCOR
        CALL    AFFHS
        LD      A,' '
        LD      (SCR+20),A
        LD      (SCR+21),A
        CALL    SCRVID
        LD      HL,TAGS
        LD      DE,VIDEO+192+14
ING0    LD      A,(HL)
        INC     HL
        OR      A
        JR      Z,ING1
        DEC     HL
        CALL    AFF1C
        INC     HL
        INC     DE
        JR      ING0
ING1    LD      A,(HL)
        CP      0FFH
        JR      Z,ING2
        LD      C,A
        LD      B,0
        EX      DE,HL
        ADD     HL,BC
        EX      DE,HL
        INC     HL
        JR      ING0
ING2    POP     BC
        LD      A,B
        LD      HL,VIDEO+10
        LD      B,'<'
        CP      1
        JR      Z,ING3
        LD      A,'2'
        LD      B,'>'
        LD      HL,VIDEO+42
        LD      (VIDEO+192+24),A
ING3    LD      A,10
ING4    LD      (HL),B
        INC     HL
        DEC     A
        JR      NZ,ING4
        POP     IX
        LD      B,0
        LD      HL,(BLK1)
        LD      A,(PLAY)
        CP      1
        JR      NZ,INGH
        LD      HL,(BLK2)
INGH    DEC     HL
        LD      (HL),'>'
        INC     HL
        CALL    2BH
ING6    LD      (HL),8FH
ING7    CALL    2BH
        OR      A
        JR      NZ,INGI
INGI0   DEC     A
        JR      NZ,INGI0
        LD      DE,(WAITER)
        DEC     DE
        LD      (WAITER),DE
        LD      A,E
        OR      D
        JR      Z,INGI1
        LD      A,E
        OR      A
        JR      Z,INGI2
        CP      80H
        JR      NZ,INGI3
        LD      A,' '
        LD      (VIDEO+192+24),A
INGI3   LD      A,E
        AND     7FH
        CP      10
        JR      Z,INGI4
        CP      74
        JR      NZ,ING7
        LD      A,8FH
        JR      INGI5
INGI4   LD      A,' '
INGI5   LD      (HL),A
        JR      ING7
INGI2   LD      A,(PLAY)
        ADD     A,'0'
        LD      (VIDEO+192+24),A
        JR      INGI3
INGI    CP      24
        JR      Z,ING9
        CP      0DH
        JR      NZ,INGL
INGI1   LD      (HL),' '
        RET
INGL    CP      8
        JR      Z,ING8
        CP      ' '
        JR      C,ING6
        EX      AF,AF'
        LD      A,B
        CP      10
        JR      Z,ING6
        EX      AF,AF'
        LD      (IX),A
        LD      (HL),A
        INC     HL
        INC     B
        INC     IX
        JR      ING6
ING8    LD      A,B
        OR      A
        JR      Z,ING6
        LD      (HL),' '
        DEC     IX
        DEC     HL
        LD      (IX),' '
        DEC     B
        JR      ING6
ING9    LD      HL,(SVHL)
        LD      BC,(SVBC)
        JP      INGS
TAGS    DEFM    '** Player 1 **'
        DEFB    0
        DEFB    114
        DEFW    0A3B7H
        DEFW    0B791H
        DEFW    90BBH
        DEFW    0B3B7H
        DEFW    0BA81H
        DEFW    95B3H
        DEFW    0B783H
        DEFB    81H
        DEFB    0
        DEFB    49
        DEFW    8C8FH
        DEFW    8F85H
        DEFW    8580H
        DEFW    8C8FH
        DEFW    8F84H
        DEFW    8580H
        DEFW    8F80H
        DEFB    80H
        DEFB    0
        DEFB    49
        DEFW    0B3B7H
        DEFW    0B791H
        DEFW    8583H
        DEFW    0A397H
        DEFW    0B795H
        DEFW    90BBH
        DEFW    0B3B7H
        DEFB    81H
        DEFB    0
        DEFB    49
        DEFW    8E8CH
        DEFW    8F85H
        DEFW    858CH
        DEFW    8E8DH
        DEFW    8F85H
        DEFW    8580H
        DEFW    8C8FH
        DEFB    84H
        DEFB    0
        DEFB    113
        DEFM    'Please   enter'
        DEFB    0
        DEFB    50
        DEFM    'your  name  or'
        DEFB    0
        DEFB    50
        DEFM    '   initials   '
        DEFB    0
        DEFB    0FFH
PRINT   LD      E,(HL)
        INC     HL
        LD      D,(HL)
        INC     HL
PRI0    LD      A,(HL)
        INC     HL
        DEC     A
        RET     Z
        INC     A
        JR      Z,PRINT
        LD      B,A
        LD      (DE),A
        LD      A,(DE)
        CP      B
        JR      Z,PRI1
        LD      A,B
        SUB     20H
        LD      (DE),A
PRI1    INC     DE
        JR      PRI0
TABFUN  DEFW    0BFBFH  ; "F"
        DEFW    0BFBFH
        DEFW    8F8FH
        DEFW    8F8FH
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    0B0B0H
        DEFW    0B0B0H
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    8383H
        DEFW    8383H
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    8080H
        DEFW    8080H
        DEFW    0BFBFH  ; "U"
        DEFW    0BFBFH
        DEFW    8080H
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    8080H
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    8080H
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    0BCBCH
        DEFW    0BFBFH
        DEFW    0BFBFH  ; "N"
        DEFW    8F8FH
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    8080H
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    8080H
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    8080H
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    0BFBFH  ; "S"
        DEFW    0BFBFH
        DEFW    8F8FH
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    0B0B0H
        DEFW    0B3B3H
        DEFW    0B3B3H
        DEFW    8383H
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    0BCBCH
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    0BFBFH  ; "O"
        DEFW    0BFBFH
        DEFW    8F8FH
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    8080H
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    8080H
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    0BCBCH
        DEFW    0BFBFH
        DEFW    0BFBFH  ; "F"
        DEFW    0BFBFH
        DEFW    8F8FH
        DEFW    8F8FH
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    0B0B0H
        DEFW    0B0B0H
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    8383H
        DEFW    8383H
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    8080H
        DEFW    8080H
        DEFW    8F8FH   ; "T"
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    8F8FH
        DEFW    8080H
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    8080H
        DEFW    8080H
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    8080H
        DEFW    8080H
        DEFW    0BFBFH
        DEFW    0BFBFH
        DEFW    8080H
TABPF   DEFW    100H
        DEFW    402H
        DEFW    1008H
        DEFW    4020H
        DEFW    4241H
        DEFW    4844H
        DEFW    6050H
        DEFW    6261H
        DEFW    6864H
        DEFW    7170H
        DEFW    7472H
        DEFW    7978H
        DEFW    7C7AH
        DEFW    7E7DH
        DEFW    7F7FH
        DEFW    7F7FH
        DEFW    7F7FH
        DEFW    7F7FH
        DEFW    7F7FH
        DEFW    7F7FH
        DEFW    0
        DEFW    7F7FH
        DEFW    0
        DEFW    7F7FH
        DEFW    0
        DEFW    7F7FH
        DEFW    1F3FH
        DEFW    70FH
        DEFW    103H
        DEFW    100H
        DEFW    402H
        DEFW    1008H
        DEFW    4020H
        DEFW    1020H
        DEFW    408H
        DEFW    102H
        DEFW    402H
        DEFW    1008H
        DEFW    4020H
        DEFW    7060H
        DEFW    7C78H
        DEFW    7F7EH
        DEFW    7F7FH
        DEFW    7F7FH
        DEFW    7F7FH
        DEFW    7F7FH
        DEFW    7F7FH
        DEFW    7F7FH
        DEFW    7F7FH
        DEFW    7F7FH
        DEFB    80H
TABDIS  DEFM    'Published by'
        DEFM    'Funsoft, Inc.'
        DEFM    '28611 Canwood'
        DEFM    'Agoura, CA 91301'
        DEFM    '(213) 991-6540'
PLETR   PUSH    AF
        PUSH    HL
        PUSH    DE
        PUSH    BC
        LD      B,4
PLE0    PUSH    BC
        LD      B,8
PLE1    LD      A,(HL)
        LD      (DE),A
        INC     HL
        INC     DE
        DJNZ    PLE1
        EX      DE,HL
        LD      BC,56
        ADD     HL,BC
        EX      DE,HL
        POP     BC
        DJNZ    PLE0
PLE2    POP     BC
        POP     DE
        POP     HL
        POP     AF
        RET
CLETR   PUSH    AF
        PUSH    HL
        PUSH    DE
        PUSH    BC
        EX      DE,HL
        LD      B,4
CLE0    LD      C,8
CLE1    LD      (HL),80H
        INC     HL
        DEC     C
        JR      NZ,CLE1
        LD      DE,56
        ADD     HL,DE
        DJNZ    CLE0
        JR      PLE2
PFUN    PUSH    AF
        PUSH    HL
        PUSH    DE
        PUSH    BC
        SLA     A
        LD      HL,TABFUN
        LD      B,7
PFU0    PUSH    BC
        SLA     A
        CALL    C,PLETR
        CALL    NC,CLETR
        EX      DE,HL
        LD      BC,9
        ADD     HL,BC
        EX      DE,HL
        LD      BC,4*8
        ADD     HL,BC
        POP     BC
        DJNZ    PFU0
        JR      PLE2
PROFUN  LD      HL,TABPF
        LD      DE,VIDEO+192+1
PRF0    LD      A,(HL)
        INC     HL
        BIT     7,A
        RET     NZ
        CALL    PFUN
        CALL    GLIFUN
        CALL    GLIFUN
        JR      PRF0
CADRE   LD      HL,SCR+960+1
        EXX
        LD      HL,SCR+512+1
        LD      DE,SCR+640+1
        LD      B,62
        LD      A,83H
CAD0    EXX
        LD      (HL),8CH
        INC     HL
        EXX
        LD      (HL),8CH
        LD      (DE),A
        INC     HL
        INC     DE
        DJNZ    CAD0
        LD      HL,SCR+576
        LD      DE,63
        LD      B,6
CAD1    LD      (HL),0BFH
        ADD     HL,DE
        LD      (HL),0BFH
        INC     HL
        DJNZ    CAD1
        LD      A,0BCH
        LD      (SCR+512),A
        LD      (SCR+512+63),A
        LD      A,8FH
        LD      (SCR+960),A
        LD      (SCR+960+63),A
        RET
TGFUN   DEFM    'FUNSOFT '
CGLI    DEFB    0
GLIFUN  EXX
        LD      A,(CGLI)
        INC     A
        AND     7
        LD      (CGLI),A
        LD      (GLI0+2),A
        LD      IX,TGFUN
        LD      HL,VIDEO+576+1
        LD      B,62
GLI0    LD      A,(IX+0)
        LD      (HL),A
        INC     HL
        LD      A,(GLI0+2)
        INC     A
        AND     7
        LD      (GLI0+2),A
        DJNZ    GLI0
        LD      BC,800H
GLI1    LD      A,(38FFH)
        OR      A
        JR      Z,GLI2
        POP     HL
        RET
GLI2    DEC     BC
        LD      A,B
        OR      C
        JR      NZ,GLI1
        EXX
        RET
DEBUT   DINT
        LD      HL,STACK
        LD      SP,HL
        LD      H,37H
        LD      L,0E4H
        LD      (HL),1
        LD      A,38H
        OUT     (0ECH),A
        COND    TYPE=PROT
        CALL    CHECKS
        ENDC
        CALL    EHS
        COND    TYPE=PROT
        CALL    CHECKR
        ENDC
        CALL    SCR191
        CALL    DISPL
        CALL    CLSSCR
        LD      HL,TABDIS
        LD      DE,SCR+64+26
        LD      BC,12
        CALL    AFF1L
        LD      DE,SCR+704+25
        LD      BC,13
        CALL    AFF1L
        LD      DE,SCR+768+25
        LD      BC,13
        CALL    AFF1L
        LD      DE,SCR+832+24
        LD      BC,16
        CALL    AFF1L
        LD      DE,SCR+896+25
        LD      BC,14
        CALL    AFF1L
        CALL    CADRE
        CALL    DISPL
        CALL    PROFUN
        JP      START
BEGIN   LD      HL,STACK
        LD      SP,HL
        XOR     A
        LD      (COUNTS),A
        LD      A,(DEMO)
        OR      A
        JR      Z,BEG0
        LD      A,2
        LD      (NPLAY),A
        JR      BEG1
BEG0    LD      HL,0
        LD      (BLK1),HL
        LD      (BLK2),HL
BEG1    LD      A,1
        LD      (PLAY),A
        CALL    CMAZE
        CALL    SCR191
        CALL    DISPL
        CALL    INITS
        CALL    CLSSCR
        CALL    CLSTIR
        CALL    DBAD
        CALL    DBASE
        CALL    DBAB
        CALL    EBASE
        CALL    DMAZE
        CALL    DSCORE
        CALL    DHSCOR
        CALL    DBONUS
        CALL    DIALOG
        CALL    DISPL
        XOR     A
        LD      (COUNTS),A
MAIN    CALL    CLSSCR
        CALL    DBAD
        CALL    DBASE
        CALL    DBAB
        CALL    EBASE
        CALL    DMAZE
        CALL    BRKCLR
        CALL    DSCORE
        CALL    DHSCOR
        CALL    DBONUS
        CALL    DIALOG
        CALL    SCRVID
        CALL    PROC
        CALL    NMAZE
        CALL    SBASE
        CALL    MDBA
        CALL    MBASE
        CALL    MCROI
        CALL    MBAD
        CALL    MBAB
        JR      MAIN
BRKCLR  LD      A,(3840H)
        AND     6
        CP      6
        JP      Z,DEBUT
        LD      A,(DEMO)
        OR      A
        CALL    SOUND
        JR      Z,BRK2
        LD      A,(38FFH)
        OR      A
        RET     Z
        LD      HL,20000
        LD      (IPRO+1),HL
        JP      START
BRK2    LD      A,(3801H)
        AND     1
        RET     Z
        LD      A,(3880H)
        AND     1
        RET     Z
BRK0    LD      A,(38FFH)
        OR      A
        JR      NZ,BRK0
        LD      B,0
        DJNZ    $
BRK1    LD      A,(38FFH)
        OR      A
        JR      Z,BRK1
        LD      B,0
        DJNZ    $
        RET
SCRVID  LD      A,(DEMO)
        OR      A
        JR      Z,SCRV0
        LD      HL,CEI0
        LD      DE,SCR+23
        LD      B,18
SCRV1   LD      A,(HL)
        CALL    DISA
        INC     HL
        INC     DE
        DJNZ    SCRV1
SCRV0   CALL    AFF
        CALL    SOUND
        COND    0!(TYPE=TAPE)!(TYPE=PROT)
        CALL    TRCLN
        ENDC
        RET
CEI0    DEFM    '** BABLE TERROR **'
INITS   LD      HL,TINIT
        LD      DE,SCORE1
        LD      BC,TINIT-SCORE1
        LDIR
        RET
INIT0   LD      HL,TINIT0
        LD      DE,BASE
        LD      BC,TINIT-BASE
        LDIR
        RET
INIT1   LD      A,1
        LD      (BASE),A
        XOR     A
        LD      (NCROI),A
        RET
DIALOG  LD      A,(BASE)
        CP      1
        RET     Z
        OR      A
        JR      NZ,DIA0
        LD      HL,TPLAY
        LD      DE,SCR+448+28
        LD      BC,7
        CALL    AFF1L
        LD      A,(PLAY)
        OR      '0'
        LD      (DE),A
        CALL    SOUND
        RET
DIA0    CP      2
        RET     NZ
        LD      A,(PLAY)
        CP      1
        JR      NZ,DIA1
        LD      A,'1'
        EX      AF,AF'
        LD      A,(SHP1)
        JR      DIA2
DIA1    LD      A,'2'
        EX      AF,AF'
        LD      A,(SHP2)
DIA2    OR      A
        RET     NZ
        LD      HL,TGAM
        LD      DE,SCR+448+23
        LD      BC,17
        CALL    AFF1L
        CALL    SOUND
        EX      AF,AF'
        LD      (DE),A
        RET
TGAM    DEFM    'Game Over '
TPLAY   DEFM    'Player '
DSCORE  LD      A,(BLINK)
        INC     A
        AND     7
        LD      (BLINK),A
        LD      HL,LAST1
        LD      A,(SCORE1+2)
        CP      (HL)
        CALL    SOUND
        JR      Z,DSC0
        LD      (HL),A
        LD      HL,SHP1
        INC     (HL)
        CALL    EXTRA
DSC0    LD      HL,LAST2
        LD      A,(SCORE2+2)
        CP      (HL)
        JR      Z,DSC1
        LD      (HL),A
        LD      HL,SHP2
        INC     (HL)
        CALL    EXTRA
DSC1    LD      A,(PLAY)
        CP      1
        JR      NZ,DSC2
        LD      A,(BLINK)
        CP      4
        JR      NC,DSC3
DSC2    LD      HL,SCORE1
        LD      DE,SCR+3
        LD      BC,600H
DSC4    LD      A,(HL)
        CP      '0'
        JR      NZ,DSC5
        LD      A,C
        OR      A
        JR      Z,DSC6
        LD      A,'0'
DSC5    CALL    DISA
        CALL    SOUND
        LD      C,1
DSC6    INC     HL
        INC     DE
        DJNZ    DSC4
        DEC     DE
        LD      A,'0'
        CALL    DISA
        LD      A,(SHP1)
        OR      A
        JR      Z,DSC3
        CP      16H
        JR      C,DSC7
        LD      A,16H
DSC7    LD      DE,SCR+10
        LD      B,A
        LD      A,'+'
DSC8    CALL    DISA
        INC     DE
        DJNZ    DSC8
DSC3    LD      A,(NPLAY)
        CP      1
        JR      Z,DSC20
        LD      A,(PLAY)
        CP      2
        JR      NZ,DSC12
        LD      A,(BLINK)
        CP      4
        JR      NC,DSC20
DSC12   LD      HL,SCORE2
        LD      DE,SCR+37H
        LD      BC,600H
DSC14   LD      A,(HL)
        CP      '0'
        JR      NZ,DSC15
        LD      A,C
        OR      A
        DEC     DE
        JR      Z,DSC16
        INC     DE
        LD      A,'0'
DSC15   CALL    DISA
        LD      C,1
DSC16   INC     DE
        INC     HL
        DJNZ    DSC14
        LD      A,C
        OR      A
        JR      NZ,DSCOP
        LD      A,'0'
        CALL    DISA
DSCOP   LD      A,(SHP2)
        OR      A
        JR      Z,DSC20
        CP      16H
        JR      C,DSC17
        LD      A,16H
DSC17   LD      DE,SCR+35H
        LD      B,A
        LD      A,'+'
DSC18   CALL    DISA
        DEC     DE
        DJNZ    DSC18
DSC20   RET
EXTRA   LD      E,5
EXT0    LD      C,150
EXT1    LD      A,1
        OUT     (255),A
        LD      B,40
        DJNZ    $
        XOR     A
        OUT     (255),A
        LD      B,40
        DJNZ    $
        DEC     C
        JR      NZ,EXT1
        DEC     E
        RET     Z
        LD      C,100
EXT2    LD      A,1
        OUT     (255),A
        LD      B,60
        DJNZ    $
        XOR     A
        OUT     (255),A
        LD      B,60
        DJNZ    $
        DEC     C
        JR      NZ,EXT2
        JR      EXT0
DHSCOR  LD      A,(DEMO)
        OR      A
        RET     NZ
        LD      A,(NPLAY)
        CP      1
        JR      Z,DHS0
        LD      HL,SCORE1
        LD      DE,SCORE2
        LD      B,5
        CALL    SOUND
DHS1    LD      A,(DE)
        CP      (HL)
        JR      C,DHS0
        JR      NZ,DHS2
        INC     HL
        INC     DE
        DJNZ    DHS1
DHS0    LD      HL,SCORE1
        LD      A,1
        EX      AF,AF'
        JR      DHS3
DHS2    LD      HL,SCORE2
        LD      A,2
        EX      AF,AF'
DHS3    LD      DE,HSCORE
        PUSH    DE
        PUSH    HL
        CALL    SOUND
        LD      B,5
DHS4    LD      A,(DE)
        CP      (HL)
        JR      C,DHS5
        JR      NZ,DHS6
        INC     HL
        INC     DE
        DJNZ    DHS4
        XOR     A
        EX      AF,AF'
DHS5    POP     HL
        POP     DE
        EX      AF,AF'
        LD      B,A
        LD      A,(PLAY)
        CP      B
        JR      NZ,DHS7
        LD      A,(BLINK)
        CP      4
        RET     NC
        JR      DHS7
DHS6    POP     DE
        POP     HL
DHS7    CALL    SOUND
        LD      DE,SCR+1DH
        LD      B,6
DHS8    LD      A,(HL)
        CP      '0'
        JR      NZ,DHS9
        INC     HL
        INC     DE
        DJNZ    DHS8
        CALL    SOUND
        RET
DHS9    CALL    DISA
        INC     DE
        INC     HL
        LD      A,(HL)
        DJNZ    DHS9
        CALL    SOUND
        RET
DBONUS  LD      HL,TBON
        LD      DE,SCR+64+27
        LD      B,8
DBO0    LD      A,(HL)
        LD      (DE),A
        INC     DE
        INC     HL
        DJNZ    DBO0
        LD      HL,WBAB
        LD      DE,SCR+64+35
        LD      BC,600H
DBO1    LD      A,(HL)
        CP      '0'
        JR      NZ,DBO2
        LD      A,C
        OR      A
        DEC     DE
        JR      Z,DBO3
        INC     DE
        LD      A,'0'
DBO2    LD      (DE),A
        LD      C,1
DBO3    INC     DE
        INC     HL
        DJNZ    DBO1
        LD      A,C
        OR      A
        RET     NZ
        LD      A,'0'
        LD      (DE),A
        RET
TBON    DEFM    'BONUS : '
DISA    PUSH    BC
        LD      C,A
        LD      A,(DE)
        CP      80H
        LD      A,C
        POP     BC
        RET     NZ
        LD      (DE),A
        RET
RAND    CALL    RND
        LD      E,A
        LD      D,0
        CALL    MUL16
        LD      A,H
        RET
RND     LD      A,R
        ADD     A,C
        RRCA
        LD      L,A
        AND     2
        SRL     A
        LD      H,A
        ADD     A,(HL)
        RRCA
        ADD     A,(HL)
        SRL     A
        SUB     (HL)
        ADD     A,E
        RRCA
        ADD     A,C
RND0    XOR     0
        LD      (RND0+1),A
        RET
MUL16   LD      HL,0
LOOPM   SRL     B
        JR      NC,CONTM
        ADD     HL,DE
CONTM   RET     Z
        EX      DE,HL
        ADD     HL,HL
        EX      DE,HL
        JR      LOOPM
DIV16   LD      A,L
        LD      L,H
        LD      H,0
        LD      E,0
        LD      B,16
        LD      IX,0
LOOPD   ADD     HL,HL
        RLA
        JR      NC,LOOPD1
        INC     L
LOOPD1  ADD     IX,IX
        INC     IX
        OR      A
        SBC     HL,DE
        JR      NC,CONTD
        ADD     HL,DE
        DEC     IX
CONTD   DJNZ    LOOPD
        RET
EDIS    DEFB    0
PROC    LD      A,(BASE)
        CP      3
        RET     NZ
        CALL    SOUND
        LD      A,(SHP1)
        LD      B,A
        LD      A,(NPLAY)
        CP      1
        LD      A,0
        JR      Z,PROC0
        LD      A,(SHP2)
PROC0   OR      B
        JR      NZ,PROC1
        LD      A,(DEMO)
        OR      A
        JP      NZ,START
        LD      A,(NPLAY)
        CP      1
        JR      NZ,PROC2
        XOR     A
        LD      (EDIS),A
        CALL    SCHST
        COND    0!(TYPE=DISK)!(TYPE=PROT)
        LD      A,(EDIS)
        OR      A
        CALL    NZ,WRITHS
        ENDC
        JP      START
PROC2   LD      HL,SCORE1
        LD      DE,SCORE2
        LD      B,5
PROC3   LD      A,(DE)
        CP      (HL)
        JR      C,PROC4
        JR      NZ,PROC5
        INC     HL
        INC     DE
        DJNZ    PROC3
PROC4   LD      A,1
        JR      PROC6
PROC5   LD      A,2
PROC6   LD      (PLAY),A
        XOR     A
        LD      (EDIS),A
        CALL    SCHST
        LD      A,(PLAY)
        NEG
        ADD     A,3
        LD      (PLAY),A
        CALL    SCHST
        COND    0!(TYPE=DISK)!(TYPE=PROT)
        LD      A,(EDIS)
        OR      A
        CALL    NZ,WRITHS
        ENDC
        JP      START
PROC1   CALL    INIT1
        LD      A,(NPLAY)
        CP      1
        JR      NZ,PROC7
        CALL    SOUND
        RET
PROC7   LD      A,(PLAY)
        CP      1
        JR      Z,PROC8
        LD      A,(SHP1)
        JR      PROC9
PROC8   LD      A,(SHP2)
PROC9   OR      A
        RET     Z
        LD      HL,PLAY
        LD      A,3
        SUB     (HL)
        LD      (HL),A
        CALL    INIT1
        CALL    SOUND
        XOR     A
        LD      (COUNTS),A
        RET
        COND    TYPE=PROT
CHECKS  JR      CHES
CHES0   LD      A,(CHKS)
        LD      H,44H
        LD      L,8
        CP      (HL)
        RET     Z
        JR      CLEANP
CHES    LD      HL,3C00H
        LD      BC,1024
        CALL    CHECK
        LD      (CHKS),A
        XOR     A
        LD      (CHECKS+1),A
        JR      CHES0
CHKS    DEFB    0
CLEANP  LD      HL,8000H
        LD      DE,4000H
        LD      BC,8000H
        LDIR
        RET
CHECK   XOR     A
CHE0    ADD     A,(HL)
        LD      E,A
        INC     HL
        DEC     BC
        LD      A,B
        OR      C
        LD      A,E
        JR      NZ,CHE0
        RET
CHECKR  JR      CHER
CHER0   LD      A,(CHKR)
        LD      H,44H
        LD      L,0AH
        CP      (HL)
        RET     Z
        JR      CLEANP
CHER    LD      HL,0A000H
        LD      BC,6000H
        CALL    CHECK
        LD      (CHKR),A
        XOR     A
        LD      (CHECKR+1),A
        JR      CHER0
CHKR    DEFB    0
        ENDC
TEC1    DEFM    'BABLE TERROR'
TEC2    DEFM    'Yves Lempereur'
TEC3    DEFM    'Player 1'
ECRIT   LD      HL,TEC1
        LD      DE,SCR+960
        LD      BC,12
        CALL    AFF1L
        LD      HL,TEC2
        LD      DE,SCR+960+50
        LD      BC,14
        CALL    AFF1L
        LD      HL,TEC3
        LD      DE,SCR+960+28
        LD      BC,8
        CALL    AFF1L
        LD      A,(PLAY)
        CP      1
        RET     Z
        LD      A,'2'
        LD      (SCR+960+35),A
        RET
DISMAZ  CALL    CLSSCR
        LD      HL,SCR
        LD      B,13
CMA0    PUSH    BC
        LD      B,21
CMA1    LD      (HL),0BFH
        INC     HL
        LD      (HL),83H
        INC     HL
        LD      (HL),83H
        INC     HL
        DJNZ    CMA1
        LD      (HL),0BFH
        INC     HL
        POP     BC
        DJNZ    CMA0
        LD      B,64
CMA2    LD      (HL),83H
        INC     HL
        DJNZ    CMA2
        CALL    ECRIT
        CALL    AFF
        RET
CMAZE   CALL    DISMAZ
        LD      HL,MAZE
        LD      DE,MAZE+1
        LD      BC,273
        LD      (HL),83H
        LDIR
        RANDOM  1,21
        LD      (X),A
        LD      (MZXY),A
        RANDOM  1,13
        LD      (Y),A
        LD      (MZXY+1),A
        LD      HL,1
        LD      (K),HL
CMA3    LD      IX,Z1
        LD      (IX),0
        LD      (IX+1),0
        LD      (IX+2),0
        LD      (IX+3),0
        LD      A,(Y)
        DEC     A
        LD      B,A
        LD      DE,21
        CALL    MUL16
        LD      A,(X)
        LD      E,A
        LD      D,0
        ADD     HL,DE
        LD      DE,MAZE
        ADD     HL,DE
        LD      (PR),HL
        LD      A,(HL)
        AND     7FH
        LD      (HL),A
        LD      A,(X)
        CP      21
        JR      Z,CMA4
        LD      HL,(PR)
        INC     HL
        LD      A,(HL)
        RLCA
        AND     1
        LD      (Z1),A
CMA4    LD      A,(Y)
        CP      13
        JR      Z,CMA5
        LD      HL,(PR)
        LD      DE,21
        ADD     HL,DE
        LD      A,(HL)
        RLCA
        AND     1
        LD      (Z2),A
CMA5    LD      A,(X)
        CP      1
        JR      Z,CMA6
        LD      HL,(PR)
        DEC     HL
        LD      A,(HL)
        RLCA
        AND     1
        LD      (Z3),A
CMA6    LD      A,(Y)
        CP      1
        JR      Z,CMA7
        LD      HL,(PR)
        LD      DE,-21
        ADD     HL,DE
        LD      A,(HL)
        RLCA
        AND     1
        LD      (Z4),A
CMA7    LD      IX,Z1
        LD      A,(IX)
        ADD     A,(IX+1)
        ADD     A,(IX+2)
        ADD     A,(IX+3)
        JP      Z,CMAR
        RANDOM  1,4
        LD      (COUNT),A
CMA8    LD      A,(COUNT)
        INC     A
        CP      5
        JR      C,CMA9
        LD      A,1
CMA9    LD      (COUNT),A
        DEC     A
        JR      Z,RIG
        DEC     A
        JR      Z,DOW
        DEC     A
        JR      Z,LEF
        JR      UP
RIG     LD      A,(Z1)
        OR      A
        JR      Z,CMA8
        LD      HL,(PR)
        LD      A,(HL)
        AND     7EH
        LD      (HL),A
        CALL    EFFRIG
        LD      A,(X)
        INC     A
        LD      (X),A
        JP      CMA10
DOW     LD      A,(Z2)
        OR      A
        JR      Z,CMA8
        LD      HL,(PR)
        LD      A,(HL)
        AND     7DH
        LD      (HL),A
        CALL    EFFDOW
        LD      A,(Y)
        INC     A
        LD      (Y),A
        JP      CMA10
LEF     LD      A,(Z3)
        OR      A
        JR      Z,CMA8
        LD      HL,(PR)
        DEC     HL
        LD      A,(HL)
        AND     7EH
        LD      (HL),A
        LD      A,(X)
        DEC     A
        LD      (X),A
        CALL    EFFRIG
        JP      CMA10
UP      LD      A,(Z4)
        OR      A
        JR      Z,CMA8
        LD      HL,(PR)
        LD      DE,-21
        ADD     HL,DE
        LD      A,(HL)
        AND     7DH
        LD      (HL),A
        LD      A,(Y)
        DEC     A
        LD      (Y),A
        CALL    EFFDOW
CMA10   CALL    SONM
        LD      HL,(K)
        ADD     HL,HL
        LD      DE,MZXY
        ADD     HL,DE
        LD      A,(X)
        LD      (HL),A
        INC     HL
        LD      A,(Y)
        LD      (HL),A
        LD      HL,(K)
        INC     HL
        LD      (K),HL
        JP      CMA3
CMAR    LD      HL,(K)
        DEC     HL
        LD      (K),HL
        ADD     HL,HL
        LD      DE,MZXY
        ADD     HL,DE
        LD      A,(HL)
        LD      (X),A
        INC     HL
        LD      A,(HL)
        LD      (Y),A
        CALL    AFFCRR
        CALL    EFFCRR
        LD      HL,(K)
        LD      A,H
        OR      L
        JP      NZ,CMA3
        LD      BC,0
        CALL    PAUSE
        CALL    CCROI
        CALL    CBAD
        LD      BC,0
        CALL    PAUSE
        RET
DRMAZE  LD      A,(X)
        LD      H,A
        LD      A,(Y)
        LD      L,A
        PUSH    HL
        CALL    DISMAZ
        LD      A,1
        LD      (Y),A
DRM0    LD      (X),A
DRM1    LD      A,(Y)
        DEC     A
        LD      B,A
        LD      DE,21
        CALL    MUL16
        LD      A,(X)
        LD      E,A
        LD      D,0
        ADD     HL,DE
        LD      DE,MAZE
        ADD     HL,DE
        LD      A,(HL)
        PUSH    AF
        BIT     0,A
        CALL    Z,EFFRIG
        POP     AF
        PUSH    AF
        BIT     1,A
        CALL    Z,EFFDOW
        POP     AF
        BIT     2,A
        CALL    NZ,AFFCRR
        LD      A,(X)
        INC     A
        LD      (X),A
        CP      22
        JR      C,DRM1
        LD      A,(Y)
        INC     A
        LD      (Y),A
        CP      14
        LD      A,1
        JR      C,DRM0
        LD      A,(PX)
        LD      (X),A
        LD      A,(PY)
        LD      (Y),A
        LD      B,50
DRM2    PUSH    BC
        CALL    AFFCRR
        LD      BC,800H
        CALL    PAUSE
        CALL    EFFCRR
        LD      BC,800H
        CALL    PAUSE
        POP     BC
        DJNZ    DRM2
        POP     HL
        LD      A,H
        LD      (X),A
        LD      A,L
        LD      (Y),A
        RET
CBAD    LD      IX,TBAD
        LD      B,9
CBA0    PUSH    BC
        LD      A,B
        CP      5
        JR      NC,CBA1
        CP      3
        JR      NC,CBA2
        LD      A,5
        JR      CBA3
CBA2    LD      A,4
        JR      CBA3
CBA1    RANDOM  2,3
CBA3    LD      (IX),A
        RANDOM  7,21
        LD      (IX+1),A
        RANDOM  1,13
        LD      (IX+2),A
        RANDOM  0,3
        LD      (IX+3),A
        LD      (IX+4),0
        LD      DE,5
        ADD     IX,DE
        POP     BC
        DJNZ    CBA0
        CALL    SCOR12
        LD      B,3
CBA4    LD      A,(HL)
        CP      '0'
        RET     NZ
        INC     HL
        DJNZ    CBA4
        XOR     A
        LD      (TBAD+6*5),A
        LD      (TBAD+8*5),A
        RET
CCROI   LD      B,10
CCR0    PUSH    BC
CCR1    RANDOM  3,21
        LD      (X),A
        RANDOM  3,13
        LD      (Y),A
        DEC     A
        LD      B,A
        LD      DE,21
        CALL    MUL16
        LD      A,(X)
        LD      E,A
        LD      D,0
        ADD     HL,DE
        LD      DE,MAZE
        ADD     HL,DE
        BIT     2,(HL)
        JR      NZ,CCR1
        SET     2,(HL)
        CALL    AFFCRR
        POP     BC
        DJNZ    CCR0
        LD      A,10
        LD      (NCROI),A
        RET
SONM    LD      HL,(K)
        INC     HL
        LD      C,8
SM0     LD      A,1
        OUT     (255),A
        LD      B,L
        DJNZ    $
        XOR     A
        OUT     (255),A
        LD      B,L
        DJNZ    $
        DEC     C
        JR      NZ,SM0
        RET
EFFRIG  LD      A,(Y)
        DEC     A
        LD      B,A
        LD      DE,64
        CALL    MUL16
        LD      A,(X)
        LD      E,A
        LD      D,0
        LD      B,3
ERG0    ADD     HL,DE
        DJNZ    ERG0
        LD      DE,VIDEO
        ADD     HL,DE
        LD      (HL),83H
        RET
EFFDOW  LD      A,(Y)
        LD      B,A
        LD      DE,64
        CALL    MUL16
        LD      A,(X)
        DEC     A
        LD      E,A
        LD      D,0
        LD      B,3
EDW0    ADD     HL,DE
        DJNZ    EDW0
        LD      DE,VIDEO+1
        ADD     HL,DE
        LD      (HL),80H
        INC     HL
        LD      (HL),80H
        RET
AFFCRR  LD      A,(Y)
        DEC     A
        LD      B,A
        LD      DE,64
        CALL    MUL16
        LD      A,(X)
        DEC     A
        LD      E,A
        LD      D,0
        LD      B,3
AFRR    ADD     HL,DE
        DJNZ    AFRR
        LD      DE,VIDEO+1
        ADD     HL,DE
        PUSH    HL
        LD      B,2
AFR0    LD      A,(HL)
        OR      0BCH
        LD      (HL),A
        INC     HL
        DJNZ    AFR0
        CALL    SONM
        POP     HL
        RET
EFFCRR  LD      B,2
AFR1    LD      A,(HL)
        AND     83H
        LD      (HL),A
        INC     HL
        DJNZ    AFR1
        RET
POSI    PUSH    DE
        LD      A,D
        ADD     A,6
        LD      L,A
        LD      H,0
        LD      D,3
        CALL    DIV16
        LD      A,H
        PUSH    IX
        POP     HL
        LD      B,6
POS0    ADD     HL,HL
        DJNZ    POS0
        LD      DE,-128
        ADD     HL,DE
        POP     DE
        PUSH    DE
        BIT     7,E
        JR      Z,POS1
        LD      D,0FFH
        JR      POS2
POS1    LD      D,0
POS2    ADD     HL,DE
        LD      DE,SCR
        ADD     HL,DE
        POP     DE
        RET
DIT     LD      A,E
        CP      64
        RET     NC
DIT0    LD      A,(HL)
        OR      C
        LD      (HL),A
        RET
DOT     LD      A,D
        CP      48
        RET     NC
        CP      3
        RET     C
        JR      DIT0
HLINE   LD      A,(YH)
        CP      48
        RET     NC
        CP      3
        RET     C
        LD      A,(XHH)
        LD      E,A
        LD      A,(CH)
        LD      C,A
        LD      HL,(PHH)
        LD      B,8
HLI0    CALL    DIT
        INC     E
        INC     HL
        DJNZ    HLI0
        RET
VLINE   LD      A,(XVV)
        CP      64
        RET     NC
        LD      A,(YV)
        LD      D,A
        LD      HL,(PVV)
        LD      A,(CVD)
        LD      C,A
        LD      B,3
VLI0    CALL    DOT
        INC     D
        INC     D
        INC     D
        PUSH    DE
        LD      DE,64
        ADD     HL,DE
        POP     DE
        LD      C,3FH
        DJNZ    VLI0
        LD      A,(CVF)
        LD      C,A
        CALL    DOT
        RET
