// 冒泡排序
#include <iostream>
using namespace std;
int main (){
    float arr[10];
    cout << "请输入10个浮点数：" << endl;
    for (int i = 0; i < 10; i++) {
        cin >> arr[i];
    }

    for (int i = 0; i < 9; i++){
		for (int j = 0; j < 9 - i; j++){
			if (arr[j + 1] < arr[j]){
				float temp = arr[j];
				arr[j] = arr[j + 1];
				arr[j + 1] = temp;
			}
		}
	}
    
    cout << "排序后的数字为：" << endl;
    for (int i = 0; i < 10; i++) {
        cout << arr[i] << " ";
    }

    return 0;
}