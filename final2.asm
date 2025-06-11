.MODEL SMALL
.STACK 100H
.DATA
    ; Thong bao menu va lua chon chinh (menu)
    MENU_FRAME_TOP     DB '+==============================================+',13,10,'$'
    MENU_TITLE         DB '|      HE THONG PHAT HIEN VA XU LY LOI        |',13,10,'$'
    MENU_FRAME_MID     DB '+----------------------------------------------+',13,10,'$'
    MENU_BODY1         DB '| 1. Kiem tra loi tran so                     |',13,10,'$'
    MENU_BODY2         DB '| 2. Kiem tra loi chia cho 0                  |',13,10,'$'
    MENU_BODY3         DB '| 3. Kiem tra loi truy cap bo nho             |',13,10,'$'
    MENU_BODY4         DB '| 4. Kiem tra loi stack overflow              |',13,10,'$'
    MENU_BODY5         DB '| 5. Kiem tra stack underflow                 |',13,10,'$'
    MENU_BODY6         DB '| 6. Kiem tra loi thanh ghi chua khoi tao     |',13,10,'$'
    MENU_BODY7         DB '| 7. Kiem tra loi nhap ky tu dac biet         |',13,10,'$'
    MENU_BODY8         DB '| 8. Kiem tra loi tran bo dem nhap lieu       |',13,10,'$'
    MENU_BODY9         DB '| 9. Kiem tra loi lenh khong hop le           |',13,10,'$'
    MENU_BODY10        DB '| 10. Xem log loi                             |',13,10,'$'
    MENU_BODY11        DB '| 11. Thoat chuong trinh                      |',13,10,'$'
    MENU_FRAME_BOT     DB '+==============================================+',13,10,'$'
    MENU_CHOICE        DB 'Nhap lua chon (1-11): $'
    
    ; Thong bao nhap lieu cho cac muc tinh toan
    INPUT_NUM1      DB 13,10,'Nhap so thu nhat (0-9): $'
    INPUT_NUM2      DB 13,10,'Nhap so thu hai (0-9): $'
    
    ; Thong bao chi tiet loi (dung chung cho cac muc tinh toan)
    DETAIL_MSG      DB 13,10,'Chi tiet loi:',13,10,'$'
    VALUE_MSG       DB 'Gia tri gay loi: $'
    LIMIT_MSG       DB 'Gioi han: -128 den +127',13,10,'$'
    RECOVERY_STEP   DB 'Buoc phuc hoi: $'
    
    ; Thong bao trang thai ket qua dung chung
    NO_ERROR_MSG    DB 13,10,'Khong phat hien loi! Phep toan thanh cong.',13,10,'$'
    CALC_MSG        DB 13,10,'Ket qua phep toan: $'
    PRESS_KEY       DB 13,10,'Nhan phim bat ky de tiep tuc...$'
    
    ; Thong bao loi cho tung muc menu
    ERROR_FOUND     DB 13,10,'!!! DA PHAT HIEN LOI !!!',13,10,'$'
    
    ; Thong bao loi va log cho cac muc (theo thu tu menu)
    OVERFLOW_MSG           DB 'Loi: Tran so trong phep toan!$'
    DIV_ZERO_MSG           DB 'Loi: Chia cho 0!$'
    MEM_ERR_MSG            DB 'Loi: Truy cap bo nho khong hop le!$'
    STACK_OVERFLOW_MSG     DB 'Loi: Tran stack overflow!$'
    STACK_UNDERFLOW_MSG    DB 'Loi: Stack underflow!$'
    REG_UNINIT_ERR_MSG     DB 'Loi: Thanh ghi CX chua duoc khoi tao!$'
    INPUT_SPECIAL_ERR_MSG  DB 'Loi: Ban da nhap ky tu dac biet!$'
    INPUT_OVERFLOW_ERR_MSG DB 'Loi: Tran bo dem nhap lieu!$'
    LOG_INVALID_OPCODE     DB 'Loi: Da thuc thi mot lenh CPU khong hop le!$'
    
    ; Cac bien
    NUM1            DB 0    ; So thu nhat
    NUM2            DB 0    ; So thu hai
    RESULT          DW 0    ; Ket qua phep toan
    ERROR_FLAG      DB 0    ; Co bao loi
    TEMP_RESULT     DB 0    ; Luu ket qua tam thoi
    
    ; Bien thoi gian
    HOUR            DB ?    ; Gio
    MINUTE          DB ?    ; Phut
    SECOND          DB ?    ; Giay
    DAY             DB ?    ; Ngay
    MONTH           DB ?    ; Thang
    YEAR            DB ?    ; Nam
    TIME_STR        DB '[  :  :  ] $'    ; Dinh dang: [HH:MM:SS]
    DATE_STR        DB '[  /  /  ] $'    ; Dinh dang: [DD/MM/YY]
    
    ; Thong bao nhap lieu khong hop le
    INPUT_ERR_MSG   DB 13,10,'Gia tri nhap khong hop le! Vui long nhap lai (0-9).',13,10,'$'
    INPUT_BUFFER    DB 10,0,10 DUP('$')
    ; Buffer rieng cho nhap menu
    MENU_INPUT_BUFFER DB 3,0,3 DUP(0)
    
    ; Thong bao xem log loi (muc 10)
    VIEW_LOG_MSG    DB 13,10,'--- NOI DUNG LOG LOI ---',13,10,'$'
    END_LOG_MSG     DB 13,10,'--- HET NOI DUNG LOG ---',13,10,'$'
    
    ; Bien va buffer cho log loi
    LOG_DIGIT       DB ?
    LOG_BUFFER      DB 1000 DUP('$')   ; Buffer luu nhieu ban ghi log
    LOG_INDEX       DW 0               ; Vi tri ghi tiep theo trong buffer
    
    ; Thong bao chuc nang kiem tra va khoi tao thanh ghi CX (muc 6)
    MSG_REG_INIT_ASK      DB 13,10,'Ban co muon khoi tao thanh ghi CX? (y/n): $'
    MSG_REG_INIT_INPUT    DB 13,10,'Nhap gia tri cho CX (0-9): $'
    MSG_REG_INIT_OK       DB 13,10,'Khong phat hien loi! Thanh ghi CX da duoc khoi tao.',13,10,'$'
    MSG_REG_UNINIT_ERR    DB 'Loi: Thanh ghi CX chua duoc khoi tao!$'
    MSG_REG_INIT_INVALID  DB 13,10,'Gia tri nhap khong hop le! Vui long nhap so tu 0 den 9.',13,10,'$'

    ; Thong bao cho muc 7: kiem tra ky tu dac biet
    MSG_INPUT_SPECIAL_ASK DB 13,10,'Nhap mot ky tu (0-9): $'
    MSG_INPUT_SPECIAL_OK  DB 13,10,'Khong phat hien loi! Ky tu nhap hop le.',13,10,'$'
    MSG_INPUT_SPECIAL_ERR DB 'Loi: Ban da nhap ky tu dac biet!$'

    ; Thong bao cho muc 9: lenh khong hop le
    MSG_INVALID_OPCODE_INPUT DB 13,10,'Nhap ma opcode (2 ky tu hex, vi du: FF): $'
    MSG_SHOW_INVALID_OPCODE DB 13,10,'Ban vua thu thuc thi opcode khong hop le: 0x','$'
    MSG_INVALID_OPCODE_OK DB 13,10,'Opcode nhap vao khong gay loi!',13,10,'$' ; 
    
    ; Thong bao hoi va xu ly khoi phuc (dung chung)
    ASK_RECOVERY_MSG   DB 13,10,'Ban co muon khoi phuc he thong? (y/n): $'
    RECOVERY_OK_MSG    DB 13,10,'Da khoi phuc he thong thanh cong!',13,10,'$'
    RECOVERY_SKIP_MSG  DB 13,10,'Khong thuc hien khoi phuc.',13,10,'$'
    HANDLE_RECOVERY_MSG DB 13,10,'Dang xu ly khoi phuc he thong...',13,10,'$'

    ; Chuoi dinh dang thoi gian cho log
    LOG_TIME_PREFIX    DB '[$'
    LOG_TIME_SEP       DB ':$'
    LOG_TIME_SUFFIX    DB '] $'

    ; Thong bao cho muc 8: tran bo dem nhap lieu
    INPUT_OVERFLOW_MSG DB 13,10,'Nhap chuoi (toi da 8 ky tu): $'
    INPUT_OVERFLOW_OK  DB 13,10,'Nhap lieu hop le! Khong co loi tran bo dem.',13,10,'$'
    LOG_INPUT_OVERFLOW DB 'Loi: Tran bo dem nhap lieu!$'
    
    ; Buffer cho muc 8
    OVERFLOW_BUFFER DB 9,0,9 DUP('$')

    ; === Bi?n b? sung cho m?c 9 ===
    INVALID_OPCODE DB 0
    ; Danh sach cac opcode duoc coi la "loi" trong mo phong nay
    LIST_INVALID_OPCODES DB 0Fh, 63h, 0FFh, '$' ; 

    ; Thong bao cho muc 3: dang truy cap bo nho
    ACCESSING_MEM_MSG DB 13,10,'Dang truy cap bo nho...$',13,10,'$'

