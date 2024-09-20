// 冒泡排序
#include <stdio.h>
int main() {
    float arr[10];
    printf("请输入10个浮点数：\n");
    for (int i = 0; i < 10; i++) {
        scanf("%f", &arr[i]);
    }

    for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9 - i; j++) {
            if (arr[j + 1] < arr[j]) {
                float temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
    
    printf("排序后的数字为：\n");
    for (int i = 0; i < 10; i++) {
        printf("%f ", arr[i]);
    }
    printf("\n");

    return 0;
}