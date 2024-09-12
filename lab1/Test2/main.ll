; 模块信息
; ModuleID = 'factorial.cpp' 模块标识符
source_filename = "factorial.cpp" ; 源文件名
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"; 目标机器的数据布局，即数据在内存中的布局方式
target triple = "x86_64-pc-linux-gnu"; 目标系统的三重标识符，目标体系结构、操作系统、ABI(应用程序二进制接口)

; 定义类型:一些C++标准库中的类和结构的LLVM IR表示
%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_istream" = type { i32 (...)**, i64, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }

; 定义全局变量
@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1; Init类的实例，用于初始化IO流
@__dso_handle = external hidden global i8; 动态共享对象的句柄
@_ZSt3cin = external global %"class.std::basic_istream", align 8; 标准输入流
@_ZSt4cout = external global %"class.std::basic_ostream", align 8; 标准输出流
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_factorial.cpp, i8* null }]; 全局构造函数的数组

; 定义全局变量初始化函数
define internal void @__cxx_global_var_init() #0 section ".text.startup" {
  ; 调用 std::ios_base::Init 的构造函数，初始化 _ZStL8__ioinit，从而间接初始化了 std::cin、std::cout 等流
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1) @_ZStL8__ioinit)
  ; 在程序结束时注册一个析构函数，用来清理 std::ios_base::Init 类的全局对象的资源，如 std::cin、std::cout 的初始化对象
  %1 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #3
  ret void
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #1

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #2

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #3

; Function Attrs: mustprogress noinline norecurse optnone uwtable
define dso_local noundef i32 @main() #4 {
    ; 为变量i、n、f分配栈上的内存
    %1 = alloca i32, align 4; %1 = i
    %2 = alloca i32, align 4; %2 = n
    %3 = alloca i32, align 4; %3 = f

    ; 调用 std::cin ，将用户输入存入变量 n 对应的内存中
    %4 = call noundef nonnull align 8 dereferenceable(16) %"class.std::basic_istream"* @_ZNSirsERi(%"class.std::basic_istream"* noundef nonnull align 8 dereferenceable(16) @_ZSt3cin, i32* noundef nonnull align 4 dereferenceable(4) %2)

    ; 将i和f存入内存
    store i32 2, i32* %1, align 4; i = 2
    store i32 1, i32* %3, align 4; f = 1

    ; 跳转到循环体
    br label %5

5:                                                ; preds = %9, %0
    ; 读取内存中的i、n
    %6 = load i32, i32* %1, align 4; %6 = %1 = i
    %7 = load i32, i32* %2, align 4; %7 = %2 = n
    ; 比较i和n
    %8 = icmp sle i32 %6, %7
    br i1 %8, label %9, label %13

9:                                               ; preds = %5
    ; 读取内存中的f
    %10 = load i32, i32* %3, align 4; %10 = %3 = f
    ; 计算 f = f * i
    %11 = mul i32 %10, %6
    store i32 %11, i32* %3, align 4
    ; i = i + 1
    %12 = add i32 %6, 1
    store i32 %12, i32* %1, align 4

    br label %5

13:
    ; 读取内存中的f
    %14 = load i32, i32* %3, align 4; %10 = %3 = f
    ; 输出f
    %15 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef %14)
    %16 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %15, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* noundef @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
    ; Return 0
    ret i32 0
}

; 声明C++标准库中的输入输出流函数
declare noundef nonnull align 8 dereferenceable(16) %"class.std::basic_istream"* @_ZNSirsERi(%"class.std::basic_istream"* noundef nonnull align 8 dereferenceable(16), i32* noundef nonnull align 4 dereferenceable(4)) #1

declare noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), i32 noundef) #1

declare noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* noundef) #1

declare noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8)) #1

; 定义启动函数，执行全局变量的初始化
define internal void @_GLOBAL__sub_I_factorial.cpp() #0 section ".text.startup" {
  call void @__cxx_global_var_init()
  ret void
}