.CODE

; === Thu tuc chinh, khoi tao va xu ly menu ===
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
MENU_LOOP:
    ; Xoa man hinh
    MOV AX,3
    INT 10H
    
    ; In mot so dong trong de dam bao man hinh sach phia duoi menu
    MOV CX, 10 ; So dong trong can in, co the dieu chinh
PRINT_BLANK_LINES:
    MOV DL, 13 ; Carriage Return
    MOV AH, 2
    INT 21H
    MOV DL, 10 ; Line Feed
    MOV AH, 2
    INT 21H
    LOOP PRINT_BLANK_LINES

    ; Hien thi menu 
    LEA DX,MENU_FRAME_TOP
    MOV AH,9
    INT 21H
    LEA DX,MENU_TITLE
    MOV AH,9
    INT 21H
    LEA DX,MENU_FRAME_MID
    MOV AH,9
    INT 21H
    LEA DX,MENU_BODY1
    MOV AH,9
    INT 21H
    LEA DX,MENU_BODY2
    MOV AH,9
    INT 21H
    LEA DX,MENU_BODY3
    MOV AH,9
    INT 21H
    LEA DX,MENU_BODY4
    MOV AH,9
    INT 21H
    LEA DX,MENU_BODY5
    MOV AH,9
    INT 21H
    LEA DX,MENU_BODY6
    MOV AH,9
    INT 21H
    LEA DX,MENU_BODY7
    MOV AH,9
    INT 21H
    LEA DX,MENU_BODY8
    MOV AH,9
    INT 21H
    LEA DX,MENU_BODY9
    MOV AH,9
    INT 21H
    LEA DX,MENU_BODY10
    MOV AH,9
    INT 21H
    LEA DX,MENU_BODY11
    MOV AH,9
    INT 21H
    LEA DX,MENU_FRAME_BOT
    MOV AH,9
    INT 21H
    
    ; Nhap lua chon tu nguoi dung (dung buffer rieng, nhap 1 hoac 2 so roi Enter)
    LEA DX,MENU_CHOICE
    MOV AH,9
    INT 21H
    LEA DX,MENU_INPUT_BUFFER
    MOV AH,0Ah
    INT 21H
    MOV AL,[MENU_INPUT_BUFFER+1] ; so ky tu nhap
    CMP AL,1
    JE ONE_DIGIT_CHOICE
    CMP AL,2
    JE TWO_DIGIT_CHOICE
    JMP INVALID_MENU

