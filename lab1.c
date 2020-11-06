#include <stdio.h>

#define N 4
#define M 3

void process(int matrix [M][N], int* result_i, int* result_j) {
    int max_value = matrix[0][0];
    int max_i = 1;
    int max_j = 1;
    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            if (matrix[i][j] > max_value) {
                max_value = matrix[i][j];
                max_i = i + 1;
                max_j = j + 1;
            }
        }
    }
    *result_i = max_i;
    *result_j = max_j;
}

int main(int argc, char** argv) {
    int matrix[M][N];
    int result_i = 0;
    int result_j = 0;

    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            scanf("%d", &matrix[i][j]);
        }
    }
    process(matrix, &result_i, &result_j);

    printf("%d\t%d", result_i, result_j);

    return 0;
}