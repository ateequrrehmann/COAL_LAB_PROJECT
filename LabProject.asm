; Include the Irvine32 library
include Irvine32.inc

; Data section to declare variables
.data
    ; Take the name from user
    Department_Name byte "------------------------------------------Department BS Computer Science-------------------------------------",0
    Subject_Name byte    "-----------------------------------Computer Organization & Assembly Language-------------------------------",0
    Project_Title byte   "------------------------Calculation of Area and Perimeter of Circle, Square, Rectangle---------------------",0
    Teacher_Name byte "Submitted To: Ma'am Romana Maroof",0
    Student_Name byte "Submitted By: 221475 Ateeq-Ur-Rehman BSCS-3-C",0
    Student_Name2 byte "Submitted By: 221478 Salman Abdullah BSCS-3-C",0
    ; Switch statement
    ; Declare a message to show when an invalid input is given
    default_msg byte "Invalid Input! Please Enter The Correct Input. ",0
    ; Declare messages to show options to the user
    meter_1 byte " meter (m)",0
    meter_2 byte " meter square (m^2)",0
    message_1 byte "Select the Option that You Want to perform.",0
    message_2 byte "1. Calculate the perimeter of the Circle.",0
    message_3 byte "2. Calculate the Area of the Circle.",0
    message_4 byte "3. Calculate the perimeter of the Square.",0
    message_5 byte "4. Calculate the Area of the Square.",0
    message_6 byte "5. Calculate the perimeter of the Rectangle.",0
    message_7 byte "6. Calculate the Area of the Rectangle.",0
    message_8 byte "7. Exit.",0
    message_9 byte "Choice-> ",0
    ; Declare a variable to store user's choice
    choice dword ?
    ; Declare a message to ask user if they want to continue or not
    again_choice byte "Do You Want to go to the main menu (y/n): ",0
    ; Declare a variable to store user's choice for continuing or not
    cho byte ?

    ; Circle Part
    ; Declare a message to get input from user
    input byte "Enter the radius of the circle (meters): ",0
    ; Declare a variable to store user's input
    val real4 ?
    ; Declare messages to show output
    output byte "The Area of circle is: ",0
    area2 real4 ?
    output_1 byte "The perimeter of circle is: ",0
    perimeter2 real4 ?
    ; Declare PI and TWO constants
    PI real4 3.1416
    TWO real4 2.0

    ; Square Part
    ; Declare a message to get input from user
    input_msg byte "Enter the side length of square (meters): ",0
    ; Declare a variable to store user's input
    side real4 ?
    ; Declare messages to show output
    output_msg1 byte "The perimeter of the Square is: ",0
    perimeter real4 ?
    output_msg2 byte "The Area of the Square is: ",0
    area real4 ?
    ; Declare FOUR constant
    FOUR real4 4.0

    ; Rectangle part
    ; Declare messages to get inputs from user
    input_msg1 byte "Enter the length of Rectangle (meters): ",0
    length1 real4 ?
    input_msg2 byte "Enter the width of Rectangle (meters): ",0
    width1 real4 ?
    ; Declare messages to show output
    output_msg3 byte "The perimeter of the Rectangle is: ",0
    perimeter1 real4 ?
    output_msg4 byte "The Area of the Rectangle is: ",0
    area1 real4 ?
    ; Declare an integer variable to store the user's input as a menu choice
    inte1 dword ?

    goodbye byte "Bye!"


.code

Display_Name_Function PROC
    mov     edx, offset Department_Name
    call    writestring
    call    crlf
    mov     edx, offset Subject_Name
    call    writestring
    call    crlf
    mov     edx, offset Project_Title
    call    writestring
    call    crlf
    mov     edx, offset Teacher_Name
    call    writestring
    call    crlf
    mov     edx, offset Student_Name
    call    writestring
    call    crlf
    mov     edx, offset Student_Name2
    call    writestring
    call    crlf
    call    WaitMsg 
    call    Clrscr
    ret 
    Display_Name_Function ENDP