ONE_DIGIT_CHOICE:
    MOV AL,[MENU_INPUT_BUFFER+2]
    CMP AL,'1'
    JB INVALID_MENU
    CMP AL,'9'
    JA INVALID_MENU
    SUB AL,'0'
    JMP HANDLE_MENU

TWO_DIGIT_CHOICE:
    MOV AL,[MENU_INPUT_BUFFER+2]
    MOV BL,[MENU_INPUT_BUFFER+3]
    CMP AL,'1'
    JNE INVALID_MENU
    CMP BL,'0'
    JE MENU_10_LABEL
    CMP BL,'1'
    JE MENU_11_LABEL
    JMP INVALID_MENU

MENU_10_LABEL:
    MOV AL,10
    JMP HANDLE_MENU
MENU_11_LABEL:
    MOV AL,11
    JMP HANDLE_MENU
INVALID_MENU:
    JMP MENU_LOOP
HANDLE_MENU:
    CMP AL,1
    JE CALL_OVERFLOW
    CMP AL,2
    JE CALL_DIV_ZERO
    CMP AL,3
    JE CALL_MEM
    CMP AL,4
    JE CALL_STACK
    CMP AL,5
    JE CALL_STACK_UNDERFLOW
    CMP AL,6
    JE CALL_REG_UNINIT
    CMP AL,7
    JE CALL_INPUT_SPECIAL
    CMP AL,8
    JE CALL_INPUT_OVERFLOW
    CMP AL,9
    JE CALL_INVALID_OPCODE
    CMP AL,10
    JE CALL_VIEW_LOG
    CMP AL,11
    JE EXIT
    JMP MENU_LOOP

; Cac label goi thu tuc tuong ung
CALL_OVERFLOW:
    CALL OVERFLOW_TEST
    JMP MENU_LOOP
    
CALL_DIV_ZERO:
    CALL DIV_ZERO_TEST
    JMP MENU_LOOP
    
CALL_MEM:
    CALL MEM_TEST
    JMP MENU_LOOP
    
CALL_STACK:
    CALL STACK_OVERFLOW_TEST
    JMP MENU_LOOP

CALL_STACK_UNDERFLOW:
    CALL STACK_UNDERFLOW_TEST
    JMP MENU_LOOP

CALL_REG_UNINIT:
    CALL REG_UNINIT_TEST
    JMP MENU_LOOP

CALL_INPUT_SPECIAL:
    CALL INPUT_SPECIAL_TEST
    JMP MENU_LOOP

CALL_INPUT_OVERFLOW:
    CALL INPUT_OVERFLOW_TEST
    JMP MENU_LOOP

CALL_INVALID_OPCODE:
    CALL INVALID_OPCODE_TEST
    JMP MENU_LOOP

CALL_VIEW_LOG:
    CALL VIEW_LOG
    JMP MENU_LOOP                 ;loop: nhay vong

EXIT:
    MOV AH,4CH      ; Ket thuc chuong trinh
    INT 21H
    
MAIN ENDP

; === Muc 1: Kiem tra loi tran so ===
OVERFLOW_TEST PROC
NHAP_LAI_NUM1_OVERFLOW:
    LEA DX,INPUT_NUM1  ;(load effective address) nap dia chi hieu dung, chuyen doi o nho vào thanh ghi
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    SUB AL,30H      ; Chuyen ASCII sang so
    CMP AL,0
    JL LOI_NHAP_OVERFLOW
    CMP AL,9
    JG LOI_NHAP_OVERFLOW
    MOV NUM1,AL
    JMP NHAP_NUM2_OVERFLOW
LOI_NHAP_OVERFLOW:
    LEA DX,INPUT_ERR_MSG                             
    MOV AH,9
    INT 21H
    JMP NHAP_LAI_NUM1_OVERFLOW
NHAP_NUM2_OVERFLOW:
    LEA DX,INPUT_NUM2
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    SUB AL,30H
    CMP AL,0
    JL LOI_NHAP2_OVERFLOW
    CMP AL,9
    JG LOI_NHAP2_OVERFLOW
    MOV NUM2,AL
    JMP TINH_OVERFLOW
LOI_NHAP2_OVERFLOW:
    LEA DX,INPUT_ERR_MSG
    MOV AH,9
    INT 21H
    JMP NHAP_NUM2_OVERFLOW
