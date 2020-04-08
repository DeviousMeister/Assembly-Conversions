#include <avr/io.h>

.global hasAOne
hasAOne:
ldi r18, 0
ldi r19, 0
cpse r24, r18
ldi r19, 1
mov r24, r19
ret

.global byteToAscii
byteToAscii:
ldi r18, 0x30
add r24, r18
ret

.global int8ToInt
int8ToInt:
ldi r25, 0
sbrc r24, 7
ldi r25, 255
ret

.global addInt8ToInt
addInt8ToInt:
call int8ToInt
add r24, r22
adc r25, r23
ret

.global add4Int8
add4Int8:
call int8ToInt
mov r30, r22
mov r22, r24
mov r23, r25
mov r24, r30
call addInt8ToInt
mov r30, r20
mov r22, r24
mov r23, r25
mov r24, r30
call addInt8ToInt
mov r30, r18
mov r22, r24
mov r23, r25
mov r24, r30
call addInt8ToInt
ret

.global average
average:
adc r24, r22
ror r24
ret
