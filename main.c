#include <stdio.h>

#define N 3
#define M 3

int process(int n, int m, int matrix [M][N], int str)
{
    int min_sum = 0x7FFFFFFF;
    for (int j = 0; j < m; ++j) {
        int current_sum = 0;
        for (int i = 0; i < n; ++i)
            current_sum += matrix[i][j];
        if (min_sum > current_sum)
            min_sum = current_sum;
    }

    return min_sum;

}

int main(int argc, char** argv)
{
    int matrix[M][N];
    
    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            scanf("%d", &matrix[i][j]);
        }
    }

    int str;
    scanf("%d", &str);

    int result = process(N, M, matrix, str);

    printf("%d ", result);

    return 0;
}