TINH_OVERFLOW:
    ; Luu trang thai truoc khi tinhq
    MOV AL,NUM1
    MOV TEMP_RESULT,AL
    ; Thuc hien phep nhan voi 100 de gay tran
    MOV AL,NUM1
    MOV BL,100
    MUL BL          ; AL = AL * 100
    JO OVERFLOW_ERROR  ; Neu co tran so -> Nhay den xu ly loi
    ; Neu khong co loi
    MOV RESULT,AX
    LEA DX,NO_ERROR_MSG
    MOV AH,9
    INT 21H
    ; Hien thi ket qua
    LEA DX,CALC_MSG
    INT 21H
    MOV AX,RESULT
    CALL DISPLAY_NUM
    MOV DL,13
    MOV AH,2
    INT 21H
    MOV DL,10
    MOV AH,2
    INT 21H
    CALL WAIT_KEY
    JMP MENU_LOOP
OVERFLOW_ERROR:
    ; Hien thi thong bao loi
    LEA DX,ERROR_FOUND
    MOV AH,9
    INT 21H
    LEA DX,OVERFLOW_MSG
    INT 21H
    ; Hien thi chi tiet loi
    LEA DX,DETAIL_MSG
    INT 21H
    LEA DX,VALUE_MSG
    INT 21H
    MOV AL,NUM1
    XOR AH,AH
    CALL DISPLAY_NUM
    MOV DL,13
    MOV AH,2
    INT 21H
    MOV DL,10
    MOV AH,2
    INT 21H
    LEA DX,LIMIT_MSG
    INT 21H
    ; Ghi log
    MOV ERROR_FLAG,1
    CALL LOG_ERROR
    ; Hoi khoi phuc
    CALL ASK_RECOVERY
    CALL WAIT_KEY
    JMP MENU_LOOP
OVERFLOW_TEST ENDP

; === Muc 2: Kiem tra loi chia cho 0 ===
DIV_ZERO_TEST PROC
NHAP_LAI_NUM1_DIV:
    LEA DX,INPUT_NUM1
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    SUB AL,30H      ; Chuyen ASCII sang so
    CMP AL,0
    JL LOI_NHAP_DIV
    CMP AL,9
    JG LOI_NHAP_DIV
    MOV NUM1,AL
    JMP NHAP_NUM2_DIV
LOI_NHAP_DIV:
    LEA DX,INPUT_ERR_MSG
    MOV AH,9
    INT 21H
    JMP NHAP_LAI_NUM1_DIV
NHAP_NUM2_DIV:
    LEA DX,INPUT_NUM2
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    SUB AL,30H
    CMP AL,0
    JL LOI_NHAP2_DIV
    CMP AL,9
    JG LOI_NHAP2_DIV
    MOV NUM2,AL
    JMP TINH_DIV
LOI_NHAP2_DIV:
    LEA DX,INPUT_ERR_MSG
    MOV AH,9
    INT 21H
    JMP NHAP_NUM2_DIV
TINH_DIV:
    ; Kiem tra chia cho 0
    CMP NUM2,0
    JE DIV_ZERO_ERROR   ; Neu so chia = 0 -> Nhay den xu ly loi
    
    ; Thuc hien phep chia neu khong co loi
    XOR AH,AH          ; Xoa AH de chuan bi chia
    MOV AL,NUM1
    DIV NUM2           ; AL = AL / NUM2
    MOV RESULT,AX
    
    ; Hien thi ket qua thanh cong
    LEA DX,NO_ERROR_MSG
    MOV AH,9
    INT 21H

    LEA DX,CALC_MSG
    INT 21H
    MOV AX,RESULT
    CALL DISPLAY_NUM
    CALL WAIT_KEY
    JMP MENU_LOOP
DIV_ZERO_ERROR:
    LEA DX,ERROR_FOUND
    MOV AH,9
    INT 21H
    
    LEA DX,DIV_ZERO_MSG
    INT 21H
    
    ; Hien thi chi tiet
    LEA DX,DETAIL_MSG
    INT 21H
    
    LEA DX,VALUE_MSG
    INT 21H
    
    MOV AL,NUM2
    CALL DISPLAY_NUM
    
    ; Ghi log
    MOV ERROR_FLAG,2
    CALL LOG_ERROR
    ; Hoi khoi phuc
    CALL ASK_RECOVERY
    CALL WAIT_KEY
    JMP MENU_LOOP
DIV_ZERO_TEST ENDP

; === Muc 3: Kiem tra loi truy cap bo nho ===
MEM_TEST PROC
    ; Hien thi thong bao dang truy cap bo nho
    LEA DX,ACCESSING_MEM_MSG
    MOV AH,9
    INT 21H
    
    ; Hien thi thong bao loi
    LEA DX,ERROR_FOUND
    MOV AH,9
    INT 21H
    
    LEA DX,MEM_ERR_MSG
    INT 21H
    
    ; Ghi log
    MOV ERROR_FLAG,3    ; Danh dau la loi bo nho
    CALL LOG_ERROR
    ; Hoi khoi phuc
    CALL ASK_RECOVERY
    CALL WAIT_KEY
    JMP MENU_LOOP
MEM_TEST ENDP

; === Muc 4: Kiem tra loi stack overflow ===
STACK_OVERFLOW_TEST PROC
    ; Neu so lan PUSH > 5 thi bi overflow (gia lap stack)
    LEA DX,INPUT_NUM1
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV BL,AL ; BL = so lan PUSH
    CMP BL,5
    JG STACK_OVERFLOW_ERROR
    LEA DX,NO_ERROR_MSG
    MOV AH,9
    INT 21H
    CALL WAIT_KEY
    JMP MENU_LOOP
