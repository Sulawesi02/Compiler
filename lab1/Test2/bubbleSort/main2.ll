; 模块信息
; ModuleID = 'bubbleSort.c' 模块标识符
source_filename = "bubbleSort.c" ; 源文件名

@.str = private unnamed_addr constant [27 x i8] c"请输入10个浮点数：\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%f\00", align 1 ; "%f" 字符串
@.str2 = private unnamed_addr constant [25 x i8] c"排序后的数字为：\00", align 1
@.str3 = private unnamed_addr constant [4 x i8] c"%f \00", align 1 ; "%f " 格式化指令
@.str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1 ; 换行符

declare i32 @printf(i8*, ...)

declare i32 @scanf(i8*, ...)

define dso_local noundef i32 @main() #0 {
    ; 变量声明
    %1 = alloca [10 x float], align 16  ; arr -> %1
    %2 = alloca i32, align 4            ; i1 -> %2
    %3 = alloca i32, align 4            ; i2 -> %3
    %4 = alloca i32, align 4            ; j -> %4
    %5 = alloca float, align 4          ; temp -> %5
    %6 = alloca i32, align 4            ; i3 -> %6
    ; 调用 printf ，输出字符串"请输入10个浮点数："
    %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i64 0, i64 0))
    ; 调用 printf ，换行
    %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str4, i64 0, i64 0))
    br label %9

9:  ; i1赋初值                           ; preds = %0
    store i32 0, i32* %2, align 4       ; i1 = 0
    br label %10

10: ; for_1循环判断                      ; preds = %9, %18
    %11 = load i32, i32* %2, align 4    ; 读取i1
    %12 = icmp slt i32 %11, 10          ; 判断i1是否小于10
    br i1 %12, label %13, label %21

13: ; for_1循环体                        ; preds = %10
    %14 = load i32, i32* %2, align 4    ; 读取i1
    %15 = sext i32 %14 to i64           ; 将i1扩展为i64类型
    %16 = getelementptr inbounds [10 x float], [10 x float]* %1, i64 0, i64 %15; 计算arr[i1]的地址
    ; 调用 scanf ，输入arr[i1]
    %17 = call i32 (i8*, ...) @scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str1, i64 0, i64 0), float* noundef %16)
    br label %18

18: ; i1++                              ; preds = %13
    %19 = load i32, i32* %2, align 4    ; 读取i1
    %20 = add nsw i32 %19, 1            ; i1 = i1 + 1
    store i32 %20, i32* %2, align 4     ; 更新i1
    br label %10

21: ; i2赋初值                           ; preds = %10
    store i32 0, i32* %3, align 4       ; i2 = 0
    br label %22

22: ; for_2外层循环判断                  ; preds = %21, %55
    %23 = load i32, i32* %3, align 4    ; 读取i2
    %24 = icmp slt i32 %23, 9           ; 判断i2是否小于9
    br i1 %24, label %25, label %58

25: ; j赋初值                            ; preds = %22
    store i32 0, i32* %4, align 4       ; j = 0
    br label %26

26: ; for_2内层循环判断                  ; preds = %25, %52
    %27 = load i32, i32* %4, align 4    ; 读取j
    %28 = load i32, i32* %3, align 4    ; 读取i2
    %29 = sub nsw i32 9, %28            ; 计算9 - i
    %30 = icmp slt i32 %27, %29         ; 判断j是否小于9 - i
    br i1 %30, label %31, label %55

31: ; 比较arr[j+1]和arr[j]               ; preds = %26
    %32 = load i32, i32* %4, align 4    ; 读取j
    %33 = add nsw i32 %32, 1            ; j = j + 1
    %34 = sext i32 %33 to i64           ; 将j扩展为i64类型
    %35 = getelementptr inbounds [10 x float], [10 x float]* %1, i64 0, i64 %34; 计算arr[j+1]的地址
    %36 = load float, float* %35, align 4; 读取arr[j+1]
    %37 = load i32, i32* %4, align 4    ; 读取j
    %38 = sext i32 %37 to i64           ; 将j扩展为i64类型
    %39 = getelementptr inbounds [10 x float], [10 x float]* %1, i64 0, i64 %38; 计算arr[j]的地址
    %40 = load float, float* %39, align 4; 读取arr[j]
    %41 = fcmp olt float %36, %40       ; 判断arr[j+1]是否小于arr[j]
    br i1 %41, label %42, label %52

42: ; 条件分支                           ; preds = %31
    %43 = load i32, i32* %4, align 4    ; 读取j
    %44 = sext i32 %43 to i64           ; 将j扩展为i64类型
    %45 = getelementptr inbounds [10 x float], [10 x float]* %1, i64 0, i64 %44; 计算arr[j]的地址
    %46 = load float, float* %45, align 4; 读取arr[j]
    store float %46, float* %5, align 4 ; temp = arr[j]
    %47 = add nsw i32 %43, 1            ; j = j + 1
    %48 = sext i32 %47 to i64           ; 将j扩展为i64类型
    %49 = getelementptr inbounds [10 x float], [10 x float]* %1, i64 0, i64 %48; 计算arr[j+1]的地址
    %50 = load float, float* %49, align 4; 读取arr[j+1]
    store float %50, float* %45, align 4; arr[j] = arr[j + 1]
    %51 = load float, float* %5, align 4; 读取temp
    store float %51, float* %49, align 4;arr[j + 1] = temp
    br label %52

52: ; j++                               ; preds = %42, %31
    %53 = load i32, i32* %4, align 4    ; 读取j
    %54 = add nsw i32 %53, 1            ; j = j + 1
    store i32 %54, i32* %4, align 4     ; 更新j
    br label %26

55: ; i2++                              ; preds = %26
    %56 = load i32, i32* %3, align 4    ; 读取i2
    %57 = add nsw i32 %56, 1            ; i2 = i2 + 1
    store i32 %57, i32* %3, align 4     ; 更新i2
    br label %22

58: ; 调用 printf ，输出字符串"排序后的数字为：" ; preds = %20
    %59 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str2, i64 0, i64 0))
    ; 调用 printf ，换行
    %60 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str4, i64 0, i64 0))
    br label %61

61: ; i3赋初值                           ; preds = %58
    store i32 0, i32* %6, align 4       ; i3 = 0
    br label %62

62: ; for_3循环判断                      ; preds = %61, %72
    %63 = load i32, i32* %6, align 4    ; 读取i3
    %64 = icmp slt i32 %63, 10          ; 判断i3是否小于10
    br i1 %64, label %65, label %75

65: ; for_3循环体                        ; preds = %62
    %66 = load i32, i32* %6, align 4    ; 读取i3
    %67 = sext i32 %66 to i64           ; 将i3扩展为i64类型
    %68 = getelementptr inbounds [10 x float], [10 x float]* %1, i64 0, i64 %67; 计算arr[i3]的地址
    %69 = load float, float* %68, align 4; 读取arr[i3]
    ; 调用 printf ，输出arr[i3]
    %70 = fpext float %69 to double
    %71 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str3, i64 0, i64 0), double noundef %70)
    br label %72

72: ; i3++                              ; preds = %65
    %73 = load i32, i32* %6, align 4    ; 读取i3
    %74 = add nsw i32 %73, 1            ; i3 = i3 + 1
    store i32 %74, i32* %6, align 4     ; 更新i3
    br label %62

75:                                     ; preds = %62
    ; 调用 printf ，换行
    %76 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str4, i64 0, i64 0))
    ret i32 0
}