Choice_Function PROC
    
    mov     edx, offset again_choice ; Prompts the user to enter a choice
    call    writestring  
    mov     edx, 0                   ; clear edx to read a single character
    call    readchar                 ; read a single character from standard input
    call    crlf
    call    WaitMsg 
    call    Clrscr  
    mov     cho, al                  ; store the character in cho
    cmp     cho, 'y'
    je      switch_Statement
    cmp     cho, 'n'
    je      done
    jne     invalid_choice

    invalid_choice:
        
        mov edx, offset default_msg
        call WriteString
        call crlf
        call Choice_Function

    ;jmp     done
    ret                              ; Returns control to the calling code.

    Choice_Function ENDP

main PROC
    call     Display_Name_Function
    ; Switch Statements Messages
    switch_Statement::               ; Global Label
    mov     edx, offset message_1  
    call    writestring
    call    crlf
    mov     edx, offset message_2 
    call    writestring
    call    crlf
    mov     edx, offset message_3  
    call    writestring
    call    crlf
    mov     edx, offset message_4 
    call    writestring
    call    crlf
    mov     edx, offset message_5  
    call    writestring
    call    crlf
    mov     edx, offset message_6 
    call    writestring
    call    crlf
    mov     edx, offset message_7  
    call    writestring
    call    crlf
    mov     edx, offset message_8 
    call    writestring
    call    crlf
    mov     edx, offset message_9 
    call    writestring
    call    readint
    mov     choice, eax

    ; Switch Statements Start
    ; Compares 'choice' to the values 1 through 7 using 'cmp' instruction
    mov     ebx, choice              
    cmp     ebx,1
    je      case_1
    cmp     ebx,2
    je      case_2
    cmp     ebx,3
    je      case_3
    cmp     ebx,4
    je      case_4
    cmp     ebx,5
    je      case_5
    cmp     ebx,6
    je      case_6
    cmp     ebx,7
    je      case_7
    jne     default

    case_1:

    ; Input the radius from the user
    intput_Jump:
    mov     edx, offset input
    call    writestring
    call    readfloat
    fstp    val                  ; pops the top value from the FPU stack and stores it in val   
    fld     val                  ; loads the floating-point value onto the top of the FPU stack.
    fistp   inte1                ; converts the floating-point value to an integer              
    cmp     inte1, 1
    jge     input_1

    mov     edx, offset  default_msg
    call    writestring
    call    crlf
    jmp     intput_Jump
    
    input_1:
    ; calculate perimeter
    fld     TWO
    fld     PI
    fmul
    fstp    perimeter2
    fld     perimeter2
    fld     val
    fmul
    fstp    perimeter2
    fld     perimeter2

    ; Output of Perimeter
    mov     edx, offset output_1
    call    writestring 
    call    writefloat
    mov     edx, offset meter_1 
    call    writestring
    call    crlf
    call    Choice_Function
    
    case_2:

    ; Input the radius from the user 
    intput_Jump1:
    mov     edx, offset input
    call    writestring
    call    readfloat
    fstp    val
    fld     val
    fistp   inte1 
    cmp     inte1, 1
    jge     input_2

    mov     edx, offset  default_msg
    call    writestring
    call    crlf
    jmp     intput_Jump1

    input_2:
    ; calculate area
    fld     val
    fld     val
    fmul 
    fstp    area2                        ; pops the top value from the FPU stack and stores it in val   
    fld     area2                        ; loads the floating-point value onto the top of the FPU stack.
    fld     PI                           
    fmul
    fstp    area2
    fld     area2

    ; Output of Area
    mov     edx, offset output
    call    writestring 
    call    writefloat
    mov     edx, offset meter_2 
    call    writestring
    call    crlf

    call    Choice_Function
   
    case_3:
    
    ; Take the side as the Input From User
    input_Jump2:
    mov     edx, offset input_msg  
    call    writestring
    call    readfloat                 
    fstp    side
    fld     side
    fistp   inte1 
    cmp     inte1, 1
    jge     input_3

    mov     edx, offset  default_msg
    call    writestring
    call    crlf
    jmp     input_Jump2

    input_3:
    ; Calculate Perimeter
    fld     FOUR
    fld     side
    fmul
    ;call    writefloat
    fstp    perimeter
    fld     perimeter
   
    ; Result Primeter
    mov     edx, offset output_msg1
    call    writestring
    call    writefloat    
    mov     edx, offset meter_1 
    call    writestring
    call    Crlf    

    call    Choice_Function

    case_4:

    ; Take the side as the Input From User
    intput_Jump3:
    mov     edx, offset input_msg  
    call    writestring
    call    readfloat                 
    fstp    side
    fld     side
    fistp   inte1
    cmp     inte1, 1
    jge     input_4

    mov     edx, offset  default_msg
    call    writestring
    call    crlf
    jmp     intput_Jump3

    input_4:
    ; Calculate Area
    fld     side
    fld     side
    fmul    
    fstp    area
    fld     area

    ; Result Area
    mov     edx, offset output_msg2
    call    WriteString 
    call    writefloat
    mov     edx, offset meter_2 
    call    writestring
    call    Crlf 

    call    Choice_Function

    case_5:
    
    ; Take the length as the Input From User
    input_Jump4:
    mov     edx, offset input_msg1  
    call    writestring
    call    readfloat                
    fstp    length1
    fld     length1
    fistp   inte1
    cmp     inte1, 1
    jge     input_Jump5

    mov     edx, offset  default_msg
    call    writestring
    call    crlf
    jmp     input_Jump4   

    input_Jump5:
    ; Take the width as the Input From User
    mov     edx, offset input_msg2 
    call    writestring
    call    readfloat                 
    fstp    width1 
    fld     width1
    fistp   inte1 
    cmp     inte1, 1
    jge     input_5

    mov     edx, offset  default_msg
    call    writestring
    call    crlf
    jmp     input_Jump5

    input_5:
    ; Calculate Perimeter
    fld     length1
    fld     width1
    fadd    
    fstp    perimeter1
    fld     perimeter1
    fld     TWO
    fmul
    fstp    perimeter1
    fld     perimeter1
    
    ; Result Primeter
    mov     edx, offset output_msg3
    call    writestring
    call    writefloat 
    mov     edx, offset meter_1 
    call    writestring
    call    Crlf       
   
    call    Choice_Function
    
    case_6:
    
    ; Take the length as the Input From User
    input_Jump6:
    mov     edx, offset input_msg1  
    call    writestring
    call    readfloat                
    fstp    length1
    fld     length1
    fistp   inte1
    cmp     inte1, 1
    jge     input_Jump7

    mov     edx, offset  default_msg
    call    writestring
    call    crlf
    jmp     input_Jump6   

    input_Jump7:
    ; Take the width as the Input From User
    mov     edx, offset input_msg2 
    call    writestring
    call    readfloat                 
    fstp    width1 
    fld     width1
    fistp   inte1 
    cmp     inte1, 1
    jge     input_6

    mov     edx, offset  default_msg
    call    writestring
    call    crlf
    jmp     input_Jump7

    input_6:
    ; Calculate Area
    fld     length1
    fld     width1
    fmul                
    fstp    area1
    fld     area1          

    ; Result Area
    mov     edx, offset output_msg4
    call    WriteString 
    call    writefloat 
    mov     edx, offset meter_2 
    call    writestring
    call    Crlf    
   
    call    Choice_Function

    case_7:
    jmp done
    
    default:
    call    WaitMsg 
    call    Clrscr  
    mov     edx, offset  default_msg
    call    writestring
    call    crlf    
    jmp     switch_statement

    done::
    mov edx, offset goodbye
    call WriteString
    ; Exit the program               

    exit                       
    main ENDP
    END main