STACK_OVERFLOW_ERROR:
    LEA DX,ERROR_FOUND
    MOV AH,9
    INT 21H
    LEA DX,STACK_OVERFLOW_MSG
    INT 21H
    MOV ERROR_FLAG,4
    CALL LOG_ERROR
    ; Hoi khoi phuc
    CALL ASK_RECOVERY
    CALL WAIT_KEY
    JMP MENU_LOOP
STACK_OVERFLOW_TEST ENDP

; === Muc 5: Kiem tra loi stack underflow ===
STACK_UNDERFLOW_TEST PROC    
    ; nghia: Neu so lan POP > so lan PUSH thi underflow
    LEA DX,INPUT_NUM1
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV BL,AL ; BL = so lan PUSH
    LEA DX,INPUT_NUM2
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV BH,AL ; BH = so lan POP
    CMP BH,BL
    JG STACK_UNDERFLOW_ERROR
    LEA DX,NO_ERROR_MSG
    MOV AH,9
    INT 21H
    CALL WAIT_KEY
    JMP MENU_LOOP
STACK_UNDERFLOW_ERROR:
    LEA DX,ERROR_FOUND
    MOV AH,9
    INT 21H
    LEA DX,STACK_UNDERFLOW_MSG
    INT 21H
    MOV ERROR_FLAG,7
    CALL LOG_ERROR
    ; Hoi khoi phuc
    CALL ASK_RECOVERY
    CALL WAIT_KEY
    JMP MENU_LOOP
STACK_UNDERFLOW_TEST ENDP

; === Thu tuc hien thi so ra man hinh ===
DISPLAY_NUM PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    MOV BX,10       ; So chia de tach cac chu so
    XOR CX,CX       ; CX = 0, dung de dem so chu so
    
    MOV DX,0        ; Dung DX:AX cho chia 16-bit
    CMP AX,0
    JNE DISPLAY_NUM_LOOP
    ; Neu AX = 0, hien thi '0'
    MOV DL,'0'
    MOV AH,2
    INT 21H
    JMP DISPLAY_NUM_DONE
DISPLAY_NUM_LOOP:
    XOR DX,DX       ; Xoa DX de chuan bi chia
    DIV BX          ; AX = AX / 10, DX = du     DIV: phep chia
    PUSH DX         ; Luu phan du vao stack
    INC CX          ; Tang so chu so
    TEST AX,AX      ; Kiem tra thuong co = 0?
    JNZ DISPLAY_NUM_LOOP
DISPLAY_NUM_PRINT:
    POP DX          ; Lay chu so tu stack
    ADD DL,30H      ; Chuyen sang ky tu ASCII
    MOV AH,2        ; Hien thi ky tu
    INT 21H
    LOOP DISPLAY_NUM_PRINT    ; Lap cho den het cac chu so
DISPLAY_NUM_DONE:
    POP DX
    POP CX
    POP BX
    POP AX
    RET
DISPLAY_NUM ENDP

; === Thu tuc chuyen so sang ASCII ===
CONVERT_TO_ASCII PROC
    PUSH BX
    MOV AH,AL       ; Luu gia tri goc
    
    ; Chia cho 10 de tach so
    MOV BL,10
    DIV BL          ; AL = Thuong, AH = Du
    
    ; Chuyen thanh ASCII
    ADD AL,30H      ; Chu so hang chuc
    ADD AH,30H      ; Chu so hang don vi
    
    POP BX
    RET
CONVERT_TO_ASCII ENDP

; === Thu tuc ghi log loi va hien thi ra man hinh ===
LOG_ERROR PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH SI
    PUSH DI

    ; --- Ghi thoi gian vao log buffer ---
    MOV AH,2Ch
    INT 21h ; CH=gio, CL=phut, DH=giay
    ; Ghi '['
    MOV DI,OFFSET LOG_BUFFER
    ADD DI,LOG_INDEX
    MOV AL,'['
    MOV [DI],AL
    INC LOG_INDEX
    ; Ghi gio
    MOV AL,CH
    CALL LOG_WRITE_2DIGIT
    ; Ghi ':'
    MOV DI,OFFSET LOG_BUFFER
    ADD DI,LOG_INDEX
    MOV AL,':'
    MOV [DI],AL
    INC LOG_INDEX
    ; Ghi phut
    MOV AL,CL
    CALL LOG_WRITE_2DIGIT
    ; Ghi ':'
    MOV DI,OFFSET LOG_BUFFER
    ADD DI,LOG_INDEX
    MOV AL,':'
    MOV [DI],AL
    INC LOG_INDEX
    ; Ghi giay
    MOV AL,DH
    CALL LOG_WRITE_2DIGIT
    ; Ghi '] '
    MOV DI,OFFSET LOG_BUFFER
    ADD DI,LOG_INDEX
    MOV AL,']'
    MOV [DI],AL
    INC LOG_INDEX
    MOV AL,' '
    MOV DI,OFFSET LOG_BUFFER
    ADD DI,LOG_INDEX
    MOV [DI],AL
    INC LOG_INDEX

    ; --- Ghi noi dung loi ---
    MOV SI,OFFSET OVERFLOW_MSG
    MOV AL,ERROR_FLAG
    CMP AL,1             ; SO SANH
    JE LOG_OVERFLOW_MSG
    CMP AL,2
    JE LOG_DIVZERO_MSG
    CMP AL,3
    JE LOG_MEM_MSG
    CMP AL,4
    JE LOG_STACK_MSG
    CMP AL,5
    JE LOG_STACK_UNDERFLOW_MSG
    CMP AL,6
    JE LOG_REG_UNINIT_MSG
    CMP AL,7
    JE LOG_INPUT_SPECIAL_MSG
    CMP AL,8
    JE LOG_INPUT_OVERFLOW_MSG
    CMP AL,9
    JE LOG_INVALID_OPCODE_MSG
    JMP LOG_WRITE_CONT_MSG
