@.str = private unnamed_addr constant [25 x i8] c"请输入一个整数：\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"%d 的阶乘是：%d\0A\00", align 1

declare i32 @printf(i8*, ...)

declare i32 @scanf(i8*, ...)

define dso_local noundef i32 @main() #0 {
    ; 变量声明
    %1 = alloca i32, align 4            ; i -> %1
    %2 = alloca i32, align 4            ; n -> %2
    %3 = alloca i32, align 4            ; f -> %3
    ; 调用 printf ，输出字符串"请输入一个整数："
    %4 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0))
    ; 调用 scanf ，输入 n
    %5 = call i32 (i8*, ...) @scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str1, i64 0, i64 0), i32* noundef %2)
    ; i、f赋初值
    store i32 2, i32* %1, align 4       ; i = 2
    store i32 1, i32* %3, align 4       ; f = 1
    br label %6

6:  ; while循环判断                      ; preds = %10, %0
    %7 = load i32, i32* %1, align 4     ; 读取i
    %8 = load i32, i32* %2, align 4     ; 读取n
    %9 = icmp sle i32 %7, %8            ; 判断i是否小于等于n
    br i1 %9, label %10, label %15

10: ; while循环体                        ; preds = %5
    %11 = load i32, i32* %3, align 4    ; 读取f
    %12 = load i32, i32* %1, align 4    ; 读取i
    %13 = mul i32 %11, %12              ; f = f * i
    store i32 %13, i32* %3, align 4     ; 更新f
    %14 = add i32 %12, 1                ; i = i + 1
    store i32 %14, i32* %1, align 4     ; 更新i
    br label %6

15:
    %16 = load i32, i32* %2, align 4    ; 读取n
    %17 = load i32, i32* %3, align 4    ; 读取f
    ; 调用 printf ，输出结果
    %18 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str2, i64 0, i64 0), i32 noundef %16, i32 noundef %17)
    ret i32 0
}