LOG_OVERFLOW_MSG:
    MOV SI,OFFSET OVERFLOW_MSG
    JMP LOG_WRITE_CONT_MSG
LOG_DIVZERO_MSG:
    MOV SI,OFFSET DIV_ZERO_MSG
    JMP LOG_WRITE_CONT_MSG
LOG_MEM_MSG:
    MOV SI,OFFSET MEM_ERR_MSG
    JMP LOG_WRITE_CONT_MSG
LOG_STACK_MSG:
    MOV SI,OFFSET STACK_OVERFLOW_MSG
    JMP LOG_WRITE_CONT_MSG
LOG_STACK_UNDERFLOW_MSG:
    MOV SI,OFFSET STACK_UNDERFLOW_MSG
    JMP LOG_WRITE_CONT_MSG
LOG_REG_UNINIT_MSG:
    MOV SI,OFFSET REG_UNINIT_ERR_MSG
    JMP LOG_WRITE_CONT_MSG
LOG_INPUT_SPECIAL_MSG:
    MOV SI,OFFSET INPUT_SPECIAL_ERR_MSG
    JMP LOG_WRITE_CONT_MSG
LOG_INPUT_OVERFLOW_MSG:
    MOV SI,OFFSET INPUT_OVERFLOW_ERR_MSG
    JMP LOG_WRITE_CONT_MSG
LOG_INVALID_OPCODE_MSG:
    MOV SI,OFFSET LOG_INVALID_OPCODE
    JMP LOG_WRITE_CONT_MSG
LOG_WRITE_CONT_MSG:
    ; Ghi chuoi log vao buffer (chi den ky tu $)
    MOV DI,OFFSET LOG_BUFFER
    ADD DI,LOG_INDEX
    MOV CX,0
COUNT_LOG_MSG_LEN_MSG:
    MOV BX, SI
    ADD BX, CX
    MOV AL, [BX]
    CMP AL, '$'
    JE LOG_MSG_LEN_FOUND_MSG
    MOV BX, DI
    ADD BX, CX
    MOV [BX], AL
    INC CX
    JMP COUNT_LOG_MSG_LEN_MSG
LOG_MSG_LEN_FOUND_MSG:
    ADD LOG_INDEX,CX
    ; Ghi xuong dong
    MOV DI,OFFSET LOG_BUFFER
    ADD DI,LOG_INDEX
    MOV BYTE PTR [DI],13
    INC LOG_INDEX
    MOV DI,OFFSET LOG_BUFFER
    ADD DI,LOG_INDEX
    MOV BYTE PTR [DI],10
    INC LOG_INDEX
    POP DI
    POP SI
    POP DX
    POP CX
    POP BX
    POP AX
    RET
LOG_ERROR ENDP

; === Thu tuc ghi 2 chu so vao log ===
LOG_WRITE_2DIGIT PROC
    PUSH AX
    PUSH BX
    PUSH CX
    MOV BL,10
    XOR AH,AH
    DIV BL ; AL=AL/10, AH=AL%10
    ADD AL,30h ; Chu so hang chuc
    MOV DI,OFFSET LOG_BUFFER
    ADD DI,LOG_INDEX
    MOV [DI],AL
    INC LOG_INDEX
    MOV AL,AH
    ADD AL,30h ; Chu so hang don vi
    MOV DI,OFFSET LOG_BUFFER
    ADD DI,LOG_INDEX
    MOV [DI],AL
    INC LOG_INDEX
    POP CX
    POP BX
    POP AX
    RET
LOG_WRITE_2DIGIT ENDP

; === Thu tuc cho nhan phim bat ky ===
WAIT_KEY PROC 
    
    LEA DX,PRESS_KEY
    MOV AH,9
    INT 21H
    
    MOV AH,1        ; Cho nhan 1 phim bat ky
    INT 21H
    RET
WAIT_KEY ENDP

; === Muc 10: Xem log loi ===
VIEW_LOG PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    LEA DX,VIEW_LOG_MSG
    MOV AH,9
    INT 21H
    ; Hien thi toan bo log buffer
    LEA DX,LOG_BUFFER
    MOV AH,9
    INT 21H
    LEA DX,END_LOG_MSG
    MOV AH,9
    INT 21H
    CALL WAIT_KEY
    POP DX
    POP CX
    POP BX
    POP AX
    RET
VIEW_LOG ENDP

; === Muc 6: Kiem tra loi thanh ghi chua khoi tao ===
REG_UNINIT_TEST PROC
    LEA DX,MSG_REG_INIT_ASK
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    CMP AL,'y'
    JE REG_INIT
    CMP AL,'Y'
    JE REG_INIT
    ; Khong khoi tao, dung gia tri rac
    LEA DX,ERROR_FOUND
    MOV AH,9
    INT 21H
    LEA DX,MSG_REG_UNINIT_ERR
    MOV AH,9
    INT 21H
    MOV ERROR_FLAG,6
    CALL LOG_ERROR
    ; Hoi khoi phuc
    CALL ASK_RECOVERY
    CALL WAIT_KEY
    JMP MENU_LOOP
REG_INIT:
NHAP_LAI_CX:
    LEA DX,MSG_REG_INIT_INPUT
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    CMP AL,13         ; Neu la Enter
    JE MSG_INVALID_INPUT
    CMP AL,30H        ; Neu < '0'
    JL MSG_INVALID_INPUT
    CMP AL,39H        ; Neu > '9'
    JG MSG_INVALID_INPUT
    SUB AL,30H
    MOV CL,AL
    LEA DX,MSG_REG_INIT_OK
    MOV AH,9
    INT 21H
    CALL WAIT_KEY
    JMP MENU_LOOP
MSG_INVALID_INPUT:
    LEA DX,MSG_REG_INIT_INVALID
    MOV AH,9
    INT 21H
    JMP NHAP_LAI_CX
REG_UNINIT_TEST ENDP

; === Muc 7: Kiem tra loi nhap ky tu dac biet ===
INPUT_SPECIAL_TEST PROC
    LEA DX,MSG_INPUT_SPECIAL_ASK
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    CMP AL,'0'
    JB INPUT_SPECIAL_ERROR
    CMP AL,'9'
    JBE INPUT_SPECIAL_OK
    CMP AL,'A'
    JB INPUT_SPECIAL_ERROR
    CMP AL,'Z'
    JBE INPUT_SPECIAL_OK
    CMP AL,'a'
    JB INPUT_SPECIAL_ERROR
    CMP AL,'z'
    JBE INPUT_SPECIAL_OK
    JMP INPUT_SPECIAL_ERROR

INPUT_SPECIAL_OK:
    LEA DX,MSG_INPUT_SPECIAL_OK
    MOV AH,9
    INT 21H
    CALL WAIT_KEY
    JMP MENU_LOOP
INPUT_SPECIAL_ERROR:
    LEA DX,ERROR_FOUND
    MOV AH,9
    INT 21H
    LEA DX,MSG_INPUT_SPECIAL_ERR
    MOV AH,9
    INT 21H
    MOV ERROR_FLAG,9
    CALL LOG_ERROR
    ; Hoi khoi phuc
    CALL ASK_RECOVERY
    CALL WAIT_KEY
    JMP MENU_LOOP
INPUT_SPECIAL_TEST ENDP

; === Muc 8: Kiem tra loi tran bo dem nhap lieu ===
INPUT_OVERFLOW_TEST PROC
    LEA DX,INPUT_OVERFLOW_MSG
    MOV AH,9
    INT 21H
    LEA DX,OVERFLOW_BUFFER
    MOV AH,0Ah
    INT 21H
    MOV AL,[OVERFLOW_BUFFER+1] ; so ky tu nhap
    CMP AL,8
    JAE INPUT_OVERFLOW_ERROR   ; Neu nhap du 8 ky tu thi bao loi
    LEA DX,INPUT_OVERFLOW_OK
    MOV AH,9
    INT 21H
    CALL WAIT_KEY
    JMP MENU_LOOP
INPUT_OVERFLOW_ERROR:
    LEA DX,ERROR_FOUND
    MOV AH,9
    INT 21H
    LEA DX,INPUT_OVERFLOW_ERR_MSG
    MOV AH,9
    INT 21H
    MOV ERROR_FLAG,10
    CALL LOG_ERROR
    CALL ASK_RECOVERY
    CALL WAIT_KEY
    JMP MENU_LOOP
INPUT_OVERFLOW_TEST ENDP

; === Muc 9: Kiem tra loi lenh khong hop le  ===
INVALID_OPCODE_TEST PROC
    LEA DX,MSG_INVALID_OPCODE_INPUT
    MOV AH,9
    INT 21H

    ; Doc ky tu dau
    MOV AH,1
    INT 21H
    MOV BL,AL       ; Luu ky tu dau vao BL

    ; Doc ky tu thu hai
    MOV AH,1
    INT 21H
    MOV BH,AL       ; Luu ky tu thu hai vao BH

    ; Chuyen doi va ket hop 2 ky tu Hex thanh 1 byte
    PUSH BX         ; Luu BX
    MOV AL,BL       ; AL = Ky tu dau
    CALL HEX_CHAR_TO_VAL ; Chuyen sang gia tri so
    CMP AL, 0FEh    ; Kiem tra neu ky tu dau khong hop le
    JE INPUT_HEX_INVALID_ERROR
    MOV CL,4        ; Shift 4 bit
    SHL AL,CL       ; Dich trai 4 bit (phan cao)
    MOV [INVALID_OPCODE],AL ; Luu phan cao vao INVALID_OPCODE

    MOV AL,BH       ; AL = Ky tu thu hai
    CALL HEX_CHAR_TO_VAL ; Chuyen sang gia tri so
    CMP AL, 0FEh    ; Kiem tra neu ky tu thu hai khong hop le
    JE INPUT_HEX_INVALID_ERROR
    OR [INVALID_OPCODE],AL ; Ket hop phan thap
    POP BX          ; Lay lai BX

    ; --- Neu ca hai ky tu hop le, kiem tra opcode vua nhap co trong danh sach gay loi khong ---
    MOV SI, OFFSET LIST_INVALID_OPCODES ; SI tro den dau danh sach
CHECK_OPCODE_LOOP:
    MOV AL, [SI]        ; Lay 1 byte tu danh sach
    CMP AL, '$'         ; Kiem tra ky tu ket thuc
    JE OPCODE_NOT_IN_LIST ; Neu gap '$', tuc la khong tim thay trong danh sach

    CMP AL, [INVALID_OPCODE] ; So sanh voi opcode nguoi dung nhap
    JE OPCODE_FOUND_IN_LIST ; Neu trung, thi day la opcode gay loi

    INC SI              ; Chuyen sang byte tiep theo trong danh sach
    JMP CHECK_OPCODE_LOOP ; Lap lai

OPCODE_FOUND_IN_LIST:
    ; --- Neu tim thay trong danh sach gay loi -> Bao loi Opcode ---
    LEA DX,ERROR_FOUND
    MOV AH,9
    INT 21H
    LEA DX,LOG_INVALID_OPCODE
    MOV AH,9
    INT 21H
    MOV ERROR_FLAG,9    ; Danh dau loi Invalid Opcode cho log
    CALL LOG_ERROR

    ; Hien thi opcode khong hop le vua nhap
    LEA DX,MSG_SHOW_INVALID_OPCODE
    MOV AH,9
    INT 21H
    CALL DISPLAY_HEX    ; Hien thi gia tri tu INVALID_OPCODE

    CALL ASK_RECOVERY    
    CALL WAIT_KEY       
    JMP MENU_LOOP       

OPCODE_NOT_IN_LIST:
    ; --- Neu khong tim thay trong danh sach gay loi -> Bao thanh cong ---
    LEA DX,MSG_INVALID_OPCODE_OK
    MOV AH,9
    INT 21H
    CALL WAIT_KEY       ; Cho nhan phim
    JMP MENU_LOOP       ; Quay lai menu

INPUT_HEX_INVALID_ERROR:
    ; Xu ly loi nhap ky tu Hex khong hop le 
    POP BX ; Lay lai BX bi push truoc do
    LEA DX,INPUT_ERR_MSG ; Su dung thong bao loi nhap chung (hoac tao thong bao rieng neu muon)
    MOV AH,9
    INT 21H
    ; Khong ghi log loi opcode, co the ghi log loi nhap lieu neu muon
    ; CALL LOG_ERROR ; Can them ERROR_FLAG moi neu ghi log loi nhap
    CALL WAIT_KEY
    JMP MENU_LOOP

INVALID_OPCODE_TEST ENDP

; === Thu tuc chuyen 1 ky tu Hex sang gia tri so ===
; Dau vao: AL = ky tu Hex (ASCII)
; Dau ra: AL = gia tri so (0-15), 0FEh neu khong hop le
HEX_CHAR_TO_VAL PROC
    CMP AL,'0'
    JL HEX_INVALID
    CMP AL,'9'
    JBE HEX_IS_DIGIT
    CMP AL,'A'
    JL HEX_INVALID
    CMP AL,'F'
    JBE HEX_IS_UPPER
    CMP AL,'a'
    JL HEX_INVALID
    CMP AL,'f'
    JBE HEX_IS_LOWER
HEX_INVALID:
    MOV AL,0FEh ; Gia tri bao loi: ky tu Hex khong hop le
    RET
HEX_IS_DIGIT:
    SUB AL,'0'
    RET
HEX_IS_UPPER:
    SUB AL,'A'
    ADD AL,10
    RET
HEX_IS_LOWER:
    SUB AL,'a'
    ADD AL,10
    RET
HEX_CHAR_TO_VAL ENDP

; === Thu tuc hien thi 1 byte duoi dang HEX ===
; Hien thi gia tri trong INVALID_OPCODE
DISPLAY_HEX PROC
    PUSH AX
    PUSH BX
    MOV AL, [INVALID_OPCODE] ; Lay gia tri tu bien
    MOV AH, AL
    SHR AL, 4           ; Lay 4 bit cao
    CALL HEX_DIGIT      ; Hien thi ky tu Hex tuong ung
    MOV AL, AH          ; Lay gia tri goc lai vao AL
    AND AL, 0Fh         ; Lay 4 bit thap
    CALL HEX_DIGIT      ; Hien thi ky tu Hex tuong ung
    POP BX
    POP AX
    RET
DISPLAY_HEX ENDP

HEX_DIGIT PROC
    ADD AL, 30h
    CMP AL, 39h
    JBE HEX_PRINT
    ADD AL, 7
HEX_PRINT:
    MOV DL, AL
    MOV AH, 2
    INT 21h
    RET
HEX_DIGIT ENDP

; === Thu tuc hoi va xu ly khoi phuc ===
ASK_RECOVERY PROC
    LEA DX,ASK_RECOVERY_MSG
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    CMP AL,'y'
    JE DO_RECOVERY
    CMP AL,'Y'
    JE DO_RECOVERY
    LEA DX,RECOVERY_SKIP_MSG
    MOV AH,9
    INT 21H
    JMP END_ASK_RECOVERY
DO_RECOVERY:
    ;  reset bien
    MOV NUM1,0
    MOV NUM2,0
    MOV RESULT,0
    
    ; Hien thi thong bao dang xu ly khoi phuc
    LEA DX,HANDLE_RECOVERY_MSG
    MOV AH,9
    INT 21H
    
    LEA DX,RECOVERY_OK_MSG
    MOV AH,9
    INT 21H
END_ASK_RECOVERY:
    RET
ASK_RECOVERY ENDP

END MAIN